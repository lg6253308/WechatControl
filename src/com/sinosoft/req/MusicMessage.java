package com.sinosoft.req;

/**
 * 音乐消息
 * 
 * @author ligang
 * @date 2013-11-19
 */
public class MusicMessage extends BaseMessage {
	// 音乐
	private Music Music;

	public Music getMusic() {
		return Music;
	}

	public void setMusic(Music music) {
		Music = music;
	}
}