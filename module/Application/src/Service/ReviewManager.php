<?php

namespace Application\Service;

use Application\Model\Review;

class ReviewManager {

    /**
     * Entity manager.
     * @var Doctrine\ORM\EntityManager;
     */
    private $entityManager;

    function __construct($entityManager) {
        $this->entityManager = $entityManager;
    }

    public function getReviewsByVehicle($vehicle) {
        $reviews = $this->getEntityManager()
                ->getRepository(Review::class)
                ->findAllReviewsByVehicle($vehicle);
        return $reviews;
    }

    public function addReview($vehicle,$reviewTitle,$reviewText) {
        // Create new Review entity.
        $review = new Review();
        $user = $this->getEntityManager()->find('\Application\Model\User', 1);
        $review->setUser($user); 
        $review->setTitle($reviewTitle);
        $review->setBody($reviewText);
        $review->setVehicle($vehicle);
        
        // Add the entity to entity manager.
        $this->entityManager->persist($review);

       
        // Apply changes to database.
        $this->entityManager->flush();
    }

    function getEntityManager() {
        return $this->entityManager;
    }

}
