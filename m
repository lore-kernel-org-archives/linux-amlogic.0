Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55099C7EE22
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 May 2023 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOaqz6OCVUo04NlHQ+fHyYU4sHSpc5UB+GIMdNcWbsY=; b=uvTHaWcn6eVE1fUw9pf9sQUzan
	StqB6tE2L0CFwnz4ukxKKqxI86yK7Ooq9FXbpHvKyecWEPPGzVbez1g0jA39l4s9hIWj5qrp/CXDn
	sDB7S9hQ3nHD/Oit/CzF8DhDkJPm2B+fGo1j1II26BVzrtGxo+CHt3rj7DOiN7MHMXKemVIS7xMG+
	24rHmhq6KwnJuHm6ixISZFHcy9Fus9tnD1XXNafrvLhhzPb+NnG9Wt0EnCxNc8LTPFyOMRNOWD+Le
	xH/Tfbphzv1H4nfRJwUQWMdwU3onkCNMw+ukC2UWQQEGF+LxtqP1/shpbKM+LXoNyYZv1JAsMBCEb
	VC/C+kgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puV06-007DQI-1Q;
	Thu, 04 May 2023 09:11:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puV03-007DPN-03;
	Thu, 04 May 2023 09:11:44 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-956eacbe651so38290466b.3;
        Thu, 04 May 2023 02:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683191499; x=1685783499;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzY+tEhZTT1946YbGAXGkkoFsY6pCsBdww1YxT+InPI=;
        b=SFex635smGfJWoSDqX2jS5ghlN0boedLXIU6oa4b6FSvXzMena8InathuY1v91YUuq
         5IDTHo1aSb4l9cn62TFT5yFHWWq+OPQ8jh5KszWzQe7OLjDU8NMnBoZjTHD5EfuxO64f
         g2GoeD5PYw0LJ+JgNQyJlpfhbJAJ8VUK4n3vetRPr8hl+DagfVzTpc2tA/JhptDs6D4l
         eFoHWuDGxmvmM84CtBbebnYBLdo01fwBw9QvVUcgnKDiljJhDnORqQLavHE7m/4f2qBY
         GYYPaGe5UmFdODaZvfppbB6fixnNIvoUX8ASf9bmGiPG7vu/PA8TiacYOeD0LHgJgsmd
         7xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683191499; x=1685783499;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzY+tEhZTT1946YbGAXGkkoFsY6pCsBdww1YxT+InPI=;
        b=j4oGG70LV24Kb4w0u8TEsvfpzT/9zJAo2VzAUqhUpBFH4epizTYl/b5M82wAcnLhud
         3suo2IxmNuRe9+CyrwzPLlPv4vNUh5c7Rza81neO/tz+bKXmkur7t3JE4ZPpLKRpU1pm
         5xiGcCTOxB2lcKlid9CMybDTVGeCxsr2kRqRgWVADTJNksOTbVNlLALVXRWSL8tAb+rF
         +LA5RNhQ0CFpSmMNSssQgd8wgc3yvF2yIC1jemLIeF9V8CTJhcz1B8wXcABbQgR9nRqO
         fpafHS/UVliPkKMwLzFrrLciBSFE6FafjOHX/Jh2SnMBcbOhH7nYxYgrgYaWDyeex/sG
         4GFw==
X-Gm-Message-State: AC+VfDwu0cx8/7+iIVLIylGefQ+rOWREYP/A7ty7QfUJsZkbcnKrv/yl
	6A8OT6tH+uXDC6CGLRD/Q4w=
X-Google-Smtp-Source: ACHHUZ4EYf52utQ9ujR/C63xdJtoEjL6kKLlava2uDu5f53mm/QWNI0HoHG0tvVIAuNlo1Gcbb3uQw==
X-Received: by 2002:a17:907:a0d:b0:94f:2c22:a7a2 with SMTP id bb13-20020a1709070a0d00b0094f2c22a7a2mr5185265ejc.68.1683191498951;
        Thu, 04 May 2023 02:11:38 -0700 (PDT)
Received: from orome (p200300e41f053a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f05:3a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id z22-20020aa7c656000000b004fc01b0aa55sm1662771edr.4.2023.05.04.02.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 02:11:38 -0700 (PDT)
Date: Thu, 4 May 2023 11:11:36 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH] pwm: pwm-meson: remove not needed check in meson_pwm_calc
Message-ID: <ZFN2yNr5GwVwwcHI@orome>
References: <d2aa9fa6-4513-c3e8-493a-3a34d5a1143b@gmail.com>
 <20230504064730.gaguyecx4q7duatk@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230504064730.gaguyecx4q7duatk@pengutronix.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_021143_054418_A51AA99E 
X-CRM114-Status: GOOD (  15.75  )
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
Content-Type: multipart/mixed; boundary="===============7149694602945121729=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7149694602945121729==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g4JdbYF11KDodS+q"
Content-Disposition: inline


--g4JdbYF11KDodS+q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 08:47:30AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Heiner,
>=20
> On Thu, May 04, 2023 at 07:35:55AM +0200, Heiner Kallweit wrote:
> > duty <=3D period implies that duty_cnt <=3D cnt. We verified before
> > that cnt <=3D 0xffff, therefore we can omit the check here.
> >=20
> > Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> > Note: Applies only after "pwm: pwm-meson: fix handling of period/duty i=
f greater than UINT_MAX"
>=20
> Do you know there is git magic to express this that (at least some of)
> the build bots understand? Look at git format-patch's --base option.

I think --base is really only applicable if the base patch is applied to
a well-known tree, otherwise the commit is unknown.

For things like this it's easier to just send them out as a series,
which implies the dependency. Obviously sometimes you get situations
where you send out a patch and only then realize there's cleanup you
can do, so mentioning this is usually enough. Most bots will end up
building this after I apply as well, so we'll get the coverage either
way.

Thierry

--g4JdbYF11KDodS+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmRTdsYACgkQ3SOs138+
s6F2UQ/+OxLFFtZnD6HiEusClT0vy5XRuUAM2Bv3GhE9mtGUCVouAl/k+J9tLHYl
89URmIhbV8ig+S3eL7Vtc3oq/vQjnS7Ln4NrjsvGQKkhKbv5QfZJ+tD7gqhOAIGZ
MTfL1BTCFc5scKDSSN0i/20TNRM8wfYwNO05cgCYmPTdNxxbKe0/iYk2tXsGoeko
BDdxtpJxE5ZdNfXlccZ8Qit/UKKOxDj8ma8zOkflji4oeL80xxP5OPNjajyC7cMH
HAQu8WCzGdUepQ662UQEzSDLldQYOTz4Lalie30Upo5TWrUb+soRCX+qBclNRxxv
ZMWhN4nDieOgb9ADRzkbkzewqXG0QqCfAmaaACocASxMIJm4W+CAjPBCm/lyKC/0
coHdfDZ5tizsISK5txQaUcEUoNdt5nfKVZs5aWM4xnz2Qn0JFrySDCx9wk/Qv+O0
SXG01pMxp5cugQiNzdfJhCY8LAtmWnhp8iZZh8murvye1sZj22nQRlQxqt6Enznr
3Vbv35oCqu/KEqlEnbZWK26GTclNa61Uv1Vd6ixAdvLzH0IsM9HBNGJ5hwkb7sUy
/yR68ED2NU8ncoeEy3BH6ztT7gOPFt21otDfl/YoJ32LClC8FPpRuDHMf+HDJ4ih
wKmACqnxuu5kH7tiSWSPVisZSv/7KRK07SKnTbPHcmZEgeYF+us=
=kpWO
-----END PGP SIGNATURE-----

--g4JdbYF11KDodS+q--


--===============7149694602945121729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7149694602945121729==--

