require 'rails_helper'

RSpec.describe Employee do
  let(:attributes) do
    {
      id: 1,
      email: 'jim@email.com',
      first_name: 'Jim',
      last_name: 'Halpert',
      avatar: 'avatar_url'
    }
  end

  subject { described_class.new(attributes) }

  describe '#initialize' do
    it 'sets the email attribute' do
      expect(subject.email).to eq(attributes[:email])
    end

    it 'sets the first_name attribute' do
      expect(subject.first_name).to eq(attributes[:first_name])
    end

    it 'sets the last_name attribute' do
      expect(subject.last_name).to eq(attributes[:last_name])
    end

    it 'sets the avatar attribute' do
      expect(subject.avatar).to eq(attributes[:avatar])
    end
  end

  describe 'attributes' do
    context 'when initialized with valid attributes' do
      it 'returns the correct id' do
        expect(subject.id).to be_nil
      end

      it 'returns the correct email' do
        expect(subject.email).to eq(attributes[:email])
      end

      it 'returns the correct first_name' do
        expect(subject.first_name).to eq(attributes[:first_name])
      end

      it 'returns the correct last_name' do
        expect(subject.last_name).to eq(attributes[:last_name])
      end

      it 'returns the correct avatar' do
        expect(subject.avatar).to eq(attributes[:avatar])
      end
    end
  end
end
