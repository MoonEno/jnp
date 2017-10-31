package com.ihd.jnp.common.util;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExceptionUtil {

	public static StackTraceElement[] getCurrentStackTrace() {
		StackTraceElement[] ste = new Exception().getStackTrace();
		if (ste.length > 1) {
			StackTraceElement[] result = new StackTraceElement[ste.length - 1];
			System.arraycopy(ste, 1, result, 0, ste.length - 1);
			return result;
		} else {
			return ste;
		}
	}

	// ---------------------------------------------------------------- exception stack trace

	/**
	 * Returns stack trace filtered by class names.
	 */
	public static StackTraceElement[] getStackTrace(Throwable t, String[] allow, String[] deny) {
		StackTraceElement[] st = t.getStackTrace();
		ArrayList<StackTraceElement> result = new ArrayList<StackTraceElement>(st.length);

		elementLoop:
		for (StackTraceElement element : st) {
			String className = element.getClassName();
			if (allow != null) {
				boolean validElemenet = false;
				for (String filter : allow) {
					if (className.indexOf(filter) != -1) {
						validElemenet = true;
						break;
					}
				}
				if (validElemenet == false) {
					continue;
				}
			}
			if (deny != null) {
				for (String filter : deny) {
					if (className.indexOf(filter) != -1) {
						continue elementLoop;
					}
				}
			}
			result.add(element);
		}
		st = new StackTraceElement[result.size()];
		return result.toArray(st);
	}

	/**
	 * Returns stack trace chain filtered by class names.
	 */
	public static StackTraceElement[][] getStackTraceChain(Throwable t, String[] allow, String[] deny) {
		ArrayList<StackTraceElement[]> result = new ArrayList<StackTraceElement[]>();
		while (t != null) {
			StackTraceElement[] stack = getStackTrace(t, allow, deny);
			result.add(stack);
			t = t.getCause();
		}
		StackTraceElement[][] allStacks = new StackTraceElement[result.size()][];
		for (int i = 0;i < allStacks.length;i++) {
			allStacks[i] = result.get(i);
		}
		return allStacks;
	}

	/**
	 * Returns exception chain starting from top up to root cause.
	 */
	public static Throwable[] getExceptionChain(Throwable throwable) {
		ArrayList<Throwable> list = new ArrayList<Throwable>();
		list.add(throwable);
		while ((throwable = throwable.getCause()) != null) {
			list.add(throwable);
		}
		Throwable[] result = new Throwable[list.size()];
		return list.toArray(result);
	}

	// ---------------------------------------------------------------- exception to string

	/**
	 * Prints stack trace into a String.
	 */
	public static String exceptionToString(Throwable t) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw, true);
		t.printStackTrace(pw);
		pw.flush();
		sw.flush();
		return sw.toString();
	}

	/*
	public static void main(String[] args) {
		System.out.println(ExceptionUtil.exceptionChainToString(new Exception("오류")));
	}
	*/
	/**
	 * Prints full exception stack trace, from top to root cause, into a String.
	 */
	public static String exceptionChainToString(Throwable e) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw, true);
		int idx = 0;
		while (e != null) {
			//Exception Message 가 오류메시지가 너무 많아 5개까지만 제한
			if(idx > 5) break;
			
			e.printStackTrace(pw);
			e = e.getCause();
			idx++;
		}
		pw.flush();
		sw.flush();
		
		String errorMsg = sw.toString();
		/*
		//Exception Message 가 여러줄로 출력되서 한줄로 변경 
		if(errorMsg != null) {
			errorMsg = errorMsg.replaceAll("\r\n", " > ");
			errorMsg = errorMsg.replaceAll("\t", " ");
		}
		*/
		return errorMsg;
	}

	// ---------------------------------------------------------------- root cause

	/**
	 * Introspects the <code>Throwable</code> to obtain the root cause.
	 * <p>
	 * This method walks through the exception chain to the last element, "root" of the tree, and returns that
	 * exception. If no root cause found returns provided throwable.
	 */
	public static Throwable getRootCause(Throwable throwable) {
		Throwable cause = throwable.getCause();
		if (cause == null) { return throwable; }
		throwable = cause;
		while ((throwable = throwable.getCause()) != null) {
			cause = throwable;
		}
		return cause;
	}

	/**
	 * Finds throwing cause in exception stack. Returns throwable object if cause class is matched.
	 * Otherwise, returns <code>null</code>.
	 */
	@SuppressWarnings({ "unchecked" })
	public static <T extends Throwable>T findCause(Throwable throwable, Class<T> cause) {
		while (throwable != null) {
			if (throwable.getClass().equals(cause)) { return (T) throwable; }
			throwable = throwable.getCause();
		}
		return null;
	}

	// ---------------------------------------------------------------- sql

	/**
	 * 여러개의 SQLException 을 하나로 합친다.
	 * Rolls up SQL exceptions by taking each proceeding exception
	 * and making it a child of the previous using the <code>setNextException</code> method of SQLException.
	 */
	public static SQLException rollupSqlExceptions(List<SQLException> exceptions) {
		SQLException parent = null;
		for (SQLException exception : exceptions) {
			if (parent != null) {
				exception.setNextException(parent);
			}
			parent = exception;
		}
		return parent;
	}

	// ---------------------------------------------------------------- misc

	/**
	 * Throws target of <code>InvocationTargetException</code> if it is exception.
	 */
	public static void throwTargetException(InvocationTargetException itex) throws Exception {
		throw exctractTargetException(itex);
	}

	public static Exception exctractTargetException(InvocationTargetException itex) {
		Throwable target = itex.getTargetException();
		return target instanceof Exception ? (Exception) target : itex;
	}

	/**
	 * Throws checked exceptions in un-checked manner.
	 * Uses deprecated method.
	 * 
	 * @see #throwException(Throwable)
	 */
	@SuppressWarnings({ "deprecation" })
	public static void throwExceptionAlt(Throwable throwable) {
		if (throwable instanceof RuntimeException) { throw (RuntimeException) throwable; }
		Thread.currentThread().stop(throwable);
	}

	/**
	 * Throws checked exceptions in un-checked manner.
	 * 
	 * @see #throwException(Throwable)
	 */
	public static void throwException(Throwable throwable) {
		if (throwable instanceof RuntimeException) { throw (RuntimeException) throwable; }
		// can't handle these types
		if ((throwable instanceof IllegalAccessException) || (throwable instanceof InstantiationException)) { throw new IllegalArgumentException(
		        throwable); }

		try {
			synchronized (ThrowableThrower.class) {
				ThrowableThrower.throwable = throwable;
				ThrowableThrower.class.newInstance();
			}
		} catch (InstantiationException iex) {
			throw new RuntimeException(iex);
		} catch (IllegalAccessException iex) {
			throw new RuntimeException(iex);
		} finally {
			ThrowableThrower.throwable = null;
		}
	}

	private static class ThrowableThrower {
		private static Throwable throwable;

		@SuppressWarnings("unused")
		ThrowableThrower() throws Throwable{
			throw throwable;
		}
	}
}
