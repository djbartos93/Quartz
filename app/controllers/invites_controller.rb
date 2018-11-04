class InvitesController < ApplicationController
  before_action :has_invites, only: [:new]
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  # GET /invites
  # GET /invites.json
  def index
    @invites = current_user.invites
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
    unless current_user.invites.include?(@invite)
      redirect_back fallback_location: invites_url
    end
  end

  # GET /invites/new
  def new
    @invite = current_user.invites.build
    @user = current_user
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites
  # POST /invites.json
  def create
    @invite = current_user.invites.build(invite_params)
    @user = current_user

    respond_to do |format|
      if @invite.save
        format.html { redirect_to @invite, notice: 'Invite was successfully created.' }
        format.json { render :show, status: :created, location: @invite }
      else
        format.html { render :new }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invites_url, notice: 'Invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def readonly?
    new_record? ? false : true
  end

  private
    def has_invites
      unless current_user.available_invites > 0
        flash[:alert] = "You have no invites left"
	redirect_back fallback_location: invites_url # TODO redirect to request page instead of just going back
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_params
      params.fetch(:invite, {})
    end
end
