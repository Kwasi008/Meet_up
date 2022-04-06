class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def index
    # @groups = Group.all
    @groups = Group.paginate(page: params[:page], per_page: 10)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group
      flash.notice = 'Group was successfully created.'
    else
      redirect_to new_group_path
      flash.alert = @group.errors.full_messages.to_s
    end
  end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to @group
      flash.notice = 'Group was successfully updated.'
    else
      redirect_to edit_group_path
      flash.alert = @group.errors.full_messages.to_s
    end
  end

  def destroy
    if @group.destroy
      redirect_to groups_path
      flash.notice = 'Group has been deleted '
    else
      redirect_to groups_path
      flash.alert = @group.errors.full_messages.to_sentence
    end
  end

  def import_page
  end

  def import
    begin
      Group.import(params[:file])
      redirect_to root_url, notice: "Imported successfully."
    rescue
     redirect_to root_url, notice: "Invalid CSV file format."
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  rescue Exception => e
    redirect_to groups_path
    flash.alert = e.to_s
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
