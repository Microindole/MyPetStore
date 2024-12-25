package csu.web.mypetstore.persistence;

import csu.web.mypetstore.domain.Sequence;

public interface SequenceDao {
    Sequence getSequence(Sequence sequence);
    void updateSequence(Sequence sequence);
}
