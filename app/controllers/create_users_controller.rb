class CreateUsersController < ApplicationController
  before_action :set_create_user, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authorize, only: [:new, :create, :index]
  # GET /create_users
  # GET /create_users.json
  def index
    @create_users = CreateUser.all
  end

  # GET /create_users/1
  # GET /create_users/1.json
  def show
  end

  # GET /create_users/new
  def new
    @create_user = CreateUser.new
  end

  # GET /create_users/1/edit
  def edit
  end

  # POST /create_users
  # POST /create_users.json
  def create
    @create_user = CreateUser.new(create_user_params)

    respond_to do |format|
      if @create_user.save
        session[:create_user_id] = @create_user.id
        format.html { redirect_to business_cards_path }
        format.json { render :show, status: :created, location: @create_user }
      else
        format.html { render :new }
        format.json { render json: @create_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_users/1
  # PATCH/PUT /create_users/1.json
  def update
    respond_to do |format|
      if @create_user.update(create_user_params)
        format.html { redirect_to @create_user }
        format.json { render :show, status: :ok, location: @create_user }
      else
        format.html { render :edit }
        format.json { render json: @create_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_users/1
  # DELETE /create_users/1.json
  def destroy
    @create_user.destroy
    respond_to do |format|
      format.html { redirect_to create_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_user
      @create_user = CreateUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_user_params
      params.require(:create_user).permit(:name, :email, :password, :password_confirmation)
    end
end
