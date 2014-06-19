AVAILABLE_PATTERNS = [ -> (name) { name.join('.') },
                       -> (name) { name.first + '.' + name.last[0] },
                       -> (name) { name.first[0] + '.' + name.last },
                       -> (name) { name.first[0] + '.' + name.last[0] }
                       ]
SEED =  { "John Ferguson" => "john.ferguson@alphasights.com",
          "Damon Aw" => "damon.aw@alphasights.com",
          "Linda Li" => "linda.li@alphasights.com",
          "Larry Page" => "larry.p@google.com",
          "Sergey Brin" => "s.brin@google.com",
          "Steve Jobs" => "s.j@apple.com" }

TO_PREDICT =  { "Peter Wong" => "alphasights.com",
                "Craig Silverstein" => "google.com",
                "Steve Wozniak" => "apple.com",
                "Barack Obama" => "whitehouse.gov" }
