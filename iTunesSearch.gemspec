$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = "iTunesSearch"
  s.version = "0.0.0"
  s.date = %q{2011-06-29}
  s.authors = ["Danny Tran"]
  s.email = %q{dannybtran@gmail.com}
  s.summary = %q{}
  s.description = %q{}  
  
  s.add_dependency('httparty', '0.7.8')  
  
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")  
  s.require_paths = ["lib"]
end