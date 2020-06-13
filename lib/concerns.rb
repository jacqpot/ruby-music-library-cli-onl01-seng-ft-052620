module Concerns::Findable
    def find_by_name(name)
        self.all.find {|i| i.name == name}
    end
    def find_or_create_by_name(name)
      output = nil
      self.find_by_name(name) ? output = self.find_by_name(name) : output = self.create(name)
      output
    end
end












































# require 'pry'
# module Concerns
#     module Findable

#         def find_by_name(name)
#             self.all.detect{|element| element if element.name == name}
#         end
#         def find_or_create_by_name(element)
#             output = nil 
#             self.find_by_name(element) ? output = self.find_by_name(element) : output = self.create(element)
#             output
#         end

#     end
# # binding.pry


# end