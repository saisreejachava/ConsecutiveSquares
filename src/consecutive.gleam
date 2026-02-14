// import gleam/int
// import gleam/io
// import gleam/list

// /// Sum of squares of `n` consecutive integers starting from `a`
// pub fn sum_of_consecutive_squares(a: Int, n: Int) -> Int {
//   list.range(a, a + n - 1)
//   |> list.map(fn(x) { x * x })
//   |> sum
// }

// /// Manual sum of list of integers
// pub fn sum(xs: List(Int)) -> Int {
//   case xs {
//     [] -> 0
//     [x, ..rest] -> x + sum(rest)
//   }
// }

// /// Manual integer square root using binary search
// pub fn int_sqrt(n: Int) -> Int {
//   binary_sqrt(n, 0, n)
// }

// /// Helper: Binary search square root
// pub fn binary_sqrt(n: Int, low: Int, high: Int) -> Int {
//   case low > high {
//     True -> high
//     False -> {
//       let mid = { low + high } / 2
//       let mid_squared = mid * mid
//       case mid_squared {
//         _ if mid_squared == n -> mid
//         _ if mid_squared < n -> binary_sqrt(n, mid + 1, high)
//         _ -> binary_sqrt(n, low, mid - 1)
//       }
//     }
//   }
// }

// /// Check if a number is a perfect square using int_sqrt
// pub fn is_perfect_square(n: Int) -> Bool {
//   let root = int_sqrt(n)
//   root * root == n
// }

// /// Main function
// pub fn main() {
//   let start = 40
//   let count = 24

//   let total = sum_of_consecutive_squares(start, count)

//   // io.println("Sum of squares from #{start} to #{start + count - 1} is #{total}")

//   case is_perfect_square(total) {
//     True -> {
//       let root = int_sqrt(total)
//       io.println(
//         "It is a perfect square: "
//         <> int.to_string(total)
//         <> " = "
//         <> int.to_string(root)
//         <> "^2",
//       )
//     }
//     False -> io.println("It is not a perfect square.")
//   }
// }

// import gleam/int
// import gleam/io
// import gleam/list
// import gleam/string

// /// Sum of squares of `n` consecutive integers starting from `a`
// pub fn sum_of_consecutive_squares(a: Int, n: Int) -> Int {
//   list.range(a, a + n - 1)
//   |> list.map(fn(x) { x * x })
//   |> sum
// }

// /// Manual sum of a list of integers
// pub fn sum(xs: List(Int)) -> Int {
//   case xs {
//     [] -> 0
//     [x, ..rest] -> x + sum(rest)
//   }
// }

// /// Manual integer square root using binary search
// pub fn int_sqrt(n: Int) -> Int {
//   binary_sqrt(n, 0, n)
// }

// /// Helper: Binary search square root
// pub fn binary_sqrt(n: Int, low: Int, high: Int) -> Int {
//   case low > high {
//     True -> high
//     False -> {
//       let mid = {
//         low + high
//       }
//       // 2
//       let mid_squared = mid * mid
//       case mid_squared {
//         _ if mid_squared == n -> mid
//         _ if mid_squared < n -> binary_sqrt(n, mid + 1, high)
//         _ -> binary_sqrt(n, low, mid - 1)
//       }
//     }
//   }
// }

// /// Checks if a number is a perfect square
// pub fn is_perfect_square(n: Int) -> Bool {
//   let root = int_sqrt(n)
//   root * root == n
// }

// /// Builds a string like "1^2 + 2^2 + 3^2 + ..."
// pub fn sequence_string(a: Int, n: Int) -> String {
//   list.range(a, a + n - 1)
//   |> list.map(fn(x) { int.to_string(x) <> "^2" })
//   |> string.join(" + ")
// }

// /// Main function
// pub fn main() {
//   let start = 1
//   let count = 24

//   let total = sum_of_consecutive_squares(start, count)
//   let sequence = sequence_string(start, count)

//   io.println("Sequence: " <> sequence)
//   io.println(
//     "Sum of squares from "
//     <> int.to_string(start)
//     <> " to "
//     <> int.to_string(start + count - 1)
//     <> " is "
//     <> int.to_string(total),
//   )

//   case is_perfect_square(total) {
//     True -> {
//       let root = int_sqrt(total)
//       io.println(
//         "It is a perfect square: "
//         <> int.to_string(total)
//         <> " = "
//         <> int.to_string(root)
//         <> "^2",
//       )
//     }
//     False -> io.println("It is not a perfect square.")
//   }
// }

// import gleam/int
// import gleam/io
// import gleam/list
// import gleam/string
// import working_actors

// // Top-level functions
// fn sum_of_consecutive_squares(a: Int, n: Int) -> Int {
//   list.range(a, a + n - 1)
//   |> list.map(fn(x) { x * x })
//   |> list.fold(0, fn(acc, x) { acc + x })
// }

// // Top-level integer square root using binary search
// fn int_sqrt(low: Int, high: Int, n: Int) -> Int {
//   case low > high {
//     True -> high
//     False -> {
//       let mid = {
//         low + high
//       }
//       // 2
//       let mid_sq = mid * mid
//       case mid_sq {
//         _ if mid_sq == n -> mid
//         _ if mid_sq < n -> int_sqrt(mid + 1, high, n)
//         _ -> int_sqrt(low, mid - 1, n)
//       }
//     }
//   }
// }

// // // Wrapper to call it with initial low/high
// // fn integer_square_root(n: Int) -> Int {
// //   int_sqrt(0, n, n)
// // }

// fn is_perfect_square(total: Int, root: Int) -> Bool {
//   root * root == total
// }

// fn build_sequence(a: Int, n: Int) -> List(Int) {
//   list.range(a, a + n - 1)
// }

// fn sequence_to_string(seq: List(Int)) -> String {
//   list.map(fn(x) { int.to_string(x) <> "^2" }, seq)
//   |> string.join(" + ")
// }

// fn print_result(s: String) {
//   io.println(s)
// }

// // Main function
// pub fn main() {
//   let tasks = [#(3, 2), #(1, 3), #(2, 4)]
//   // Example ranges

//   working_actors.spawn_workers(1, tasks, fn(range) {
//     let #(a, n) = range

//     let total = sum_of_consecutive_squares(a, n)
//     let root = int_sqrt(total)

//     case is_perfect_square(total, root) {
//       True -> {
//         let seq = build_sequence(a, n)
//         let seq_str = sequence_to_string(seq)
//         let result_str =
//           "Sum of squares: "
//           <> int.to_string(total)
//           <> " = "
//           <> int.to_string(root)
//           <> "^2 | Sequence: "
//           <> seq_str
//         print_result(result_str)
//       }
//       False -> io.println("Not a perfect square: " <> int.to_string(total))
//      }
//   })
//  }

// 

// import gleam/io
// import gleam/list
// import gleam/int
// import gleam/string
// import gleam/system
// import working_actors

// // --------------------
// // Math utilities
// // --------------------

// // Sum of k consecutive squares starting at `start`
// fn sum_of_squares(start: Int, k: Int) -> Int {
//   list.range(start, start + k - 1)
//   |> list.map(fn(x) { x * x })
//   |> list.fold(0, fn(acc, x) { acc + x })
// }

// // Integer square root helper (module-level recursion)
// fn int_sqrt_helper(low: Int, high: Int, n: Int) -> Int {
//   case low > high {
//     True -> high
//     False -> {
//       let mid = {low + high} / 2
//       let mid_sq = mid * mid
//       case mid_sq {
//         _ if mid_sq == n -> mid
//         _ if mid_sq < n -> int_sqrt_helper(mid + 1, high, n)
//         _ -> int_sqrt_helper(low, mid - 1, n)
//       }
//     }
//   }
// }

// // Public integer square root
// fn integer_sqrt(n: Int) -> Int {
//   int_sqrt_helper(0, n, n)
// }

// // Check if n is a perfect square
// fn is_perfect_square(n: Int) -> Bool {
//   let r = integer_sqrt(n)
//   r * r == n
// }

// // --------------------
// // Worker actor
// // --------------------

// fn worker(range: #(Int, Int), k: Int, boss_pid) {
//   let #(start, end_) = range
//   list.range(start, end_)
//   |> list.each(fn(i) {
//     case is_perfect_square(sum_of_squares(i, k)) {
//       True -> working_actors.send(boss_pid, i)
//       False -> Nil
//     }
//   })
// }

// // --------------------
// // Chunking helper
// // --------------------

// fn chunk_ranges_helper(i: Int, n: Int, chunk_size: Int, acc: List(#(Int, Int))) -> List(#(Int, Int)) {
//   case i > n {
//     True -> acc
//     False -> {
//       let e =
//         case i + chunk_size - 1 > n {
//           True -> n
//           False -> i + chunk_size - 1
//         }
//       chunk_ranges_helper(e + 1, n, chunk_size, list.append(acc, [#(i, e)]))
//     }
//   }
// }

// // Public chunking function
// fn chunk_ranges(n: Int, chunk_size: Int) -> List(#(Int, Int)) {
//   chunk_ranges_helper(1, n, chunk_size, [])
// }

// // --------------------
// // Collect messages
// // --------------------

// fn collect_messages(remaining: Int) {
//   case remaining {
//     0 -> Nil
//     _ -> {
//       let msg = working_actors.receive()
//       io.println(int.to_string(msg))
//       collect_messages(remaining - 1)
//     }
//   }
// }

// // --------------------
// // Boss actor
// // --------------------

// fn boss(n: Int, k: Int, chunk_size: Int) {
//   let ranges = chunk_ranges(n, chunk_size)
//   let num_workers = list.length(ranges)

//   io.println("Parallel search using " <> int.to_string(num_workers) <> " workers")
//   io.println("N = " <> int.to_string(n) <> ", k = " <> int.to_string(k))

//   let boss_pid = working_actors.self()
//   ranges
//   |> list.each(fn(range) {
//     working_actors.spawn(fn() { worker(range, k, boss_pid) })
//   })

//   // Collect messages from workers
//   collect_messages(n)
// }

// // --------------------
// // CLI input
// // --------------------

// fn get_input() -> #(Int, Int) {
//   let args = system.args()
//   case args {
//     [_, n_str, k_str] ->
//       #(
//         string.to_int(n_str) |> Result.with_default(0),
//         string.to_int(k_str) |> Result.with_default(0)
//       )
//     _ ->
//       io.println("Usage: lukas N k")
//       #(0, 0)
//   }
// }

// // --------------------
// // Main
// // --------------------

// pub fn main() {
//   let #(n, k) = get_input()
//   case n > 0 && k > 0 {
//     True -> boss(n, k, 10_000) // adjust chunk_size for performance
//     False -> Nil
//   }
// }

import gleam/io
import gleam/list
import gleam/int
import working_actors

// --------------------
// Math utilities
// --------------------

fn sum_of_squares(start: Int, k: Int) -> Int {
  list.range(start, start + k - 1)
  |> list.map(fn(x) { x * x })
  |> list.fold(0, fn(acc, x) { acc + x })
}

fn int_sqrt_helper(low: Int, high: Int, n: Int) -> Int {
  case low > high {
    True -> high
    False -> {
      let mid = {low + high} / 2
      let mid_sq = mid * mid
      case mid_sq {
        _ if mid_sq == n -> mid
        _ if mid_sq < n -> int_sqrt_helper(mid + 1, high, n)
        _ -> int_sqrt_helper(low, mid - 1, n)
      }
    }
  }
}

fn integer_sqrt(n: Int) -> Int {
  int_sqrt_helper(0, n, n)
}

fn is_perfect_square(n: Int) -> Bool {
  let r = integer_sqrt(n)
  r * r == n
}

// --------------------
// Worker function
// --------------------

fn process_range_k(pair: #(Int, Int, Int)) -> List(Int) {
  let #(k, start, end_) = pair

  list.range(start, end_)
  |> list.flat_map(fn(i) {
    let sum = sum_of_squares(i, k)
    case is_perfect_square(sum) {
      True -> [i]  // Only keep starting number
      False -> []
    }
  })
}

// --------------------
// Chunking helpers
// --------------------

fn chunk_ranges_recursive(k: Int, max_start: Int, chunk_size: Int, i: Int, acc: List(#(Int, Int, Int))) -> List(#(Int, Int, Int)) {
  case i > max_start {
    True -> acc
    False -> {
      let e =
        case i + chunk_size - 1 > max_start {
          True -> max_start
          False -> i + chunk_size - 1
        }

      chunk_ranges_recursive(k, max_start, chunk_size, e + 1, list.append(acc, [#(k, i, e)]))
    }
  }
}

fn chunk_ranges(k: Int, n: Int, chunk_size: Int) -> List(#(Int, Int, Int)) {
  let max_start = n - k + 1
  chunk_ranges_recursive(k, max_start, chunk_size, 1, [])
}

// --------------------
// Main
// --------------------

pub fn main() {
  let n = 1_000_000
  let max_k = 4
  let chunk_size = 10_000

  list.range(2, max_k)
  |> list.each(fn(k) {
    let ranges = chunk_ranges(k, n, chunk_size)
    let num_workers = list.length(ranges)

    let results_per_range = working_actors.spawn_workers(num_workers, ranges, process_range_k)
    let all_results = results_per_range |> list.flatten

    case all_results {
      [] -> io.println("")
      [first, ..rest] -> {
        let min_val = list.fold(rest, first, fn(x, acc) {
          case x < acc {
            True -> x
            False -> acc
          }
        })
        io.println(int.to_string(min_val))
      }  
    }
  })
}




