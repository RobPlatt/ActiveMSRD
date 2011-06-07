require 'set'

class ClassFeat < ActiveRecord::Base
  belongs_to :modern_class
  belongs_to :feat
  
  def self.seed_from_list(modern_class, feat_list)
    feat_set = Set.new(Feat.all)
    feat_list.each do |feat_name|
      matches = feat_set.select {|feat| feat.feat_name.downcase == feat_name.downcase}
      if matches.count == 1
        ClassFeat.find_or_create_by_modern_class_id_and_feat_id(
           :modern_class_id => modern_class.id, :feat_id => matches[0].id)
      elsif matches.count == 0
        raise 'No match for feat "' + feat_name + '"'
      elsif matches.count > 1
        raise 'Multiple matches for feat "' + feat_name + '", ambiguous'
      end
    end
  end
    
  def self.seed(modern_class, feat_text)
    ClassFeat.seed_from_list(modern_class, feat_text.split(%r{,\s*}))
  end
end
