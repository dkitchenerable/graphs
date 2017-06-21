module Utility
  def self.swap(arr, i1, i2)
    temp = arr[i1]
    arr[i1] = arr[i2]
    arr[i2] = temp
  end
end
