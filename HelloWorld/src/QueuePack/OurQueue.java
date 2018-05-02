//David
//Tads
package QueuePack;

public class OurQueue {
	
	Object[] queue;
	//Object[] queue = new Object[100];
	
	public OurQueue() {
		super();
		queue = new Object[100];
	}
	
	public void addToQueue(Object o) throws IllegalArgumentException {
		if(o == null)
				throw new IllegalArgumentException(); 
		
		
		for(int i = 0; i < queue.length; i++) {
			if(queue[i] == null) {
				queue[i] = o;
				return;
			}
			
		}

		//return true;
	}
	public Object examineQueue(OurQueue q) {
		return q.queue[0];
	}
	
	public Object removeQueue(OurQueue q) {
		Object buffer = q.queue[0];
		for(int i = 0; i < q.queue.length-1; i++) {
			if(q.queue[i] == null) {
				break;
			}
			q.queue[i] = q.queue[i+1];   
		}
		return buffer;
	}
	public int getCount(OurQueue q) {
		for(int i = 0; i < q.queue.length-1; i++) {
			if(q.queue[i] == null) {
				return i;
			}
		}
	return 0;
	}

}

