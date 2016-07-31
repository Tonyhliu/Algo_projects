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
    BinarySearchTree.inorder!(@root_node)
  end

  def postorder
    BinarySearchTree.postorder!(@root_node)
  end

  def preorder
    BinarySearchTree.preorder!(@root_node)
  end

  def height
    BinarySearchTree.height!(@root_node)
  end

  def min
    BinarySearchTree.min(@root_node)
  end

  def max
    BinarySearchTree.max(@root_node)
  end

  def delete(value)
    @root_node = BinarySearchTree.delete!(@root_node, value)
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
    # BC
    return [] unless node

    arr = [node.value]
    arr += BinarySearchTree.preorder!(node.left) if node.left
    arr += BinarySearchTree.preorder!(node.right) if node.right

    arr
  end

  def self.inorder!(node)
    return [] unless node

    arr = []
    arr += BinarySearchTree.inorder!(node.left) if node.left
    # Left side all smaller than node
    arr << node.value
    arr += BinarySearchTree.inorder!(node.right) if node.right

    arr
  end

  def self.postorder!(node)
    return [] unless node

    arr = []
    arr += BinarySearchTree.postorder!(node.left) if node.left
    arr += BinarySearchTree.postorder!(node.right) if node.right
    arr << node.value

    arr
  end

  def self.height!(node)
    return -1 unless node

    1 + [BinarySearchTree.height!(node.left), BinarySearchTree.height!(node.right)].max
  end

  def self.max(node)
    return nil unless node
    return node unless node.right

    BinarySearchTree.max(node.right)
  end

  def self.min(node)
    return nil unless node
    return node unless node.left

    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left

    node.left = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node

    if value < node.value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif value > node.value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left
      target_node = node
      node = target_node.right.min
      node.right = BinarySearchTree.delete_min!(target_node.right)
      node.left = target_node.left
    end

    node
  end
end
