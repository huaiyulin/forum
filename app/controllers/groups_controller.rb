class GroupsController < ApplicationController
  before_action :set_group, only:[:show, :edit, :update, :destroy]
	def index
    @groups = Group.all
  end

  def show
  end

  def edit
  end

  def new
    @group = Group.new
  end

  def create
    # both OK 
    # @group = Group.create(group_params)
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def update
    @group.update(group_params)
    if @group.save
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, alert: 'Group was successfully destroyed.'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
