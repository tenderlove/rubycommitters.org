Transform /^the "([^"]*)" account$/ do |username|
  Account.find_by_username!(username)
end
