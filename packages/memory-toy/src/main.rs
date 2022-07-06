use clap::Parser;
use std::thread;
use std::time::Duration;

#[derive(Parser, Debug)]
#[clap(author, version, about, long_about = None)]
struct Args {
    /// bit set ?
    #[clap(short, long)]
    is_set: bool,
    /// Number of times to greet
    #[clap(short, long, default_value_t = 6)]
    size: usize,
}

fn main() {
    let args = Args::parse();

    println!("Starting instanciation of {} Gb", args.size);

    let my_big_array : Vec<u64> = if args.is_set {
        vec![0xFFFFFFFF_FFFFFFFF; args.size * 128 * 1024 * 1024]
    }
    else {
        vec![0x00000000_00000001; args.size * 128 * 1024 * 1024]
    };

    println!("Instanciated {} Gb with value {:#016x}", args.size, my_big_array[0]);

    thread::sleep(Duration::from_secs(30));

    println!("Exiting");
}
