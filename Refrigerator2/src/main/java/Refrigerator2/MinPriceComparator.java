package Refrigerator2;
import java.util.Comparator;

public class MinPriceComparator  implements Comparator<Shohin> {
	@Override
	public int compare(Shohin o1, Shohin o2) {
		return o1.getPrice() - o2.getPrice();
	}
}
