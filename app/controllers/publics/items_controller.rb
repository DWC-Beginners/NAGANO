class Publics::ItemsController < Publics::ApplicationController
  
  def index
    @item = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  private
  def product_params
   params.require(:product).permit(:image, :name, :description)
 end
end
