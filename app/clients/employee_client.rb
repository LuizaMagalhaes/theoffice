class EmployeeClient
  class << self
    def all
      EmployeeProvider.fetch_employees
    end

    def find(id)
      attrs = EmployeeProvider.fetch_employee(id)
      Employee.new(attrs) 
    end
  end
end
