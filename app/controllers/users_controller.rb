class UsersController < ApplicationController

  def new
    @user_form = UserForm.new(User.new())
  end

  def show
  end

  def create
    @user_form = UserForm.new(User.new(user_params))
    respond_to do |format|
      if @user_form.validate(user_params)
        response = UserBitexManager.new(@user_form.model).call
        @show_presenter = ShowPresenter.new(response)
        flash[:success] = 'Datos cargados correctamente.'
        format.html { render :show, notice: 'OK' }
      else
        format.html { render :new, notice: 'ERROR create' }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nationality,
      :birth_date, :document, :document_file_name, :address, :address_file_name)
  end
end