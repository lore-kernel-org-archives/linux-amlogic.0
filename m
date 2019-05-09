Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8022DC04AB1
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 14:53:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53D0720644
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 14:53:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ed1cFY0L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvO63F4G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53D0720644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dDB+Lu8LFyzcJH8az8slnrCrKnOFzEGI20XnjfVwoXM=; b=ed1cFY0LZYIy4YsLV2q1+u2CX
	j3vwiBdnBpNlPaMVmLeUqSKeyuX1CbQwC5iBQAN0DFhXXGCfXwA7+Ct0+wvBqIEhoXMpedZJu7pgI
	YG0rZj/HIP8aPUEo4OzeScOUNMm3Z5iTwh06M0sgaXBYnvZtKPAIcW3veuKcUFH/kSwaxtPRtB1ph
	Jzj+MY+68jxHFADsE5zjz3cugMVSBN9GYoI3WlEXWe8NzOVyvOovmvRdiRKhQj2OdsbOVoqOr8iQ7
	wnZRwz65O+To4/8NWW5hglMug9wq4h0YAlfJwTOlb1ASqyKUIEIbrfX/BtQHd1NwEK8IxGhw8Nm9O
	4kfQQc2vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOkPy-0007iG-Nv; Thu, 09 May 2019 14:53:06 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOkPv-0007es-A9; Thu, 09 May 2019 14:53:05 +0000
Received: by mail-wr1-x443.google.com with SMTP id r7so2832528wrr.13;
 Thu, 09 May 2019 07:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q+1TsGRKkwXUYYOoB2LIsila6ZhfcUv70iojfQ5/w9M=;
 b=dvO63F4GKSuh+nx1VkFNjrbeq11WPXdaaDZIDHHzeqEb0NC2LSjjRvIMFTU6xWKCAS
 NSz848cbvpQZmfWPe8Q5F4WzqTlzYFtIjQhq/iBANrIEZD29GrwhSUThKRvtqeTLxVga
 8Jnwbvwxoh0zvK8gumUsopxm8EUOq5ylrRawCp/7M9GfeiySm5Bez81iFE3VNLSEd4V9
 jvy8KDKUx8jOblvYJ49BYWvY6S1dho2EH1yeg2+zuUBZUaf+IwTxARnK76IGMxTYQJAV
 WRDGN4TEsnlJ3OnxtVJzOpnEAq9+T/h8Es3/+9cWV6POPE+EwjxLrew7SYzA1rK8IDvB
 +i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q+1TsGRKkwXUYYOoB2LIsila6ZhfcUv70iojfQ5/w9M=;
 b=jQBJ9Al4+OgN4vSA28L2lb/JC3R/36Yec2/7dTK4opuiLEQVOgLrTVvP0uA8veL8vt
 AguhI0uZ9WM9DADRlul+l339m7SxK+oTWABXY+hft5VYVetxb2QryXAzO/1bRcLsET9v
 Jl8CYR4QiH3Z6do5n8nUhFgd/X6Foz/lFn63+3M8/4MZPraFm74vjrsuqo2yRCRM3xJ2
 xeeT8yYLbiyYmRzr4DYtRkcKWqzsvmuXL+w7rfV07qHCJ87AbgRh04vTUWKpaM0zp3Bq
 BoSJOc2pAH0XeHtfxxE/A01A9hi0Go2JrSb4ds/cbjzQIPf4mGlMgeX5QAB8oBm17y3o
 R+fw==
X-Gm-Message-State: APjAAAW1GC1dMaEHNlz2txOJ1tqYJNyt8pe2ddI1WYdecPf8HW1/rujq
 s/2oLtnSYY82otloXg4PGRk=
X-Google-Smtp-Source: APXvYqzIxbcYRCSo8r50PrcP3rEHkfelhjH97R+hDzmn2hwZU4TaoWItIaQT7DNkBg+WqpZCTE6Naw==
X-Received: by 2002:adf:9dd0:: with SMTP id q16mr3534840wre.28.1557413581230; 
 Thu, 09 May 2019 07:53:01 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id v184sm3707659wma.6.2019.05.09.07.53.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 07:53:00 -0700 (PDT)
Date: Thu, 9 May 2019 16:52:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/2] pwm: meson: two small bug-fixes
Message-ID: <20190509145259.GA8907@ulmo>
References: <20190401181817.11999-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <20190401181817.11999-1-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_075303_440504_AC5C6DE9 
X-CRM114-Status: GOOD (  17.01  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, narmstrong@baylibre.com,
 bichao.zheng@amlogic.com, linux-kernel@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: multipart/mixed; boundary="===============7597139785984384545=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7597139785984384545==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sdOeJE8sLwpQaOMV"
Content-Disposition: inline


--sdOeJE8sLwpQaOMV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 08:18:15PM +0200, Martin Blumenstingl wrote:
> This series applies on top of my other fix "pwm: meson: fix scheduling
> while atomic issue" from [0]
>=20
> The first patch fixes an issue where the maximum possible pre-divider
> (128) could not be used because there was an off-by-one error in the
> code. I discovered this while testing with the longest supported period
> (349514407ns) when running from XTAL. This is verified to work on my
> Meson8b Odroid-C1 board using "pwm_b" on GPIOX_11.
>=20
> The second patch was suggested by Uwe Kleine-K=C3=B6nig but was actually
> implemented much earlier (back in mid 2018) by Bichao Zheng from
> Amlogic. This patch fixes changing the duty cycle by relying on the
> hardware to re-start the PWM output (instead of adding an artificial
> "constant LOW" of about 20ms - as measured by Bichao Zheng when
> stopping and re-starting the PWM output from within the driver). I
> tested this fix on my Meson8b Odroid-C1 board which uses a PWM driven
> CPU regulator (DVFS with all supported OPPs is still working fine for
> me, although I couldn't observe any issues before this patch).
>=20
> I also have some code-improvements queued which I'll send in the next
> days, see [1]
>=20
>=20
> [0] https://patchwork.kernel.org/cover/10880419/
> [1] https://github.com/xdarklight/linux/commits/meson-pwm-for-5.2-v1
>=20
>=20
> Bichao Zheng (1):
>   pwm: meson: don't disable pwm when setting duty repeatedly
>=20
> Martin Blumenstingl (1):
>   pwm: meson: consider 128 a valid pre-divider
>=20
>  drivers/pwm/pwm-meson.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Both patches applied, thanks.

Thierry

--sdOeJE8sLwpQaOMV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUPssACgkQ3SOs138+
s6HQ2w/5AYGbx7MbLUpSUjsimmVEVGLHZMNi+Ma8lE2mK2HKzvp1nHPQvai/Pob7
2dnkyZjxB5FhHBJSuh92Wpk7rdLUMEG0mY/BJRkZG5Ne2dt94Jxyz2clVbM950kE
7YtzMBuPmCWvn8noD9aSyiVqVAeBppUfQhBBWvWaC2byjmXW5YB0ND/yyZH6o33x
ZS9gH8v6COySx2zNxzWjk3Fx7q8PjqnY2JvKZqpLSoE4rt49YJnUdafeRPDdBOoa
odBOSmVE8u4NvjLL/lbHgfpX9ITApqBGsfIX9EQZiqsGsD3DFFJff7zuxjMJJLfZ
cVsvWaTRzQhPxB2CkWQJ/yn8OI0JOPdCXKyZM1sK/apBRj3lEhD6AoYdwlslk4MW
Qn4mqSf5yWE7i8XnSo9Bb3IvE0U0F9+WSRE9Cf/IeKryeE2SwbIGNbbHrtQNqD4I
95xa0Ck4ijkwX4N3j1fL+/6VfLG/gRUs7aXUtwfMPyf4ln49hwHvAkFJfWU7fOqm
zffAQhbmqEeuiGFO9BZGHtTF5l9WzOEhs+aqtupn226xLAAUA5AUUZeypRwswNIM
x8X91p+Iy/EJdck2vcsLmFgl2CHuSo45bUepmicGOaOc1611ZZMry5fgqSgEn4iI
pVmuiNeb8uZ//O5v+GG0vdt94+lLwZAwCARg/UHfmPf55T4AMuI=
=7AFQ
-----END PGP SIGNATURE-----

--sdOeJE8sLwpQaOMV--


--===============7597139785984384545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7597139785984384545==--

