class OpenLettersController < ApplicationController

  before_action :set_paper_trail_whodunnit
  before_action :find_open_letter, only: [:show, :edit, :update]

  caches_page :show

  def index
    @open_letters = OpenLetter.all
  end

  def show
  end

  def new
    if current_user.present? && current_user.open_letter.present?
      flash[:notice] = "Currently limited to one Open Letter per user"
      redirect_to edit_open_letter_path(current_user.open_letter)
    end

    @open_letter = OpenLetter.new
  end

  def create
    @open_letter = OpenLetter.new(open_letter_params)
    @open_letter.user = current_user

    if @open_letter.save
      flash.clear
      redirect_to @open_letter
    else
      flash.now[:error] = @open_letter.errors.full_messages
      render "new"
    end
  end

  def edit
  end

  def update
    if @open_letter.update_attributes(open_letter_params)
      flash.clear
      expire_page action: "show", id: @open_letter.id
      redirect_to @open_letter
    else
      flash.now[:error] = @open_letter.errors.full_messages
      render "edit"
    end
  end

  def destroy
  end

  private

  def find_open_letter
    @open_letter ||= OpenLetter.find(params[:id])
  end

  def open_letter_params
    params.require(:open_letter).permit(
      :body,
      :title
    )
  end
end
