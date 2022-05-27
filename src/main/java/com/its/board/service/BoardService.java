package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.PageDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;
    public boolean save(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile = boardDTO.getBoardFile();
        String boardFileName = boardFile.getOriginalFilename();
        boardFileName = System.currentTimeMillis() + "-" + boardFileName;
        boardDTO.setBoardFileName(boardFileName);
        String savePath = "C:\\spring_img\\" + boardFileName;
        if(!boardFile.isEmpty()){
            boardFile.transferTo(new File(savePath));
        }
        int saveResult = boardRepository.save(boardDTO);
        if(saveResult > 0){
            return true;
        }
        else {
            return false;
        }
    }
    private static final int PAGE_LIMIT = 5;
    private static final int BLOCK_LIMIT = 3;
    public List<BoardDTO> boardList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> boardList = boardRepository.boardList(pagingParam);
        return boardList;
    }

    public PageDTO paging(int page) {
        int boardCount = boardRepository.boardCount(); // 글 갯수 조회
        // 필요한 전체 페이지 갯수
        // Math.ceil method -> 올림 처리.
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
        // 시작페이지 1 4 7 10
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        //끝페이지 3, 6, 9, 12
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public BoardDTO findById(Long id) {
        boardRepository.updateHits(id);
        BoardDTO boardDTO = boardRepository.findById(id);
        return boardDTO;
    }
}
