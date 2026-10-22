use aiken/collection/list
pub type State { count: Int }
pub type Action { Add(Int) Stop }
fn positive(n: Int) -> Bool { n > 0 }
validator payments(owner: ByteArray) {
  spend(datum: Option<State>, redeemer: Int, _ref: Data, _tx: Data) {
    when datum is {
      Some(state) -> positive(redeemer)
      None -> False
    }
  }
  mint(redeemer: Int, _policy: ByteArray, _tx: Data) { redeemer |> positive }
  else(_) { fail }
}
test positive_test() { positive(1) }
