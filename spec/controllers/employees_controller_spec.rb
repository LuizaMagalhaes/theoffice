require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @employees' do
      allow(EmployeeClient).to receive(:all).and_return([{ id: 1, email: 'michael@mail.com', first_name: 'Michael', last_name: 'Scott' }])
      get :index
      expect(assigns(:employees)).to eq([{ id: 1, email: 'michael@mail.com', first_name: 'Michael', last_name: 'Scott' }])
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      allow(EmployeeClient).to receive(:find).and_return({ id: 1, email: 'michael@mail.com', first_name: 'Michael', last_name: 'Scott' })
      get :show, params: { id: 1 }
      expect(response).to be_successful
    end

    it 'assigns @employee' do
      allow(EmployeeClient).to receive(:find).and_return({ id: 1, email: 'michael@mail.com', first_name: 'Michael', last_name: 'Scott' })
      get :show, params: { id: 1 }
      expect(assigns(:employee)).to eq({ id: 1, email: 'michael@mail.com', first_name: 'Michael', last_name: 'Scott' })
    end
  end
end
