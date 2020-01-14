class ExternalApi::BitexApi
  include ExternalApi::GenericConnection

  BITEX_API_URL = ENV['BITEX_API_URL'].freeze
  TOKEN = ENV['APPLICATION_TOKEN'].freeze

  def get_users
    get_call("#{BITEX_API_URL}/users", TOKEN)
  end

  def post_users
    post_call("#{BITEX_API_URL}/users", { "data": {"type": "users"}}, TOKEN)
  end

  def issues(user_id)
    url  = "#{BITEX_API_URL}/issues"
    body = issue_body
    auth = "#{TOKEN}; user=#{user_id}"

    post_call(url, body, auth)
  end

  def natural_docket_seeds(user_id, issue_id, user)
    url  = "#{BITEX_API_URL}/natural_docket_seeds"
    body = natural_docket_seeds_body(issue_id, user)
    auth = "#{TOKEN}; user=#{user_id}"

    post_call(url, body, auth)
  end

  def identification_seeds(user_id, issue_id, user)
    url  = "#{BITEX_API_URL}/identification_seeds"
    body = identification_seeds_body(issue_id, user)
    auth = "#{TOKEN}; user=#{user_id}"

    post_call(url, body, auth)
  end

  def attachments(user_id, identification_seeds_id, attach)
    url  = "#{BITEX_API_URL}/attachments"
    body = attachments_body(identification_seeds_id, attach)
    auth = "#{TOKEN}; user=#{user_id}"

    post_call(url, body, auth)
  end

  def complete(user_id, issue_id)
    url  = "#{BITEX_API_URL}/issues/#{issue_id}/complete"
    auth = "#{TOKEN}; user=#{user_id}"

    post_call(url, '', auth)
  end

  def fetching(user_id, issue_id)
    url  = "#{BITEX_API_URL}/issues/#{issue_id}"
    auth = "#{TOKEN}; user=#{user_id}"

    get_call(url, auth)
  end

  private

  def issue_body
    {
      "data": {
        "type": "issues",
        "attributes": {
          "reason_code": "new_client"
        }
      }
    }
  end

  def natural_docket_seeds_body(issue_id, user)
    {
      "data": {
        "type": "natural_docket_seeds",
        "attributes": {
          "first_name": user.first_name,
          "last_name": user.last_name,
          "nationality": user.nationality,
          "gender_code": "male",
          "marital_status_code": "single",
          "politically_exposed": "false",
          "birth_date": user.birth_date
        },
        "relationships": {
          "issue": {
            "data": {
              "type": "issues",
              "id": issue_id
            }
          }
        }
      }
    }
  end

  def identification_seeds_body(issue_id, user)
    {
    "data": {
      "type": "identification_seeds",
      "attributes": {
        "identification_kind_code": "national_id",
        "issuer": user.nationality,
        "number": user.document
      },
      "relationships": {
        "issue": {
          "data": {
            "type": "issues",
            "id": issue_id
          }
        }
      }
    }
  }
  end

  def attachments_body(identification_seeds_id, attach)
    {
    "data": {
      "type": "attachments",
      "attributes": {
        "document": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+P+/HgAFhAJ/wlseKgAAAABJRU5ErkJggg==",
        "document_file_name": attach,
        "document_content_type": "image/png",
        "document_size": "68"
      },
      "relationships": {
        "attached_to_seed": {
          "data": { "id": identification_seeds_id, "type": "identification_seeds" }
        }
      }
    }
  }
  end
end
