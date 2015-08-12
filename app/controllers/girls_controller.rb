class GirlsController < ApplicationController
  before_action :set_girl, only: [:show, :edit, :update, :destroy]

  # GET /girls
  def index
    @girls = Girl.all
  end

  # GET /girls/1
  def show
  end

  # GET /girls/new
  def new
    @girl = Girl.new
  end

  # GET /girls/1/edit
  def edit
  end

  # POST /girls
  def create
    @girl = Girl.new(girl_params)

    if @girl.save
      redirect_to @girl, notice: 'Girl was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /girls/1
  def update
    if @girl.update(girl_params)
      redirect_to @girl, notice: 'Girl was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /girls/1
  def destroy
    @girl.destroy
    redirect_to girls_url, notice: 'Girl was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_girl
      @girl = Girl.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def girl_params
      params.require(:girl).permit(:name, :city, :age)
    end
end
