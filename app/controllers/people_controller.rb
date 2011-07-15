class PeopleController < ApplicationController
  before_filter :lookup_person, :except => [:new, :index, :create]
  
  def index
    @people = Person.all
  end

  def show    
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params[:person])
    
    # @person = Person.new
    # mugshot = @person.build_mugshot
    # mugshot.photo = params[:person][:mugshot][:photo]
    # params[:person].delete(:mugshot)
    # @person.update_attributes(params[:person])
    # @person.mugshot = mugshot
    # @person.update_attributes(params[:person])
    
    if @person.save
      redirect_to @person, :notice => "Successfully created person."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @person.update_attributes(params[:person])
      redirect_to @person, :notice  => "Successfully updated person."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @person.destroy
    redirect_to people_url, :notice => "Successfully destroyed person."
  end

private
  def lookup_person
    @person = Person.find(params[:id])
  end
end
