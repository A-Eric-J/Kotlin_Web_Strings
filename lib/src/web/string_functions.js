function reverseString(input) {
    return input.split('').reverse().join('');
}

function toUpperCase(input) {
    return input.toUpperCase();
}

function toLowerCase(input) {
    return input.toLowerCase();
}

function getLength(input) {
    return input.length;
}

function concatenate(input1, input2) {
    return input1 + input2;
}

function replaceAll(input, from, to) {
    return input.split(from).join(to);
}

function contains(input, substring) {
    return input.includes(substring);
}

function substring(input, start, end) {
    return input.substring(start, end);
}

function trim(input) {
    return input.trim();
}

function trimLeft(input) {
    return input.trimStart();
}

function trimRight(input) {
    return input.trimEnd();
}
