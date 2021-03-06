# frozen_string_literal: true

class ContributorsSearchesController < ApplicationController
  def new; end

  def create
    @contributors_search = ContributorsSearch.new(contributors_search_params)

    if contributors_search.save
      redirect_to contributors_search
    else
      flash[:alert] = 'You have provided bad url.'
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.zip do
        send_data contributors_search.generate_zip.read, filename: 'diplomas.zip'
      end
    end
  end

  private

  def contributors_search_params
    params.require(:contributors_search).permit(:url)
  end

  def contributors_search
    @contributors_search ||= params[:id] ? ContributorsSearch.find(params[:id]) : ContributorsSearch.new
  end

  helper_method :contributors_search
end
