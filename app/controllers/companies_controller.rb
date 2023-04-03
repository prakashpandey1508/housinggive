class CompaniesController < ApplicationController
  def index
    @companies=Company.all

  end

  def show
        @companies=Company.find(params[:id])
  end

  def edit
     @companies=Company.find(params[:id])
  end
   def update
    @companies=Company.find(params[:id])
     @companies.update(company_params)
     redirect_to companies_path
  end

  def new
      @companies=Company.new
  
  end

  def create
    @companies=Company.create(company_params)
    redirect_to  companies_path
  end

  def destroy
    @companies=Company.find(params[:id])
    @companies.destroy
    redirect_to companies_path

  end
  private
  def company_params
    params.require(:company).permit(:name,:email,:number)
  end

end
