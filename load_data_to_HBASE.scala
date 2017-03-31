import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client.{HBaseAdmin, HTable, Put, Get}

import org.apache.hadoop.hbase.util.Bytes

import org.apache.hadoop.hbase.{HBaseConfiguration, HTableDescriptor}

import org.apache.hadoop.hbase.client.HBaseAdmin

import org.apache.hadoop.hbase.mapreduce.TableInputFormat

import org.apache.hadoop.fs.Path

import org.apache.hadoop.hbase.HColumnDescriptor

import org.apache.hadoop.hbase.util.Bytes

import org.apache.hadoop.hbase.client.Put

import org.apache.hadoop.hbase.client.HTable

val config = HBaseConfiguration.create()
config.clear();
config.set("hbase.zookeeper.quorum", "ec2-35-161-86-164.us-west-2.compute.amazonaws.com");
config.set("hbase.zookeeper.property.clientPort","2181");
val tableName = "measurement"
val myTable = new HTable(config, tableName);
var p = new Put(Bytes.toBytes(1));
p.add("family".getBytes(), "column_name".getBytes(), new String("value999").getBytes());
myTable.put(p);
myTable.flushCommits();
