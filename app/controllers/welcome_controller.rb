class WelcomeController < ApplicationController
  def index
    render json: { status: "Working", message: "Running !" }, status: 200
  end
end
