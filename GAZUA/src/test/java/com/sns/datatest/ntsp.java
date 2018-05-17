package com.sns.datatest;

import java.util.Scanner;

public class ntsp {

	public static int N;
	public static int[][] W = new int[10][10];
	public static boolean[] visited = new boolean[10];
	public static int[] city = new int[10];
	
	public static void tsp(int node, int costSum, int count) {
		visited[node] = true;
		city[count - 1] = node;
		if(count == N) {
			for(int i = 0; i < N; i++) {
				System.out.print(city[i] + " ");
			}
			System.out.print(" : " + costSum);
			System.out.println();
			visited[node] = false;
			city[count -1] = -1;
			return;
		}
		
		for(int i = 0; i < N; i++) {
			if(!visited[i] && W[node][i] != 0) {
				tsp(i, costSum+W[node][i], count + 1);
			}
		}
		visited[node] = false;
		city[count - 1] = -1;
	}
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		N = sc.nextInt();
		for(int i = 0; i < N; i++){
			city[i] = -1;
			visited[i] = false;
			for (int j = 0; j < N; j++) {
				W[i][j] = sc.nextInt();
			}
		}
		System.out.println();
		tsp(1, 0, 1);
		tsp(2, 0, 1);
		tsp(3, 0, 1);
		tsp(4, 0, 1);
		tsp(5, 0, 1);
	}
}
