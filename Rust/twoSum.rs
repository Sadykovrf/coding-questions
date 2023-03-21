fn two_sum(nums: &[i32], target: i32) -> Option<(usize, usize)> {
    use std::collections::HashMap;
    
    let mut num_map = HashMap::new();
    
    for (i, num) in nums.iter().enumerate() {
        let complement = target - num;
        if let Some(&complement_index) = num_map.get(&complement) {
            return Some((complement_index, i));
        }
        num_map.insert(num, i);
    }
    
    None
}

fn main() {
    let nums = vec![2, 7, 11, 15];
    let target = 9;
    let result = two_sum(&nums, target);
    match result {
        Some((i, j)) => println!("Indices of numbers that add up to {}: {} and {}", target, i, j),
        None => println!("No two numbers add up to {}", target),
    }
}
