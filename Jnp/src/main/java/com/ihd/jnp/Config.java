package com.ihd.jnp;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class Config {
	
	/**
	 * 모든 속성값을 저장한다..
	 */
	protected Properties props = null;

	public Config() {
		// do nothing;
	}
	
	public Config(String fileName) throws IOException {
		File file = new File(fileName);
		// 파일이 없다면 새로 만든다.
		if (!file.exists())
			file.createNewFile();
		load(file);
	}

	public Config(File file) throws IOException {
		load(file);
	}

	private void load(File file) throws IOException {
		try {
			// 프로퍼티 파일 인 스트림
			FileInputStream fis = new FileInputStream(file);
			// 프로퍼티 파일을 메모리에 올린다.(파일을 읽어 온다.)
			props = new Properties();
			props.load(new BufferedInputStream(fis));
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		}
	}

	public Properties getProps() {
		return props;
	}

	public void setProps(Properties props) {
		this.props = props;
	}

	/**
	 * 모든 속성 이름을 구한다.
	 */
	public Properties getProperties() {
		return props;
	}

	/**
	 * String 타입 속성값을 읽어온다.
	 */
	public String getString(String key) {
		String value = null;
		value = props.getProperty(key);

		if (value == null) throw new IllegalArgumentException("Illegal String key : " + key);

		return value;
	}

	/**
	 * String 타입 속성값을 읽어온다.
	 */
	public String getString(String key, String defaultValue) {
		String value = null;

		if (!props.contains(key)) return defaultValue;

		value = props.getProperty(key);

		if (value == null) throw new IllegalArgumentException("Illegal String key : " + key);

		return value;
	}

	/**
	 * int 타입 속성값을 읽어온다.
	 */
	public int getInt(String key) {
		int value = 0;
		try {
			value = Integer.parseInt(props.getProperty(key));
		} catch (Exception ex) {
			throw new IllegalArgumentException("Illegal int key : " + key);
		}
		return value;
	}

	/**
	 * int 타입 속성값을 읽어온다.
	 */
	public int getInt(String key, int defaultValue) {
		int value = 0;

		if (!props.contains(key)) return defaultValue;

		try {
			value = Integer.parseInt(props.getProperty(key));
		} catch (Exception ex) {
			throw new IllegalArgumentException("Illegal int key : " + key);
		}
		return value;
	}

	/**
	 * double 타입 속성값을 읽어온다.
	 */
	public double getDouble(String key) {
		double value = 0.0;
		try {
			value = Double.valueOf(props.getProperty(key)).doubleValue();
		} catch (Exception ex) {
			throw new IllegalArgumentException("Illegal double key : " + key);
		}
		return value;
	}

	/**
	 * double 타입 속성값을 읽어온다.
	 */
	public double getDouble(String key, double defaultValue) {
		double value = 0.0;

		if (!props.contains(key)) return defaultValue;

		try {
			value = Double.valueOf(props.getProperty(key)).doubleValue();
		} catch (Exception ex) {
			throw new IllegalArgumentException("Illegal double key : " + key);
		}
		return value;
	}

	/**
	 * boolean 타입 속성값을 읽어온다.
	 */
	public boolean getBoolean(String key) {
		boolean value = false;
		try {
			value = Boolean.valueOf(props.getProperty(key)).booleanValue();
		} catch (Exception ex) {
			throw new IllegalArgumentException("Illegal boolean key : " + key);
		}
		return value;
	}

	/**
	 * boolean 타입 속성값을 읽어온다.
	 */
	public boolean getBoolean(String key, boolean defaultValue) {
		boolean value = false;

		if (!props.contains(key)) return defaultValue;

		try {
			value = Boolean.valueOf(props.getProperty(key)).booleanValue();
		} catch (Exception ex) {
			throw new IllegalArgumentException("Illegal boolean key : " + key);
		}
		return value;
	}
}
