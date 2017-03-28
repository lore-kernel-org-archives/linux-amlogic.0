From: mturquette@baylibre.com (Michael Turquette)
Date: Tue, 28 Mar 2017 15:07:24 -0700
Subject: [PATCH v3 1/3] clk: meson-gxbb: expose clock CLKID_RNG0
In-Reply-To: <20170323075602.GA6054@gondor.apana.org.au>
References: <4e2d12e5-f75b-3ac6-a3f7-18e8a8b7283b@gmail.com>
 <20170316100743.GA12137@gondor.apana.org.au> <m2mvcl6pwg.fsf@baylibre.com>
 <20170317083032.GA18512@gondor.apana.org.au> <m2lgrxnxlz.fsf@baylibre.com>
 <20170323075602.GA6054@gondor.apana.org.au>
Message-ID: <CAEG3pNCop22g0SbKfPma+iaHrSzv6sBXTJRsrjwtwUw+HGYV7Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Herbert,

On Thu, Mar 23, 2017 at 12:56 AM, Herbert Xu
<herbert@gondor.apana.org.au> wrote:
> On Wed, Mar 22, 2017 at 08:24:08AM -0700, Kevin Hilman wrote:
>>
>> Because this will be causing conflicts with both the platform (amlogic)
>> tree and the clk tree, could provide an immutable branch where these are
>> applied to help us handle these conflicts?
>
> If you apply the same patches to your tree there should be no
> conflicts at all.  git is able to resolve this automatically.

The commits will have different SHA1 hashes (commit id's). Having
multiple "copies" of the same patch with separate id's is undesirable
and completely avoidable. Immutable, shared branches resolve this
issue.

Best regards,
Mike

>
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
