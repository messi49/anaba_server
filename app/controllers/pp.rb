class ChkPassController < ApplicationController
  before_action :set_check, only: [:show, :edit, :update, :destroy]

  # New function to check user_id
  def check
    ChkPass.find(params[:user_id])
  end

  # GET /memos
  # GET /memos.json
  def index
    @checks = ChkPass.all
  end

  # GET /memos/1
  # GET /memos/1.json
  def show
  end

  # GET /memos/new
  def new
    @check = ChkPass.new
  end

  # GET /memos/1/edit
  def edit
  end

  # POST /memos
  # POST /memos.json
  def create
    @check = ChkPass.new(check_params)


    respond_to do |format|
      if @check.save
        format.html { redirect_to @check, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @check }
      else
        format.html { render :new }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memos/1
  # PATCH/PUT /memos/1.json
  def update
    respond_to do |format|
      if @check.update(user_params)
        format.html { redirect_to @check, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @check }
      else
        format.html { render :edit }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memos/1
  # DELETE /memos/1.json
  def destroy
    @check.destroy
    respond_to do |format|
      format.html { redirect_to memos_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # edited by Rho 2015/01/16 (id->user_id)
    def set_check
      @check = ChkPass.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # edited by Rho 2015/01/16 (memo_params)
    def check_params
      params.require(:check).permit(:user_id, :category_id, :venue1_id, :venue2_id, :venue3_id, :venue4_id, :venue5_id)
    end
end
