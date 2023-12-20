enum BookSearchFilter {
  bookName,
  publishDate,
  isBookLoaned,
  loanRemainingDays,
}

enum UserSearchFilter {
  userUid,
  name,
  address,
  phoneNum,
  birthDate,
  registrationDate,
}

enum BookLoanSearchFilter {
  bookName,
  userUid,
  loanDate,
  dueDate,
  remainingLoanDays
}

enum SortFilter {
  ascending,
  decending
}