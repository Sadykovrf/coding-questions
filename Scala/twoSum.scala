object twoSum {
  def twoSum(nums: Array[Int], target: Int): Array[Int] = {
  val map = scala.collection.mutable.Map.empty[Int, Int]
  for (i <- nums.indices) {
    val complement = target - nums(i)
    if (map.contains(complement)) {
      val result = Array(map(complement), i)
      println(s"Indices that add up to target ($target): ${result.mkString(", ")}")
      return result
    }
    map(nums(i)) = i
  }
  throw new IllegalArgumentException("No two sum solution")
}

val nums = Array(2, 7, 11, 15)
val target = 9

	def main(args: Array[String]): Unit = {
	val indices = twoSum(nums, target)
  }
}