# never finished, seems like the problem isn't fully laid out?

def loop_size(node)
  node_ids = []
  loop do
    current = node.next.object_id
    break if node_ids.include?(current)
    node_ids << current
  end
  connection = node_ids.index(current)
  tail = node_ids[0..connection-1]
  ring = node_ids[connection..-1]
end

# method provide by problem author to test, get an error on first line
# when trying to create a new node...
def create_chain_for_test(tail_size, loop_size)
  prev_node = start = Node.new
  start.next = start
  return start if loop_size == 1
  (1..tail_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  end_loop = prev_node
  (1...loop_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  prev_node.next = end_loop
  start
end

puts loop_size(create_chain_for_test(3,10)) == 10
