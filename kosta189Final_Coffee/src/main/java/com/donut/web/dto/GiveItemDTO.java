package com.donut.web.dto;

public class GiveItemDTO
{
	private int giveItemNo;
	private int giveNo;
	private String giveItemName;
	private int giveItemPrice;
	private int giveItemAmount;

	public GiveItemDTO() {}

	public GiveItemDTO(int giveItemNo, int giveNo, String giveItemName, int giveItemPrice, int giveItemAmount)
	{
		super();
		this.giveItemNo = giveItemNo;
		this.giveNo = giveNo;
		this.giveItemName = giveItemName;
		this.giveItemPrice = giveItemPrice;
		this.giveItemAmount = giveItemAmount;
	}

	public int getGiveItemNo()
	{
		return giveItemNo;
	}

	public void setGiveItemNo(int giveItemNo)
	{
		this.giveItemNo = giveItemNo;
	}

	public int getGiveNo()
	{
		return giveNo;
	}

	public void setGiveNo(int giveNo)
	{
		this.giveNo = giveNo;
	}

	public String getGiveItemName()
	{
		return giveItemName;
	}

	public void setGiveItemName(String giveItemName)
	{
		this.giveItemName = giveItemName;
	}

	public int getGiveItemPrice()
	{
		return giveItemPrice;
	}

	public void setGiveItemPrice(int giveItemPrice)
	{
		this.giveItemPrice = giveItemPrice;
	}

	public int getGiveItemAmount()
	{
		return giveItemAmount;
	}

	public void setGiveItemAmount(int giveItemAmount)
	{
		this.giveItemAmount = giveItemAmount;
	}

	/*@Override
	public String toString()
	{
		return "GiveItemDTO [giveItemNo=" + giveItemNo + ", giveNo=" + giveNo + ", giveItemName=" + giveItemName
				+ ", giveItemPrice=" + giveItemPrice + ", giveItemAmount=" + giveItemAmount + "]";
	}*/

	@Override
	public String toString()
	{
		return "{\"giveItemNo\":" + giveItemNo + ", \"giveNo\":" + giveNo + ", \"giveItemName\":\"" + giveItemName
				+ "\", \"giveItemPrice\":" + giveItemPrice + ", \"giveItemAmount\":" + giveItemAmount + "}";
	}

	
}
