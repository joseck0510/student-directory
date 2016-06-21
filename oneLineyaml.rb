require 'yaml'

def yaml_save object, filename
  File.open filename, 'w' do |f|
    f.write(object.to_yaml)
  end
end

def yam_load filename
  yaml_string = File.read filename

  YAML::load yaml_string
end

test_array = ['Slick Shoes',
              'Bully Blinders'
              'Pincers of Peril']

filename = 'DatasGadgets.txt'

yaml_save test array, filename

read_array = yaml_load filename

puts(read_array == test_array)
