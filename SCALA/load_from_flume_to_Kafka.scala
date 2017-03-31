import kafka.serializer.StringDecoder
import org.apache.spark.SparkConf
import org.apache.spark.streaming.{Seconds, StreamingContext}
import org.apache.spark.streaming.kafka.KafkaUtils
val ssc = new StreamingContext(sc,Seconds(1))
val kafkaParams = Map("metadata.broker.list" -> "ip-172-31-11-209.us-west-2.compute.internal:9092","auto.offset.reset" -> "smallest")
val topics = Set("measurement")
val stream = KafkaUtils.createDirectStream[String, String, StringDecoder, StringDecoder](ssc, kafkaParams, topics)
stream.foreachRDD { rdd =>
      println(" no of records per DSTREAM ", rdd.map( x => x).count)
      rdd.take(10).foreach(println)
      }
ssc.start()
