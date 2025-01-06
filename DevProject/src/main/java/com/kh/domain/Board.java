package com.kh.domain;


import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@Data
public class Board {
	private int boardNo;
	@NonNull
	private String tilte;
	@NonNull
	private String content;
	@NonNull
	private Date regDate;
}
