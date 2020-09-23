class CsvsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @files = Csv.all.order("created_at DESC")
  end
  
  def show
  end

  def new
    @csv = current_user.csvs.build
  end
  
  def edit
  end
  
  def create
    data = params[:csv]
    #render plain: data[:file].path
                                      
    @csv = current_user.csvs.new csv_params
    id = current_user.id
    if @csv.save
      #ProccessContactsJob.perform_later(data[:file].path, id)
      CSV.foreach(data[:file].path, headers: true, col_sep: ';') do |row|
        row[0] = row[0] << " x"
        contact = current_user.contacts.new(row.to_hash)
        contact.save
      end
      flash[:success] = "Csv successfully uploaded"
      redirect_to csvs_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  private

  def csv_params
    params.require(:csv).permit(:status, :file)
  end

end
