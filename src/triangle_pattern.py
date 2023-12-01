class Pattern:
    def pattern_printing(self):

        for i in range(self):
            for j in range(i, self):
                print(" ", end=" ")
            for j in range(i + 1):
                print("*", end=" ")
            for j in range(i):
                print("*", end=" ")

            print("\r")


c1 = Pattern
c1.pattern_printing(6)