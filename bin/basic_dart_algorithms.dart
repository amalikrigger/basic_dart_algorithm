// ANSI escape codes for colors
const String colorGreen = '\x1B[32m';
const String colorRed = '\x1B[31m';
const String colorReset = '\x1B[0m';

void main() {
  print('Running Tests:\n');

  // Linear Search Tests
  print('Linear Search Tests:');
  testLinearSearch([], 5, -1, 'Empty List');
  testLinearSearch([1], 1, 0, 'Single element - target found');
  testLinearSearch([1], 5, -1, 'Single element - target not found');
  testLinearSearch([1, 2, 3, 4, 5], 3, 2, 'Multiple elements - target in middle');
  testLinearSearch([1, 2, 3, 4, 5], 1, 0, 'Multiple elements - target at start');
  testLinearSearch([1, 2, 3, 4, 5], 5, 4, 'Multiple elements - target at end');
  testLinearSearch([1, 2, 3, 4, 5], 6, -1, 'Multiple elements - target not found');
  testLinearSearch([1, 2, 2, 3, 4], 2, 1, 'Duplicate elements - first occurrence');

  // Binary Search Tests
  print('\nBinary Search Tests:');
  testBinarySearch([], 5, -1, 'Empty List');
  testBinarySearch([1], 1, 0, 'Single element - target found');
  testBinarySearch([1], 5, -1, 'Single element - target not found');
  testBinarySearch([1, 2, 3, 4, 5], 3, 2, 'Multiple elements - target in middle');
  testBinarySearch([1, 2, 3, 4, 5], 1, 0, 'Multiple elements - target at start');
  testBinarySearch([1, 2, 3, 4, 5], 5, 4, 'Multiple elements - target at end');
  testBinarySearch([1, 2, 3, 4, 5], 6, -1, 'Multiple elements - target not found');
  // testBinarySearch([1, 2, 2, 3, 4], 2, 1, 'Duplicate elements - first occurrence (binary search might return any occurrence)');
  // testBinarySearch([5, 4, 3, 2, 1], 3, -1, 'Unsorted list - should not work correctly');
  // Binary search on unsorted list

  // isPalindrome Tests
  print('\nisPalindrome Tests:');
  testIsPalindrome('', true, 'Empty String');
  testIsPalindrome('a', true, 'Single character');
  testIsPalindrome('aba', true, 'Odd length palindrome');
  testIsPalindrome('abba', true, 'Even length palindrome');
  testIsPalindrome('abc', false, 'Odd length non-palindrome');
  testIsPalindrome('abcc', false, 'Even length non-palindrome');
  testIsPalindrome('Aba', false, 'Case sensitive non-palindrome');
  testIsPalindrome('racecar', true, 'Longer palindrome');
  testIsPalindrome('Racecar', false, 'Longer case sensitive non-palindrome');
  testIsPalindrome('madam', true, 'Another palindrome');
  testIsPalindrome('level', true, 'Another palindrome');

  // rotateArray Tests
  print('\nrotateArray Tests:');
  testRotateArray([], 2, [], 'Empty List');
  // testRotateArray([1], 2, [1], 'Single element list');
  testRotateArray([1, 2, 3, 4, 5], 0, [1, 2, 3, 4, 5], 'Rotate 0 spaces');
  testRotateArray([1, 2, 3, 4, 5], 1, [5, 1, 2, 3, 4], 'Rotate 1 space');
  testRotateArray([1, 2, 3, 4, 5], 2, [4, 5, 1, 2, 3], 'Rotate 2 spaces');
  testRotateArray([1, 2, 3, 4, 5], 5, [1, 2, 3, 4, 5], 'Rotate equal to length');
  testRotateArray([1, 2, 3, 4, 5], 6, [5, 1, 2, 3, 4], 'Rotate more than length');
  // testRotateArray([1, 2, 3, 4, 5], -1, [2, 3, 4, 5, 1], 'Rotate negative 1 space');
  // testRotateArray([1, 2, 3, 4, 5], -2, [3, 4, 5, 1, 2], 'Rotate negative 2 spaces');

  // longestSubstringWithoutRepeatingCharacters Tests
  print('\nlongestSubstringWithoutRepeatingCharacters Tests:');
  testLongestSubstringWithoutRepeatingCharacters('', 0, 'Empty String');
  testLongestSubstringWithoutRepeatingCharacters('a', 1, 'Single character');
  testLongestSubstringWithoutRepeatingCharacters('abcabcbb', 3, 'Repeating characters - example 1');
  testLongestSubstringWithoutRepeatingCharacters('bbbbb', 1, 'All repeating characters');
  testLongestSubstringWithoutRepeatingCharacters('pwwkew', 3, 'Repeating characters - example 2');
  testLongestSubstringWithoutRepeatingCharacters('dvdf', 3, 'Repeating characters - example 3');
  testLongestSubstringWithoutRepeatingCharacters('abcde', 5, 'All unique characters');
  testLongestSubstringWithoutRepeatingCharacters('abcdefghabcdefghi', 9, 'Longer string with repeating and non-repeating parts');
  testLongestSubstringWithoutRepeatingCharacters('anviaj', 5, 'Another example');


  print('\nTests Completed.');
}

void testLinearSearch(List<int> arr, int target, int expected, String testName) {
  int result = linearSearch(arr, target);
  checkResult(result == expected, 'linearSearch', testName, 'Input: arr=$arr, target=$target', 'Expected: $expected, Actual: $result');
}

void testBinarySearch(List<int> arr, int target, int expected, String testName) {
  int result = binarySearch(arr, target);
  checkResult(result == expected, 'binarySearch', testName, 'Input: arr=$arr, target=$target', 'Expected: $expected, Actual: $result');
}

void testIsPalindrome(String str, bool expected, String testName) {
  bool result = isPalindrome(str);
  checkResult(result == expected, 'isPalindrome', testName, 'Input: str="$str"', 'Expected: $expected, Actual: $result');
}

void testRotateArray(List<int> arr, int spaces, List<int> expected, String testName) {
  List<int> result = rotateArray(List.from(arr), spaces); // Pass a copy to avoid modifying original test array
  checkResult(listEquals(result, expected), 'rotateArray', testName, 'Input: arr=$arr, spaces=$spaces', 'Expected: $expected, Actual: $result');
}


void testLongestSubstringWithoutRepeatingCharacters(String str, int expected, String testName) {
  int result = longestSubstringWithoutRepeatingCharacters(str);
  checkResult(result == expected, 'longestSubstringWithoutRepeatingCharacters', testName, 'Input: str="$str"', 'Expected: $expected, Actual: $result');
}


void checkResult(bool condition, String functionName, String testName, String inputDetails, String resultDetails) {
  if (condition) {
    print('${colorGreen}Pass:$colorReset $functionName - $testName - $inputDetails - $resultDetails');
  } else {
    print('${colorRed}Fail:$colorReset $functionName - $testName - $inputDetails - $resultDetails');
  }
}

bool listEquals<T>(List<T> list1, List<T> list2) {
  if (list1.length != list2.length) {
    return false;
  }
  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) {
      return false;
    }
  }
  return true;
}

int linearSearch(List<int> arr, int target) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      return i;
    }
  }
  return -1;
}

int binarySearch(List<int> arr, int target) {
  int left = 0;
  int length = arr.length;
  int right = length - 1;

  while (left <= right) {
    int mid = left + ((right - left) / 2).toInt();
    if (arr[mid] == target) {
      return mid;
    } else if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return -1;
}

bool isPalindrome(String str) {
  int left = 0;
  int right = str.length - 1;

  while (left < right) {
    if (str[left] != str[right]) {
      return false;
    }

    left++;
    right--;
  }

  return true;
}

List<int> rotateArray(List<int> arr, int spaces) {
  if (arr.isNotEmpty && spaces > 0) {
    int length = arr.length;
    int k = spaces % length;

    reverse(arr, 0, length - 1);
    reverse(arr, 0, k - 1);
    reverse(arr, k, length - 1);
  }

  return arr;
}

void reverse(List<int> arr, int start, int end) {
  while (start < end) {
    int temp = arr[start];
    arr[start] = arr[end];
    arr[end] = temp;
    start++;
    end--;
  }
}

int longestSubstringWithoutRepeatingCharacters(String str) {
  Set<String> seen = {};
  int left = 0;
  int right = 0;
  int max = 0;

  while (right < str.length) {
    if (!seen.add(str[right])) {
      seen.remove(str[left]);
      left++;
    } else {
      seen.add(str[right]);
      right++;
      max = max < right - left ? right - left : max;
    }
  }
  return max;
}
