class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC') }
  scope :ordered_by_title, -> { order ('title DESC') }
  scope :ordered_by_reverse_created_at, -> { order ('created_at ASC') }

  validates :title, length: {minimum: 5 }, presence: true
  validates :body, length: {minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def markdown_title
    render_as_markdown title
  end

  def markdown_body
    render_as_markdown body
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true, autolink: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def render_as_markdown(attr)
    if attr == "body"
      return markdown(self.body)
    elsif attr == "title"
      return markdown(self.title)
    else
      return "invalid attribute"
    end
  end
end

### Sandbox

class Walrus
  attr_accessor :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def to_s
    puts "#{self.title} #{self.name}"
  end

  def render_as_markdown(model_attribute)
    self.model_attribute = add_stars(self.model_attribute)
  end

  def address_with_excitement(*attr)
    if attr.include? "name" then name = "#{self.name}!!!!" end
    if attr.include? "title" then title = "His #{self.title}ship" end
    "#{title} #{name}"
  end
end

m = Walrus.new("Walruckford", "Dude")
puts m
