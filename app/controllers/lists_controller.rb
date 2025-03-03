class ListsController < ApplicationController

  # GET /lists
  def index
    @lists = List.all
  end

  # Gets /lists/1
  def show
    @list = List.find(params[:id])
  end

  # GET /Lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: "list successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
