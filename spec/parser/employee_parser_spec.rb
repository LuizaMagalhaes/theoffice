require 'rails_helper'

RSpec.describe EmployeeParser do
  describe '.parse' do
    it 'parses employee data' do
      data = '{"data": {"id": 1, "email": "jim@mail.com", "first_name": "Jim", "last_name": "Halpert"}}'
      employee = EmployeeParser.parse(data)
      expect(employee).to include(id: 1, email: 'jim@mail.com', first_name: 'Jim', last_name: 'Halpert')
    end
  end
end
