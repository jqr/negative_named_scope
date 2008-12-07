# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{negative_named_scope}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Elijah Miller"]
  s.date = %q{2008-12-07}
  s.description = %q{Negative Named Scope will automatically generate the NOT'd version of your named scope.}
  s.email = %q{elijah.miller@gmail.com}
  s.extra_rdoc_files = ["CHANGELOG", "lib/negative_named_scope.rb", "LICENSE", "README.rdoc"]
  s.files = ["CHANGELOG", "init.rb", "lib/negative_named_scope.rb", "LICENSE", "Manifest", "Rakefile", "README.rdoc", "spec/models.rb", "spec/negative_named_scope_spec.rb", "spec/spec_helper.rb", "negative_named_scope.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Negative_named_scope", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{negative_named_scope}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Negative Named Scope will automatically generate the NOT'd version of your named scope.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
