class SpeaksController < ApplicationController
  before_action :set_speak, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  include ActionController::Live
  # GET /speaks
  
  # GET /speaks.json
  def index
    @speaks = Speak.all
    @speak = Speak.new
    
  end

  # GET /speaks/1
  # GET /speaks/1.json
  def show
  end

  # GET /speaks/new
  def new
    @room = Room.find_by(rando: session[:current_room])
    @speaks = Speak.where(:room_id => @room.id).last(20)
    @speak = Speak.new
    render layout: 'x-nil'
  end

  # GET /speaks/1/edit
  def edit
  end

  # POST /speaks
  # POST /speaks.json
  def create
    @speak = Speak.new(speak_params)
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream)
    
    respond_to do |format|
      if @speak.save
      begin
        sse.write({name: @speak.content}, event: "scrollr")
      rescue IOError
        # When the client disconnects, we'll get an IOError on write
      ensure
        sse.close
      end
        @speak.update(room_id: Room.find_by(rando: session[:current_room]).id)
        format.html { }
        format.json { render :show, status: :created, location: @speak }
      else
        format.html { render :new }
        format.json { render json: @speak.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /speaks/1
  # PATCH/PUT /speaks/1.json
  def update
    respond_to do |format|
      if @speak.update(speak_params)
        format.html { }
        format.json { render :show, status: :ok, location: @speak }
      else
        format.html { render :edit }
        format.json { render json: @speak.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speaks/1
  # DELETE /speaks/1.json
  def destroy
    @speak.destroy
    respond_to do |format|
      format.html { }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speak
      @speak = Speak.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def speak_params
      params.require(:speak).permit(:content, :user, :room_id)
    end
end
