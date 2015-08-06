require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/portfolio_controller'

# Re-raise errors caught by the controller.
class Admin::PortfolioController; def rescue_action(e) raise e end; end

class Admin::PortfolioControllerTest < Test::Unit::TestCase
  fixtures :portfolio_entries

  def setup
    @controller = Admin::PortfolioController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = portfolio_entries(:first).id
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

    assert_not_nil assigns(:portfolio_entries)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:portfolio_entry)
    assert assigns(:portfolio_entry).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:portfolio_entry)
  end

  def test_create
    num_portfolio_entries = PortfolioEntry.count

    post :create, :portfolio_entry => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_portfolio_entries + 1, PortfolioEntry.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:portfolio_entry)
    assert assigns(:portfolio_entry).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      PortfolioEntry.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      PortfolioEntry.find(@first_id)
    }
  end
end
