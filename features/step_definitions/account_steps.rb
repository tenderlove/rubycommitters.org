Then /^I should see "([^"]*)" as the name of (.+)$/ do |name, account|
  page.should have_css("tr#account_#{account.id} td.name:contains('#{name}')")
end

Then /^I should see the avatar of (.+)$/ do |account|
  page.should have_css("tr#account_#{account.id} td.avatar img[src='#{account.avatar.url}']")
end

Then /^I should see the default avatar for (.+)$/ do |account|
  page.should have_css("tr#account_#{account.id} td.avatar img[src^='/images/missing-avatar.png']")
end

Then /^I should see the "([^"]*)" website for (.+)$/ do |title, account|
  site = Site.find_by_title!(title)

  page.should have_css("tr#account_#{account.id} td.website a[href='#{site.url}']:contains('#{title}')")
end

Then /^I should not see a website for (.+)$/ do |account|
  find("tr#account_#{account.id} td.website").text.strip.should be_empty
end

Then /^I should see the following services of (.+):$/ do |account, table|
  table.hashes.each do |hash|
    service_name   = hash['name']
    service_active = hash['active'] == 'true'

    within("tr#account_#{account.id}") do
      if service_active
        service = account.services.where(:name => service_name).first

        page.should have_css("td.service.#{service_name}.active a[href='#{service.url}'] img[src^='/images/icons/#{service_name}.png']")
      else
        page.should have_css("td.service.#{service_name} img[src^='/images/icons/#{service_name}.png']")
      end
    end
  end
end
