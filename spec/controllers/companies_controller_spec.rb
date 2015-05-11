require 'rails_helper'

RSpec.describe CompaniesController, type: :controller  do
  login_company
  before do
    request.host = 'example.com'
    expect(post: "http://#{request.host}/companies").to(
      route_to(controller: 'devise/registrations', action: 'create')
    )
  end
  describe 'Create Ticket' do
    it 'should create a 5 tickets' do
      company = nil
      5.times do |step|
        ticket = FactoryGirl.attributes_for :ticket
        post :create_ticket, id: subject.current_company._id.to_s,
                             company: { ticket: ticket }, format: :json
        expect(response.status).to eq 200
        company = Company.find subject.current_company._id
        expect(company.tickets[step].name).to eql ticket[:name]
      end
      company.reload
      expect(company.tickets.length).to eql 5
    end
  end
end
