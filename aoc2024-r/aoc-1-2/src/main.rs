use std::{collections::HashMap, io};

fn main() {
    let mut v1: HashMap<i32, i32> = HashMap::new();
    let mut v2: HashMap<i32, i32> = HashMap::new();

    let it = io::stdin().lines();
    for l in it {
        let lu = l.unwrap();
        let mut values = lu.split_ascii_whitespace().map(|s| s.parse::<i32>());
        let fst = values.next().unwrap().unwrap();
        let snd = values.next().unwrap().unwrap();
        *v1.entry(fst).or_insert(0) += 1;
        *v2.entry(snd).or_insert(0) += 1;
    }

    let mut res = 0;
    for (a, b) in v1.iter() {
        res += a * *v2.get(a).unwrap_or(&0) * b;
    }
    println!("{res}");
}
