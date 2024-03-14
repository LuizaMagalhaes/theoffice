require 'rails_helper'

RSpec.describe EmployeeProvider do
  describe '.fetch_employees' do
    context 'when the request is successful' do
      it 'returns an array of employees' do
        allow(RestClient).to receive(:get).with('https://reqres.in/api/users').and_return(double(body: '{"data": [{"id": 1, "email": "stanley@mail.com", "first_name": "Stanley", "last_name": "Hudson"}]}'))
        
        employees = EmployeeProvider.fetch_employees

        expect(employees).to be_an(Array)
        expect(employees.size).to eq(1)
        expect(employees.first).to include(id: 1, email: 'stanley@mail.com', first_name: 'Stanley', last_name: 'Hudson')
      end
    end

    context 'when the request fails' do
      it 'returns an empty array' do
        allow(RestClient).to receive(:get).and_raise(RestClient::ExceptionWithResponse.new(nil, 404))

        employees = EmployeeProvider.fetch_employees

        expect(employees).to eq([])
      end
    end
  end

  describe '.fetch_employee' do
    context 'when the request is successful' do
      it 'returns a single employee' do
        allow(RestClient).to receive(:get).with('https://reqres.in/api/users/1').and_return(double(body: '{"data": {"id": 1, "email": "stanley@mail.com", "first_name": "Stanley", "last_name": "Hudson"}}'))

        employee = EmployeeProvider.fetch_employee(1)

        expect(employee).to include(id: 1, email: 'stanley@mail.com', first_name: 'Stanley', last_name: 'Hudson')
      end
    end

    context 'when the request fails' do
      it 'returns an empty array' do
        allow(RestClient).to receive(:get).and_raise(RestClient::ExceptionWithResponse.new(nil, 404))

        employee = EmployeeProvider.fetch_employee(1)

        expect(employee).to eq([])
      end
    end
  end
end
