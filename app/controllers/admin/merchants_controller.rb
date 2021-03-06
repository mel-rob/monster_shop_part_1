class Admin::MerchantsController < Admin::BaseController

  def show
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])
    if params[:enable_disable] == 'enable'
      @merchant.enable
      flash[:success] = 'Ahoy! This merchant has re-joined the ranks.'
    else
      @merchant.disable
      flash[:success] = 'This merchant has walked the plank.'
    end
    redirect_to "/merchants"
  end
end
