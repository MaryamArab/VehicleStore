<?php
namespace Application\Service;

use Application\Model\Vehicle;


class VehicleManager {
    /**
     * Entity manager.
     * @var Doctrine\ORM\EntityManager;
     */
    private $entityManager;
    
    function getEntityManager()
    {
        return $this->entityManager;
    }

        
    /**
     * Constructor.
     */
    public function __construct($entityManager)
    {
        $this->entityManager = $entityManager;
    }
    public function searchVehicle($vehicleType, $minbudget, $maxbudget, $keywords)
    {
        $vehicles = $this->getEntityManager()
                ->getRepository(Vehicle::class)
                ->findVehicleByCriteria($vehicleType,$minbudget,$maxbudget, $keywords);
        return $vehicles;
        
    }
     public function addReviewsToVehicle($vehicle, $data) 
    {
        // Create new Comment entity.
       /* $comment = new Comment();
        $comment->setPost($post);
        $comment->setAuthor($data['author']);
        $comment->setContent($data['comment']);        
        $currentDate = date('Y-m-d H:i:s');
        $comment->setDateCreated($currentDate);
        // Add the entity to entity manager.
        $this->entityManager->persist($comment);
        // Apply changes.
        $this->entityManager->flush();*/
    }
}
