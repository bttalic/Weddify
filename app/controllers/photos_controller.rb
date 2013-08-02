class PhotosController < ApplicationController
  # GET /uploads
  # GET /uploads.json
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos.map{|upload| photo.to_jq_upload } }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  

  # POST /uploads
  # POST /uploads.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@photo.to_jq_upload]}, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

 

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end
