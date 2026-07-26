require "yaml"
require "date"

# Reads a blog post straight from a Markdown file with YAML front matter —
# no database, no framework. Front matter is delimited by `---` lines:
#
#   ---
#   title: "..."
#   date: YYYY-MM-DD
#   slug: some-slug
#   tags: [tag1, tag2]
#   summary: "..."
#   ---
#   Markdown body here.
class Post
  attr_reader :slug, :title, :date, :tags, :summary, :body_markdown, :source_path

  def initialize(path)
    @source_path = path
    front_matter, @body_markdown = self.class.parse(File.read(path))
    @title   = front_matter["title"] || File.basename(path, ".md")
    @date    = Date.parse(front_matter["date"].to_s)
    @slug    = front_matter["slug"] || File.basename(path, ".md")
    @tags    = Array(front_matter["tags"])
    @summary = front_matter["summary"]
  end

  class << self
    def all(posts_dir)
      Dir.glob(File.join(posts_dir, "*.md"))
         .map { |file| new(file) }
         .sort_by(&:date)
         .reverse
    end

    # Splits raw file contents into [front_matter_hash, markdown_body].
    def parse(raw)
      return [{}, raw] unless raw.start_with?("---")

      _, front_matter_yaml, body = raw.split(/^---\s*$/, 3)
      front_matter = YAML.safe_load(front_matter_yaml, permitted_classes: [Date]) || {}
      [front_matter, body.to_s.strip]
    end
  end
end
