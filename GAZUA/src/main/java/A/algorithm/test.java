package A.algorithm;

public class test {
	public static void main(String[] args) {
		double s = 100000;
		int t = 0;
		while(s > 0) {
			t+=1;
			s = s - (s*0.9);
		}
		System.out.println("t : " + t);
		
	}
}
