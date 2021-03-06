package com.sns.datatest;

 import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Deque;
import java.util.List;
import java.util.Scanner;
 
 /**
 * 외판원 순회(TSP) DP + Bit mask
 * BOJ2098과 같은 문제
 * 
 * @author quki
 *
 */

public class tsp {

	public static int[][] W;
	public static int[][] dp;
	public static int N;
	public static final int INF = 1000000000;
	private static Deque<Integer> route = new ArrayDeque<>();
	private static List<Integer> solution;
	private static List<Integer> path;
	static int re = INF;
	/**
	 * 
	 * @param start 시작점
	 * @param visited 현재까지 경로
	 * @return
	 */
 
	public static int getShortestPath(int current, int visited) {
		
		// 모든 정점을 다 들른 경우
		if (visited == (1 << N) - 1) {	
			route.push(1);
			//1까지 경로 리턴
			return W[current][1];
		}

		// 이미 들렀던 경로이므로 바로 return
//		if (dp[current][visited] >= 0) {
//			System.out.println("이미 들렀던 경로");
//			System.out.println("visited : " + visited);
//			return dp[current][visited];
//		}
		

		int ret = INF;

		// 집합에서 다음에 올 원소를 고르자!
		for (int i = 1; i <= N; i++) {
			int next = i;
			
			// 이미 들렀던 곳일때 pass
			if ((visited & (1 << (next - 1))) != 0) { 
				continue;
			}
			
			// 0은 경로가 없으므로 pass
			if(W[current][next] == 0)
				continue;
			
			route.push(i);
			int temp = W[current][next] + getShortestPath(next, visited + (1 << (next - 1)));
			System.out.println(route.toString());
			System.out.println(temp);

			if(route.size()==N) {
					solution = new ArrayList<>(route);
					System.out.println(route.toString());
				route.pop();
			}
			if(route.size()==2) {
				if(re > temp + W[i][1]) {
					System.out.println("temp : " + temp);
					System.out.println("갱신");
					path = new ArrayList<>(solution);
					re = temp;
				}
			}
			route.pop();
			ret = Math.min(ret, temp);		
		}	
		return dp[current][visited] = ret;
	}

	public static void main(String[] args) {
			
		Scanner sc = new Scanner(System.in);
		N = sc.nextInt();
		W = new int[N + 1][N + 1];
		dp = new int[N + 1][1 << N];
		for (int i = 1; i <= N; i++) {
			for (int j = 1; j <= N; j++) {
				W[i][j] = sc.nextInt();
			}
		}

		// 2차원 배열의 모든 원소를 -1로
		for (int i = 1; i <= N; i++) {
			Arrays.fill(dp[i], -1);
		}
		
		int start = 1;
		System.out.println(getShortestPath(start, 1));
		
		System.out.print("path : ");
		for(int i : path) {
			System.out.print(i + " ");
		}
	}

}