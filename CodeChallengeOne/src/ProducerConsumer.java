import java.util.LinkedList;

public class ProducerConsumer {
	public static class TheProducerAndConsumer{
		LinkedList<Integer> linkedList = new LinkedList<Integer>();
		int listSize = 2;
		int value = 0;
		
		public void produce() {
			while(true) {
				//linkedList.add(value++);
				if(linkedList.size()==2) {
					try {
						wait();
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else {
					linkedList.add(value++);
					System.out.println(value);
				}
				//break;
			}
		}
		public void consume() {
			int someValue = 0;
			while(true) {
				someValue = linkedList.removeFirst();
				if(linkedList.size()==0) {
					try {
						wait();
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else {
					someValue = linkedList.removeFirst();
					System.out.println(someValue);
				}
			}
				//break;
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Producer p = new Producer();
		//Consumer c = new Consumer();
		//TheProducerAndConsumer tpac = new TheProducerAndConsumer();

		
		//LinkedList<Integer> linkedList = new LinkedList<Integer>();
		

	}

}
