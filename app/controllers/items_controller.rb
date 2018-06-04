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
    @users = Item.page(params[:page])
    
    # render :json => Item.all
    #   render :json => {
    #     :result => Item.page(1).total_pages.inspect
    # }
    respond_to do |format|
      format.html
      format.json do
        render partial: "listItems", locals: {users: @users}
      end
    end
    # render plain: paginate @users
  end
end
