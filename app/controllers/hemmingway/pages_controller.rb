require_dependency "hemmingway/application_controller"

module Hemmingway
  class PagesController < ApplicationController

    layout :get_layout
    before_action :setup
    before_action :admin_check, except: [:show]
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    # GET /pages
    def index
      @pages = Page.all
    end

    # GET /pages/1
    def show
    end

    # GET /pages/new
    def new
      @page = Page.new
    end

    # GET /pages/1/edit
    def edit
    end

    # POST /pages
    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to parent_page_path(@page.to_param), notice: 'Page was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        redirect_to parent_page_path(@page.to_param), notice: 'Page was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /pages/1
    def destroy
      @page.destroy
      redirect_to hemmingway_pages_path, notice: 'Page was successfully destroyed.'
    end

    private

      def get_layout
        Hemmingway.layout
      end

      def setup
        @is_admin ||= instance_exec(&Hemmingway.admin_check)
        @prefix = "#{request.protocol}#{request.host}/"
      end

      def set_page
        @page = Page.find_by_url!(params[:id])
      end
      
      def admin_check
        raise ActionController::BadRequest unless @is_admin
      end

      # Only allow a trusted parameter "white list" through.
      def page_params
        params.require(:page).permit(:url, :locale, :html)
      end
  end
end
