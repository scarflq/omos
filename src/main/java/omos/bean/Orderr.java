package omos.bean;

public class Orderr {
    public Orderr() {
		super();
	}

	public Orderr(Integer oId, Integer uId, Integer status, String orderTime, String getTime, Integer total) {
		super();
		this.oId = oId;
		this.uId = uId;
		this.status = status;
		this.orderTime = orderTime;
		this.getTime = getTime;
		this.total = total;
	}

	private Integer oId;

    private Integer uId;

    private Integer status;

    private String orderTime;

    private String getTime;

    private Integer total;

    public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime == null ? null : orderTime.trim();
    }

    public String getGetTime() {
        return getTime;
    }

    public void setGetTime(String getTime) {
        this.getTime = getTime == null ? null : getTime.trim();
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }
}