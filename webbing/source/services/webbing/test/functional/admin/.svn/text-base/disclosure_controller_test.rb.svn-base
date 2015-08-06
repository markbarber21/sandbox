require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/disclosure_controller'

# Re-raise errors caught by the controller.
class Admin::DisclosureController; def rescue_action(e) raise e end; end

class Admin::DisclosureControllerTest < Test::Unit::TestCase
  fixtures :disclosures

  def setup
    @controller = Admin::DisclosureController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = disclosures(:first).id
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

    assert_not_nil assigns(:disclosures)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:disclosures)
    assert assigns(:disclosures).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:disclosures)
  end

  def test_create
    num_disclosures = Disclosures.count

    post :create, :disclosures => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_disclosures + 1, Disclosures.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:disclosures)
    assert assigns(:disclosures).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Disclosures.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Disclosures.find(@first_id)
    }
  end
end
