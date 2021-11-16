class ViewersController < ApplicationController
  before_action :set_viewer, only: %i[show edit update destroy]

  # GET /viewers
  def index
    @viewers = Viewer.page(params[:page]).per(10)
  end

  # GET /viewers/1
  def show; end

  # GET /viewers/new
  def new
    @viewer = Viewer.new
  end

  # GET /viewers/1/edit
  def edit; end

  # POST /viewers
  def create
    @viewer = Viewer.new(viewer_params)

    if @viewer.save
      redirect_to @viewer, notice: "Viewer was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /viewers/1
  def update
    if @viewer.update(viewer_params)
      redirect_to @viewer, notice: "Viewer was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /viewers/1
  def destroy
    @viewer.destroy
    redirect_to viewers_url, notice: "Viewer was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_viewer
    @viewer = Viewer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def viewer_params
    params.require(:viewer).permit(:movie_id)
  end
end
