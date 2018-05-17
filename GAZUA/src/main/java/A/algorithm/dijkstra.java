package A.algorithm;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Scanner;

public class dijkstra {

	static int V; // 정점의 개수
	static int E; // 간선의 개수
	static int START_V; // 시작 정점의 번호

	static int[] dist; // 시작점 부터의 거리
	static int[] visited; // 방문여부 체크
	static HashMap<Integer, LinkedList<Node>> maps; // 간선 정보

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		V = sc.nextInt();
		E = sc.nextInt();
		START_V = sc.nextInt();
		maps = new HashMap<>();

		dist = new int[V + 1];
		visited = new int[V + 1];

		for (int i = 0; i <= V; i++) {
			dist[i] = Integer.MAX_VALUE - 1;
		}

		for (int i = 0; i < E; i++) {
			int from = sc.nextInt();
			int to = sc.nextInt();
			int cost = sc.nextInt();

			if (!maps.containsKey(from))
				maps.put(from, new LinkedList<>());

			maps.get(from).add(new Node(from, to, cost));
		}

		sc.close();

		// 시작
		dist[START_V] = 0;

		for (int i = 0; i < V; i++) {

			// 최소값을 가지는 정점 확인
			int minCost = Integer.MAX_VALUE;
			int from = -1;
			for (int k = 1; k < dist.length; k++) {
				if (visited[k] == 0 && minCost > dist[k]) {
					from = k;
					minCost = dist[k];
				}
			}

			// 최소값 정점 체크
			visited[from] = 1;

			// from 에서 출발하는 경로기 있을 때 처리
			if (maps.containsKey(from)) {
				for (Node next : maps.get(from)) {
					int to = next.to;
					int cost = next.cost;

					// from 으로 가는 경로가 계산 되어 있는 경우만 처리
					if (dist[from] != Integer.MAX_VALUE - 1 && dist[to] > dist[from] + cost) {
						dist[to] = dist[from] + cost;
					}
				}
			}
		}

		for (int i = 1; i < dist.length; i++) {
			System.out.println(dist[i] == Integer.MAX_VALUE - 1 ? "INF" : dist[i]);
		}
	}
}

class Node {
	public int from;
	public int to;
	public int cost;

	public Node(int from, int to, int cost) {
		super();
		this.from = from;
		this.to = to;
		this.cost = cost;
	}
}
