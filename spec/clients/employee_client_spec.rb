require 'rails_helper'

RSpec.describe EmployeeClient do
  describe '.all' do
    it 'fetches all employees from the provider' do
      employees_data = [{ id: 1, email: 'dwight@email.com', first_name: 'Dwight', last_name: 'Schrute' }]
      allow(EmployeeProvider).to receive(:fetch_employees).and_return(employees_data)

      employees = EmployeeClient.all

      expect(employees).to eq(employees_data)
    end
  end

  describe '.find' do
    it 'fetches a specific employee from the provider and instantiates a new Employee object' do
      employee_data = { id: 1, email: 'dwight@email.com', first_name: 'Dwight', last_name: 'Schrute' }
      allow(EmployeeProvider).to receive(:fetch_employee).with(1).and_return(employee_data)
      employee = EmployeeClient.find(1)

      expect(employee).to be_an_instance_of(Employee)
      expect(employee.email).to eq('dwight@email.com')
      expect(employee.first_name).to eq('Dwight')
      expect(employee.last_name).to eq('Schrute')
    end
  end
end
