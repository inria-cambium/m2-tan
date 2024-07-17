From MetaCoq.Guarded Require Import plugin.
From MetaCoq Require Import Utils.bytestring.

Open Scope bs.

Inductive A := AC (u : unit).

#[bypass_check(guard)]
Fixpoint f (a : A) : unit := match a with AC u => f a end.

(* MetaCoq Run (check_inductive (Some "list_tree") list).  *)
MetaCoq Run (check_fix f). 

#[bypass_check(guard)]
Fixpoint abc_bad (n : nat) := 
  match n with 
  | 0 => 0
  | S m => abc_bad n
  end.

MetaCoq Run (check_fix abc_bad). 