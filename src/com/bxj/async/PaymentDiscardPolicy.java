package com.bxj.async;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * A handler for rejected tasks that silently discards the
 * rejected task.
 */
public class PaymentDiscardPolicy implements RejectedExecutionHandler {

    private Logger logger = LoggerFactory.getLogger(PaymentDiscardPolicy.class);

    /**
     * Creates a {@code DiscardPolicy}.
     */
    public PaymentDiscardPolicy() {
    }

    /**
     * Does nothing, which has the effect of discarding task r.
     *
     * @param r the runnable task requested to be executed
     * @param e the executor attempting to execute this task
     */
    @Override
    public void rejectedExecution(Runnable r, ThreadPoolExecutor e) {
        logger.error("This Thread discarded...");
    }
}
