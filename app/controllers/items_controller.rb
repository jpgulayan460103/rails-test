class ItemsController < ApplicationController
  def index
  end
  def show
    @title = 'Items'
    @users = Item.page(params[:page])
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
  def listItems
    # render :json => Item.all
    respond_to do |format|
      format.html
      format.json do
        render :json => {:result => Item.page(1) }
      end
    end
    # render plain: paginate @users
  end
end
