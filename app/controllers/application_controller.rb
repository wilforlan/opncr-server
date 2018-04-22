class ApplicationController < ActionController::Base
  # Disable since we are not using the view
  # protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  private

  def record_not_found
    render json: { error: "Record Not Found" }, status: 404
  end

end
