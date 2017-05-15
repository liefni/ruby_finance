class TextReport

  def create(&block)
    @text = ''
    instance_eval(&block)
    return @text
  end

  def heading(text)
    text = text.to_s
    @text += '-' * text.length + "\r\n"
    @text += text.upcase + "\r\n"
    @text += '-' * text.length + "\r\n\r\n"
  end

  def sub_heading(text)
    text = text.to_s
    @text += text.upcase + "\r\n"
    @text += '-' * text.length + "\r\n"
  end

  def paragraph(text)
    text = text.to_s
    @text += text + "\r\n\r\n"
  end

  def table(&block)
    @text += Table.new.create(&block)
  end

  class Table

    def create(&block)
      @text = ''
      instance_eval(&block).to_s
      @text += "\r\n"
      return @text
    end

    def table_row(&block)
      @text += TableRow.new.create(false, &block) + "\r\n"
    end

    def table_heading(&block)
      @text += TableRow.new.create(true, &block) + "\r\n"
    end

    class TableRow

      def create(is_heading, &block)
        @text = ''
        @underline = ''
        @is_heading = is_heading
        instance_eval(&block).to_s
        @text += "\r\n" + @underline if @is_heading
        return @text
      end

      def table_cell(text)
        if @is_heading
          @text += text.to_s.upcase + "\t"
          @underline += '-' * text.length + "\t"
        else
          @text += text.to_s + "\t"
        end
      end

      def table_cells(*values)
        values.each do |value|
          table_cell(value)
        end
      end
    end
  end

end