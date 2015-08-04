class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_general_group, only:[:show]
  before_action :set_user_group, only:[:edit, :update, :destroy]

	def index
    @groups = Group.all
  end

  def show
    @posts = @group.posts
  end

  def edit
  end

  def new
    @group = current_user.groups.new
  end

  def create
    # both OK 
    # @group = Group.create(group_params)
    @group = current_user.groups.new(group_params)
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

  def set_general_group
    @group = Group.find(params[:id])
  end

  def set_user_group
    @group = current_user.groups.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
