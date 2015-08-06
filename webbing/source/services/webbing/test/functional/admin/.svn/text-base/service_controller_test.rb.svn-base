require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/service_controller'

# Re-raise errors caught by the controller.
class Admin::ServiceController; def rescue_action(e) raise e end; end

class Admin::ServiceControllerTest < Test::Unit::TestCase
  fixtures :service_entries

  def setup
    @controller = Admin::ServiceController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = service_entries(:first).id
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

    assert_not_nil assigns(:service_entries)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:service_entry)
    assert assigns(:service_entry).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:service_entry)
  end

  def test_create
    num_service_entries = ServiceEntry.count

    post :create, :service_entry => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_service_entries + 1, ServiceEntry.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:service_entry)
    assert assigns(:service_entry).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      ServiceEntry.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      ServiceEntry.find(@first_id)
    }
  end
end
