class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root_node = nil
  end

  def insert(value)
    unless @root_node
      @root_node = BSTNode.new(value)
      return
    end

    BinarySearchTree.insert!(@root_node, value)
  end

  def find(value)
    BinarySearchTree.find!(@root_node, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder

  end

  def preorder

  end

  def height

  end

  def min

  end

  def max

  end

  def delete(value)

  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node

    if value <= node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    # base cases
    return nil unless node
    return node if node.value == value

    if value < node.value
      return BinarySearchTree.find!(node.left, value)
    end
    
    BinarySearchTree.find!(node.right, value)
  end

  def self.preorder!(node)

  end

  def self.inorder!(node)

  end

  def self.postorder!(node)

  end

  def self.height!(node)

  end

  def self.max(node)

  end

  def self.min(node)

  end

  def self.delete_min!(node)

  end

  def self.delete!(node, value)

  end
end
