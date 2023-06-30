package Refrigerator2;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class Main {
public static void main(String[] args) throws IOException {
		
		ShohinManager manager = new ShohinManager();
		
		/*manager.addShohin(new Shohin("microKORG XL", "KORG", 49000, 28));
		manager.addShohin(new Shohin("Nord Electro 4", "Clavia DMI AB", 234800, 8));
		manager.addShohin(new Shohin("TENORI-ON TNR-W", "YAMAHA", 120000, 8));
		manager.addShohin(new Shohin("MOTIF XF8", "YAMAHA", 279000, 12));
		manager.addShohin(new Shohin("EWI4000s", "AKAI", 82999, 22));
		
		manager.display(ShohinManager.DisplayType.MIN_PRICE);
		manager.display(ShohinManager.DisplayType.MIN_NUM_STOCK);*/
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		String line = "";
		for(int i=0; i<5; i++) {
			System.out.print("商品名を入力してください。>");
			line = reader.readLine();
			Shohin shohin = new Shohin();
			shohin.setName(line);
			
			System.out.print("メーカー名を入力してください。>");
			line = reader.readLine();
			shohin.setManufacturer(line);
			
			System.out.print("価格を入力してください。>");
			line = reader.readLine();
			shohin.setPrice(getAvailable(line));;
			
			System.out.print("在庫数を入力してください。>");
			line = reader.readLine();
			shohin.setNumStock(getAvailable(line));
			
			manager.addShohin(shohin);
		}
		
		System.out.print("最小価格の商品データを表示するには0,在庫数が0のデータを表示するには1を入力してください。>");
		line = reader.readLine();
		int selection = getAvailable(line);
		if(selection == 0) {
			manager.display(ShohinManager.DisplayType.MIN_PRICE);
		} else if(selection == 1) {
			manager.display(ShohinManager.DisplayType.MIN_NUM_STOCK);
		} else {
			System.err.println("0か1を入力してください。");
			System.exit(0);
		}
		
		reader.close();
	}
	
	private static int getAvailable(String line) {
		int i = 0;
		try {
			Integer.parseInt(line);
		} catch(NumberFormatException e) {
			System.err.println("パースできません。");
			System.exit(1);
		}
		i = Integer.parseInt(line);
		if(i < 0) {
			System.err.println("正の整数で入力してください。");
			System.exit(1);
		}
		return i;
	}

}
