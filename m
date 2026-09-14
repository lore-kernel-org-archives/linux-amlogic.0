Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DBCC88E67
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2026 07:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RF8ybHOpDtMDKaSGdgh8Hi+h+DtOSBmv/yLG6IaLrqc=; b=yoCBOkc6nu/OmyzsecxV2Q+UOy
	bVorX446vsuwFW2gXhL4AiJFqPjcsApmHkTymCZJxsodV46Nm7heoH1oprP0m8opV6Lq+IEZpbb4i
	JuxrmOA7HhrkH0kDf0whRmCnFlVEv6JiiIyXUhzXG86uXoOV30ZR6/u8AIz0CZQVctqtlPCkQIroy
	SUzkriCQJaXOoxeOMgzZJ4bSnjp8baHraeNjY3EBNVOjleG3t07GDm2HzpOM68ztD3tCijAMz92RA
	wJI47+GOqo+yqeiyY8OrJVzNIqYidKQCf5T97PPKeGFW339mtFKOtwR71zXUvkGBaBLa5yabWFBL+
	VZXyzgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Bw-00000002aGr-1lWq;
	Mon, 14 Sep 2026 07:33:28 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Bt-00000002aFi-0zDx
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Sep 2026 07:33:27 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874aso1343436f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 14 Sep 2026 00:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789371203; x=1789976003; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZr2FikKI33KDHEnzqoeN/VTnNw+pox/jCxpOuAG6zQ=;
        b=e/bZpOdaiQLqSVBaG8IWyYyTWz5SjayhFwRfKIUJnivMDE5Ovtf3KEV127/sRdps5K
         YmsIP/gbc1BnG4ugSdqq1MvxfCvKo4CwNRTFdyfkgAkITluOW6/lrh+d1wXJSOMW1+0+
         OI5aYYtc+/f88pnEx7MA8LraQyXQAEls5Mh4g3s3iObW34g6mxATB3RSmyGnv2HFP0uP
         7vBDNGAx65L92cYFGkNhTwtBabE3op+PLiItOa3Ua9SXWQHe09AJoly0DXONIS3/RxjS
         f08z2xQU/EzW+PM1+rJo+IJ4yGPl38zg1zg7X5gmx8iHnYjQEz5X7ba5wGb401dP00yx
         tJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371203; x=1789976003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZr2FikKI33KDHEnzqoeN/VTnNw+pox/jCxpOuAG6zQ=;
        b=HNXZwZcK1d6dzYsDtQyWi3czhEWOwryEKzo4H5trHFVAksLTxOjGrKNSQAeuP/tvQW
         8nWoyo7jiTIAmFpcrwrublPuxrhGGn7qNOOIFk7KbarG83AoHIxTaI7yAZfO+b5L8FtV
         3l69xI24JDY4AcGvflev8qPiX9Z65unK9+heYDzqE5Qdy6Ff030N6Qz2K3OuYdf/MK8Y
         GNOKrGc3oFfaQkFxBHeD0k8KTlw75H5Uv2crvoYD0YXhrzRRl+nZJXB7+OEL/P12qpIl
         +glxJdLtr70k8VZaBCyymknU12fgwALwPprQTEMXpNkSDb0Z1TCYsKN6s5HAifys+pUr
         XqHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRhT3sv3tNGjLSwxjkaX19wDRThGhw26CL5q63n+SblixPzgAUWRBmMvDF3zaxMVEsWCrXdoztSqyFKFiI@lists.infradead.org
X-Gm-Message-State: AFuF++kny07dDZrWf4KDCxmtS+9J5woVmQS/qs5UZ9+6mexMTUtHSz7e
	XtDZ8pHM7pEXaofDWt82xRob06GT9ya8BlsKEiL4KVMgQB9KPFSeWQtkyY5IhC9cq/g=
X-Gm-Gg: AYBFou0b0OafSGNWK5Q0289olVnMQSYjQ74JnM4VjnS5BHrVWReafCPZH8iAfTTojWy
	K1Qx2kLyy/h+X1NRsS7eH+H+vWb3SqSwk9cUQHrPG3UEKajp9gCJtvY/a4auxX7fMpAx98lfZjS
	F12hujMT2Zso0oQ+fwTrheRqinuSiRa46pEsFfo/Oo77yic61CX6cGRyw6T2+Fk7MQaKS6Cg6id
	Sj9SdDnQ+fsEIGeyBMjzmMkXhrTjMIt5oTQWlIQuRhQtGhnXsZ9VDd39sUBZQPk+jVrfLV9w7av
	hJlreHWml+w8+xGc69Wzbt4h1ku8n4e+0KNOGPUbhre6XTAmDxPnzYDzuaOU5pQBdazdKzg32Le
	rf6kiLZAbXHSLI6wWfe/YhT0Yxa5dxBPG1GWn4EN4eJ1hSZippMRidX97mP9D1H8liJ/FzfnPIu
	aXkD2IplYqRr0ywZh2ol+JvjwR7enDUDaHMUHM2Lw2ZEAmRA1YNpFVAIOrsNPNQJyuU/IgKsVYc
	qf1knM073qpvnTr4uPMc3w4lt2u20p060G4K5h/A9ZUEWxwXnvme5M70T8JzAE/xVfTGZEe
X-Received: by 2002:a05:6000:470c:b0:486:f770:9e87 with SMTP id ffacd0b85a97d-48702aacef4mr2464666f8f.5.1789371202652;
        Mon, 14 Sep 2026 00:33:22 -0700 (PDT)
Received: from localhost (p200300f65f19a904d5c06a7863c841d4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d5c0:6a78:63c8:41d4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-486eb2ed106sm24129793f8f.1.2026.09.14.00.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:33:21 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:33:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
Message-ID: <aqeiUfIyeW2mapm_@monoceros>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-2-7fbefe928711@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20260912-audin-v1-2-7fbefe928711@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_003325_285265_DB428036 
X-CRM114-Status: GOOD (  12.83  )
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
Content-Type: multipart/mixed; boundary="===============6873979970421847470=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6873979970421847470==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4kuywhcc5gf5klas"
Content-Disposition: inline


--4kuywhcc5gf5klas
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
MIME-Version: 1.0

Hello Valerio,

On Sat, Sep 12, 2026 at 12:14:32AM +0200, Valerio Setti wrote:
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the include for <linux/mod_devicetable.h>. That latter header is
supposed to go away soon and injects a lot of build dependencies into
your driver.

If you want to go full iwyn, please use <linux/device-id/of.h> instead.

> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <sound/soc.h>
> [...]
> +static const struct of_device_id meson_gx_audin_of_match[] = {
> +	{ .compatible = "amlogic,meson-gxbb-audin" },
> +	{ .compatible = "amlogic,meson-gxl-audin" },
> +	{}
> +};

It seems to be subjective, but I think most nit-pickers in the kernel
prefer { } over {} to match the spacing in the non-empty initializers.

Best regards
Uwe

--4kuywhcc5gf5klas
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqnoz4ACgkQj4D7WH0S
/k6wBgf/VDlnoO5+iXo8tNZhitG0NPObCWmA3qnUxY31Go2pWwo5D7mENYe58DQf
LbOjfyHM3rG5ajmQJpNpoxoWanM8pHm1pbf7WjzZXg8WxLPnc6Y6QmjA5rC1Rsoe
OaAlq3aB/SmDTaIo9WzaLTYU/UhsFNVrWjtqGWhRXgGod17Q1r4iEW6LZadLjsyw
8xYNabxMGbQJVZK8cXM2tJCC9n1O51+z8w01tQyZ4ze4J3Xw7v8uRXbDezOIqIee
/+z7LE3HPZKG04IMtzYplulwe4dmSdjkf81QWxDR5SFxRrlxNaSuxE12LKJ4DSS4
GL20Mp6Pvdl/Kqd1PwrNPdwUx4BNlw==
=LwSM
-----END PGP SIGNATURE-----

--4kuywhcc5gf5klas--


--===============6873979970421847470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6873979970421847470==--

