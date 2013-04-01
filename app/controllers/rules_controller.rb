class RulesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  # GET /rules
  # GET /rules.json
  def index
    @search = Rule.search do
      fulltext params[:search]
    end
    @rules = @search.results

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rules }
    end
  end

  # GET /rules/1
  # GET /rules/1.json
  def show
    @rule = Rule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rule }
    end
  end

  def tagged
    if params[:tag].present? 
      @rules = Rule.tagged_with(params[:tag])
    else 
      @rules = Rule.ruleall
    end  
  end

  # GET /rules/new
  # GET /rules/new.json
  def new
    @rule = current_user.rules.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rule }
    end
  end

  # GET /rules/1/edit
  def edit
    @rule = current_user.rules.find(params[:id])
  end

  # POST /rules
  # POST /rules.json
  def create
    @rule = current_user.rules.new(params[:rule])

    respond_to do |format|
      if @rule.save
        format.html { redirect_to @rule, notice: 'Rule was successfully created.' }
        format.json { render json: @rule, status: :created, location: @rule }
      else
        format.html { render action: "new" }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rules/1
  # PUT /rules/1.json
  def update
    @rule = current_user.rules.find(params[:id])

    respond_to do |format|
      if @rule.update_attributes(params[:rule])
        format.html { redirect_to @rule, notice: 'Rule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1
  # DELETE /rules/1.json
  def destroy
    @rule = current_user.rules.find(params[:id])
    @rule.destroy

    respond_to do |format|
      format.html { redirect_to rules_url }
      format.json { head :no_content }
    end
  end
end
