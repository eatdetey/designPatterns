require 'fox16'
require_relative '../Models/StudentsList/StudentsListDB.rb'
require '../Models/StudentsList/StudentsListFile.rb'
require '../Models/StudentsList/StudentsList.rb'
require '../Models/StudentsList/StudentsListJSON.rb'
require '../Models/StudentsList/StudentsListYAML.rb'
include Fox

class StudentListView < FXMainWindow

    def initialize(app, students_list)
        super(app, "Student List", width: 1080, height: 505)

        self.filters = {}
        self.students_list = students_list
        self.current_page = 1
        self.items_per_page = 20

        # Главный контейнер
        main_frame = FXHorizontalFrame.new(self, LAYOUT_FILL_X | LAYOUT_FILL_Y)

        # Область фильтрации
        filter_frame = FXVerticalFrame.new(main_frame, LAYOUT_FIX_WIDTH, width: 250, padding: 10)
        setup_filter_area(filter_frame)

        # Таблица
        table_frame = FXVerticalFrame.new(main_frame, LAYOUT_FILL_X | LAYOUT_FILL_Y, padding: 10)
        setup_table_area(table_frame)

        # Область управления
        control_frame = FXVerticalFrame.new(main_frame, LAYOUT_FIX_WIDTH, width: 150, padding: 10)
        setup_control_area(control_frame)

        load_data

        # Инициализация таблицы
        update_table
    end

    def setup_filter_area(parent)
        FXLabel.new(parent, "ФИЛЬТРАЦИЯ")

        name_text_field = nil
        FXLabel.new(parent, "Фамилия и инициалы:")
        name_text_field = FXTextField.new(parent, 25, opts: TEXTFIELD_NORMAL)

        self.filters['name'] = { text_field: name_text_field }

        add_filtering_row(parent, "Git:")
        add_filtering_row(parent, "Email:")
        add_filtering_row(parent, "Телефон:")
        add_filtering_row(parent, "Telegram:")

        FXButton.new(parent, "Сбросить", opts: BUTTON_NORMAL).connect(SEL_COMMAND) do
            reset_filters
        end
    end

    def add_filtering_row(parent, label)
        FXLabel.new(parent, label)
        combo = FXComboBox.new(parent, 3, opts: LAYOUT_FILL_X | FRAME_SUNKEN | FRAME_THICK | COMBOBOX_STATIC)
        combo.numVisible = 3
        combo.appendItem("Не важно")
        combo.appendItem("Да")
        combo.appendItem("Нет")
        text_field = FXTextField.new(parent, 15, opts: TEXTFIELD_NORMAL)
        text_field.visible = false

        self.filters[label] = { combo: combo, text_field: text_field }

        combo.connect(SEL_COMMAND) do
            text_field.visible = (combo.currentItem == 1)
            parent.recalc
        end
    end
      
      
    def setup_table_area(parent)
        # Таблица
        self.table = FXTable.new(parent, opts: LAYOUT_FILL_X | LAYOUT_FILL_Y | TABLE_READONLY | TABLE_COL_SIZABLE)
        self.table.setTableSize(self.items_per_page, 3)
        self.table.defColumnWidth = 180
        self.table.rowHeaderWidth = 30

        self.table.columnHeader.connect(SEL_COMMAND) do |_, _, col|
            sort_table_by_column(col)
            update_table
        end

        # Навигация по страницам
        navigation_frame = FXHorizontalFrame.new(parent, opts: LAYOUT_FILL_X)
        self.prev_button = FXButton.new(navigation_frame, "Предыдущая", opts: BUTTON_NORMAL | LAYOUT_LEFT)
        self.next_button = FXButton.new(navigation_frame, "Следующая", opts: BUTTON_NORMAL | LAYOUT_RIGHT)
        self.page_label = FXLabel.new(navigation_frame, "Страница 1", opts: LAYOUT_CENTER_X)

        self.prev_button.connect(SEL_COMMAND) { change_page(-1) }
        self.next_button.connect(SEL_COMMAND) { change_page(1) }
    end

    def setup_control_area(parent)
        FXLabel.new(parent, "УПРАВЛЕНИЕ", opts: LAYOUT_FILL_X)
        FXButton.new(parent, "Добавить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
        FXButton.new(parent, "Удалить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
        FXButton.new(parent, "Изменить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
        FXButton.new(parent, "Обновить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    end

    def update_table
        return if self.data.nil? || self.data.row_count <= 1
        total_pages = (self.data.row_count.to_f / self.items_per_page).ceil
        self.page_label.text = "Страница #{self.current_page} из #{total_pages}"
      
        # Рассчитываем индекс начала и конца для текущей страницы
        start_idx = (self.current_page - 1) * self.items_per_page
        end_idx = [start_idx + self.items_per_page - 1, self.data.row_count - 1].min
      
        # Формируем подмассив данных для текущей страницы
        data_for_page = (start_idx..end_idx).map do |row_idx|
            (0...self.data.column_count).map do |col_idx|
                self.data.get_element(row_idx, col_idx)
            end
        end
      
        # Обновляем таблицу
        row_count = data_for_page.length
        column_count = self.data.column_count
      
        self.table.setTableSize(row_count, column_count)
        self.table.setColumnWidth(0, 30)
      
        (0...row_count).each do |row_idx|
            (0...column_count).each do |col_idx|
                value = data_for_page[row_idx][col_idx]
                self.table.setItemText(row_idx, col_idx, value.to_s)
            end
        end
    end

    def change_page(offset)
        new_page = self.current_page + offset
        total_pages = (self.students_list.get_student_short_count.to_f / self.items_per_page).ceil
        return if new_page < 1 || new_page > total_pages

        self.current_page = new_page
        update_table
    end

    def load_data
        self.data = self.students_list.get_k_n_student_short_list(1, self.students_list.get_student_short_count).get_data
    end

    def sort_table_by_column(col_idx=0)
        return if self.data.nil? || self.data.row_count <= 1

        headers = (0...self.data.column_count).map {|col_idx| self.data.get_element(0, col_idx)}

        rows = (1...self.data.row_count).map do |row_idx|
            (0...self.data.column_count).map {|column_idx| self.data.get_element(row_idx, column_idx)}
        end

        self.sort_order ||= {}
        self.sort_order[col_idx] = !sort_order.fetch(col_idx, false)

        sorted_rows = rows.sort_by do |row| 
            value = row[col_idx]
            value.nil? ? "\xFF" * 1000 : value
        end

        sorted_rows.reverse! unless self.sort_order[col_idx]

        all_data = [headers] + sorted_rows

        self.data = DataTable.new(all_data)
    end

    def create
        super
        show(PLACEMENT_SCREEN)
    end

    private
    attr_accessor :filters, :students_list, :current_page, :items_per_page, :table, :prev_button, :next_button, :page_label, :sort_order, :data

    def reset_filters
        self.filters.each do |key, field|
            field[:combo].setCurrentItem(0) if !field[:combo].nil?
            field[:text_field].text = ""
            field[:text_field].visible = false if key != 'name'
        end
        update_table
    end
end