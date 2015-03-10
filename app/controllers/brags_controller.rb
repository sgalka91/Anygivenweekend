class BragsController < ApplicationController
  layout 'application'


    def index
      @brags = Brag.all
    end

    def create
      @brag = Brag.new(params[:brag].permit(:title, :weight, :lake, :city, :state, :rig, :bait))
      @brag.image = params[:brag][:imageData].original_filename
      if @brag.save

        uploaded_io = params[:brag][:imageData]
        File.open(Rails.root.join('public', 'brags', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end

        redirect_to('/my-account/', :notice => "Brag #{@brag.title} was successfully created.")
      end

    end

  def new
    if !@member
      redirect_to login_url(:redir => '/brags/new')
    end

    @brag = Brag.new
  end

end