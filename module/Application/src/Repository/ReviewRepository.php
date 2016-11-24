<?php

namespace Application\Repository;

use Doctrine\ORM\EntityRepository;
use Application\Model\Review;

class ReviewRepository extends EntityRepository {

    public function findAllReviewsByVehicle($vehicle) {
        $qb = $this->getEntityManager()->createQueryBuilder();
        $reviews = $qb->select('r')->from('\Application\Model\Review', 'r')
                ->where($qb->expr()->eq('r.vehicle', '?1'))
                ->setParameters(array(
                    1 => $vehicle))->getQuery()
                ->getResult();
        return $reviews;
    }

    

}
