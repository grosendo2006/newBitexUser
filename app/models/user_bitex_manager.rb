class UserBitexManager
  def initialize(user)
    @user      = user
    @bitex_api = ExternalApi::BitexApi.new
  end

  def call
    user_id = @bitex_api.post_users['data']['id']
    issues_id = @bitex_api.issues(user_id)['data']['id']

    @bitex_api.natural_docket_seeds(user_id, issues_id, @user)

    document_seeds_id = @bitex_api.identification_seeds(user_id, issues_id, @user)['data']['id']
    @bitex_api.attachments(user_id, document_seeds_id, @user.document_file_name)

    address_seeds_id = @bitex_api.identification_seeds(user_id, issues_id, @user)['data']['id']
    @bitex_api.attachments(user_id, address_seeds_id, @user.address_file_name)

    @bitex_api.complete(user_id, issues_id)
    @bitex_api.fetching(user_id, issues_id)
  end
end