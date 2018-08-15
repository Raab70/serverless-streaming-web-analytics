# Serverless Streaming Web Analytics Demo
This repository contains a demo to go along with the talk Serverless Streaming web analytics

Slides are [here](https://docs.google.com/presentation/d/1KfHFwh4zhE1rI9ctio65Ho4Rx2Ir_ZFNnUtWCa1jeag/edit?usp=sharing)

This repo contains a terraform module which can be used to deploy your own streaming analytics as
well as an example of how to deploy the module using my blog. To set this up on your own site:

1. Clone or download this repository and `cd serverless-streaming-web-analytics/example-infra/`
1. Modify `main.tf` to point to your remote terraform state bucket, create one if you do not have one
1. Modify `blog-infra.tf` if you'd like to change the name of the bucket and stream that will be created by terraform
1. `terraform init`
1. `terraform apply`, respond `yes` when prompted.
1. Copy [kinesis.js](https://github.com/Raab70/Raab70.github.io/blob/master/assets/js/kinesis.js)
somewhere within your site (like `assets/js/`).
1. Modify `kinesis.js` with your [Cognito Identity Pool id](https://github.com/Raab70/Raab70.github.io/commit/1f9298ba4204bc60ad9071964119f17d386492e3#diff-4d3db53b9e963fb1dfa916813d6a6e2aR3)
and [stream name](https://github.com/Raab70/Raab70.github.io/commit/1f9298ba4204bc60ad9071964119f17d386492e3#diff-4d3db53b9e963fb1dfa916813d6a6e2aR62),
both should be printed by terraform after apply
1. Add the script import on your site for `kinesis.js` and `https://sdk.amazonaws.com/js/aws-sdk-2.283.1.min.js`
An example of these steps for my blog can be seen in [this commit](https://github.com/Raab70/Raab70.github.io/commit/1f9298ba4204bc60ad9071964119f17d386492e3)
If you're not using jekyll you'll need to directly add the script tags to your HTML `<script src="assets/js/kinesis.js"></script>`


This demo is based on this AWS [tutorial](https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/kinesis-examples-capturing-page-scrolling.html)