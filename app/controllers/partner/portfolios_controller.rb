# Portfolio Controller
class Partner::PortfoliosController < PartnerController
  # frozen_string_literal: true
  before_action :set_portfolio, only: %I[show edit update destroy]

  def show; end

  def edit; end

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
    @subservices = Service.where(parent_id: params[:parent_id])
    render partial: 'subservices', object: @subservices
  end

  # UPLOAD photos for portfolio
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
    remain_images = portfolio.images
    deleted_image = remain_images.delete_at(params[:index].to_i)
    deleted_image.try(:remove!)
    portfolio.images = remain_images
    portfolio.save(validate: false)
    flash[:success] = 'Photo deleted successfully!.'
    redirect_to partner_portfolio_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio
    @portfolio = current_user.portfolio
  end

  # WhiteList the Parameters
  def portfolio_params
    params.require(:portfolio).permit(:gender, :about, :experience,
                                      :education, :avatar, :city_id,
                                      :service_id, { documents: [] },
                                      { images: [] }, :company_name,
                                      :address, :company_ph_no)
  end
end
