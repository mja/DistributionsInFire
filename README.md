# Distributions.🔥

This is a project learning space for teaching myself [Mojo](https://docs.modular.com/mojo/manual/).

Mojo has [built-in support](https://docs.modular.com/mojo/manual/types#simd-and-dtype) for hardware-level parallel processing ([Single Instruction, Multiple Data](https://en.wikipedia.org/wiki/Single_instruction,_multiple_data)). This makes it suitable for high-performance numerical computing.

To learn Mojo, I'm focusing on implementing functions that I use a lot: statistical distributions (probability density, cumulative density, and quantile functions). I also expect to gain a better understanding of how these functions are implemented and approximated. 

## Tests

```sh
magic run mojo test -I . tests
```