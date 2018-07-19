function madLib(verb, adj, noun) {
  return 'We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.';
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuss(array) {
  const result = [];
  array.forEach(el) => {
    if ((el % 3 === 0) || (el % 5 === 0)) {
      result.push(el);
    }
  });

  return result;
}

function isPrime(number) {
  if (n < 2) {return false}

  for (let i = 2, i < number, i++) {
    if (number % i === 0) {return false};
  }

  return true;
}

function sumOfNPrimes(n) {
  result = [];
  let i = 2;

  while (result.length < n) {
    if (isPrime(i)) {
      result.push(i);
    }
    i ++;
  }
  return result;
}
