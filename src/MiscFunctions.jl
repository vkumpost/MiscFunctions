module MiscFunctions

using Statistics

export binary_boundary_search
export cmean, cstd
export find_closest

include("binary_search.jl")
include("circular_statistics.jl")
include("find_closest.jl")

end  # module
