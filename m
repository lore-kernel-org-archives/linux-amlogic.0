Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B121EC43217
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qkvwp2pAVYcJandbLz8n1LHOudJVPtO3K7C0csiYOq8=; b=GCA
	ADz7VjfugNcT48qpCEeOa0aX+hOf8Sz1EzXJ/Ace0o4YGYU+F8733MEkswBcdQCjVeqS38Lx6Bun7
	EFTp0os+mE80EHDMjsYKi22HGMWdayeYTsQjyzGDALfnIPWeAOp7EhY8fYNGFSptjRWUVjcIxSyz4
	NLggSbivLLoOhjywgmnahIAkGvbqkWuKWHwpn4OlcRT+P8H37XA6xpNhSDpDdnowsspTrgFtf+hok
	zMiZQQT0oZPZCLC782usIGI3E/3ARIsqhXyIK8ybsg3LOSp+Hva6pnDdIFiGeH1SVTUf5TzkZgWf2
	Vit/SVXrTFJ88SD0H3b1NyzaLN5wGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olruW-007rP2-UH; Fri, 21 Oct 2022 13:18:04 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olruV-007rFX-0o; Fri, 21 Oct 2022 13:18:04 +0000
Received: by mail-lf1-x134.google.com with SMTP id j4so5168790lfk.0;
        Fri, 21 Oct 2022 06:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6OsdhUjW7L1QAZe7IfDCMt4jC7eaRPds2f3xTvTcWM=;
        b=NvXmRpLEwW15x4sHw8WsKT9UISkiiOEvlUYJsc3+jtM5BAz28eKD5C8fMmm2QEafXQ
         i9Iymyq6iBLiS2ccEq8b6W4IZS+Fcyjh3rsbLHN8wSvQqAm0yVLSqzl/PEHgfYYRahJ3
         +VHk7QCBW1774fIlJrdE4xfOUNzoRqGKay+NDBvJhMBd0RKK3fGvl+tJc6sde66KVPn6
         COZB2dWm/yBfpCIsUh6m48vuO4BKIL6Her8uuHef5YkURs86J2WBWpDGrbC+sfsF5PgG
         1pArS5cCtKAg/1z/HAdiHw6TnEj2cr/FKxFi/isKtdBv2owKM/6Bp7OR5xmT8lbSkgV0
         vptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6OsdhUjW7L1QAZe7IfDCMt4jC7eaRPds2f3xTvTcWM=;
        b=Goz/yhP6jGtV7eRK3OeWhxXhRf/WbWg2Ug/k6s6GFCGtB1OGk0Yie+1cFcaaMmgWJ4
         Yma8BC2O7XYtM817SlGu/Oj8ZgXJfGo7ROFmQPqcphGn/hCjiLwdPE+hYtRBVhAyampb
         RcptfAVMlDmNxd9eG9+9FHGas05Qgu4EgMLO1O0yFU+iT3y11YrxzN6oJcTe9DFmLxGb
         GlWQeaaBwkNRxB4dgGiOrQl9fjtUZLJUf/elAHMTNo3HtKezDGm0htSjlo/1zMmNxlfo
         h26f7cLC0soWfelMNpV6fmaktPbBkOiHuESnRXzkGgH2RWmHBiOoMo8VH9TAtwYAU5Qz
         jStg==
X-Gm-Message-State: ACrzQf3mSBJNQoJZGlPHG3GxL73u8yZ1XGNJ4UsOxjvJ4R/SZoB7RdlA
	tU1W4Ir3PcpgHKAaXL9ZAKc=
X-Google-Smtp-Source: AMsMyM45sQCWIL00BKCqmckZv7XIyZNPhMuNPcqRjItA+8zp2cjZJgscTuO6QkpAf44MY1NK69uMIA==
X-Received: by 2002:ac2:483b:0:b0:4a6:f5d3:dd07 with SMTP id 27-20020ac2483b000000b004a6f5d3dd07mr1723500lft.233.1666358266558;
        Fri, 21 Oct 2022 06:17:46 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
        by smtp.gmail.com with ESMTPSA id m7-20020a2e9107000000b0026fb4d20636sm3417298ljg.17.2022.10.21.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:17:45 -0700 (PDT)
Date: Fri, 21 Oct 2022 16:17:37 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org
Subject: [PATCH v4 0/4] Use devm helpers for regulator get and enable
Message-ID: <cover.1666357434.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_061803_086863_8B7839F2 
X-CRM114-Status: GOOD (  13.37  )
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
Content-Type: multipart/mixed; boundary="===============8476725580629133509=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8476725580629133509==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uZtN7dB4zT5zFsmG"
Content-Disposition: inline


--uZtN7dB4zT5zFsmG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify couple of drivers by using the new devm_regulator_*get_enable*()

These patches were previously part of the series:
https://lore.kernel.org/lkml/cover.1660934107.git.mazziesaccount@gmail.com/
"Devm helpers for regulator get and enable". I did keep the patch series
versioning even though I changed the series name (subject of this mail)
to "Use devm helpers for regulator get and enable". Name was changed
because the devm helpers are already in 6.1-rc1.

Also, most of the patches in the series are already merged to subsystem
trees so this series now contains only the patches that have not yet
been merged. I hope they can be now directly taken sirectly into
respective subsystem trees as the dependencies should be in v6.1-rc1.

Please note that these changes are only compile-tested as I don't have
the HW to do proper testing. Thus, reviewing / testing is highly
appreciated.

Revision history:

v3 =3D> v4:
	- Drop applied patches
	- rewrite cover-letter
	- rebase on v6.1-rc1
	- split meson and sii902x into own patches as requested.
	- slightly modify dev_err_probe() return in sii902x.

---

Matti Vaittinen (4):
  gpu: drm: meson: Use devm_regulator_*get_enable*()
  gpu: drm: sii902x: Use devm_regulator_bulk_get_enable()
  hwmon: lm90: simplify using devm_regulator_get_enable()
  hwmon: adm1177: simplify using devm_regulator_get_enable()

 drivers/gpu/drm/bridge/sii902x.c      | 26 ++++----------------------
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
 drivers/hwmon/adm1177.c               | 27 +++------------------------
 drivers/hwmon/lm90.c                  | 20 ++------------------
 4 files changed, 12 insertions(+), 84 deletions(-)


base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
--=20
2.37.3


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--uZtN7dB4zT5zFsmG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNSm+wACgkQeFA3/03a
ocUk8wf9GPfjBtyvD9zhemcPtbAvMi1mDRXVTeferJLMfZOaxAHzotYu/L1BsSmr
tHKDT7ApHkeVbmnnc9jzIb1g71n9qBPkNWj5fsXkYMLrwv8ngU9OVZjKSXj2du+n
hpc3j+0OLO4v8KYQN7wcHo4vyINm/3xXwoiKDAm43IWja45PBti+r8V3WvtiVf1h
GWPmS0ZiU2imPdmNSnOxVjh+1EtNDMQlFDu/Fv1dU2MYuLZAM6bkJfRs9gYmu1w9
RvKW1HEEk2moacyue7LVlseaa2Y38togIUAYEy5Hz/h+MqZPEuE1KirPlrW7/6wP
TVYakMaJuld2nhQS8hIce5Tuds4jsg==
=wmbp
-----END PGP SIGNATURE-----

--uZtN7dB4zT5zFsmG--


--===============8476725580629133509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8476725580629133509==--

