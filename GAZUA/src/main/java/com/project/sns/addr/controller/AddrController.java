package com.project.sns.addr.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Deque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletionService;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.cxf.helpers.IOUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.project.sns.addr.service.AddrService;
import com.project.sns.addr.vo.AddrVO;
import com.project.sns.board.vo.BoardVO;

import A.algorithm.AES;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Controller
public class AddrController {
	private final Logger logger = LoggerFactory.getLogger(AddrController.class);

	@Autowired
	private AddrService service;

//	public static int[][] W;
//	public static int[][] dp;
//	public static int N;
//	public static final int INF = 1000000000;
//	private static Deque<Integer> route = new ArrayDeque<>();
//	private static List<Integer> solution;
//	private static List<Integer> path;
//	static int re = INF;
	
	//DB ���옣
	@RequestMapping("/inputAddr.do")
	public String inputAddr(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "429e9l%2BRPBvvMYSqI0TIu0JgvFl1vio2dcUfXj7d66%2F%2B2glco1EDs1HDHJBssw9U7HAt1A11Cy6N0Hbk2INDfQ%3D%3D";
		String parameter = "";
		// serviceKey = URLEncoder.encode(serviceKey,"utf-8");

		PrintWriter out = response.getWriter();
		// PrintWriter out = new PrintWriter(new OutputStream
		// Writer(response.getOutputStream(),"KSC5601"));
		// ServletOutputStream out = response.getOutputStream();p
		parameter = parameter + "&" + "areaCode=1";
		parameter = parameter + "&" + "numOfRows=4000";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=aa";
		parameter = parameter + "&" + "_type=json";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		System.out.println(addr);

		// BufferedReader in = new BufferedReader(new
		// InputStreamReader(url.openStream(), "UTF-8"));

		InputStream in = url.openStream();
		// CachedOutputStream bos = new CachedOutputStream();
		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);

		JSONObject json = new JSONObject();
		json.put("data", s);
		// json.put("data", data);

		JSONObject jso = json.getJSONObject("data");
		JSONObject js = jso.getJSONObject("response");
		JSONObject jj = js.getJSONObject("body");
		JSONObject items = jj.getJSONObject("items");
		JSONArray jArray = items.getJSONArray("item");

		List<AddrVO> list = new ArrayList<AddrVO>();
		for (int i = 0; i < 3361; i++) {
			JSONObject a = jArray.getJSONObject(i);


			AddrVO vo = new AddrVO();

			// TourMap DB
			if (a.has("contenttypeid") && a.has("contentid") && a.has("title") && a.has("tel") && a.has("addr1")
					&& a.has("firstimage") && a.has("firstimage2") && a.has("cat2") && a.has("cat3") && a.has("mapx")
					&& a.has("mapy")) {
				vo.setContentTypeId(a.getString("contenttypeid"));
				vo.setContentId(a.getString("contentid"));
				vo.setTitle(a.getString("title"));
				vo.setTel(a.getString("tel"));
				vo.setAddr1(a.getString("addr1"));
				vo.setFirstimage(a.getString("firstimage"));
				vo.setFirstimage2(a.getString("firstimage2"));
				vo.setCat2(a.getString("cat2"));
				vo.setCat3(a.getString("cat3"));
				vo.setMapx(a.getString("mapx"));
				vo.setMapy(a.getString("mapy"));
				list.add(vo);
			}
		}

		int i = service.inputAddr(list);
		return "test";
	}

	//DB ���옣(異뺤젣 update)
	@RequestMapping("/updateFest.do")
	public String updateFest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "429e9l%2BRPBvvMYSqI0TIu0JgvFl1vio2dcUfXj7d66%2F%2B2glco1EDs1HDHJBssw9U7HAt1A11Cy6N0Hbk2INDfQ%3D%3D";
		String parameter = "";
		// serviceKey = URLEncoder.encode(serviceKey,"utf-8");

		PrintWriter out = response.getWriter();
		// PrintWriter out = new PrintWriter(new OutputStream
		// Writer(response.getOutputStream(),"KSC5601"));
		// ServletOutputStream out = response.getOutputStream();
		parameter = parameter + "&" + "areaCode=1";
		parameter = parameter + "&" + "contentTypeId=15";
		parameter = parameter + "&" + "numOfRows=4000";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=aa";
		parameter = parameter + "&" + "_type=json";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		System.out.println(addr);

		// BufferedReader in = new BufferedReader(new
		// InputStreamReader(url.openStream(), "UTF-8"));

		InputStream in = url.openStream();
		// CachedOutputStream bos = new CachedOutputStream();
		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);

		JSONObject json = new JSONObject();
		json.put("data", s);
		// json.put("data", data);

		JSONObject jso = json.getJSONObject("data");
		JSONObject js = jso.getJSONObject("response");
		JSONObject jj = js.getJSONObject("body");
		JSONObject items = jj.getJSONObject("items");
		JSONArray jArray = items.getJSONArray("item");

		List<AddrVO> list = new ArrayList<AddrVO>();
		for (int i = 0; i < 377; i++) {
			JSONObject a = jArray.getJSONObject(i);

			AddrVO vo = new AddrVO();

			// TourMap DB
			if (a.has("contenttypeid") && a.has("contentid") && a.has("title") && a.has("tel") && a.has("addr1")
					&& a.has("firstimage") && a.has("firstimage2") && a.has("cat2") && a.has("cat3") && a.has("mapx")
					&& a.has("mapy")) {
				vo.setContentTypeId(a.getString("contenttypeid"));
				vo.setContentId(a.getString("contentid"));
				vo.setTitle(a.getString("title"));
				vo.setTel(a.getString("tel"));
				vo.setAddr1(a.getString("addr1"));
				vo.setFirstimage(a.getString("firstimage"));
				vo.setFirstimage2(a.getString("firstimage2"));
				vo.setCat2(a.getString("cat2"));
				vo.setCat3(a.getString("cat3"));
				vo.setMapx(a.getString("mapx"));
				vo.setMapy(a.getString("mapy"));
				list.add(vo);
			}
		}

		int i = service.inputAddr(list);
		return "test";
	}

	//�옄�꽭�븳 �젙蹂� �몴�떆
	@RequestMapping("/callDetail.do")
	public void callDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam String contentId,
			@RequestParam String contentTypeId) throws Exception {
		logger.info("callDetail");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=";
		String serviceKey = "429e9l%2BRPBvvMYSqI0TIu0JgvFl1vio2dcUfXj7d66%2F%2B2glco1EDs1HDHJBssw9U7HAt1A11Cy6N0Hbk2INDfQ%3D%3D";
		String parameter = "";

		PrintWriter out = response.getWriter();

		parameter = parameter + "&" + "contentId=" + contentId;
		parameter = parameter + "&" + "contentTypeId=" + contentTypeId;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=aa";
		parameter = parameter + "&" + "_type=json";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		InputStream in = url.openStream();

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);

		JSONObject json = new JSONObject();
		json.put("data", s);
		
	}
	
	@ResponseBody
	@RequestMapping("/callInfo")
	public AddrVO callInfo(@RequestParam String contentId) throws Exception{
		AddrVO vo = service.callInfo(contentId);
		double star = 0;
		if(vo.getScope()!=null) {
			star = Double.parseDouble(vo.getScope());
			if(star != 0) {
				if(service.getStarAvg(contentId)>0) {
					double star2 = service.getStarAvg(contentId);
					if(star2!=0) {
						star = (star + star2)/2;
					}
				}
			}
		}
		String stars = Double.toString(star);
		if(vo.getContentTypeId().equals("39")) {
		AddrVO vo2 = service.callReview(contentId);
		if(vo2!=null) {
		vo.setLink1(vo2.getLink1());
		vo.setLink2(vo2.getLink2());
		vo.setLink3(vo2.getLink3());
		vo.setImage1(vo2.getImage1());
		vo.setImage2(vo2.getImage2());
		vo.setImage3(vo2.getImage3());
		vo.setScope(stars);
		}else {
			vo.setScope(stars);
			vo2 = null;
		}
		}
		return vo;
	}

	 @RequestMapping("/newMap")
	 public String path2(HttpServletRequest request, HttpSession session)throws Exception{
	    List<AddrVO> list = service.getAddress();
	    request.setAttribute("list", list);   
	    
	    if(session.getAttribute("id") != null) {				//濡쒓렇�씤�씠 �릺�뼱�엳�쓣 �븣留� pathCount瑜�(寃쎈줈 臾띠쓬) 遺덈윭�삩�떎.
	    	
	    	String id = (String) session.getAttribute("id");
	    	id = AES.setDecrypting(id);

	    request.setAttribute("id", id);
	    }
	    return "path2";
	 }

	  @RequestMapping("/insertPath.do")
	    public void insertPath(HttpSession session, BoardVO vo) throws Exception {

	    	String id = (String) session.getAttribute("id");
	    	id = AES.setDecrypting(id);
	    	
		int storySeq = service.getStoryseq(id);
		
	    vo.setWriter(id);
	    	vo.setStory_seq(storySeq);
	    	service.insertPath(vo);
	    
	    }
	
	//Dijkstra - 肄붿뒪異붿쿇 湲몄갼湲�
	@RequestMapping("/getPath.do")
	public @ResponseBody Map<String, Object> getPath(@RequestParam String sigungucode, @RequestParam String startTime) throws Exception {
		
		
		//�궇�뵪 API
		   String[] temp = new String[3];
	       String[] wfKor = new String[3];
	       String[] hour1 = new String[3];
	        int weather =0 ;
	        try {
	              DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();				//臾몄꽌 �씫湲� �쐞�븳 factory
	              DocumentBuilder builder = factory.newDocumentBuilder();								//鍮뚮뜑 �깮�꽦
	            
	              Document xmlDoc = null;
	              String url = "http://www.weather.go.kr/wid/queryDFSRSS.jsp?zone=1159068000";
	              xmlDoc = builder.parse(url);															//�깮�꽦�맂 鍮뚮뜑瑜� �넻�빐 XML臾몄꽌瑜� Document 媛앹껜濡� �뙆�떛�빐�꽌 媛��졇�삩�떎	            
	              Element root = xmlDoc.getDocumentElement();
	              // System.out.println(root.getTagName());
	               
	              for (int i = 0; i < temp.length; i++) {
	               Node xml = root.getElementsByTagName("pubDate").item(0);     
	               Node xmlNode1 = root.getElementsByTagName("data").item(i);
	               
	               Node xmlNode21 = ((Element) xmlNode1).getElementsByTagName(
	                 "pty").item(0);
	               Node xmlNode22 = ((Element) xmlNode1).getElementsByTagName(
	                 "wfKor").item(0);
	               Node xmlNode23 = ((Element) xmlNode1).getElementsByTagName(
	                 "hour").item(0);
	                
	               temp[i] = xmlNode21.getTextContent();
	               wfKor[i] = xmlNode22.getTextContent();
	               hour1[i] = "湲곗��떆媛� : " + xmlNode23.getTextContent() + "�떆";
	               
	               System.out.println("湲곗� �떆媛�"+xml.getTextContent());
	               System.out.println("湲곗삩 : 0 => 留묒쓬  1,2,3 => �늿/鍮�           �쁽�긽�깭 =>"+temp[i] + "    �궇�뵪: " + wfKor[i] + "    �떆媛�: " +hour1[i]);
	               if(temp[i].equals("0"))
	                  weather = 1;
	               else 
	                  weather = 2;
	              }	            
	             } catch (Exception e) {
	              System.out.println(e.getMessage());
	              System.out.println(e.toString());
	             }	        
	  
	       List<AddrVO> list = null;
	       if(weather == 1)
	       {	
	    	   list = service.getAddrWithCode(sigungucode);
	       }
	       else 
	       {
	    	   list = service.getAddrByWeather(sigungucode, "1");	//�궇�뵪媛� �븞 醫뗭쓣 �븣�뿉�뒗 �떎�궡 �뜲�씠�꽣留� 媛��졇�삩�떎.
	       }

		List<BoardVO> listHeart = service.getHeart();
		System.out.println();
		List<BoardVO> listStar = service.getStarAvgList();
	       
		double distanceMeter = 0;
		//洹몃옒�봽 ���옣�슜 留�
        //HashMap<異쒕컻吏�, HashMap<�룄李⑹�, 嫄곕━>>
        HashMap<String, HashMap<String, ArrayList>> distanceMap = 
                new HashMap<String, HashMap<String, ArrayList>>();
        
        //�룄李⑹�, 嫄곕━ ���옣�슜 �엫�떆 留�
        //tempMap�쓣 留뚮뱺�썑 �씠瑜� �떎�떆 distanceMap�뿉 put
        HashMap<String, ArrayList> tempMap = new HashMap<String, ArrayList>();
       
		// �떆媛� 援ы븯湲곗슜
		Calendar cal = Calendar.getInstance();
		// 異쒕젰 �삎�깭瑜� 吏��젙
		SimpleDateFormat dataFormat = new SimpleDateFormat("YYYYMMddHHmm");							//�굹以묒뿉 �떆媛꾨릺硫� 異뺤젣 �뜲�씠�꽣 諛쏆쓣 �븣 �궗�슜�븯�룄濡� �뀈�썡�씪源뚯� �몴�떆
		String curDate = dataFormat.format(cal.getTime());
		
		int time = 0;
		String sTime = startTime.replace(":", "");
		String ampm = sTime.substring(4);
		System.out.println(sTime.substring(0,4));
		if(sTime.substring(0,4).equals("0000")) {
			time = Integer.parseInt(curDate.substring(8));
		} else if(ampm.equals("PM")){
			time = Integer.parseInt(sTime.substring(0,4)) + 1200;
		}
		
		if(ampm.equals("PM")) {
			time = Integer.parseInt(sTime.substring(0,4)) + 1200;
		}

     		
		for(int i=0; i<list.size(); i++) {
			tempMap = new HashMap<>();
			for(int j=0; j<list.size(); j++) {
				distanceMeter = distance(Double.parseDouble(list.get(i).getMapy()), Double.parseDouble(list.get(i).getMapx()), Double.parseDouble(list.get(j).getMapy()), Double.parseDouble(list.get(j).getMapx()), "meter");	
//				System.out.println(list.get(i).getTitle() + " --> " + distanceMeter + " --> " + list.get(j).getTitle() );	
				ArrayList<Object> mapList = new ArrayList<>();
				mapList.add(distanceMeter);									//嫄곕━
				mapList.add(list.get(j).getScope());						//�꽕�씠踰� �쓬�떇�젏 �룊�젏
				mapList.add(list.get(j).getContentId());					
				mapList.add(list.get(j).getContentTypeId());
				mapList.add(list.get(j).getInside());
				for(int l=0; l<listStar.size(); l++) {
					if(listStar.get(l) !=null && list.get(j).getContentId().equals(listStar.get(l).getStar())) {
						mapList.add(listStar.get(l).getStar());
					}
				}				
				for(int k=0; k<listHeart.size(); k++) {
					if(listHeart.get(k) !=null && list.get(j).getContentId().equals(listHeart.get(k).getContentId())) {
						mapList.add(listHeart.get(k).getHeart());			//寃뚯떆湲� 醫뗭븘�슂
				}
				}
					

		
					
				tempMap.put(list.get(j).getContentId(), mapList);			
			}	
			distanceMap.put(list.get(i).getContentId(), tempMap);
		}
		
		Collections.shuffle(list);			//臾댁옉�쐞 異쒕컻�젏 異붾젮�궡湲� �쐞�빐�꽌 list �븳踰� �꽎�쓬		
		
		if(1130 <= time && time <= 1330 || 1730 <= time && time <= 1930) {			//�젏�떖, ���뀅�떆媛꾩씪 寃쎌슦 �쓬�떇�젏�쑝濡�
			while(!list.get(0).getContentTypeId().equals("39")) {					
				Collections.shuffle(list);
			}
		} else { 
			while(list.get(0).getContentTypeId().equals("39")) {					//洹� �쇅 �떆媛꾩� �떎瑜� �옣�냼濡� 異쒕컻吏� 吏��젙
				Collections.shuffle(list);
			}
		};
		

		String start = list.get(0).getContentId();
		
		ArrayList destinationArry = new ArrayList<>();			//紐⑹쟻吏� 由ъ뒪�듃 以� �옖�뜡�쑝濡� �븯�굹�쓽 紐⑹쟻吏�瑜� 戮묒븘�궡湲� �쐞�븳 諛곗뿴
		
		int lastTime = 0;			//寃쎈줈 以� 媛��옣 留덉�留� �떆媛�
		Result result = dijkstra(distanceMap, start, time);    	//dijkstra(嫄곕━ 留�, 異쒕컻吏�, 肄섑뀗痢좏��엯ID, �쁽�옱�궇吏쒖떆媛�)
		
		for(String key : result.preNode.keySet()) {	
			if(!result.preNode.get(key).isEmpty()) {							//異쒕컻吏��뒗 preNode 諛곗뿴�씠 �뾾�쑝誘�濡� result.preNode.get(key).get(1)�뿉�꽌 IndexOutBoundsException �뿉�윭�궓.  洹몃옒�꽌 �궗�슜				
				if((int) result.preNode.get(key).get(1) > lastTime) { 			//result.preNode.get(key).get(1) = HHmm �삎�깭�쓽 �떆媛꾩씠 �뱾�뼱�엳�쓬
					lastTime = (int) result.preNode.get(key).get(1);	
				}
				
				int resultTime = (Integer) result.preNode.get(key).get(1);
				if(1130 <= lastTime && lastTime <= 1330 || 1730 <= lastTime && lastTime <= 1930) {       		//紐⑹쟻吏� 諛μ떆媛꾩뿏 �쓬�떇�젏, 諛μ떆媛� �쇅�뿉�뒗 愿�愿묒�濡� �꽭�똿
												
					if(result.preNode.get(key).get(2).equals("39") && resultTime == lastTime) {					
							destinationArry.add(key);						
					}
				} else {
					if(!result.preNode.get(key).get(2).equals("39") && resultTime == lastTime) {
							destinationArry.add(key);						
					}					
				}
			}
		};
			
	
		Collections.shuffle(destinationArry);						
		String destination = destinationArry.get(0).toString();
               
        ArrayList<String> path = new ArrayList<>();			//寃쎈줈 �떞�븘�몢�뒗 LIST
        String curNode = destination; 	//�쁽�옱�끂�뱶�뒗 destination   
               
        path.add(destination);			
        	
        while(!result.preNode.get(curNode).isEmpty()){					
           curNode  = (String) result.preNode.get(curNode).get(0);						
           												
           path.add(curNode);
        }																
               
        Map<String, Object> jsonData = new HashMap<String, Object>();
        jsonData.put("path",path);
        return jsonData;
	}

	   // TSP
    @ResponseBody
    @RequestMapping(value = "/getpath", method= {RequestMethod.POST})
    public List<AddrVO> path(HttpServletRequest req, @RequestBody List<AddrVO> paramData) throws Exception{

          System.out.println("paramData�쓽 湲몄씠" + paramData.size());
          System.out.println(paramData.toString());
          for(int i = 0; i < paramData.size(); i++) {
             System.out.println(paramData.get(i).getContentId());
             System.out.println(paramData.get(i).getTitle());

          }

             int[][] W = getP.getW(paramData);
             
          System.out.println("getW�쓽 寃곌낵 W : ");
          for(int i = 0; i<W.length; i++) {
             for(int j = 0; j <W[0].length; j++) {
                System.out.print(W[i][j] + " ");
             }
             System.out.println();
          }               
          getP.getShortestPath(1, 1, W);
//           int delayTime = 2000;
//           long saveTime = System.currentTimeMillis();
//           long currTime = 0;
//           while(currTime - saveTime < delayTime) {
//              currTime = System.currentTimeMillis();
//           }
           
          List<Integer> path = getP.getPath();
          Collections.reverse(path);
          
          int longest = 0;
          int star = 0;         
          for(int i = 0; i < path.size(); i++) {
             if(i == path.size()-1) {
                if(W[path.get(i)][path.get(0)] > longest) {
                   longest = W[path.get(i)][path.get(0)];
                   star = path.get(0);
                }
             }else if(W[path.get(i)][path.get(i+1)] > longest) {
                longest = W[path.get(i)][path.get(i+1)];
                star = path.get(i+1);
             }
          }
          
          System.out.println("W : ");
          for(int i = 0; i<W.length; i++) {
             for(int j = 0; j <W[0].length; j++) {
                System.out.print(W[i][j] + " ");
             }
             System.out.println();
          }
          
          
          int index = path.indexOf(star);
          List<Integer> result = new ArrayList<>();
          for(int i = index; i < path.size(); i++) {
             result.add(path.get(i));
          }
          for(int i = 0; i < index; i++) {
             result.add(path.get(i));
          }
          
          System.out.println("result�쓽 湲몄씠 : " + result.size());

          
          System.out.println("result : ");
          for(int i : result) {
             System.out.print(i + " ");
          }
          
          List<AddrVO> re = new ArrayList<>();
          for(int i : result) {
             re.add(paramData.get(i-1));
          }

          System.out.println("re�쓽 湲몄씠 : " + re.size());
          
          return re;
    }  
		
	//嫄곕━ �룷�씤�듃 媛�以묒튂 (Dijkstra)
	private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {

		double theta = lon1 - lon2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;

		if (unit == "kilometer") {
			dist = dist * 1.609344;
		} else if (unit == "meter") {
			dist = dist * 1609.344;
		}
		
		int distPoint = (int) Math.floor(dist/1000) * 10;
		//Meter濡� 怨꾩궛�븷 �븣 1000�쑝濡� �굹�닠�꽌 �냼�닔�젏 �씠�븯 踰꾨┝
		// * 10�� 媛�以묒튂 媛� 怨꾩궛�븷 �븣 踰붿쐞 �쟻�슜媛��뒫�븯寃� 踰붿쐞 �뒛由ш린�슜
		
		return (distPoint);
	}

	// This function converts decimal degrees to radians
	private static double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	// This function converts radians to decimal degrees
	private static double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}
	
	
	//�떎�씡�뒪�듃�씪 �븣怨좊━利�
	    final static double INFINITY = Double.MAX_VALUE;		
    
	    //dijkstra return �삤釉뚯젥�듃
	    private static class Result{
	        //�끂�뱶 源뚯� 理쒕떒 嫄곕━
	        HashMap<String, Double> shortestPath = new HashMap<>();
	        //�옄湲� �씠�쟾�쓽 �끂�뱶 -> 猷⑦듃 異붿쟻�슜
	        HashMap<String, ArrayList> preNode = new HashMap<>(); 
	    }
	    
	    //input: Map<異쒕컻吏�, Map<�룄李⑹�, 嫄곕━>>, 理쒖큹 異쒕컻吏�, �떆媛�, �궇�뵪
	    //output: Result object
	    //do: dijkstra �븣怨좊━利섏쓣 �씠�슜�븯�뿬 異쒕컻吏�遺��꽣 媛� �끂�뱶源뚯� 理쒕떒 嫄곕━, 猷⑦듃 怨꾩궛
	    private static Result dijkstra(HashMap<String, HashMap<String, ArrayList>> graph, String start, Integer time){
	    	HashMap<String, Double> shortestPath= new HashMap<>();
	        HashMap<String, ArrayList> preNode = new HashMap<>();			//<�떆媛�, �씠�쟾�끂�뱶�씠由�>
	        HashMap<String, Integer> timeMap = new HashMap<>();

	        shortestPath.put(start,0.0);
	        preNode.put(start, new ArrayList());
	        timeMap.put(start, time);
	        
	        //洹몃옒�봽�쓽 媛� �끂�뱶瑜� ���옣�븷 吏묓빀
	        HashSet<String> Q = new HashSet<>();
	        
	        for(String key: graph.keySet()){       //異쒕컻->�룄李⑷퉴吏� 紐⑤뱺 �끂�뱶 Q�뿉 ���옣
	            Q.add(key);
	            if(!key.equals(start)){			   //異쒕컻吏�媛� �븘�땲硫� 寃쎈줈, �씠�쟾 �끂�뱶 珥덇린�솕	            	
	            	shortestPath.put(key, INFINITY);	            	
	                preNode.put(key, new ArrayList());
	                timeMap.put(key, 0);
	            }
	        }
	        
	        while(!Q.isEmpty()){			        //Q媛� 鍮뚮븣 源뚯� 諛섎났
	            //�쁽�옱 Q�븞�뿉�꽌 理쒖냼 distance�씤 node 李얠� �썑 爰쇰궡湲�
	            String minNode = "";
	            String minTypeId = "";
	            double minNodeDistance = INFINITY;
	            int curTime = 0;
	            
	            for(String node: Q){

	            		if(shortestPath.get(node) < minNodeDistance){	//理쒖냼嫄곕━ map�뿉�꽌 node源뚯��쓽 嫄곕━媛� 媛��옣 �궙��嫄� minNode, minNodeDistance�뿉 �뾽�뜲�씠�듃
	            			minNode = node;								
	            			minNodeDistance = shortestPath.get(node);
	            			curTime = timeMap.get(node);
	            		}	           		
	            }
	            Q.remove(minNode);	// �끂�뱶媛� 嫄곕━�뱾 以� 媛��옣 �궙�� 嫄곕━�뒗 Q�뿉�꽌 �젣�쇅�떆�궡
	            
	            //嫄곕━ 理쒖냼 node�쓽 �씠�썐 �끂�뱶源뚯� 嫄곕━ Map �씫�뼱 �삤湲�
	            //理쒖냼 node 源뚯� 嫄곕━ + �씠�썐 �끂�뱶源뚯� 嫄곕━ < �쁽�옱 �씠�썐 �끂�뱶�쓽 理쒖냼 嫄곕━ �씠硫� shortestPath, preNode 媛깆떊      
	            
	            HashMap<String, ArrayList> minNodeMap = graph.get(minNode);		//媛��옣 �쟻�� 嫄곕━瑜� �넻�빐 �씠�룞�뻽�쑝�땲源� 嫄곌린�꽌 異쒕컻(minNode=異쒕컻)	
	            
	            for(String key: minNodeMap.keySet()) {	
	           
	            //minNode.get(key).get(0) : 嫄곕━
	            //minNode.get(key).get(1) : �꽕�씠踰� �룊�젏
	            //minNode.get(key).get(2) : 肄섑뀗痢쟅D
	            //minNode.get(key).get(3) : 肄섑뀗痢� ���엯ID (移댄뀒怨좊━)	            
	            //minNode.get(key).get(4) : �떎�궡/�떎�쇅
	            //minNode.get(key).get(5) : �궗�슜�옄媛� 以� 蹂꾩젏
	            //minNode.get(key).get(6) : 醫뗭븘�슂...�엫�떆
	            	
	            	String sco = minNodeMap.get(key).get(1).toString().replaceAll("\n", "");
	            	Double scop = Double.parseDouble(sco);
	            	int scope = (int)Math.round(scop);
		            String contentId = minNodeMap.get(key).get(2).toString();
		            String contentTypeId = minNodeMap.get(key).get(3).toString();
		            int nextTime = curTime + 200;
		            String inside = minNodeMap.get(key).get(4).toString();
		            int like = 0;
		            int star = 0;
		            if(minNodeMap.get(key).size()==6) {
		            	star = (int)Math.round(Double.parseDouble(minNodeMap.get(key).get(5).toString()));
		            }
		            if(minNodeMap.get(key).size()==7) {
		            	like = (int) minNodeMap.get(key).get(6);
		            }

		            
	            		double distance = minNodeDistance + Double.parseDouble(minNodeMap.get(key).get(0).toString());		//泥섏쓬 = 0 + 嫄곕━, 泥ル컮�대뒗 嫄곕━�꽭�똿      		//�씠�룞�븳 嫄곕━ + 異쒕컻吏��뿉�꽌 �떎�쓬 �끂�뱶源뚯� 嫄곕━

	            		distance = distance + 10;          			    	            		

	            			if(1130<=nextTime && nextTime<=1330 || 1730<=nextTime && nextTime<=1930) {
	            				if(contentTypeId.equals("39")) {					//諛� �떆媛꾩뿉 �쓬�떇�젏 肄붾뱶硫� �룊�젏�뿉 �뵲�씪 媛�以묒튂 李⑤벑 遺��뿬

	            					switch (scope){
	            					case 1: distance = distance - 1; break;
	            					case 2: distance = distance - 2; break;
	            					case 3: distance = distance - 3; break;
	            					case 4: distance = distance - 4; break;
	            					case 5: distance = distance - 5; break;
	            					default : distance = distance - 1; break;
					                }
			                	} else {
			                		distance = distance + 5000;						//�쓬�떇�젏�씠 �븘�땶 怨녹� 媛�以묒튂 �뜑�빐�꽌 紐산��룄濡�
			                	} 		                	
			                } else {
			                	if(contentTypeId.equals("39"))		            //諛� �떆媛꾩씠 �븘�땺 �븣 �쓬�떇�젏�뱾�뿉 ���빐�꽌 媛�以묒튂 遺��뿬
			                		distance = distance + 10000;
			                }		                				                				                

	            			if(!contentTypeId.equals("39")) {
		            			switch (star){
	        					case 1: distance = distance - 1; break;
	        					case 2: distance = distance - 2; break;
	        					case 3: distance = distance - 3; break;
	        					case 4: distance = distance - 4; break;
	        					case 5: distance = distance - 5; break;
	        					default : distance = distance - 1; break;
				                }
	            			}

	            			
/*	            			if(like <= 50) {
	            				distance = distance - 1;
	            			} else {
	            				distance = distance - 10;
	            			}*/
		                
		                if(distance < shortestPath.get(key)){						//key源뚯� 理쒖냼嫄곕━蹂대떎 distance媛� �쟻�쑝硫� 洹멸굅濡� 諛붽퓞		                	
		                	ArrayList<Object> nodeMap = new ArrayList<>();
		                	shortestPath.put(key, distance);						//minNode(異쒕컻) -> key(�룄李�) 嫄곕━ update		                    
		                	nodeMap.add(minNode);
		                	nodeMap.add(nextTime);
		                	nodeMap.add(contentTypeId);
		                	
		                    timeMap.put(key, nextTime);
		                    preNode.put(key, nodeMap);
		                }
	            	}            
	            }
	        	        
	        Result result = new Result();
	        result.shortestPath.putAll(shortestPath);
	        result.preNode.putAll(preNode);
	        return result;
	    }
	    

}


class getP{
	   public static int[][] W;
	   public static int[][] dp;
	   public static int N;
	   public static final int INF = 1000000000;
	   private static Deque<Integer> route = new ArrayDeque<>();
	   private static List<Integer> solution;
	   private static List<Integer> path;
	   static int re = INF;
	   

	   
	    public static int[][] getW(List<AddrVO> paramData){
	      double distanceMeter = 0;
	       int[][] W = null;
	      N = paramData.size();
	       W = new int[N + 1][N + 1];
	      dp = new int[N + 1][1 << N];
	      re = INF;
	      
	      if(route!=null) {
	      route.clear();
	      }

	      
	      for (int i = 1; i <= N; i++) {
	         Arrays.fill(dp[i], -1);
	      }
	        
	        for(int i = 0; i < N; i++) {
	            for(int j = 0; j < N; j++) {
	               if(i==j)continue;
	               
	               if(paramData.get(i).getContentTypeId().equals("39") && paramData.get(j).getContentTypeId().equals("39")) {
	                  distanceMeter = distance2(Double.parseDouble(paramData.get(i).getMapy()), Double.parseDouble(paramData.get(i).getMapx()), Double.parseDouble(paramData.get(j).getMapy()), Double.parseDouble(paramData.get(j).getMapx()), "meter");
	                  distanceMeter += 5000;
	               }else {
	               distanceMeter = distance2(Double.parseDouble(paramData.get(i).getMapy()), Double.parseDouble(paramData.get(i).getMapx()), Double.parseDouble(paramData.get(j).getMapy()), Double.parseDouble(paramData.get(j).getMapx()), "meter");   
	               }
	               W[i+1][j+1] = (int) Math.floor(distanceMeter);                       
	            }   
	         }
	        int[][] W2 = W;
	       return W2;
	    }   
	   
	   public static int getShortestPath(int current, int visited, int[][] W) {
	      

	      
	      if (visited == (1 << N) - 1) {   
	         route.push(1);
	         return W[current][1];
	      }

	      int ret = INF;
	      
	      for (int i = 1; i <= N; i++) {
	         int next = i;
	         
	         if ((visited & (1 << (next - 1))) != 0) { 
	            continue;
	         }
	         
	         if(W[current][next] == 0)
	            continue;
	         
	         route.push(i);

	         int temp = W[current][next] + getShortestPath(next, visited + (1 << (next - 1)), W);

	         if(route.size()==N) {
	            solution = new ArrayList<>(route);
	            route.pop();
	         }
	         if(route.size()==2) {
	            if(re > temp + W[i][1]) {
	               path = new ArrayList<>(solution);
	               System.out.println("path : " + path.toString());
	               re = temp;
	            }
	         }
	         route.pop();
	         ret = Math.min(ret, temp);   
	      }   
	      return dp[current][visited] = ret;
	   }
	   
	   
	   public static List<Integer> getPath() {
	      return path;
	   }
	   
	   private static double distance2(double lat1, double lon1, double lat2, double lon2, String unit) {

	      double theta = lon1 - lon2;
	      double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
	            + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

	      dist = Math.acos(dist);
	      dist = rad2deg(dist);
	      dist = dist * 60 * 1.1515;

	      if (unit == "kilometer") {
	         dist = dist * 1.609344;
	      } else if (unit == "meter") {
	         dist = dist * 1609.344;
	      }
	      
	      return dist;
	   }
	   
	   // This function converts decimal degrees to radians
	   private static double deg2rad(double deg) {
	      return (deg * Math.PI / 180.0);
	   }

	   // This function converts radians to decimal degrees
	   private static double rad2deg(double rad) {
	      return (rad * 180 / Math.PI);
	   }

	   
	}
