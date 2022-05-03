class Role < ActiveRecord::Base 
   has_many :auditions

   def actors
    self.auditions.map do |audition|
        audition.actors
    end
   end

   def locations 
    self.auditions.map do |audition|
        audition.location
    end
   end

   def lead 
    array_result_from_filter = self.auditions.filter do |that_audition_instance|
        that_audition_instance.hired == true
    end
    if(array_result_from_filter.size != 0 && array_result_from_filter.size > 0)
        return array_result_from_filter.first
    else
        return 'no actor has been hired for understudy for this role'   
    end
   end

   def understudy
    array_result_from_filter = self.auditions.filter do |audition|
        audition.hired == true
    end
    if(array_result_from_filter.size != 0 && array_result_from_filter.size > 0)
        array_result_from_filter.second
    else
        return 'no actor has been hired for understudy for this role'      
    end
   end
end 