class StudyTypesController < ApplicationController
  before_action :set_study_type, only: [:show, :update, :destroy]

  # GET /study_types
  # GET /study_types.json
  def index
    #@study_types = StudyType.all
    @study_types = StudyType.where(deleted_at: nil)
    if params[:id].present?
      set_study_type
    else
      @study_type = StudyType.new
    end
  end

  # GET /study_types/1
  # GET /study_types/1.json
  def show
  end

  # POST /study_types
  # POST /study_types.json
  def create
    @study_type = StudyType.new(study_type_params)

    respond_to do |format|
      if @study_type.save
        format.html { redirect_to study_types_path, notice: '学習タイプの新規登録が完了した。' }
        format.json { render :show, status: :created, location: @study_type }
      else
        format.html { render :new }
        format.json { render json: @study_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_types/1
  # PATCH/PUT /study_types/1.json
  def update
    respond_to do |format|
      if @study_type.update(study_type_params)
        format.html { redirect_to study_types_path, notice: '学習タイプの更新が完了した。' }
        format.json { render :show, status: :ok, location: @study_type }
      else
        format.html { render :edit }
        format.json { render json: @study_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_types/1
  # DELETE /study_types/1.json
  def destroy

    @study_type.deleted_at = Date.today.to_time
    respond_to do |format|
      if @study_type.save
        format.html { redirect_to study_types_url, notice: '学習タイプの削除が完了した。' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_type
      @study_type = StudyType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def study_type_params
      params.fetch(:study_type, {}).permit(
        :type_name,
        :remark,
      )
    end
end
