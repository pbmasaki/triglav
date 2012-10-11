class ServicesController < ApplicationController
  respond_to :html, :json

  def index
    @services = Service.all
    respond_with @services
  end

  def show
    @service = Service.find(params[:id])
    respond_with @services
  end

  def new
    @service = Service.new
    respond_with @services
  end

  def edit
    @service = Service.find(params[:id])
    respond_with @services
  end

  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :description)
  end
end