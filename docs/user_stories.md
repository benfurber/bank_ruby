# User Stories

```
AS A customer
I WANT an account
SO THAT I can contribute to the capitalist society
```
*ACs:*
* Customer can request an account is opened
* New account balance is set to zero
* Date of account creation is saved

```
AS A customer
I WANT to make deposits into my account
SO THAT I can keep my money safe
```
*ACs:*
* Customer can request a deposit as an integer
* Deposit integer is ADDED to account balance
* Integer of deposit is saved
* Date of deposit is saved

```
AS A customer
I WANT to make withdrawals from my account
SO THAT I can spent it
```
*ACs:*
* Customer can request a withdrawal as an integer
* Deposit integer is REMOVED from account balance
* Integer of withdrawal is saved
* Date of withdrawal is saved

```
AS A customer
I WANT to print a bank statement
SO THAT I can see the history of transactions
```
*ACs:*
* Customer can request a print out of transactions
* Each transaction gives the date and balance after transaction
* If the transaction type is a deposit, the deposit amount is printed in the deposit column
* If the transaction type is a withdrawal, the withdrawal amount is printed in the withdrawal column
* Transactions printed in date order - most recent transaction first
