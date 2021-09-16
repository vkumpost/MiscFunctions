module MiscFunctions

using Statistics

export cmean, cstd
export find_closest

include("circular_statistics.jl")
include("find_closest.jl")

end  # module
