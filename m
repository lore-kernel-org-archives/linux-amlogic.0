From: herbert@gondor.apana.org.au (Herbert Xu)
Date: Thu, 23 Mar 2017 15:56:02 +0800
Subject: [PATCH v3 1/3] clk: meson-gxbb: expose clock CLKID_RNG0
In-Reply-To: <m2lgrxnxlz.fsf@baylibre.com>
References: <4e2d12e5-f75b-3ac6-a3f7-18e8a8b7283b@gmail.com>
 <20170316100743.GA12137@gondor.apana.org.au>
 <m2mvcl6pwg.fsf@baylibre.com>
 <20170317083032.GA18512@gondor.apana.org.au>
 <m2lgrxnxlz.fsf@baylibre.com>
Message-ID: <20170323075602.GA6054@gondor.apana.org.au>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Mar 22, 2017 at 08:24:08AM -0700, Kevin Hilman wrote:
> 
> Because this will be causing conflicts with both the platform (amlogic)
> tree and the clk tree, could provide an immutable branch where these are
> applied to help us handle these conflicts?

If you apply the same patches to your tree there should be no
conflicts at all.  git is able to resolve this automatically.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
