package com.ihd.jnp.common.exception;

public class SystemException extends Exception {

	private static final long serialVersionUID = 7194327497976996682L;


	private String code;

	private String message;

	public SystemException(){}

	
	public SystemException(final String code){
		this.code = code;
	}

	/**
	 * SystemException
	 * 
	 * @param code 에러코드
	 * @param message 에러메시지 
	 */
	public SystemException(final String code, final String message){
		super(message);
		this.message = message;
		this.code = code;
	}
	public SystemException(Throwable t, final String code, final String message){
		super(message, t);
		this.message = message;
		this.code = code;
	}

	/**
	 * SystemException
	 * 
	 * @param code 에러코드
	 * @param message 에러메시지
	 * @param cause
	 */
	public SystemException(final String code, final String message, final Throwable cause){
		super(message, cause);
		this.message = message;
		this.code = code;
	}
	
	/**
     * @param message the message to set
     */
    public void setMessage(String message) {
    	this.message = message;
    }

	@Override
	public String toString() {
		return "SystemException[Code=" + code + ", Message=" + getMessage() + "]";
	}

}