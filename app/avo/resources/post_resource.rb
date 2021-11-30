# frozen_string_literal: true

class PostResource < Avo::BaseResource
  self.title = :title
  self.includes = [:user]
  self.default_view_type = :grid
  # self.default_view_type = :table
  # self.unscoped_queries_on_index = true
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :title, as: :string, required: true
  field :body, as: :trix, placeholder: 'Add the post body here', required: true
  field :is_published, as: :boolean
  field :user, as: :belongs_to, placeholder: '-'

  grid do
    title :title, as: :text
    body :body, as: :text
  end
end
