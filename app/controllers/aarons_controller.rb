class AaronsController < ApplicationController
  before_action :set_aaron, only: [:show, :edit, :update, :destroy]

  # GET /aarons
  # GET /aarons.json
  def index
    @aarons = Aaron.all
  end

  # GET /aarons/1
  # GET /aarons/1.json
  def show
  end

  # GET /aarons/new
  def new
    @aaron = Aaron.new
  end

  # GET /aarons/1/edit
  def edit
  end

  # POST /aarons
  # POST /aarons.json
  def create
    @aaron = Aaron.new(aaron_params)

    respond_to do |format|
      if @aaron.save
        format.html { redirect_to @aaron, notice: 'Aaron was successfully created.' }
        format.json { render :show, status: :created, location: @aaron }
      else
        format.html { render :new }
        format.json { render json: @aaron.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aarons/1
  # PATCH/PUT /aarons/1.json
  def update
    respond_to do |format|
      if @aaron.update(aaron_params)
        format.html { redirect_to @aaron, notice: 'Aaron was successfully updated.' }
        format.json { render :show, status: :ok, location: @aaron }
      else
        format.html { render :edit }
        format.json { render json: @aaron.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aarons/1
  # DELETE /aarons/1.json
  def destroy
    @aaron.destroy
    respond_to do |format|
      format.html { redirect_to aarons_url, notice: 'Aaron was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aaron
      @aaron = Aaron.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aaron_params
      params.require(:aaron).permit(:title, :content)
    end
end
