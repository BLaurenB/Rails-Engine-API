class WelcomeController < ApplicationController

  def index
    render json: "Welcome to the Rails Engine API"
  end

end
