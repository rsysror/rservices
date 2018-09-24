class Partner::PortfoliosController < PartnerController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  
  def show; end

  def edit
    # @portfolio = Portfolio.find(current_user.portfolio.id)
    # @cities = City.details.order(:name)
    # @services = Service.get_services
  end

  def update
    if @portfolio.update(portfolio_params)
      flash[:success] = 'Portfolio updated successfully!.'
      redirect_to partner_portfolio_path(@portfolio) 
    else
      render :edit 
    end
  end

  
  def destroy
    @portfolio.destroy
    flash[:success] = 'Portfolio deleted successfully!.'
    redirect_to portfolios_url
  end

  def get_subservices
    @subservices = Service.where(:parent_id => params[:parent_id])
    render :partial => "subservices", :object => @subservices
  end

  # def get_city_service_list
  #   if params[:portfolio][:city_id].present?
  #     @city = City.find(params[:portfolio][:city_id])
  #     @services = @city.services
  #   end
  # end
 
  #UPLOAD photos for portfolio 
  def upload_photos
    portfolio = Portfolio.find_by_id(params[:portfolio][:portfolio_id])
    if params[:portfolio][:images].present?
      portfolio.images += params[:portfolio][:images]
      portfolio.save(validate: false)
      flash[:success] = 'Photo added successfully!.'
    end
    redirect_to partner_portfolio_path
  end

  # Delete Portfolio Photo
  def delete_photo
    portfolio = Portfolio.find(params[:id])
    remain_images = portfolio.images # copy the array
    deleted_image = remain_images.delete_at(params[:index].to_i) # delete the target image
    deleted_image.try(:remove!) # delete image from S3
    portfolio.images = remain_images # re-assign back
    portfolio.save(validate: false)
    flash[:success] = 'Photo deleted successfully!.'
    redirect_to partner_portfolio_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio
    @portfolio = current_user.portfolio
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def portfolio_params
    params.require(:portfolio).permit(:gender, :about, :experience, :education, :avatar, :city_id, :service_id, {documents: []}, {images: []}, :company_name, :address,:company_ph_no)
  end
    
end
