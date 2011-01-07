Factory.define :account do |account|
end

Factory.define :name do |name|
  name.association(:account)
end

Factory.define :portrait do |portrait|
  portrait.association(:account)
end

Factory.define :service do |service|
  service.association(:account)
end
