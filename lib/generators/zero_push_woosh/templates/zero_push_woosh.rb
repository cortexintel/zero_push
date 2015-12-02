if Rails.env.production?
  ZeroPushWoosh.auth_token = '<%= @production_token %>'
else
  ZeroPushWoosh.auth_token = '<%= @development_token %>'
end
