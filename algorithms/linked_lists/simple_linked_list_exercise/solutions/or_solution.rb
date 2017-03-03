class LinkedList
  attr_accessor :data, :head, :length

  def initialize (data)
    @head = Node.new(data, nil)
    @length = 1
  end

  def append_to_tail(more_data)
    current = @head
    new_node = Node.new(more_data, nil)
    while current.pointer != nil
      current = current.pointer
    end
    current.pointer = new_node
    @length += 1
  end

  def append_to_head(more_data)
    current = @head
    next_node = current.pointer
    new_node = Node.new(more_data, current)
    @head = new_node
    @length += 1
  end

  def remove_from_tail
    current = @head
    if @length != 0
      current.pointer.pointer = nil
    end
    @length -= 1
  end

  def remove_from_head
    current = @head
    next_node = current.pointer
    if @length == 1
      current = nil
    else
      current = nil
      @head = next_node
    end
    @length -= 1
  end

  def size
    @length
  end

  def self.convert_array(some_array)
    new_list = LinkedList.new(some_array[0])
    i = 1
    while i < some_array.length
      new_list.append_to_tail(some_array[i])
      i += 1
    end
    return new_list
  end

  def insert_at(node_val, target)
    current = @head
    next_node = current.pointer
    counter = 0
    while counter != target
      current.pointer = Node.new(node_val, next_node)
      counter += 1
    end
  end

end

class Node
  attr_accessor :data, :pointer

  def initialize (data, pointer)
    @data = data
    @pointer = pointer
  end

end

our_list = LinkedList.new(23)

our_list.append_to_tail(12)

our_list.append_to_tail(14)
# p "BEFORE REMOVAL"
# p our_list

# our_list.remove_from_tail()
# p "AFTER REMOVAL"
# p our_list

our_list.append_to_head(400)
# p "CHECKING NEW APPENDAGE"
# p our_list
our_list.insert_at(75, 2)
p "ISERTION"
p our_list
# our_list.remove_from_head
# p "SHIFTING"
# p our_list.size

# p LinkedList.convert_array([40, 50, 60, 10])
