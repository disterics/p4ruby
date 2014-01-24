
Gem::Specification.new { |t| 
  t.name = "p4ruby"
  t.version = "1.0.12"
  t.summary = "Ruby interface to the Perforce API"
  t.description = t.summary + "."
  t.author = "Perforce Software (ruby gem by James M. Lawrence)"
  t.email = "quixoticsycophant@gmail.com"
  t.homepage = "http://p4ruby.rubyforge.org"
  t.rubyforge_project = "p4ruby"
  # ruby-2.1.x and probably previous ships with
  # rubygems 2.2.2 and below
  # which contans a bug where require_paths
  # cannot be appended to
  # this was fixed with ruby-gems pull request 909
  # https://github.com/rubygems/rubygems/pull/909
  # work-around issue by  getting the array,
  # appending to it and then setting it again
  t.require_paths = t.require_paths.push('ext')
  # add after setting require paths
  t.extensions << "Rakefile"

  t.files = %w[
    README
    CHANGES
    Rakefile
    install.rb
    p4ruby.gemspec
  ]

  t.extra_rdoc_files = ["README"]
  rdoc_exclude = t.files - t.extra_rdoc_files
  t.rdoc_options +=
    ["--title", "P4Ruby: #{t.summary}", "--main", "README"] +
    rdoc_exclude.inject(Array.new) { |acc, pattern|
      acc + ["--exclude", pattern]
    }

  if t.respond_to? :specification_version then
    t.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      t.add_runtime_dependency(%q<rake>, [">= 0"])
    else
      t.add_dependency(%q<rake>, [">= 0"])
    end
  else
    t.add_dependency(%q<rake>, [">= 0"])
  end
}

