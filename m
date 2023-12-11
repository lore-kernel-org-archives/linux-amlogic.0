Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EF3C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Dec 2023 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAo+C76bt0Mmh1j1GjEROuXbVFO8VDiR9kEiLHs0cfM=; b=G1Zrm+qKYBBzSfxVC6KlStRJiN
	g7fT7UJNEzQjArOmTxUE/MRUNWypt4oPVYuXUsKSawlSJbaEVINDkpEpYwpg1cYlFFpCckmNPUiNM
	+zPjUYossvThg0Noegnh4VNQg0OW3y6Gd+1EOoaPe0bLmUsXQtAgYU/y0A1KurcoaSUDRZF36QuRo
	sOMwUL3G6yZ9uSjfSumYq3he7iY5MNHdImtFKjTVPrTefqBLxeW1n0ZNPtEw9Gg2zDRpdokU/T96r
	L24MD/6LOLGxDLrJxNxGNxiKILBJ0Cr9GbVlppNUTzYgTaTjTbAL8V53RUbdOLbIXrxu4mOVpCq/n
	p9+J9VkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCe2i-004gfL-1l;
	Mon, 11 Dec 2023 11:01:44 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCe2e-004gdV-27;
	Mon, 11 Dec 2023 11:01:41 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c9f62fca3bso54757341fa.0;
        Mon, 11 Dec 2023 03:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702292496; x=1702897296; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yoNUyDc7crveEMwlT2FZNhS4oJafuWVz60O2pzpfD4=;
        b=UXMUwRb6z2s7zAO29R22A34lsoZvZcSQk/+pviR+okMmnz45t9vWQxfOpUp5iUfeYc
         Br6ggxVw2Ff3geXqDicY6/EUhitbOvQCAgGIVCTuZC7DYx+eoL5mIJ+P+iPPbl5JuPsT
         TErCu3hDtQKONCs+eF/NiJXKRxsds5xFYXmCCFEV0nN+obzvwjoRg9JPtLXEapvp1jVM
         OtqN5ujLvUNgBwnYxYKJTn4E/Gg/TcDvZpbmVLu1DXlb9GPbPKqsA9HU654j/hxQ0Z95
         fZS/GrzPOVFrEAHanD4Wpyr4gGpRuwQ5SeUWxS/Mrk1eFfSN7msXNbF3mJAHmamv4BKV
         2EbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702292496; x=1702897296;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yoNUyDc7crveEMwlT2FZNhS4oJafuWVz60O2pzpfD4=;
        b=eTG9tFnuPXt+OzfNzcE7iS90j/0o5PUFYTzoNkpNrghmIRovyPZZLOKKiTJpOh1yPb
         tH+yNcJCmO8xC6b9CK4mbOryJTszsFF7cpdxsevtBetTHnwc6LmkFjK4fZCkw82E/EDA
         Kb8Whfv2P8z2YGD3Cho5hwDz6P+vVRWqu3Hzbe3YhdaLXqGZU6ZBP/nCl+MVMG61KpUg
         uxNLrbeOOelO7pYZ7cIV0cSouJM4AVZLXEQ5VU3/Dz4PnIPXeScqsdKo7HeNR9c6uyih
         LPIaVhVxVaz3I5TQ9MiCvXoTorO5M+XKMkfB2EZ5A6ufPz6smenUD4GTYCzXw53XfZhv
         kSBw==
X-Gm-Message-State: AOJu0Yw6ib+stK+9HhN/68MNcbiUh4XRPCwxmxz2Z5en1fyZeu7ys7cc
	w0A3KW7AXfFkYlFXeQh3KvCYc/KPlm0=
X-Google-Smtp-Source: AGHT+IHGf0deBy1kz+L9fNu2VeKiVKe8qdt8XFpmGRHh7XmpI4WZnb9TvttVPcmhvXHyv33Lh4JIBg==
X-Received: by 2002:a2e:ab09:0:b0:2cc:208b:98c5 with SMTP id ce9-20020a2eab09000000b002cc208b98c5mr1151013ljb.44.1702292495785;
        Mon, 11 Dec 2023 03:01:35 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1ca6f5f189sm4698236ejc.179.2023.12.11.03.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 03:01:35 -0800 (PST)
Date: Mon, 11 Dec 2023 12:01:33 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, kernel@pengutronix.de,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] pwm: meson: Simplify using dev_err_probe()
Message-ID: <ZXbsDRslZNKCeJF9@orome.fritz.box>
References: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
 <ZXM72QYBbb32Q_aL@orome.fritz.box>
 <20231208190620.5qobgtyii2wt7tfa@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231208190620.5qobgtyii2wt7tfa@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_030140_713262_487B6D90 
X-CRM114-Status: GOOD (  21.31  )
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
Content-Type: multipart/mixed; boundary="===============9008160669218431616=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============9008160669218431616==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pjs2fT3iSG2v3iJj"
Content-Disposition: inline


--Pjs2fT3iSG2v3iJj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 08:06:20PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Thierry,
>=20
> On Fri, Dec 08, 2023 at 04:52:57PM +0100, Thierry Reding wrote:
> > This is a lot of churn for very little gain.
>=20
> We seem to have different conceptions of churn. Each hunk here is an
> improvement for both SLOC count and usefulness of the generated error
> message.
>=20
> 	failed to register somename: -5
>=20
> is worse than
>=20
> 	error EIO: failed to register somename
>=20
> , isn't it?

That's entirely subjective. I think the first version is just fine. I,
and I suspect most developers will, know what to do with either of those
error messages.

> > None of these functions are ever going to return -EPROBE_DEFER. And
> > yes, I know that function's doc says that it is "deemed acceptable to
> > use" elsewhere. However, the existing error messages are just fine, no
> > need to churn just for the sake of it.
>=20
> We had this disagreement already before. Yes dev_err_probe() is useful
> for three reasons and this driver only benefits from two of these.
> That's IMHO still one reason more than needed to justify such a change.

I disagree. There are certainly cases where dev_err_probe() can be a
significant improvement, but there are others where the improvement is
very minor (if there's any at all) and in my opinion the churn isn't
justified. Otherwise we'll just forever keep rewriting the same code
over and over again because somebody comes up with yet another variant
of mostly the same code.

> And if you think that a function should only be used if all advantages
> are useful for the caller, let us reconsider if we really need capture
> support in the pwm framework as only two of the 68 drivers make use of
> it.

That's a ridiculous argument and you know it. You are comparing apples
to oranges.

Thierry

--Pjs2fT3iSG2v3iJj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmV27A0ACgkQ3SOs138+
s6EQgxAAkVhxQElwpdJ5LLraBhrPHb0memFPXZvwsLSeq6skTKYwpO8l7HKPl/qX
qpFMwqfyVz1NiEnstvgPgcmW0VWA+UZUUdrvmrdLmgkLy9tJ4K6T2Fo9TTOsLUhK
YRG+NXungaHNZO8rL2H4vEEyhaSw6120uZbU2oCVqewX9tdH+yPZAhcpwFlG6Hcx
RayaAS5BFPKt7yk2PZf3uVPFHcM6dyJ6YOUBUTipWgcspryg3E9aF3ygzn3+XeOg
pocrBPM74kDEnUbWtVh34sOjigLhbSLyTnWMhHRjSGzWGDngRrIaVkWMw5OePH0o
c+Rc9dlAPftHa2ug1TF9IsiMWe8Uo8qGJWSTJ9nh3R/DZHN5lwY2+LalugqN3GWJ
Sj+CP57YUfjw7VurMYjH182VfsTrjhbxjCUlL2CClzInWpoKZm784IEqfdCADPX6
G7vpidscTOReyV96PmDGizGCdMnDAe2kH5y6eRfFrijQCRHoY59xerPK7pLqtyKE
fRQBvyMYnWNnfEG7LR6ZxZVnD42Pzu8R04opuoMmuXFQjkOl47VdjLHYOuyozJRG
/wV8n/M6PLT3yDGEVacXHQGbbpnyRYrE7EX7/BtXH0gMnpLmzThVEVWHvndQDDGU
SxfQV/yEIcrYxGZgkf7In7t4lNWF0VQtbT0RksVbQiKAHV7yunM=
=lGOp
-----END PGP SIGNATURE-----

--Pjs2fT3iSG2v3iJj--


--===============9008160669218431616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============9008160669218431616==--

