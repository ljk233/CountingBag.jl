module Counter

struct Counter
    items::Dict{Any, Integer}
end

"""
    Bag() -> Bag
"""
function Counter()::Bag
    Bag(Dict())
end

"""
    length(bag) -> Integer

Return the number of items in the given bag.
"""
function length(bag::Bag)::Integer
    size = 0
    for items in bag.values
        size += item[2]    
    end
    size
end

"""
    isempty(bag) -> Bool

Return if the given is empty.
"""
function isempty(bag::Bag)::Integer
    length(bag) == 0
end

"""
    add!(bag, item)

Add the given item to the given bag.
"""
function add!(bag::Bag, item)
    !haskey(bag.items, item) ? bag.items[item] = 1 : bag.items[item] += 1
    return
end

"""
    remove!(bag, item) -> item

Remove and return an instance of the given item from the given bag
"""
function remove!(bag::Bag, item)
    if haskey(bag.items, item)
        bag.items[item] -= 1
        if bag.items[item] == 0
            delete!(bag.items, item)
        end
    end
end

function iterate(bag::Bag)
    (iterate(keys(bag.items)))
end

"""
    ∈(bag, item) -> Bool

Return if the given bag contains the given item.
"""
function ∈(bag::Bag, item)::Bool
    item in bag.items
end

"""
    countitem(bag, item) -> Integers

Return the count of the given item in the given bag.
"""
function countitem(bag::Bag, item)::Integer
    count = 0
    for bagitem in bag.items
        item == bagitem[1] ? count = bagitem[2] : nothing
    end
    count
end
