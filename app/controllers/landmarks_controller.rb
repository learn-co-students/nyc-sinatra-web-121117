class LandmarksController < ApplicationController

  #INDEX ACTION
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  #NEW ACTION
  get '/landmarks/new' do
    @figures = Figure.all #giving access to the variable in our new.erb file
    erb :'/landmarks/new'
  end

  #CREATE ACTION
  post '/landmarks' do
    @landmark = Landmark.create(name: params[:name], year_completed: params[:year_completed], figure_id: params[:figure_id])
    redirect "/landmarks/#{@landmark.id}"
  end

  #SHOW ACTION
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  #EDIT ACTION

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all #giving them access to figures varible in our edit.erb file
    erb :"/landmarks/edit"
  end

  #UPDATE ACTION

  patch "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:name], year_completed: params[:year_completed], figure_id: params[:figure_id])
    redirect "/landmarks/#{@landmark.id}"
  end

  #DESTROY ACTION

  delete "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @landmark.destroy
    redirect "/landmarks"
  end

end
