class AdvertisesController < InheritedResources::Base

	def index
		@advertises = Advertise.all
	end	



  def new

    if user_signed_in?
      @advertise = Advertise.new
    end  
    
  end

  def create
    @advertise = Advertise.new(advertise_params)

    respond_to do |format|
      if @advertise.save
        format.html { redirect_to @advertise, notice: 'advertise was successfully created.' }
        format.json { render :show, status: :created, location: @advertise }
      else
        format.html { render :new }
        format.json { render json: @advertise.errors, status: :unprocessable_entity }
      end
    end
  end



  def show
    @advertise = Advertise.find(params[:id])
    @hash = []
    @hash[0]= { lat: 31.2 , lng: 29.9167 ,

                  picture: {
                  icon: 'http://www.kjftw.com/gmap/images/icons/numeric/red10.png',
                  width:  35,
                  height: 35
                          } ,
                  infowindow: @advertise.desc
              }
  end



  private

    def advertise_params
      params.require(:advertise).permit( :desc, :mytype, :city, :address, :user_id, :avatar)
    end

end

