require 'yaml'

class Properties < Hash
  
  DefaultSuffix = '.dflt'
  
  attr :db_file
  
  def self.default_name(name)
    return name + DefaultSuffix
  end

  def self.get(file_name)
    props = Properties.new
    default_file = DbFile.find_by_name(default_name(file_name))
    if default_file
      props.merge_db_file(default_file)
    end
    props.load_db_file_by_name(file_name);
    return props
  end
  
  def initialize()
    super()
    @db_file = nil
  end
  
  def load_db_file(db_file)
      @db_file = db_file
      if not @db_file.body
        @db_file.body = ''
      end
      merge_db_file(@db_file)
  end
  
  def load_db_file_by_name(file_name)
      db_file = DbFile.find_or_initialize_by_name(file_name)
      load_db_file(db_file)
  end
  
  # while loading, convert string keys to symbols for ease of use
  def merge_db_file(db_file)
    str_hash = (YAML.load(db_file.body) or {})
    str_hash.each do |k, v|
      store(k.to_sym, v)
    end
  end

  # while saving, convert the symbols into strings so the YAML looks normal
  def save!()
    if (@db_file)
      str_hash = {}
      self.each do |k, v|
        str_hash.store(k.to_s, v)
      end
      @db_file.body = YAML.dump(str_hash)
      @db_file.save!
    end
  end
  
end
