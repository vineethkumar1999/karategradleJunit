package karaterunner;


public class TestUtils {

    public static int add(int a, int b) {
        return a + b;
    }

    public int mul(int a, int b) {
        return a * b;
    }

    public void test() {
        int a = 1_50;
        System.out.println(a);
        int i = 10, j = 20;
        first:
        while (i > 0) {
            second:
            while (j > 10) {
                System.out.println(" J is " + j);
                if (j == 12) {
                    j=15;
                    break first;
                }
                j--;
            }
            i--;
        }
    }

    public void test(int...num)
    {
        int l = num.length;
        int v = 0;
        for(int a:num)
            v = v+a;

        System.out.println("avg is " +(float)v/l);
    }

    public void az(String s)
    {
        if(s=="small") {
            for (int i = 65; i < 65 + 26; i++) {
                System.out.format("%2c", (char) i);
            }
        }
        else
        {
            for (int i = 97;i < 97 + 26; i++) {
                System.out.format("%2c", (char) i);
            }
        }
        System.out.println();
    }

}
