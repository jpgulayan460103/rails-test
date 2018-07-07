class ItemsController < ApplicationController
  include AuthenticationControllerHelper
  before_action :authenticateUsers
  def index
    @title = 'Items'
    # puts session[:user]
  end
  def show
    @item = Item.find_by_id(params[:id]);
    render json: @item
    # respond_to do |format|
    #   format.html { render json: @item }
    #   format.json { render json: @item }
    # end
  end
  def update
    @item = Item.find_by_id(params[:id])
    @item.update(permittedParams)
    respond_to do |format|
      format.html
      format.json do
        saveItem @item
      end
    end
  end
  def create
    @item = Item.new(permittedParams)
    respond_to do |format|
      format.html
      format.json do
        saveItem @item
      end
    end
  end
  def itemsList
    @items = Item.order(name: :asc).page(params[:page])
    results = {
      :results => results = ActiveModelSerializers::SerializableResource.new(@items, {each_serializer: ItemSerializer, include: ""}),
      :pagination => {
        :total_rows => @items.total_pages,
        :per_page => @items.limit_value,
        :current_page => params[:page].to_i,
      }
    }
    respond_to do |format|
      format.html
      format.json do
        render :json => results.to_json
      end
    end

    def destroy
      @items = Item.find(params[:id])
      @items.destroy
    end
    # render plain: paginate @users
  end

  private
  def permittedParams
    params[:formData].present? ? params[:formData].permit(:name, :category, :dealers_price, :retail_price, :subcategory, :unit_of_measure, :id) : false
  end
  def saveItem (item)
    if item.save
      render json: item
    else
      render json: { message: "Validation failed", errors: item.errors }, status: 422
    end
  end
end
