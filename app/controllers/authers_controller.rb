class AuthersController < ApplicationController
  before_action :set_auther, only: %i[ show edit update destroy ]

  # GET /authers or /authers.json
  def index
    @authers = Auther.all
  end

  # GET /authers/1 or /authers/1.json
  def show
  end

  # GET /authers/new
  def new
    @auther = Auther.new
  end

  # GET /authers/1/edit
  def edit
  end

  # POST /authers or /authers.json
  def create
    @auther = Auther.new(auther_params)

    respond_to do |format|
      if @auther.save
        format.html { redirect_to auther_url(@auther), notice: "Auther was successfully created." }
        format.json { render :show, status: :created, location: @auther }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @auther.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authers/1 or /authers/1.json
  def update
    respond_to do |format|
      if @auther.update(auther_params)
        format.html { redirect_to auther_url(@auther), notice: "Auther was successfully updated." }
        format.json { render :show, status: :ok, location: @auther }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @auther.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authers/1 or /authers/1.json
  def destroy
    @auther.destroy

    respond_to do |format|
      format.html { redirect_to authers_url, notice: "Auther was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def destroy_picture
    @picture = ActiveStorage::Attachment.find(params[:picture_id])
    @picture.purge
    if params[:class_name] == 'Auther'
      redirect_to auther_path(params[:id])
    elsif params[:class_name] == 'Book'
      redirect_to book_path(params[:id])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auther
      @auther = Auther.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auther_params
      params.require(:auther).permit(:name, :address, :profile_picture)
    end
end
