require 'digest/sha2'
def time
  start = Time.now

  array = []
  loop  do
    value = Digest::SHA256.hexdigest(1)
    if array.include? value
      break
    end
    array << value
  end

  finish = Time.now
  finish - start
end

puts time