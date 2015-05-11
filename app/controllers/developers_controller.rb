class DevelopersController < ApplicationController
  def choose_ticket
    ticket = Ticket.find params[:ticket]
    # For the current signed-in developer, this helper is available: current_developer
    current_developer.tickets.push ticket
    render nothing: true, status: :ok
  end
end
