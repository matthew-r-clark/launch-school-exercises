def categories(arr)
  yield(arr)
end

arr = %w(raven finch hawk eagle)
categories(arr) {|_, _, *raptors| p raptors}