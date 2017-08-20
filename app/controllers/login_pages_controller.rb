class LoginPagesController < ApplicationController
  before_action :set_login_page, only: [:show, :edit, :update, :destroy]

  # GET /login_pages
  # GET /login_pages.json
  def index
    session[:current_room] = nil
    session[:current_user_id] = nil
    puts session[:current_user_id]
    if params[:user]
      @room = Room.find_by(rando: params[:room])
      @user = User.find_by(username: params[:user])
      begin
        @permissions = Permission.where( {user_id: @user.id, room_id: @room.id} )
        if @permissions.count > 0 then
          puts 'yes'
          session[:current_user_id] = @user.username
          session[:current_room] =  @room.rando
          redirect_to @room
        end
      rescue
        if @room.nil? then
          puts 'invalid room'
        end
      end
      
    end
  end

  # GET /login_pages/1
  # GET /login_pages/1.json
  def show
  end

  # GET /login_pages/new
  def new
    @login_page = LoginPage.new
  end

  # GET /login_pages/1/edit
  def edit
  end

  # POST /login_pages
  # POST /login_pages.json
  def create
    @login_page = LoginPage.new(login_page_params)

    respond_to do |format|
      if @login_page.save
        format.html { redirect_to @login_page, notice: 'Login page was successfully created.' }
        format.json { render :show, status: :created, location: @login_page }
      else
        format.html { render :new }
        format.json { render json: @login_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /login_pages/1
  # PATCH/PUT /login_pages/1.json
  def update
    respond_to do |format|
      if @login_page.update(login_page_params)
        format.html { redirect_to @login_page, notice: 'Login page was successfully updated.' }
        format.json { render :show, status: :ok, location: @login_page }
      else
        format.html { render :edit }
        format.json { render json: @login_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /login_pages/1
  # DELETE /login_pages/1.json
  def destroy
    @login_page.destroy
    respond_to do |format|
      format.html { redirect_to login_pages_url, notice: 'Login page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login_page
      @login_page = LoginPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_page_params
      params.fetch(:login_page, {})
    end
end
