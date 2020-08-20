class StudyBooksController < ApplicationController
  before_action :set_study_book, only: [:show, :edit, :update, :destroy]

  # GET /study_books
  # GET /study_books.json
  def index
    '''
    @study_books = params[:tag_id].present? 
      ? Tag.find(params[:tag_id]).study_books.where(deleted_at: nil, user_id: @current_user.id)
        : StudyBook.where(deleted_at: nil, user_id: @current_user.id)
    '''
    #@study_books = StudyBook.where(deleted_at: nil, user_id: @current_user.id)

    if params[:tag_id].present?
      @@tmp_tudy_books = Tag.find(params[:tag_id]).study_books
  
      @study_books = @@tmp_tudy_books.select do |study_book|
        study_book.deleted_at == nil
      end
    else
      @study_books = StudyBook.where(deleted_at: nil, user_id: @current_user.id)
    end

  end

  # GET /study_books/1
  # GET /study_books/1.json
  def show
  end

  # GET /study_books/new
  def new
    @study_book = StudyBook.new
  end

  # GET /study_books/1/edit
  def edit
  end

  # POST /study_books
  # POST /study_books.json
  def create
    @study_book = StudyBook.new(study_book_params)
    @study_book.user_id = @current_user.id

    respond_to do |format|
      if @study_book.save
        format.html { redirect_to @study_book, notice: '参考書の追加が完了した。' }
        format.json { render :show, status: :created, location: @study_book }
      else
        format.html { render :new }
        format.json { render json: @study_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_books/1
  # PATCH/PUT /study_books/1.json
  def update
    respond_to do |format|
      if @study_book.update(study_book_params)
        format.html { redirect_to @study_book, notice: '参考書の更新が完了した。' }
        format.json { render :show, status: :ok, location: @study_book }
      else
        format.html { render :edit }
        format.json { render json: @study_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_books/1
  # DELETE /study_books/1.json
  def destroy
    @study_book.deleted_at = Date.today.to_time
    respond_to do |format|
      if @study_book.save
        format.html { redirect_to study_books_url, notice: '参考書の削除が完了した。' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_book
      @study_book = StudyBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def study_book_params
      params.fetch(:study_book, {}).permit(
        :book_name,
        :study_type_id,
        :author,
        :publisher,
        :price,
        :remark,
        tag_ids: []
      )
    end
end
