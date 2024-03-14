class EmployeesController < ApplicationController
  def index
    @employees = EmployeeClient.all
  end

  def show
    @employee = EmployeeClient.find(params[:id])
  end
end
