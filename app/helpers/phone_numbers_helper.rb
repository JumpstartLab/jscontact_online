module PhoneNumbersHelper
  def print_numbers(phone_numbers)
    phone_numbers.collect(&:number).join(", ")
  end
end
