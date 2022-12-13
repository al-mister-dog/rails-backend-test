class DrawsController < ApplicationController
  before_action :set_draw, only: %i[ show update destroy ]

  # GET /draws
  def index
    @draws = Draw.all
    render json: @draws, status: :ok
  end

  # GET /draws/1
  def show
    participants = @draw.participants #SELECT "participants".* FROM "participants" INNER JOIN "santas" ON "participants"."id" = "santas"."giver_id" WHERE "santas"."draw_id" = ?  [["draw_id", "7"]]
    render json: {draw: @draw, participants: participants}, status: :ok
  end

  # POST /draws
  def create
    body = JSON.parse(request.body.read)
    participants = body["participants"] 
    santas = body["santas"]
    budget = body["budget"]
    draw = Draw.create(budget: budget)
    
    def santa_error(message)
      render json: {error: message}, status: :unprocessable_entity
    end

    santas.each do |santa|
      giver = Participant.find_by(email: santa["giver_id"])
      receiver = Participant.find_by(email: santa["receiver_id"])
      
      if giver.nil?
        giver = Participant.create( email: santa["giver_id"])  
      end
      if receiver.nil?
        receiver = Participant.create(email: santa["receiver_id"])
      end
      
      Santa.create(giver_id: giver.id, receiver_id: receiver.id, draw_id: draw.id)
    end
    

    render json: { draw: draw }, status: :ok
  end

  # PATCH/PUT /draws/1
  def update
    body = JSON.parse(request.body.read)
    participants = body["participants"] 
    santas = body["santas"]

    santas.each do |santa|
      giver = Participant.find_by(email: santa["giver_id"])
      receiver = Participant.find_by(email: santa["receiver_id"])
      
      if giver.nil?
        giver = Participant.create( email: santa["giver_id"])
      end
      if receiver.nil?
        receiver = Participant.create(email: santa["receiver_id"])
      end
      
      Santa.create(giver_id: giver.id, receiver_id: receiver.id, draw_id: draw.id)
    end
    if @draw.update(draw_params)
      render json: @draw
    else
      render json: @draw.errors, status: :unprocessable_entity
    end
  end

  # DELETE /draws/1
  def destroy
    @draw.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draw
      @draw = Draw.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def draw_params
      params.fetch(:draw, {})
    end
end