Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694CEC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Dec 2023 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zViLHD4+EhkRmCxzXD/dWFkhWKf3gqCGVStCPDUi078=; b=WrpLm6t4m8uHbSlBUQqNAgxVFO
	6+VIhQnw4I4FT8A/iTX1ZXLf3Iw0aVdpX3NR04BUxKY6hOarqxY+kZEtw/NvqGXnluL61hn3ahXPe
	NBzxOk/+rOdmiK9fm4gKPWR8CgJGnLxkL7+nEh9BKON+KCWgU1mQe36Qvwrm6IHcr58tvPAeIBDR1
	23Gad+n0FQ4bchqEAIWXPb1M83X3ufoW7qwGdjmDkrlNFL0gpBF/GmCe/r1qQ4C5VCovHrN7LWyvu
	yauvlBQJCgBDV7Ro12E+ZhSJ/vhkKfv4dJxsVOB34zp3K+kyXl0l6WMYyeGhmhi0JbfCpFgXbIvQE
	EQu985/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCi9M-005PMl-1d;
	Mon, 11 Dec 2023 15:24:52 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCi9D-005PJ4-0J;
	Mon, 11 Dec 2023 15:24:51 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a1f5cb80a91so467848666b.3;
        Mon, 11 Dec 2023 07:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702308278; x=1702913078; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bjsk1T6zWHBNqkcu8mlXzkpQPoZwdAp78nI27bikvLA=;
        b=TWl9A5Qh75hMxsjZcWrTpewbBfEqEx+/qMlxuWvR8/pKXcHZN153tYTSSr3fTSGXKE
         CaraMSW5TvjKQaMawFjKxipZdyQuLvl0xHeeXeFnDDUieKVhD69ADTqCtHQZ5w9G3z0A
         i+IzYKpUQIxQtMjNteE2BkIoH5lM6hxZRylzQisHw/j1LfDCEg5W81YK92K8kUQgHNlC
         JIXSRPfEbI81qdCFHlI05HfUqEH24SKOJKUOwiLr4Ey9jHjub5xRCZe3sTXmUSyWGkmD
         oClDPsOSFYHSl6P0DgPXB7iTl0rKxjyd1ZuD6xgc57+zCvAI568ZymuMRvJ4G4l4vgZY
         U7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308278; x=1702913078;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bjsk1T6zWHBNqkcu8mlXzkpQPoZwdAp78nI27bikvLA=;
        b=oOhSr0CIqXRMtljoigOrK9o+pXeBErZ8hLeMXThUvXLW2qApF8G1ij7MsqDvOx87cx
         Fxb4oryiOIYz+9Hek+KXKeEOZhJMMsedy/mfiN0Mfikp0Nggd0YxmbXm47sy1RDteKLo
         tTrUEVWKrGRIrcRlIbZ2Iemu+ZQfjEfCN94gLiBtrehaz9hRfbilnGzadnJOfGkTWa6g
         iOdw6SP1TGqLDkBRlZ7RgT4tTIjdsZwTx8fQCS0+A9JrQ6OPI5zovjxQ6499RwVdoezw
         G03CniF2r61mi316rFnoqPIOkamUFMWmj9hE3zqPTiXNsVOf2r1s/VyaqEd9TO9p3FU8
         I6gQ==
X-Gm-Message-State: AOJu0Yzv3iwP8G5LJ/qMDRKl+sAeAJ5pwp5HjvwFnqVtWZP6zyr2ZubB
	15FLf+VKefK9nwTkOPFSJ34=
X-Google-Smtp-Source: AGHT+IFbzgHeqitxqguLprNLF0JYPjAO2jKvpdmZzZDz8TIDT9tgiggTFH9ZEBns9yvuXoCJnLKwcg==
X-Received: by 2002:a17:907:7f94:b0:9e5:ee70:5da1 with SMTP id qk20-20020a1709077f9400b009e5ee705da1mr1648796ejc.53.1702308277671;
        Mon, 11 Dec 2023 07:24:37 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ry9-20020a1709068d8900b00a1f744953c1sm4302276ejc.105.2023.12.11.07.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:24:37 -0800 (PST)
Date: Mon, 11 Dec 2023 16:24:35 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, kernel@pengutronix.de,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] pwm: meson: Simplify using dev_err_probe()
Message-ID: <ZXcpswXxb1oQldp5@orome.fritz.box>
References: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
 <ZXM72QYBbb32Q_aL@orome.fritz.box>
 <20231208190620.5qobgtyii2wt7tfa@pengutronix.de>
 <ZXbsDRslZNKCeJF9@orome.fritz.box>
 <20231211141900.x6tpyctch5fv3uqf@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231211141900.x6tpyctch5fv3uqf@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_072444_395110_4E8B4EF5 
X-CRM114-Status: GOOD (  46.56  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0416082775535464233=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0416082775535464233==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eUC+m1HNmJK0/n+y"
Content-Disposition: inline


--eUC+m1HNmJK0/n+y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 03:19:00PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Mon, Dec 11, 2023 at 12:01:33PM +0100, Thierry Reding wrote:
> > On Fri, Dec 08, 2023 at 08:06:20PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > On Fri, Dec 08, 2023 at 04:52:57PM +0100, Thierry Reding wrote:
> > > > This is a lot of churn for very little gain.
> > >=20
> > > We seem to have different conceptions of churn. Each hunk here is an
> > > improvement for both SLOC count and usefulness of the generated error
> > > message.
> > >=20
> > > 	failed to register somename: -5
> > >=20
> > > is worse than
> > >=20
> > > 	error EIO: failed to register somename
> > >=20
> > > , isn't it?
> >=20
> > That's entirely subjective.
>=20
> It's not. You and me both know that -5 is EIO. But there are quite a few
> people who don't.

So it is, in fact, subjective.

>                   And for other error codes I'm not that fluent. (Do you
> know -2 and -19?) Also some constants are architecture specific, so e.g.
> -11 is -35 on alpha.

I didn't know about -11 and -35 on Alpha. Looks like %pe would handle
those properly, so yeah, I suppose one could count that as a benefit.
Not sure if we have PWM drivers that run on Alpha, and Meson in
particular probably doesn't.

> > I think the first version is just fine. I,
> > and I suspect most developers will, know what to do with either of those
> > error messages.
>=20
> Error messages aren't only for (kernel) developers. If you don't know
> that the kernel uses negative error numbers as return codes, the
> translation of -5 to EIO is even further away than opening
> /usr/include/errno.h.

Actually, kernel developers are exactly who these error messages are
for. Regular users that don't know how to decipher the error codes are
typically not going to know what to do about the error anyway, so they
are likely just going to copy/paste into some forum or bug tracker.

> > > > None of these functions are ever going to return -EPROBE_DEFER. And
> > > > yes, I know that function's doc says that it is "deemed acceptable =
to
> > > > use" elsewhere. However, the existing error messages are just fine,=
 no
> > > > need to churn just for the sake of it.
> > >=20
> > > We had this disagreement already before. Yes dev_err_probe() is useful
> > > for three reasons and this driver only benefits from two of these.
> > > That's IMHO still one reason more than needed to justify such a chang=
e.
> >=20
> > I disagree. There are certainly cases where dev_err_probe() can be a
> > significant improvement, but there are others where the improvement is
> > very minor (if there's any at all) and in my opinion the churn isn't
> > justified.
>=20
> What is churn for you? Many changes? Big changes? For me churn is only a
> big amount of changes where a considerable part cancels out if it was
> squashed together. For you this concept seems to be broader.

Churn for me is really any kind of change and it's not bad per se. What
I don't like are changes that are basically done just for the sake of
changing something. I don't have any strict rules for this, so I apply
common sense. If you want to rewrite an error message because it
contains typos or bad grammar, or is generally hard to understand,
that's what I'd consider fine and an improvement.

But this patch exchanges one format of the error message by another. It
doesn't change the error message or the information content in any way,
but instead just rearranges where the error is printed.

On top of it not adding any benefit, this might cause somebody to get
confused because some error message that they were looking out for is
now different. They may have to adjust a script or something.

You also mentioned that you saw the opportunity to do this while
reviewing Jerome's patches and looking at those patches, Jerome will now
have to solve a couple of conflicts when rebasing. They should
admittedly be fairly minor, but if Jerome wasn't experienced this might
be really annoying. Again, if this was a significant improvement I'm
sure this would be easily acceptable, but if it's just for format's sake
I'm not so sure it is.

> > Otherwise we'll just forever keep rewriting the same code
> > over and over again because somebody comes up with yet another variant
> > of mostly the same code.
>=20
> If there is an improvement in each adaption that's fine for me.

I can't speak for other maintainers, but I get very annoyed every time
somebody introduces some new helper and then I get to deal with 60 or so
patches just because there's a new thing that ultimately doesn't really
change or improve anything.

It's easier to apply 60 patches today that it was perhaps a few years
ago, but it also entails a bunch of things like reviewing the code
because sometimes even trivial conversions are faulty, the nrunning test
builds and pushing changes.

It all adds up in the end and keeps me from doing other things. Again,
if this all has some sort of benefit it makes sense to put in the time,
but if it's just for the sake of shuffling around parts of error
messages it just makes me grumpy.

Unfortunately, with all of that said I probably have no other choice but
to apply this patch because if I don't, then I know somebody else will
send the very same patch at some point...

Thierry

--eUC+m1HNmJK0/n+y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmV3KbAACgkQ3SOs138+
s6HuRA//cFZS5pBnD1ziuKfUh1H4yg5+iHug/NGIaioAfyPPCMBoh3B+okZjcChw
W9TZHVKEdi/VfxqpRxQ+nuwVOhqWHQtu4OF/YRsfXoKcOcK73EBGD19FSgta6oPN
qRdE/3Hm9oNjhiwTUxAOBZAZxl7xkWe/JdIg3k9ysd2arvkpEwhoX245jsUJ/Fj3
WGb8zcTh9/7XJ+IPeRvO51rryMG0ppJaSzbYpQwg9F760GOvQ4/Vv9fwzxCAKdeD
GNpH3PyuBCYSPffXA9K2LJta82PoHhfpVR52QSU6N4BocfYIFSVAdZsoZVkzPA3M
QN1huMTUgYgxht8zYIVWAdexDBnAXamjztalR7o9z9CslfG4lEVcD+3R7ZvUC5fi
wAe6zJSKvPRiU92u7OZIdZwN7nJo1WE2DckcxWKf2T3by/IV5Ku+FdRtXA0ibBYO
8aaCE6k5G6PZMiv+kEHN5RilVZQLfoSBhZeWQN1S8PXLsQePVxFcPug3pxOiSKPz
5jjVrzYBPo1dxl3EFbdB4vkuVFKIjbXOoHTgJfr82WC8EZLBh6cin7DnODJMbH7m
qsyHhJgbGXdTUGaNAGFsjae8rFmOjowlqlSGbFiCm11GIs8bGV7icgLOHZNX0mrt
RqPmNYmEaA/RQM/Oy3z4LEdVdE5ora7MkQMJTI279hZbVLInycU=
=hDh0
-----END PGP SIGNATURE-----

--eUC+m1HNmJK0/n+y--


--===============0416082775535464233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0416082775535464233==--

