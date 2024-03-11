if @match.accepted?
  json.content render(partial: "match_success", formats: :html, locals: { user: @user })
  json.status "accepted"
end
