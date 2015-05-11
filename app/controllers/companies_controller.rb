class CompaniesController < ApplicationController
  respond_to :json
  # method helper from devise
  before_action :authenticate_company!, only: [:create_ticket]

  def create_ticket
    secure_params = post_params
    categories = secure_params[:ticket][:categories].map do |category_name|
      Category.new name: category_name
    end
    ticket = Ticket.new name: secure_params[:ticket][:name], categories: categories
    # For the current signed-in company, this helper is available: curren_company
    current_company.tickets.push ticket
    render nothing: true, status: :ok
  end

  private

    def post_params
      params.require(:company).permit ticket: [:name, categories: []]
    end
end
