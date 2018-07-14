class ItemsController < ApplicationController
  include AuthenticationControllerHelper
  before_action :authenticateUsers
  def index
    @title = 'Items'
  end
  def show
    @item = Item.find_by_id(params[:id]);
    respond_to do |format|
      format.html { render json: @item }
      format.json { render json: @item }
    end
  end
  def update
    @item = Item.find_by_id(params[:id])
    @item.update(permittedParams)
    respond_to do |format|
      format.html
      format.json do
        saveItem "update"
      end
    end
  end
  def create
    @item = Item.new(permittedParams)
    respond_to do |format|
      format.html
      format.json do
        saveItem "create"
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
  end
  def destroy
    @items = Item.find_by_id(params[:id])
    @items.destroy
  end
    # render plain: paginate @users

  private
  def saveItem (method)
    if @item.save
      @item_detail = @item.item_details.create({
        quantity: params[:formData][:beginning_quantity],
        remarks: "Beginning Quantity",
        cost_price: params[:formData][:retail_price]
      })
      render json: @item, include: ""
    else
      render json: { message: "Validation failed", errors: @item.errors }, status: 422
    end
  end
  def permittedParams
    params[:formData].present? ? params[:formData].permit(
      :id,
      :name,
      :category,
      :dealers_price,
      :retail_price,
      :subcategory,
      :code,
      :unit_of_measure,
      :reorder_level,
      :unit_of_measure,
      :beginning_quantity
    ) : false
  end
end
