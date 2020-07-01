package study_java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class AnIncompletePlayer {
	public static void main(String[] args) {
		String[] participant = { "mislav", "stanko", "mislav", "ana" };
		String[] completion = { "stanko", "ana", "mislav" };

		System.out.println("solution_01 Result: " + solution_01(participant, completion));
		System.out.println("solution_02 Result: " + solution_02(participant, completion));
	}

	/**
	 * https://programmers.co.kr/learn/courses/30/lessons/42576 HashMap 과 ArrayList를
	 * 사용한 배열 비교
	 * 
	 * @author devcolton
	 * @param participant 참가자 배열
	 * @param completion  완주자 배열
	 * @return answer 완주하지 못한 참가자
	 */
	private static String solution_01(String[] participant, String[] completion) {

		Map<String, Integer> map = new HashMap<>();

		// 참가자를 map에 put.(key = 이름, value = 기본 value + 1)
		for (String player : participant) {
			if (map.get(player) != null) {
				map.put(player, map.get(player) + 1);
			} else {
				map.put(player, 1);
			}
		}

		// 완주자를 map에서 -1한 뒤 다시 put.
		for (String cPlayers : completion) {
			if (map.get(cPlayers) != null) {
				map.put(cPlayers, map.get(cPlayers) - 1);
			}
		}

		// map 중에 값이 0이 아닌 key만 list에 담는다.
		List<String> list = new ArrayList<>();
		Iterator<String> keys = map.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			if (map.get(key) != 0) {
				for (int i = 0; i < map.get(key); i++) {
					list.add(key);
				}
			}
		}

		String answer = list.get(0);
		return answer;
	}

	/**
	 * https://programmers.co.kr/learn/courses/30/lessons/42576 HashMap을 사용한 배열 비교
	 * 
	 * @author devcolton
	 * @param participant 참가자 배열
	 * @param completion  완주자 배열
	 * @return answer 완주하지 못한 참가자
	 */
	private static String solution_02(String[] participant, String[] completion) {

		String answer = "";
		Map<String, Integer> map = new HashMap<>();

		// 참가자 이름은 key, getOrDefault()를 사용해 value setting 후 put
		for (String player : participant) {
			// getOrDefault(): 찾는 key가 있으면 해당 키의 value를 return, 없으면 기본 value(0)를 return
			map.put(player, map.getOrDefault(player, 0) + 1);
		}

		// 완주자를 참가리스트 value에서 1을 뺀다음 다시 put.(re-setting)
		for (String completePlayer : completion) {
			map.put(completePlayer, map.get(completePlayer) - 1);
		}

		// 참가자 중 value가 0이 아닌 참가자를 answer에 담는다.
		for (String incompletePlayer : map.keySet()) {
			if (map.get(incompletePlayer) != 0) {
				answer = incompletePlayer;
			}
		}
		return answer;
	}
}
