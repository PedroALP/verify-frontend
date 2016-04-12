class WillItWorkForMeForm
  include ActiveModel::Model

  attr_reader :above_age_threshold, :resident_last_12_months, :not_resident_reason

  def initialize(hash)
    @above_age_threshold = hash[:above_age_threshold]
    @resident_last_12_months = hash[:resident_last_12_months]
    @not_resident_reason = hash[:not_resident_reason]
  end

  def resident_last_12_months?
    resident_last_12_months == 'true'
  end

  def address_but_not_resident?
    not_resident_reason == 'AddressButNotResident'
  end

  def no_uk_address?
    not_resident_reason == 'NoAddress'
  end
end