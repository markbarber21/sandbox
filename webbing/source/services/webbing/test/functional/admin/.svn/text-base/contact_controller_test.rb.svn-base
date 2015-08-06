require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/contact_controller'

# Re-raise errors caught by the controller.
class Admin::ContactController; def rescue_action(e) raise e end; end

class Admin::ContactControllerTest < Test::Unit::TestCase
  fixtures :contacts

  def setup
    @controller = Admin::ContactController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = contacts(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:contacts)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:contact)
    assert assigns(:contact).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:contact)
  end

  def test_create
    num_contacts = Contact.count

    post :create, :contact => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_contacts + 1, Contact.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:contact)
    assert assigns(:contact).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Contact.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Contact.find(@first_id)
    }
  end
end
