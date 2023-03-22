theory TwoSums
  imports Main
begin

fun twoSums :: "nat list \<Rightarrow> nat \<Rightarrow> (nat \<times> nat) list" where
  "twoSums [] _ = []" |
  "twoSums (x # xs) target =(
    let
      indices = [j \<leftarrow> [0..<length xs] . xs ! j = target - x]
    in
      map (\<lambda>j. (j + 1, length xs)) indices @ twoSums xs target)"

value\<open>twoSums [1, 2,7, 11, 15, 9] 9\<close>
(*
definition property1 :: "nat list \<Rightarrow> nat \<Rightarrow> bool" where
  "property1 nums target \<equiv>
    \<exists>(i, j) \<in> set (twoSums nums target). nums ! i + nums ! j = target"

definition property2 :: "nat list \<Rightarrow> nat \<Rightarrow> bool" where
  "property2 nums target \<equiv>
    \<exists>(i, j) \<in> set (twoSums nums target).
      i < length nums \<and> j < length nums \<and> i < j \<and> nums ! i + nums ! j = target"

theorem twoSums_correct:
  "\<forall>nums target. property1 nums target \<and> property2 nums target"
proof (intro allI conjI)
  fix nums target
  show "property1 nums target"
  proof (induction nums)
    case Nil
    then show ?case unfolding property1_def by simp
  next
    case (Cons x xs)
    let ?indices = "[j \<leftarrow> [0..<length xs] . xs ! j = target - x]"
    let ?pairs = "map (\<lambda>j. (j + 1, length xs)) ?indices"
    let ?sums = "map (\<lambda>(i, j). nums ! i + nums ! j) ?pairs"
    have "property1 xs target" by (rule Cons.IH)
    then show ?case
    proof (cases "x + x = target")
      case True
      then have "(0, 1) \<in> set (twoSums (x # xs) target)" by simp
      then show ?thesis
        unfolding property1_def
        using True by auto
    next
      case False
      then have "?indices = [j \<leftarrow> [0..<length xs] . xs ! j = target - x] \<and> x \<notin> set ?sums"
        by auto
      then have "set (twoSums (x # xs) target) = set ?pairs \<union> set (twoSums xs target)"
        by simp
      then show ?thesis
        unfolding property1_def
        using Cons.prems \<open>property1 xs target\<close>
        by (auto simp: nth_Cons' sum_list.Cons intro: add.commute)
    qed
  qed

  show "property2 nums target"
  proof (induction nums)
    case Nil
    then show ?case by simp
  next
    case (Cons x xs)
    let ?indices = "[j \<leftarrow> [0..<length xs] . xs ! j = target - x]"
    let ?pairs = "map (\<lambda>j. (j + 1, length xs)) ?indices"
    let ?sums = "map (\<lambda>(i, j). nums ! i + nums ! j) ?pairs"
    have "property2 xs target" by (rule Cons.IH)
    then show ?case
    proof (cases   "x \<ge> target \<or> x \<in> set ?sums")
  case True
  then have "set (twoSums (x # xs) target) = set (twoSums xs target)"
    by simp
  then show ?thesis
    unfolding property2_def
    using \<open>property2 xs target\<close> by auto
next
  case False
  then have "?indices = [j \<leftarrow> [0..<length xs] . xs ! j = target - x] \<and> x \<notin> set ?sums"
    by auto
  then have "set (twoSums (x # xs) target) = set ?pairs \<union> set (twoSums xs target)"
    by simp
  moreover have "\<forall>(i, j) \<in> set ?pairs. i < length (x # xs) \<and> j < length (x # xs) \<and> i < j"
    by auto
  ultimately show ?thesis
    unfolding property2_def
    using Cons.prems \<open>property2 xs target\<close>
    by (auto simp: nth_Cons' intro: add.commute)
qed
qed
qed*)
end
