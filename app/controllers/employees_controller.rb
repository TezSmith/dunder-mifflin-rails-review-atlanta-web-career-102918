class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
   @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
    redirect_to employee_path(@employee)
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
    redirect_to employee_path(@employee)
    else
      render :edit
    end
  end

  private

  def employee_params
    #Remember the difference between params.require(:resource) vs params.permit
    #What is the difference? Why do we need to know it?
   params.permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

end
