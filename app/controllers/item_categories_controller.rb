class ItemCategoriesController < ApplicationController
  def index
    @item_categories = ItemCategory.all
    respond_to do |format|
      format.json { render json: @item_categories}
    end
  end
end
