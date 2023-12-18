package by.bsuir.barilko.entity.orders;

/**
 * The OrderStatus enum represents the possible status values for an order.
 */
public enum OrderStatus {
    /**
     * The order has been sent.
     */
    SENT,

    /**
     * The order has been canceled.
     */
    CANCELED,

    /**
     * The order has been rejected.
     */
    REJECTED,

    /**
     * The order has been approved.
     */
    APPROVED
}