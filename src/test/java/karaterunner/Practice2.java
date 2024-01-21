package karaterunner;

import java.util.Scanner;

public class Practice2 {
       private int a,b;
       private static int c;

       static
       {
              printC();
              System.out.println("Initializing C to 1");
              c = 1;
       }

       Practice2()
       {
              c+=1;
              System.out.println("C incremented");
       }

       Practice2(int x, int y)
       {
              a = x;
              b = y;
              c+=1;
              System.out.println("C incremented");
       }
       protected void setData(int a,int b)
       {
              this.a = a;
              this.b = b;
       }
       public void getData()
       {
              Scanner sc = new Scanner(System.in);
              System.out.println("Enter the values of a and b");
              a = sc.nextInt();
              b = sc.nextInt();
       }

       public void displayData()
       {
              System.out.println("a and b values are "+ a + "  " +b);
       }

       public static void printC()
       {
              System.out.println("C value is " +c);
       }

}
