# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

config[:casper] = {
  blog: {
    url: 'http://www.example.com',
    name: 'Middleman',
    description: 'Makes developing websites simple.',
    date_format: '%d %B %Y',
    navigation: true,
    logo: nil # Optional
  },
  author: {
    name: 'Daniel Vinciguerra',
    bio: nil, # Optional
    location: nil, # Optional
    website: nil, # Optional
    gravatar_email: nil, # Optional
    twitter: nil # Optional
  },
  navigation: {
    'Home' => '/'
  }
}

# pretty urls
activate :directory_indexes

# syntax highlighting
activate :syntax

# markdown
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, footnotes: true,
               link_attributes: { rel: 'nofollow' }, tables: true

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/feed.xml', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# Activate and configure blog extension

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = 'posts/{year}-{month}-{day}-{title}.html'
  blog.taglink = 'tags/{tag}.html'
  blog.layout = 'blog'
  # blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  # blog.page_link = "page/{num}"

  blog.new_article_template = "#{Dir.pwd}/post_template.tt"
end

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end

activate :importmap do |option|
  option.entrypoint = 'site' # js entrypoint's filename without extension
  option.importmap = 'importmap.yml' # importmap's filename with extension (yaml or json)
  option.use_shim = true # or false
end

# activate :external_pipeline,
#          name: :tailwind,
#          # command: "npx tailwindcss -i ./source/#{style_file} -o ./dist/#{style_file} #{'--watch' unless build?}",
#          latency: 2,
#          source: './dist/'

configure :development do
  set :debug_assets, true
  activate :livereload
end
