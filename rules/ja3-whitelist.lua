function init (args)
  local needs = {}
  needs["tls"] = tostring(true)
  return needs
end

function match(args)
  hash = Ja3GetHash()
  if hash == nil then
    return 0
  end
  local list = {
                ["326bdfa913bb492729b8e8f5f6444bb7"] = true,
                ["9bba0277a08f39c92cec8c67742fc3a0"] = true,
                ["d9e47f0ebed131ce3c9c998d65abc0fc"] = true,
                ["e9f8df175cf50c4d9868df294c0994d6"] = true,
                ["10ed84409cde78ad0c8e2dc45e455405"] = true,
                ["55e67872cb9fde018f845d0006ddd2ab"] = true,
                ["12f664535877cd8f59ea381623526553"] = true,
                ["2699b84e0d3de6dfa570e9b160d02409"] = true
  }
  if list[hash] == true then
    return 0
  else
    return 1
  end
end
