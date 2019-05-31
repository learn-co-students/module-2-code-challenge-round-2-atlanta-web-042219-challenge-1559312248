class AppearancesController < ApplicationController

    def new
      @appearance = Appearance.new
    end

    def create
        @appearance = Appearance.create(app_params)
        if @appearance.save
            redirect_to episode_path(@appearance.episode_id)
        else
            render :new
        end
    end

    private

    def app_params
        params.require(:appearance).permit(:guest_id, :episode_id, :rating)
    end
  end