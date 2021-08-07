#number = int(input("Enter a non negative integer number: "))    
number = 4

fact = 1    
if number < 0:    
   print(" Factorial does not exist for negative integer numbers")    
elif number == 0:    
   print("Factorial of 0 is 1")    
else:    
   for a in range(1,number + 1):    
       fact = fact*a    
   print("The factorial of",number,"is",fact)    
