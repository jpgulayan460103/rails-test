class ItemsController < ApplicationController
  def index
    @title = 'Items'
    @users = Item.page(params[:page])
  end
  def show
    @item = Item.find(params[:id]);
    respond_to do |format|
      format.html { render json: @item }
      format.json { render json: @item.as_json }
    end
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
    @items = Item.page(params[:page])
    respond_to do |format|
      format.html
        # render :json => @items, each_serializer: ItemSerializer
      format.json do
        render partial: "itemsList", locals: {items: @items}
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
