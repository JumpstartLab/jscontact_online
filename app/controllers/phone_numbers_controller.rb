class PhoneNumbersController < ApplicationController
  before_filter :lookup_phone_number, :except => [:new, :create]
  
  def new
    if params[:person_id]
      @contact = Person.find params[:person_id]    
    elsif params[:company_id]
      @contact = Company.find params[:company_id]
    end
    @phone_number = @contact.phone_numbers.new
  end

  def create
    @phone_number = PhoneNumber.new(params[:phone_number])      
    if @phone_number.save
      redirect_to @phone_number.contact, :notice => "Successfully created phone number."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @phone_number.update_attributes(params[:phone_number])
      redirect_to @phone_number.contact, :notice  => "Successfully updated phone number."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @phone_number.destroy
    redirect_to @phone_number.contact, :notice => "Successfully destroyed phone number."
  end

private  
  def lookup_phone_number
    @phone_number = PhoneNumber.find(params[:id])
  end  
end
