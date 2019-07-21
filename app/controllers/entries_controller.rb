# frozen_string_literal: true

class EntriesController < ApplicationController
  before_action :set_entry, only: [:index, :show, :edit, :update]

  # GET /entries
  def index
    render :show
  end

  # GET /entries/1
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new(id: '0' * 16)
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      render :redirect, layout: false
    else
      render :new
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      render :redirect, layout: false
    else
      render :edit
    end
  end

  private

  def set_entry
    if params[:id].present?
      @entry = Entry.find(params[:id])
    else
      @entry = Entry.random
    end
  end

  def entry_params
    params.require(:entry).permit(:content)
  end
end
