package com.bxj.exception;

public class CustomException extends RuntimeException {

    /**
     * Comment for <code>serialVersionUID</code>
     */

    private static final long serialVersionUID = -9213061167470150235L;

    private String resultCode;
    private String errorCode;
    private String errorDesc;

    /**
     * 
     * @param resultCode
     */
    public CustomException(String resultCode) {
        super();
        this.resultCode = resultCode;
    }

    /**
     * @param resultCode
     * @param e
     */
    public CustomException(String resultCode, Exception e) {
        super(resultCode, e);
        this.resultCode = resultCode;

    }

    /**
     * 
     * @param resultCode
     */
    public CustomException(String resultCode, String errorDesc) {
        this(resultCode);
        this.errorDesc = errorDesc;
    }

    /**
     * 
     * @param resultCode
     */
    public CustomException(String resultCode, String errorCode, String errorDesc) {
        this(resultCode);
        this.errorCode = errorCode;
        this.errorDesc = errorDesc;
    }

    /**
     * 
     * @param resultCode
     */
    public CustomException(String resultCode, String errorDesc, Exception e) {
        this(resultCode, e);
        this.errorDesc = errorDesc;
    }

    public String getResultCode() {
        return resultCode;
    }

    public void setResultCode(String resultCode) {
        this.resultCode = resultCode;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public String getErrorDesc() {
        return errorDesc;
    }

    public void setErrorDesc(String errorDesc) {
        this.errorDesc = errorDesc;
    }
}
