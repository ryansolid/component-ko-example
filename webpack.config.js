var webpack = require('webpack');
var path = require('path');

module.exports = {
  entry: {
    app: "./client/index.coffee",
    vendor: [
      'underscore', 'backbone', 'backbone-http', 'backbone-orm', 'superagent', 'backout',
      'knockout', 'moment', 'component-register', 'component-register-ko', 'webcomponent-router',
      'path', 'url', 'events'
    ]
  },
  output: {
    path: __dirname + "/public/client",
    filename: "[name].js"
  },
  module: {
		rules: [
      {test: /\.coffee$/, use: ["coffee-loader"]},
      {test: /\.pug$/, use: [
        'component-register-ko-loader',
        'pug-html-loader?exports=false'
      ]},
      {test: /\.css$/, use: ['to-string-loader', 'css-loader']},
      {test: /\.styl$/, use: ['to-string-loader', 'css-loader', 'stylus-loader']},
      {test: /\.woff$/, use: ['url-loader?limit=10000&mimetype=application/font-woff']},
      {test: /\.woff2$/, use: ['url-loader?limit=10000&mimetype=application/font-woff']},
      {test: /\.ttf$/, use: ['file-loader']},
      {test: /\.eot$/, use: ['file-loader']},
      {test: /\.svg$/, use: ['file-loader']},
      {test: /\.jpg$/, use: ['file-loader']},
      {test: /\.png$/, use: ['file-loader']}
		]
	},
	resolve: {
		extensions: [".coffee", ".js", ".pug", ".styl"],
		modules: ['node_modules']
	},
	plugins: [
      new webpack.optimize.CommonsChunkPlugin({name: 'vendor', filename: 'vendor.js'}),
	    new webpack.ProvidePlugin({jQuery: 'jquery', $: 'jquery'}),
	    new webpack.ContextReplacementPlugin(/moment[\/\\]locale$/, /en/)
  ]
}