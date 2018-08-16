module Campus
    module Core
        class ExcelHelper

            #读取excel文件
            def self.read_excel(file)
                type = File.extname(file)
                case type
                    when ".xlsx" then
                        obj = ::Roo::Excelx.new(file)
                    when ".xls" then
                        obj = ::Roo::Excel.new(file)
                    when ".csv" then
                        obj = ::Roo::CSV.new(file)
                end
                return obj
            end

            # dir 文件夹
            # filename 文件名
            # first_row 第一行
            # array 传入嵌套数组
            def self.export_rows(dir, filename, first_row, array)
                #没有文件夹就创建, 有文件夹先清空其中内容
                mkdir_dir(dir)

                Spreadsheet.client_encoding = "UTF-8"
                book = Spreadsheet::Workbook.new
                sheet = book.create_worksheet

                #第一行插入
                sheet.row(0).concat first_row

                #从第二行开始插入, 每一行插入一个数组
                array.each_with_index do |x, i|
                    sheet.row(1+i).concat x
                end
                # dir = dir.to_a.join('/')
                book.write "#{Rails.root}/public/excel/#{dir}/#{filename}.xls"
                Rails.logger.info "~~~~~~~~#{Rails.root}/public/excel/#{dir}/#{filename}.xls~~~~~~~~~~excel write done~~~~~~~~"
            end

            #创建文件夹, 清空其中的内容
            def self.mkdir_dir(dir)
                begin
                    Dir.mkdir("#{Rails.root}/public/excel/")
                rescue
                end

                begin
                    Dir.mkdir("#{Rails.root}/public/excel/#{dir}")
                rescue
                end

                FileUtils.rm_rf(Dir.glob("#{Rails.root}/public/excel/#{dir}/*"))
            end

        end
    end
end