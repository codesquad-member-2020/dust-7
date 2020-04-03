const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
module.exports = {
    mode: "development",
    entry: "./js/main.js",
    output: {
        filename: "bundle.js",
        path: path.resolve(__dirname, "dist"),
    },
    module: {
        rules: [
            {
                test: /\.css$/,
                use: ['css-loader', 'style-loader'],
                exclude: /node_modules/
            },
            {
                test: /\.js$/,
                include: [path.resolve(__dirname, "js")],
                exclude: /node_modules/,
                // use: {
                //     loader: "babel-loader",
                //     options: {
                //       presets: ["@babel/preset-env"],
                //     },
                //   },
            }
        ]
    },
    plugins: [
        new HtmlWebpackPlugin({
          template: 'index.html'
        })
    ]
}