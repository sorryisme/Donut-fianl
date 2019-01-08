package com.donut.web.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProjectDTO {
	private int projectNo;
	private String id;
	private String projectSubject;
	private String category1;
	private String category2;
	private String category3;
	private String story;
	private String projectImg;
	private String projectEnd;
	private String projectRegdate;
	private int moneyOrItem;
	private int totalMoney;
	private int goal;
	private int percent;
	private int givePerson;
	private List<ItemDTO> item;
	private List<RewardDTO> reward;
	private ReviewDTO review;
	private List<CheerDTO> cheer;
	private List<QnADTO> qna;
	private MultipartFile file;

	public ProjectDTO() {}

	public ProjectDTO(int projectNo, String id, String projectSubject, String category1, String category2,
			String category3, String story, String projectImg, String projectEnd, String projectRegdate,
			int moneyOrItem, int totalMoney, int goal, int percent, int givePerson, List<ItemDTO> item,
			List<RewardDTO> reward, ReviewDTO review, List<CheerDTO> cheer, List<QnADTO> qna, MultipartFile file) {
		this.projectNo = projectNo;
		this.id = id;
		this.projectSubject = projectSubject;
		this.category1 = category1;
		this.category2 = category2;
		this.category3 = category3;
		this.story = story;
		this.projectImg = projectImg;
		this.projectEnd = projectEnd;
		this.projectRegdate = projectRegdate;
		this.moneyOrItem = moneyOrItem;
		this.totalMoney = totalMoney;
		this.goal = goal;
		this.percent = percent;
		this.givePerson = givePerson;
		this.item = item;
		this.reward = reward;
		this.review = review;
		this.cheer = cheer;
		this.qna = qna;
		this.file = file;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProjectSubject() {
		return projectSubject;
	}

	public void setProjectSubject(String projectSubject) {
		this.projectSubject = projectSubject;
	}

	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	public String getCategory3() {
		return category3;
	}

	public void setCategory3(String category3) {
		this.category3 = category3;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public String getProjectImg() {
		return projectImg;
	}

	public void setProjectImg(String projectImg) {
		this.projectImg = projectImg;
	}

	public String getProjectEnd() {
		return projectEnd;
	}

	public void setProjectEnd(String projectEnd) {
		this.projectEnd = projectEnd;
	}

	public String getProjectRegdate() {
		return projectRegdate;
	}

	public void setProjectRegdate(String projectRegdate) {
		this.projectRegdate = projectRegdate;
	}

	public int getMoneyOrItem() {
		return moneyOrItem;
	}

	public void setMoneyOrItem(int moneyOrItem) {
		this.moneyOrItem = moneyOrItem;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public int getPercent() {
		return percent;
	}

	public void setPercent(int percent) {
		this.percent = percent;
	}

	public int getGivePerson() {
		return givePerson;
	}

	public void setGivePerson(int givePerson) {
		this.givePerson = givePerson;
	}

	public List<ItemDTO> getItem() {
		return item;
	}

	public void setItem(List<ItemDTO> item) {
		this.item = item;
	}

	public List<RewardDTO> getReward() {
		return reward;
	}

	public void setReward(List<RewardDTO> reward) {
		this.reward = reward;
	}

	public ReviewDTO getReview() {
		return review;
	}

	public void setReview(ReviewDTO review) {
		this.review = review;
	}

	public List<CheerDTO> getCheer() {
		return cheer;
	}

	public void setCheer(List<CheerDTO> cheer) {
		this.cheer = cheer;
	}

	public List<QnADTO> getQna() {
		return qna;
	}

	public void setQna(List<QnADTO> qna) {
		this.qna = qna;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "ProjectDTO [projectNo=" + projectNo + ", id=" + id + ", projectSubject=" + projectSubject
				+ ", category1=" + category1 + ", category2=" + category2 + ", category3=" + category3 + ", story="
				+ story + ", projectImg=" + projectImg + ", projectEnd=" + projectEnd + ", projectRegdate="
				+ projectRegdate + ", moneyOrItem=" + moneyOrItem + ", totalMoney=" + totalMoney + ", goal=" + goal
				+ ", percent=" + percent + ", givePerson=" + givePerson + ", item=" + item + ", reward=" + reward
				+ ", review=" + review + ", cheer=" + cheer + ", qna=" + qna + ", file=" + file + "]";
	}
	
}
