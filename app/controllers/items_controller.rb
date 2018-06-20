class ItemsController < ApplicationController
  def index
    @title = 'Items'
    @users = Item.page(params[:page])
  end
  def show
    @item = Item.find(params[:id]);
    respond_to do |format|
      format.html
      format.json { render json: @item.as_json }
    end
  end
  def create
    # render plain: params.inspect
    # render :json => params
    newitems = {
      name: params[:formData][:itemName],
      category: params[:formData][:category],
      subcategory: params[:formData][:subcategory],
      retail_price: params[:formData][:retailPrice],
      dealers_price: params[:formData][:dealersPrice],
    }
    @item = Item.new(newitems)
    
    @item.save
    render :json => @item
  end
  def itemsList
    @items = Item.page(params[:page])
    # render plain: @items.to_json
    # item = ItemSerializer.new()
    # render :json => item
    #   render :json => {
    #     :result => Item.page(1).total_pages.inspect
    # }
    # render partial: "itemsList", locals: {items: @items}
    # render :json => @items
    # render plain: Oj.dump(@items._json)
    # render plain: @items.object.to_json
    respond_to do |format|
      format.html
        # render :json => @items, each_serializer: ItemSerializer
      format.json do
        render partial: "itemsList", locals: {items: @items}
      end
    end
    # render plain: paginate @users
  end
end
