class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks/new' do
    new_landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed].to_s)
    redirect to "/landmarks/#{new_landmark.id}"
  end

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.name = params[:landmark][:name]
    landmark.year_completed = params[:landmark][:year_completed].to_s
    landmark.save
    redirect to "/landmarks/#{landmark.id}"
  end



end
