require_relative '../parsers/employee_parser'

class EmployeeProvider
  API_URL = 'https://reqres.in/api/users'.freeze

  class << self
    def fetch_employees
      response = RestClient.get(API_URL)
      handle_response(response.body)
    rescue RestClient::ExceptionWithResponse => e
      handle_error(e)
    end

    def fetch_employee(id)
      response = RestClient.get("#{API_URL}/#{id}")
      handle_response(response.body)
    rescue RestClient::ExceptionWithResponse => e
      handle_error(e)
    end

    private

    def handle_response(response_body)
      parsed_data = EmployeeParser.parse(response_body)
    end

    def handle_error(error)
      Rails.logger.error("Error fetching data from API: #{error.message}")
      []
    end
  end
end
