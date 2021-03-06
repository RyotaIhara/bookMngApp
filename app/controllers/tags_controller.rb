class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    #@tags = Tag.all
    @tags = Tag.where(deleted_at: nil).page(params[:page]).per(7)
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /study_books/new
  def new
    @tag = Tag.new
  end

  # GET /study_books/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'タグの新規登録が完了した。' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'タグの新更新が完了した。' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.deleted_at = Date.today.to_time
    respond_to do |format|
      if @tag.save(validate: false)
        StudyBookTagRelation.where(tag_id: @tag.id).destroy_all
        format.html { redirect_to tags_url, notice: '学習タイプの削除が完了した。' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.fetch(:tag, {}).permit(
        :tag_name,
        :remark,
      )
    end
end
