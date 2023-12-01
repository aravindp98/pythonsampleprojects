class Pattern:
    def pattern_printing(self):

        for i in range(1, self):
            for j in range(i + 1):
                print(" ", end=" ")
            for j in range(i, self):
                print("*", end=" ")

            print("\r")


c1 = Pattern
c1.pattern_printing(6)