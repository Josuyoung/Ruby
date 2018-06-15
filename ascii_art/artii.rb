#http://artii.herokuapp.com/ 참고
require 'artii'

art_write = Artii::Base.new(font: 'rozzo')
output = art_write.asciify('Test')
puts output


