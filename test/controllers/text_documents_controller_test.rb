require 'test_helper'

class TextDocumentsControllerTest < ActionController::TestCase
  setup do
    @text_document = text_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:text_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create text_document" do
    assert_difference('TextDocument.count') do
      post :create, text_document: { content_type: @text_document.content_type, file_contents: @text_document.file_contents, filename: @text_document.filename }
    end

    assert_redirected_to text_document_path(assigns(:text_document))
  end

  test "should show text_document" do
    get :show, id: @text_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @text_document
    assert_response :success
  end

  test "should update text_document" do
    patch :update, id: @text_document, text_document: { content_type: @text_document.content_type, file_contents: @text_document.file_contents, filename: @text_document.filename }
    assert_redirected_to text_document_path(assigns(:text_document))
  end

  test "should destroy text_document" do
    assert_difference('TextDocument.count', -1) do
      delete :destroy, id: @text_document
    end

    assert_redirected_to text_documents_path
  end
end
