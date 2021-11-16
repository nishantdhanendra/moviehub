class ViewersController < ApplicationController
  before_action :set_viewer, only: %i[show edit update destroy]

  def index
    @viewers = Viewer.page(params[:page]).per(10)
  end

  def show; end

  def new
    @viewer = Viewer.new
  end

  def edit; end

  def create
    @viewer = Viewer.new(viewer_params)

    if @viewer.save
      redirect_to @viewer, notice: "Viewer was successfully created."
    else
      render :new
    end
  end

  def update
    if @viewer.update(viewer_params)
      redirect_to @viewer, notice: "Viewer was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @viewer.destroy
    redirect_to viewers_url, notice: "Viewer was successfully destroyed."
  end

  private

  def set_viewer
    @viewer = Viewer.find(params[:id])
  end

  def viewer_params
    params.require(:viewer).permit(:movie_id)
  end
end
