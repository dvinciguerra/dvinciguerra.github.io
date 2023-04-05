# frozen_string_literal: true

namespace :develop do
  desc 'start development server'
  task :server do
    sh 'bundle exec jekyll server --incremental --livereload'
  end
end

namespace :assets do
  desc 'precompile application assets for deployment'
  task :precompile do
    exec 'bundle exec jekyll build'
  end
end
