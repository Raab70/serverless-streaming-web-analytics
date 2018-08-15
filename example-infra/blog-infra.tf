module "streaming_analytics" {
    source = "../tf-module"

    stream_name = "unsupervisedpandas"
    bucket_name = "unsupervisedpandas-scroll-data"
}