package Refrigerator2;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ShohinManager {
	private List<Shohin> shohinList = new ArrayList<>();
	public enum DisplayType { MIN_PRICE, MIN_NUM_STOCK,	}
	private MinPriceComparator minPriceComparator = new MinPriceComparator();
	private MinNumStockComparator minNumStrockComparator = new MinNumStockComparator();
	
	public void addShohin(Shohin shohin) {
		shohinList.add(shohin);
	}

	public void display(DisplayType type) {
		int min = 0;
		if(type == DisplayType.MIN_PRICE) {
			Collections.sort(shohinList, minPriceComparator);
			min = shohinList.get(0).getPrice();
			for(int i=0; i<shohinList.size(); i++) {
				if(min == shohinList.get(i).getPrice()) displayShohin("", i);
				else break;
			}
		} else if(type == DisplayType.MIN_NUM_STOCK) {
			Collections.sort(shohinList, minNumStrockComparator);
			min = shohinList.get(0).getNumStock();
			for(int i=0; i<shohinList.size(); i++) {
				if(shohinList.get(i).getNumStock()==0) displayShohin("", i);
				else break;
			}
		}
	}

	private void displayShohin(String title, int i) {
		if(i == 0) System.out.println("[" +title + "]");
		System.out.println("" + shohinList.get(i).getName());
		System.out.println("" + shohinList.get(i).getManufacturer());
		System.out.println("" + shohinList.get(i).getPrice());
		System.out.println("" + shohinList.get(i).getNumStock());
	}
}
