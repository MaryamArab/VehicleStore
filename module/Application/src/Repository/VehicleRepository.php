<?php
namespace Application\Repository;
use Doctrine\ORM\EntityRepository;

class VehicleRepository extends EntityRepository {
    
    public function findVehicleByCriteria($vehicleType, $minPrice, $maxPrice, $keyword) {
        $qb = $this->getEntityManager()->createQueryBuilder();
        $myVehicles = $qb->select('v')->from('\Application\Model\Vehicle', 'v')
                ->leftJoin('v.vehicleType', 't')
                ->where($qb->expr()->eq('t.title', '?1'))
                ->andWhere($qb->expr()->between('v.price', '?2', '?3'))
                ->andWhere($qb->expr()->orX(
                        $qb->expr()->like('lower(v.make)', '?4'),
                        $qb->expr()->like('lower(v.model)', '?4'),
                        $qb->expr()->like('lower(v.year)', '?4')
                ))->setParameters(array(
                    1 => $vehicleType,
                    2 => $minPrice,
                    3 => $maxPrice,
                    4 => $keyword . '%'
                ))->getQuery()
                ->getResult();
        return $myVehicles;
    }
    
}
