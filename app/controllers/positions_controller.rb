class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  # GET /positions
  # GET /positions.json
  def index
    @positions = Position.all
  end

  # GET /positions/1
  # GET /positions/1.json
  def show
  end

  # GET /positions/new
  def new
    @invoice = Invoice.find(params[:invoice_id])
    puts @invoice.name
    @position = @invoice.positions.build
    @path = [@invoice, @position]
  end

  # GET /positions/1/edit
  def edit
  end

  # POST /positions
  # POST /positions.json
  def create
  
    
    @position = Position.new(position_params)

    # respond_to do |format|
    #   if @position.save
    #     format.html { redirect_to @position, notice: 'Position was successfully created.' }
    #     format.json { render :show, status: :created, location: @position }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @position.errors, status: :unprocessable_entity }
    #   end
    # end

    @invoice = Invoice.find(params[:invoice_id])
    @position = @invoice.positions.new(position_params)
    if @position.save
      redirect_to @invoice
    else
      redirect_to new_invoice_position_path
    end
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to @position, notice: 'Position was successfully updated.' }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to positions_url, notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def position_params
      params.require(:position).permit(:name, :description, :hours)
    end

end
