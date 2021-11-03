"""
`MiscFunctions`

Miscellaneous functions.

**Functions**
- `binary_boundary_search`: Use binary search to find a boundary value.
- `cmean`: Compute circular mean of an array.
- `cstd`: Compute circular standard deviation of an array.
- `find_closest`: Find the position of the closest value in an array.
- `r2_score`: Calculate the coefficient of determination.
"""
module MiscFunctions

using Statistics

export binary_boundary_search
export cmean, cstd
export find_closest
export r2_score

include("binary_search.jl")
include("circular_statistics.jl")
include("find_closest.jl")
include("metrics.jl")

end  # module
