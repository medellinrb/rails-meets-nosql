require 'rails_helper'

RSpec.describe DevelopersController, type: :controller  do
  login_developer

  describe 'Select Ticket to Solve' do
    it 'should ' do
      categories = subject.current_developer.categories.map do |category|
        category.name
      end
      tickets = Ticket.in('categories.name' => categories)
      post :choose_ticket,
           ticket: tickets.sample._id.to_s,
           id: subject.current_developer._id
      expect(response.status).to eq 200
      developer = Developer.find subject.current_developer._id
      expect(developer.tickets.length).to eql 1
    end
  end
end
