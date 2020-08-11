class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures/new' do
    new_fig = Figure.create(name: params[:figure][:name])
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each { |title_id| new_fig.titles << Title.find(title_id) }
    end
    if !params[:title][:name].empty?
      new_fig.titles << Title.create(name: params[:title][:name])
    end
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each { |landmark_id| new_fig.landmarks << Landmark.find(landmark_id) }
    end
    if !params[:landmark][:name].empty?
      new_fig.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    new_fig.save
    redirect to "/figures/#{new_fig.id}"
  end

  get '/figures' do
    @figures = Figure.all 
    erb :'figures/index'
  end

  get '/figures/:id' do
    @fig = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @fig = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @fig = Figure.find(params[:id])
    @fig.name = params[:figure][:name]
    @fig.titles = []
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        @fig.titles << Title.find(title_id)
      end
    end
    if !params[:title][:name].empty?
      @fig.titles << Title.create(name: params[:title][:name])
    end
    @fig.landmarks = []
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |landmark_id|
        @fig.landmarks << Landmark.find(landmark_id)
      end
    end
    if !params[:landmark][:name].empty?
      @fig.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    @fig.save
    redirect to "figures/#{@fig.id}"
  end

end
