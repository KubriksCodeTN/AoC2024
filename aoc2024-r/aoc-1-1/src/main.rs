use std::io;

fn main() {
    let mut v1: Vec<i32> = Vec::new();
    let mut v2: Vec<i32> = Vec::new();

    let it = io::stdin().lines();
    for l in it {
        let lu = l.unwrap();
        let mut values = lu.split_ascii_whitespace().map(|s| s.parse::<i32>());
        v1.push(values.next().expect("???").expect("???"));
        v2.push(values.next().expect("???").expect("???"));
    }

    v1.sort();
    v2.sort();
    let res: i32 = v1.iter().zip(v2.iter()).fold(0, |acc: i32, (a, b)| acc + (a - b).abs());
    println!("{res}");
}
