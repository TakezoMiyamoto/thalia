class WorksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  require 'date'

  def index
    @works = Work.order(created_at: :desc)
    @title = 'ワークス一覧'
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
    @title = '新規ワークの作成'
  end

  def create
    @work = current_user.works.build(works_params)
    if @work.save
      flash[:success] = "新規Workを作成しました！"
      redirect_to @work
    else
      render 'new'
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(edit_work_params)
      flash[:success] = 'ワーク内容が更新されました。'
      redirect_to @work
    else
      render 'edit'
    end
  end

  def destroy
    @work = current_user.works.find_by(id: params[:id])
    return redirect_to root_url if @work.nil?
    @work.destroy
    flash[:success] = 'ワークは削除されました.'
    redirect_to works_path
  end

  private

  def works_params
    params.require(:work).permit(:title, :description, :youtube_url)
  end

  def edit_work_params
    params.require(:work).permit(:title, :description, :youtube_url)
  end

  def works_owner
    @work = Work.find(params[:id])
    unless @work.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this work'
      redirect_to works_path
    end
  end
end
