class WelcomeController < ApplicationController
  def index
    render json: "Hi"
  end
end
