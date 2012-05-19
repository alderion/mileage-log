class FillUpsController < ApplicationController
  # GET /fill_ups
  # GET /fill_ups.json
  def index
    @vehicle = Vehicle.find(params[:vehicle_id])
    @fill_ups = @vehicle.fill_ups

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fill_ups }
    end
  end

  # GET /fill_ups/1
  # GET /fill_ups/1.json
  def show
    @vehicle = Vehicle.find(params[:vehicle_id])
    @fill_up = @vehicle.fill_ups.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fill_up }
    end
  end

  # GET /fill_ups/new
  # GET /fill_ups/new.json
  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    odometer = @vehicle.get_last_odometer
    cost = @vehicle.get_last_cost_per_gallon
    @fill_up = @vehicle.fill_ups.build
    @fill_up.odometer = odometer
    @fill_up.cost_per_gallon = cost

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fill_up }
    end
  end

  # GET /fill_ups/1/edit
  def edit
    #@vehicle = Vehicle.find(params[:vehicle_id])
    #@fill_up = @vehicle.fill_ups.find(params[:id])
    @fill_up = Fill_up.find(params[:id])
  end

  # POST /fill_ups
  # POST /fill_ups.json
  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    if @vehicle.get_last_odometer == params[:fill_up][:odometer].to_i
      @fill_up = @vehicle.get_last_fill_up
      @fill_up.gallons += params[:fill_up][:gallons].to_i
    else
      @fill_up = @vehicle.fill_ups.build(params[:fill_up])
    end

    @fill_up.mpg = (@vehicle.get_last_odometer - @vehicle.get_second_to_last_fill_up.odometer) / @fill_up.gallons

    respond_to do |format|
      if @fill_up.save
        @vehicle.trigger_service_items @fill_up.odometer
        #format.html { redirect_to vehicle_fill_up_path(@vehicle, @fill_up), notice: 'Fill up was successfully created.' }
        format.html { redirect_to vehicle_path(@vehicle), notice: 'Fill up was successfully created.' }
        format.json { render json: @fill_up, status: :created, location: @fill_up }
      else
        format.html { render action: "new" }
        format.json { render json: @fill_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fill_ups/1
  # PUT /fill_ups/1.json
  def update
    @vehicle = Vehicle.find(params[:vehicle_id])
    @fill_up = @vehicle.fill_ups.find(params[:id])

    respond_to do |format|
      if @fill_up.update_attributes(params[:fill_up])
        format.html { redirect_to @fill_up, notice: 'Fill up was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fill_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fill_ups/1
  # DELETE /fill_ups/1.json
  def destroy
    @vehicle = Vehicle.find(params[:vehicle_id])
    @fill_up = @vehicle.fill_ups.find(params[:id])
    @fill_up.destroy

    respond_to do |format|
      format.html { redirect_to fill_ups_url }
      format.json { head :no_content }
    end
  end
end
