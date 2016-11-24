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
    
}
