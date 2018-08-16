class UsersController < ApplicationController

    def index
        @users = User.all
        'master'
    end
    def download
        filename = Campus::Schoolwork::HomeModel.download_news_detail(params[:tab])
        str = request.user_agent
        user_agent = ::UserAgent.parse(str)
        new_filename = user_agent.browser == 'Internet Explorer' ? CGI::escape(filename) : filename
        send_file("#{Rails.root}/public/excel/schoolwork/#{filename}", :type => 'xls', :disposition => 'attachment', :filename => new_filename)

        filename = "users"
        first_row = ["name", "email", "gender", "phone_number"]
        data = User.all.map{|x| [x.name,x.email,x.gender,x.phone_number]}
        dir = 'users'
        ExcelHelper.export_rows(dir, filename, first_row, data)

    end
end
