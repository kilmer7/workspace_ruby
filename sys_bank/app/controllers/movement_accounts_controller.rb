class MovementAccountsController < ApplicationController
  before_action :set_movement_account, only: %i[ show edit update destroy ]

  # GET /movement_accounts or /movement_accounts.json
  def index
    @movement_accounts = MovementAccount.where(account_id: current_user.account.id).or(MovementAccount.where(account_destiny_id: current_user.account.id))
  end

  # GET /movement_accounts/1 or /movement_accounts/1.json
  def show
  end

  # GET /movement_accounts/new
  def new
    @movement_account = MovementAccount.new(movement_type: params[:movement_type])
  end

  # GET /movement_accounts/1/edit
  def edit
  end

  # POST /movement_accounts or /movement_accounts.json
  def create
    @movement_account = MovementAccount.new(movement_account_params)

    respond_to do |format|
      if @movement_account.save
        format.html { redirect_to @movement_account, notice: "Movement account was successfully created." }
        format.json { render :show, status: :created, location: @movement_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movement_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movement_accounts/1 or /movement_accounts/1.json
  def update
    respond_to do |format|
      if @movement_account.update(movement_account_params)
        format.html { redirect_to @movement_account, notice: "Movement account was successfully updated." }
        format.json { render :show, status: :ok, location: @movement_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movement_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movement_accounts/1 or /movement_accounts/1.json
  def destroy
    @movement_account.destroy
    respond_to do |format|
      format.html { redirect_to movement_accounts_url, notice: "Movement account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement_account
      @movement_account = MovementAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movement_account_params
      params.require(:movement_account).permit(:movement_date, :value, :account_id, :user_id, :movement_type, :account_destiny_id)
    end
end
