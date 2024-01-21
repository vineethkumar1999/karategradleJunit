package karaterunner;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;
public class Practice {

    public static void main(String[] args) {
//        variable_num(10, 10, 10, 20);
//        Practice2 p1, p2, p3;
//        p1 = new Practice2();
//        p1.displayData();
//        p1.getData();
//        p1.displayData();
//
//        System.out.println("P1 done");
//
//        p2 = new Practice2(10, 20);
//        p2.displayData();
//
//        p3 = new Practice2();
//        p3.setData(30, 40);
//        p3.displayData();
//
//        Practice2.printC();
//        fibonacci(3);
        armstrong(54748);
    }

    static void leap_year() {
        System.out.println("Hi");
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Enter a year");
        boolean c = true;
        try {
            while (c) {
                int year = Integer.parseInt(br.readLine());
                int d = 1;
                if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
                    System.out.println("Its a leap year");
                else
                    System.out.println("Not a leap year");
                d = Integer.parseInt(br.readLine());
                if (d == 0)
                    break;
            }
        } catch (IOException e) {
            System.out.println("Error" + e);
        }
    }

    static void big3_Conditional() {
        int a, b, c;
        System.out.println("Enter a,b,c");
        Scanner sc = new Scanner(System.in);
        a = sc.nextInt();
        b = sc.nextInt();
        c = sc.nextInt();
        System.out.println(a > b ? (a > c ? 'a' : 'c') : (b > c ? 'b' : 'c'));
    }

    static void variable_num(int... num) {
        int sum = 0;
        System.out.println("Length is " + num.length + " Avg is ");
        for (int a : num)
            sum += a;
        System.out.format("%f", (float) sum / num.length);
    }

    static void fibonacci(int num) {
        int a = 0;
        int b = 1;
        int c = 0;
        System.out.println(a + " " + b);
        for (int i = 1; i <= num - 2; i++) {
            c = a + b;
            a = b;
            b = c;
            System.out.print(" " + c);

        }
    }

    static void armstrong(int n)
    {
        int d,sum=0;
        int l = (int) Math.log10(n)+1;
        System.out.println("length is "+l);
        int temp = n;
        while(n>0)
        {
            d = n%10;
            sum = sum + (int) Math.pow(d,l);
            n = n/10;
        }
        if(temp==sum)
            System.out.println("Given value is Armstrong Number");
    }

}

