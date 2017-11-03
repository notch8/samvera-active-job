class SearchRecordsController < ApplicationController
  before_action :set_search_record, only: [:show, :edit, :update, :destroy]

  # GET /search_records
  # GET /search_records.json
  def index
    @search_records = SearchRecord.all
  end

  # GET /search_records/1
  # GET /search_records/1.json
  def show
  end

  # GET /search_records/new
  def new
    @search_record = SearchRecord.new
  end

  # GET /search_records/1/edit
  def edit
  end

  # POST /search_records
  # POST /search_records.json
  def create
    @search_record = SearchRecord.new(search_record_params)

    respond_to do |format|
      if @search_record.save
        format.html { redirect_to @search_record, notice: 'Search record was successfully created.' }
        format.json { render :show, status: :created, location: @search_record }
      else
        format.html { render :new }
        format.json { render json: @search_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_records/1
  # PATCH/PUT /search_records/1.json
  def update
    respond_to do |format|
      if @search_record.update(search_record_params)
        format.html { redirect_to @search_record, notice: 'Search record was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_record }
      else
        format.html { render :edit }
        format.json { render json: @search_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_records/1
  # DELETE /search_records/1.json
  def destroy
    @search_record.destroy
    respond_to do |format|
      format.html { redirect_to search_records_url, notice: 'Search record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_record
      @search_record = SearchRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_record_params
      params.require(:search_record).permit(:pattern, :count, :users)
    end
end
