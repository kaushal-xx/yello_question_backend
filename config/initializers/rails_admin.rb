RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.authorize_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == ENV["ADMIN_KEY"] && password == ENV["ADMIN_PASSWORD"]
    end
  end 
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  config.model 'PostDocument' do
    list do
      field :id
      field :status
      field :active
      field :annotation
      field :document_type
      field :post_id
      field :document_url
      field :document_thumb_url
      field :creation_time
      field :modification_time
      field :created_by
      field :modified_by
      field :hash_id
    end
  end
  config.model 'UserRedeemActivity' do
    list do
      field :id
      field :email
      field :account_id
      field :redeem_item_id
      field :redeem_points
      field :creation_time
    end
    show do
      include_all_fields
      field :email
    end
  end

  config.model 'Account' do
    list do
      field :id
      field :email
      field :phone
      field :status
      field :total_redeem
      field :created_by
      field :modified_by
      field :app_version
      field :app_type
      field :modification_time
      field :creation_time
    end
    show do
      include_all_fields
      field :total_redeem
    end
  end
end
