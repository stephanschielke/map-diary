class TextDocumentsController < ApplicationController
  before_action :set_text_document, only: [:show, :edit, :update, :destroy]

  # GET /text_documents
  # GET /text_documents.json
  def index
    @text_documents = TextDocument.all
  end

  # GET /text_documents/1
  # GET /text_documents/1.json
  def show  
    send_data(@text_document.file_contents,
              type: @text_document.content_type,
              filename: @text_document.filename)
  end  

  # GET /text_documents/new
  def new
    @text_document = TextDocument.new
  end

  # GET /text_documents/1/edit
  def edit
  end

  # POST /text_documents
  # POST /text_documents.json
  def create
    @text_document = TextDocument.new(text_document_params)

    respond_to do |format|
      if @text_document.save
        format.html { redirect_to @text_document, notice: 'Text document was successfully created.' }
        format.json { render :show, status: :created, location: @text_document }
      else
        format.html { render :new }
        format.json { render json: @text_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /text_documents/1
  # PATCH/PUT /text_documents/1.json
  def update
    respond_to do |format|
      if @text_document.update(text_document_params)
        format.html { redirect_to @text_document, notice: 'Text document was successfully updated.' }
        format.json { render :show, status: :ok, location: @text_document }
      else
        format.html { render :edit }
        format.json { render json: @text_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_documents/1
  # DELETE /text_documents/1.json
  def destroy
    @text_document.destroy
    respond_to do |format|
      format.html { redirect_to text_documents_url, notice: 'Text document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_document
      @text_document = TextDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_document_params
      params.require(:text_document).permit(:file)
    end

end
