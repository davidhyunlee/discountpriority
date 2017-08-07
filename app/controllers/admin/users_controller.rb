class Admin::UsersController < AdminController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  # GET /admin/users.json
  def index
    @breadcrumb = "Users"
    @users = User.all
    authorize [:admin, :user]
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
    authorize [:admin, :user], :show?
  end

  # GET /admin/users/new
  def new
    @user = User.new
    @breadcrumb = "Create New User"
    authorize [:admin, :user], :new?
  end

  # GET /admin/users/1/edit
  def edit
    @breadcrumb = "Edit User"
    authorize [:admin, :user], :edit?
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @user = User.new(user_params)
    authorize [:admin, :user], :create?

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_path(@user) }
        flash[:success] = "User was successfully created."
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        flash[:danger] = "User was not created."
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_admin_user_path(@user) }
        flash[:success] = "User was successfully updated."
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        flash[:danger] = "User was not updated."
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:company, :api_key, :activated, :first_name, :last_name, :address_1, :address_2, :city, :state, :zip, :email, :password, :password_confirmation)
    end
end
