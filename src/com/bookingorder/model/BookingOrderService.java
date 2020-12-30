package com.bookingorder.model;

import java.sql.Date;
import java.util.List;

public class BookingOrderService {
	private BookingOrderDAO_interface dao;
	
	public BookingOrderService() {
		dao = new BookingOrderDAO();
	}
	
	public BookingOrderVO addBkOd(String mb_id, Date dateIn, Date dateOut, Integer total_price) {
		BookingOrderVO bkodvo = new BookingOrderVO();
		bkodvo.setMb_id(mb_id);
		bkodvo.setDateIn(dateIn);
		bkodvo.setDateOut(dateOut);
		bkodvo.setTotal_price(total_price);
		bkodvo = dao.insert(bkodvo);
		return bkodvo;
	}
	
	public void updateDateInOut(String bk_no, Date dateIn, Date dateOut) {
		BookingOrderVO bkodvo = new BookingOrderVO();
		bkodvo.setBk_no(bk_no);
		bkodvo.setDateIn(dateIn);
		bkodvo.setDateOut(dateOut);
		dao.update(bkodvo);
	}
	
	public void checkIn(String bk_no) {
		dao.updateCheckIn(bk_no);
	}
	
	public void checkOut(String bk_no) {
		dao.updateCheckOut(bk_no);
	}
	
	public void bkOdPaid(String bk_no) {
		dao.updateOrderPaid(bk_no);
	}
	
	public List<BookingOrderVO> getAllBooking(){
		return dao.getAll();
	}
	
	public List<BookingOrderVO> getAllByBkStatus(String bk_status){
		return dao.getAllByBkStatus(bk_status);
	}
	
	public List<BookingOrderVO> getAllByDateIn(Date dateIn){
		return dao.getAllByDateIn(dateIn);
	}
	
	public BookingOrderVO getOneByBkNo(String bk_no) {
		return dao.getOneByBkNo(bk_no);
	}
	
	public BookingOrderVO getOneByMbId(String mb_id) {
		return dao.getOneByMbId(mb_id);
	}
}
