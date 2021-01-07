package org.apache.hadoop.hdfs.server.datanode.fsdataset.impl;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

import org.apache.hadoop.hdfs.server.datanode.Replica;
import org.apache.hadoop.hdfs.server.datanode.fsdataset.FsVolumeReference;

public class BlockSenderBatch {
	public final AtomicReference<Replica> replica = new AtomicReference<>(null);
	public final AtomicReference<IOException> info_ref_error = new AtomicReference<IOException>(null);
	public final AtomicLong visiblelen = new AtomicLong(0);
	
	public final AtomicReference<FsVolumeReference> volumeRef = new AtomicReference<FsVolumeReference>(null);

	public AtomicReference<File> getFile = new AtomicReference<>(null);
	
	public final AtomicBoolean used_batch = new AtomicBoolean(false);

}
