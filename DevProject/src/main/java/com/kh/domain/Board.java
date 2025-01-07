package com.kh.domain;


import java.util.Date;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Builder
public class Board {
	private int boardNo;
	private String tilte;
	private String content;
	private String writer;
	private Date regDate;
	
}
