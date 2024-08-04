
const { i18n } = require("./next-i18next.config");

const SUB_DIRECTORY = '/home'

/** @type {import('next').NextConfig} */
const nextConfig = {
    // basePath: SUB_DIRECTORY,
    assetPrefix: "/home",
    swcMinify: false,
    async rewrites() {
        return [
            {
                source: "/home/api/:path*",
                destination: "/api/:path*",
            },
            {
                source: "/home/images/:query*",
                destination: "/_next/image/:query*"
            },
            {
                source: "/home/_next/:path*",
                destination: "/_next/:path*",
            },
            {
                source: "/home/icons/:path*",
                destination: "/icons/:path*",
            },
        ]
    },

    reactStrictMode: true,
    output: "standalone",
    images: {
        domains: ["cdn.jsdelivr.net"],
        unoptimized: true,
    },
    i18n,
};

module.exports = nextConfig;
