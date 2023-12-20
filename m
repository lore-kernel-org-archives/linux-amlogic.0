Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0FEC3DA6E
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Dec 2023 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjKvlRJvcToKRCXd8QLmO7nsSlDur4thu/ztTpIMZ/0=; b=D3VNOOZJhZUe/wsGSivm1QJme8
	Z9KjtqjDPUPKLUaNfy3FNXAjjeD/RSF9C+gZbNoyXsXFOTEkxyL4B5KxVZzTexbyG1X5pe71nxwNV
	KYAA401GJPDN6Rcy6E3npk4zXiztI09crIqG7JLNaFN63Yht7faJPGbAf28fuDn8AI9dkeM/bIGL7
	JLzrJjGZ2LPaHmJWGzpLLOlfKCvisoK3+prBFH2m53IEOxqpcnGejVGNZn8nrOMJRNMRxSZHs2Vdp
	bHU1MswNMaHJOwYIy0c7rvACSTBQTulPjpyEu7lhInXsHwbJKJVSQQEb8zX3T5xQqjykx8eJeAh85
	f9QL6acg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzG-000LVj-2D;
	Wed, 20 Dec 2023 15:59:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzC-000LQs-0J;
	Wed, 20 Dec 2023 15:59:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c31f18274so73592105e9.0;
        Wed, 20 Dec 2023 07:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703087989; x=1703692789; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlF491ghOGLrK9Em/D/uRAJ1aT5zh9NJczNU+dua4mQ=;
        b=E70XDTHdlMXER1aRzSF5Qs6wCey67rjTxZ/Gk1azu9blqkHDNH8hRyekoamOFRoXGR
         3d//UAY+2hc2YtKPfdW0tni2RAzOa+i9aebAFInuWD4Pi4MesM7um9+frn5wX28VzdCH
         Nns7jjtt+Ca74Aqrzqjmms1w6PGTnam4SKdUU12ClHOCtXb3zIvVJdGu62alrUAo7A0/
         hdv3EgBmqmgTl1WrGQrUSMZd9V8de5J+tfiiLqev8BoNdtGz8vBUcEcTOaJ++y3Q1qK2
         by0aT9ROJYSQ7bte9z4xIjzjEpHrwdta54sqEcpYYB2k8LpJmnij0oNjmjmgu/vVR2ar
         mH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087989; x=1703692789;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlF491ghOGLrK9Em/D/uRAJ1aT5zh9NJczNU+dua4mQ=;
        b=R5atN4l6mfULwt/VUv+mRBRGvIDGoVCH4Gfki9KyxkRi4O2khSIY/Wl74qGDni9NFx
         sstM/ranfeUF6NeP2jhilw70dv9rWYlr8n52iNbc4xoAqQ0H6uXnLAEKTWQxiE+suVLn
         ZiU6Cc3qqwfiqtKfBrzpSq8y4UIoVEBbgdwqKy1vKCUBLbUUqvUCt29UefrtEUBsqkJe
         HQFysG+DxABqHC5MtHYeEcq3zZV+lQjnjt4DoUHIvGB/FvrJiXvxzZa7uF1dzUNFDmpn
         kd2wgkowpgU/CabSW7anDh1vrbEmq4jFUVJ0eUY+Bwb4aL2ZBDqIyWLc1UfCgiu7D/sM
         i8HQ==
X-Gm-Message-State: AOJu0YxuHyp9OHt+UH50fcT9BZtDzYT2bjoytEDpgSfgtg16xwSCiN6l
	V2YUabU0LKlseH1uuauwWZw=
X-Google-Smtp-Source: AGHT+IFnMPCDwoGTWb01tNCJPHJq8OlIroHW54gzOjTRHhUdDfR4zUHzMtMHHa51Tf6/OEhaYaM07w==
X-Received: by 2002:a05:600c:1389:b0:40c:61a7:e868 with SMTP id u9-20020a05600c138900b0040c61a7e868mr5142052wmf.26.1703087989151;
        Wed, 20 Dec 2023 07:59:49 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id zw23-20020a17090771d700b00a1de8f69dabsm75096ejb.5.2023.12.20.07.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:59:48 -0800 (PST)
Date: Wed, 20 Dec 2023 16:59:47 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, kernel@pengutronix.de,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] pwm: meson: Simplify using dev_err_probe()
Message-ID: <ZYMPc50eBi6oBClu@orome.fritz.box>
References: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
 <ZXM72QYBbb32Q_aL@orome.fritz.box>
 <20231208190620.5qobgtyii2wt7tfa@pengutronix.de>
 <ZXbsDRslZNKCeJF9@orome.fritz.box>
 <20231211141900.x6tpyctch5fv3uqf@pengutronix.de>
 <ZXcpswXxb1oQldp5@orome.fritz.box>
 <20231212203352.wl3rzob75fct4lov@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231212203352.wl3rzob75fct4lov@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_075954_144052_BF510980 
X-CRM114-Status: GOOD (  12.04  )
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
Content-Type: multipart/mixed; boundary="===============3388785004906813177=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3388785004906813177==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NDgFrnQjyNDqVFH/"
Content-Disposition: inline


--NDgFrnQjyNDqVFH/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 09:33:52PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Thierry,
>=20
> On Mon, Dec 11, 2023 at 04:24:35PM +0100, Thierry Reding wrote:
> > It all adds up in the end and keeps me from doing other things.
>=20
> If that means you'd be glad to give up the PWM maintainer job, I'd
> happily take over this post.

"Glad" is not the word that I would choose. After all I've looked after
this subsystem for almost 12 years, and letting it go isn't something
that is particularly easy. However, I do realize that my heart isn't in
it anymore and I don't want to be in the way of anyone.

So I'll take you up on that offer. Do you want to send a patch?

Thierry

--NDgFrnQjyNDqVFH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmWDD3AACgkQ3SOs138+
s6H0QQ/+IPt7W7ID5anQIEij/5IA0Mb5hvrylvIttu2J7KwG8Quq+UDFMqpHho4N
KKwxuRMPcwHvV/riQ/c53H8si8Qq680pH0GGVIqg3v2CJsyDifjSWQA1FfeM/v+O
44NMP7QdIjl5/y3IvFXJCczT63c1Njq6P9Fp2vjwUI1Ed3YHsnpRUjmFrRBc89j7
1CsDiMpbvaXX6A5JA/E44xVI+bzg/s3KT64scsLRYJ+gFFJBJwuShwKu96m/qcZg
XovZIZJwuH8IQpBfJ7bAvfVZUhAzGXXPL9427fv4HiBtkOC7eSNnz4rwxrz22bTd
K3wHxBwwsZmm8WXqdbSZ/iNflTOs50RkJ6ZZ+0xvEX6Y55N2Au0Xu2Ou369Aqm2V
ztQrNiJazuUGpNriWXJcq+43FHbj0dM66g5drnMwBzbxIU0h2nSliSa7Bgph4VDU
mrkUxi/9bgpu4XUV/1oB5MkuRkhW/6cp4A3v5MDREJ8TJb7h8/F0JNoHCFdpboYB
yD/FCxoPlAawzCKqTxJTL3005NtlMTc1OLWLr9UtpxfMY4L2aMmbaMaNQQTroN1D
C0y083ypWTamIQs0rxVn/NIBWwAL1H0HgBDTeDac5IhX+YM/yDUmzIHJU7BrbVJu
Pgz3OncTJ+G4Wq/1+dmoKc68Z63VEUWzmgN7rq2vMJASRsujZPA=
=pjoN
-----END PGP SIGNATURE-----

--NDgFrnQjyNDqVFH/--


--===============3388785004906813177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3388785004906813177==--

