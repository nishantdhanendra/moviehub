class Api::V1::ViewersController < Api::V1::GraphitiController
  def index
    viewers = ViewerResource.all(params)
    respond_with(viewers)
  end

  def show
    viewer = ViewerResource.find(params)
    respond_with(viewer)
  end

  def create
    viewer = ViewerResource.build(params)

    if viewer.save
      render jsonapi: viewer, status: :created
    else
      render jsonapi_errors: viewer
    end
  end

  def update
    viewer = ViewerResource.find(params)

    if viewer.update_attributes
      render jsonapi: viewer
    else
      render jsonapi_errors: viewer
    end
  end

  def destroy
    viewer = ViewerResource.find(params)

    if viewer.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: viewer
    end
  end
end
