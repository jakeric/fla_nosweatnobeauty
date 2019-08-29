class EmployeesController < ApplicationController
  def new
    @department_array = ['Business Intelligence','Brand & Communication','Business Development','CFO Staff','Engineering','Enterprise Apps & Infrastructure','Finance','Human Resources','International Strategy & New Markets','Office Management','Online Marketing','Operations','Private Label','Product','Sales & Merchandizing','Vendor Management']
    @employee = Employee.new
  end

  def create
    if Employee.where("employeename = ?", employee_params[:employeename]) == []
      @employee = Employee.new(employee_params)
      @employee.save
      redirect_to pages_about_path
    else
      redirect_to new_employee_path
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:employeename, :department)
  end
end
