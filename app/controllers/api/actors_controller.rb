class Api::ActorsController < ApplicationController

  def create
    if params[:actor][:type] == 'agg'
      @actor = Actor.new(create_actor_params)
      @actor.signing_key = ::Encryptor.actor_key_gen(create_actor_params[:address])
      @actor.save

      render json: @actor, status: :created
    elsif params[:actor][:type] == 'fil'
      @user = User.new({
        address: create_actor_params[:address],
        role: 'fil',
      })
      @user.save
      render json: @user, status: :created
    end
  end

  def test
    @actors = Actor.all
    render json: @actors
  end
  def create_loan_record

  end

  def pull_loan_record_request
    @loan_record = LoanRecordRequest.new({user_id: create_pull_loan_record_request_params[:user_id], initiator: User.find_by(address: create_pull_loan_record_request_params[:initiator_addr])})
    @loan_record.validity = 2

    p @loan_record
    if @loan_record.save
      render json: @loan_record, status: :created
    else
      render json: @loan_record.errors, status: 500
    end

  end

  def get_pull_loan_record_request
    @loan_records = LoanRecordRequest.includes(:user).all
    @loan_records = @loan_records.where('users.address': params[:address], invalidate: false)

    render json: @loan_records
  end

  def approve_loan_record_request
    @lr = LoanRecordRequest.includes(:user).where(id: params[:request][:id]).first
    @loans = LoanRecord.includes(:user).all
    @loans = @loans.where('users.address': @lr.user.address)
    @lr.invalidate = true
    @lr.save
    render json: @loans
  end

  private
    def create_actor_params
      params.require(:actor).permit(
        :address,
        :name
      )

    end

    def create_pull_loan_record_request_params
      params.require(:request).permit(
        :initiator_addr,
        :user_id
      )
    end

end
