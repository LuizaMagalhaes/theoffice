class EmployeeParser
  class << self
    def parse(data)
      parsed_data = JSON.parse(data)
      if parsed_data['data'].is_a?(Array)
        parsed_data['data'].map { |employee_data| parse_employee(employee_data) }
      else
        parse_employee(parsed_data['data'])
      end
    end

    def parse_employee(data)
      {
        id: data['id'],
        email: data['email'],
        first_name: data['first_name'],
        last_name: data['last_name'], 
        avatar: data['avatar']
      }
    end
  end
end
