class EmployeesController < ApplicationController
  def new
    # @array = ["Food", "Animal", "Unicorn", "Cartoon", "Classic", "Weird"]
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
