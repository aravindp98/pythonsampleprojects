class Pattern:
    def pattern_printing(self):

        for i in range(0, self):
            for j in range(0, i):
                print(end=" ")
            for j in range(0, self - i - 1):
                print("*", end=" ")
            print()


c1 = Pattern
c1.pattern_printing(6)