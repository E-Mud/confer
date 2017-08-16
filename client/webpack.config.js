const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
    entry: {index: './index.js'},
    output: {
        filename: '[name].bundle.js',
        path: path.join(__dirname, 'dist')
    },
    module : {
        loaders : [
            {
                test: /\.jsx?/,
                use: {
                    loader: 'babel-loader',
                    options: {presets: ['es2015', 'react']}
                }
            },
            {
                test: /\.styl?/,
                use: ExtractTextPlugin.extract(['css-loader', 'stylus-loader'])
            },
            {
                test: /\.(eot|otf|svg|ttf|woff|woff2|html)$/,
                use: {
                    loader: 'file-loader',
                    options: {name: '[name].[ext]'}
                }
            }
        ]
    },
    plugins: [
        new ExtractTextPlugin('[name].css')
    ]
}
