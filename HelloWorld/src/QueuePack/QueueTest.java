//David
//Tad
package QueuePack;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.BlockJUnit4ClassRunner;

//import src.EvaluationService;

import org.junit.*;

@RunWith (value = BlockJUnit4ClassRunner.class)

public class QueueTest {
	private static final OurQueue evaluationService = new OurQueue();
	public ExpectedException expectedException = ExpectedException.none();

	private Object o1 = null;
	private Object o2 = new Object();
	private Object o3 = new Object();
	private Object o4 = new Object();
	
	@Test (expected = IllegalArgumentException.class)
	public void notNull() {
		

		expectedException.expect(IllegalArgumentException.class);
		evaluationService.addToQueue(o1);
		
	}
	@Test
	public void examineQueueTest() {
		OurQueue q = new OurQueue();
		q.addToQueue(o2);
		evaluationService.examineQueue(q);
		assertEquals(o2, o2);
	}
	@Test
	public void removeQueueTest() {
		OurQueue q = new OurQueue();
		//OurQueue q2 = new OurQueue();
		q.addToQueue(o3);
		q.addToQueue(o4);
		
		evaluationService.removeQueue(q);
		//assertEquals(r, r);
	}
	@Test
	public void getCount() {
	OurQueue q = new OurQueue();
		q.addToQueue(o2);
		q.addToQueue(o3);
		q.addToQueue(o4);
		
		System.out.println(q.queue[0]);
		System.out.println(q.queue[1]);
		System.out.println(q.queue[2]);
		//evaluationService.getCount(q);
		assertEquals(3,evaluationService.getCount(q));
	}
	
}
