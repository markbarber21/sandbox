require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/recommendation_controller'

# Re-raise errors caught by the controller.
class Admin::RecommendationController; def rescue_action(e) raise e end; end

class Admin::RecommendationControllerTest < Test::Unit::TestCase
  fixtures :recommendations

  def setup
    @controller = Admin::RecommendationController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = recommendations(:first).id
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

    assert_not_nil assigns(:recommendations)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:recommendations)
    assert assigns(:recommendations).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:recommendations)
  end

  def test_create
    num_recommendations = Recommendations.count

    post :create, :recommendations => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_recommendations + 1, Recommendations.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:recommendations)
    assert assigns(:recommendations).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Recommendations.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Recommendations.find(@first_id)
    }
  end
end
