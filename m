Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E8BC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Nov 2022 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=doo0JWi73Umt5QCOD9KkqwVPwYXzrD2CfAXM4nU6Fbc=; b=jpD
	FvsVEYvFHzhazH0qSgN/IOr0iN/AuHObRbucMm5ZS5UFSyXyDAc1B8HHjbdGNrgcZP6HDYnjZ3BWJ
	YTatXLVMsEOVTV0I2d+Xs8UBe+75aXt5snY8bDBAmTiDxBCLD620AUsOSjzTRqTrFEj5dvF9CB0R+
	7+4krlX061AO5tRxBH3S9jJxxaGYulxLY5uybhd7A8SXzP1VI5xmwErh0a1v3DOA+oy4xRhpuM7i+
	juRNCb+uPyRa7UFRfMxrq3VgIVwPLfy0zPZg4eral6jxqsl0e1uJkPKRbJseVlh69DeK/nhm8+5Dg
	NFMh4n5C9vDt8LCv6ZBUtmSTZRd0mow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovI4d-003eiP-Sx; Wed, 16 Nov 2022 13:03:27 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovI4R-003ebc-8r; Wed, 16 Nov 2022 13:03:17 +0000
Received: by mail-lf1-x12d.google.com with SMTP id d6so29348411lfs.10;
        Wed, 16 Nov 2022 05:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yj1uHK7HEYHiWFNEA4c6ztqJMkzjkf4XEFeM+LwxtIg=;
        b=DQqtzDKWBRTTXrTN9hNrp+mtDefk1sMRvbwnlYah2vXNkxG9puls0fYPV+phkNSdFW
         tlfwHOcvpqNA18GculZlgXIGwceB/LVIJlVMRIf8G1z0/6CGdTd1VWLUJMsP4tZbVaFS
         YLYSNYLsZBmUxGis5weeBHTPBW+KWHEhG0hF2k8uXZvRiX1phQBxlAweebBbn5MCDYAf
         KZPP80JcWP/6zUqVaO2p3aC7OvanvwK1xmSQBsThqwNsfFHpRKEniRUyASzYJsX8VafY
         I41RtTe4Vq1DAUdY6ZsZlHmgB3Vh826+JdSXO14quqCwX6XhtZeOtni3R+MY5QkXtexS
         KV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yj1uHK7HEYHiWFNEA4c6ztqJMkzjkf4XEFeM+LwxtIg=;
        b=GGjg++BtTeZ6X3BDqKoRxF2yNjIwrQOo70sqQKj8XKuC7qiNomAsIMAVxvgv4FstRF
         rjCa5ItJ0sGZDBJOf/Hkn5Kge5em4WMtOC7hZFd/MhwYzQWFCwcpQxPQPegKXyFVqcwg
         hBb4gN0e5HFZIL7uE44+XB5GPF1VEMZjVdVBrfGG/eimdeCjAhB+gulE3yeC1IPg9iQg
         onO0tJ5JoWdfOU5+dyOsHm5WjHXuJx6EYFKCk741tTUEJLhvaiEhX9yKVJMCHpsDXSxU
         sl4I0hWvormxTKNj9hAHcib2Qsv4gR2JXnUguYDaSk7/I0q8jKsIIXqle23sZlrOdhEL
         011Q==
X-Gm-Message-State: ANoB5pkXsiNFZy8n3VGi7sETA4fX9NvqutX333+/C3mapRZQhARjCUFF
	/FuSrMuE4TKxDj2znrUkKEk=
X-Google-Smtp-Source: AA0mqf7AzfIzexM2z7u+Uqd3EVkiLAzQw1oHH8gedmcDfckXG3tZna2CfFK4Bwj1l2ZwJnkRNoljSA==
X-Received: by 2002:ac2:55a1:0:b0:494:9680:5036 with SMTP id y1-20020ac255a1000000b0049496805036mr6845823lfg.416.1668603791679;
        Wed, 16 Nov 2022 05:03:11 -0800 (PST)
Received: from dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::7])
        by smtp.gmail.com with ESMTPSA id r18-20020a2e8e32000000b0026c4305e5e2sm3002831ljk.53.2022.11.16.05.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 05:03:10 -0800 (PST)
Date: Wed, 16 Nov 2022 15:02:41 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Kevin Hilman <khilman@baylibre.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Liam Girdwood <lgirdwood@gmail.com>,
	David Airlie <airlied@gmail.com>
Subject: [PATCH RESEND v4 0/2] Use devm helpers for regulator get and enable
Message-ID: <cover.1668602942.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_050315_334192_57BDC0C5 
X-CRM114-Status: GOOD (  14.61  )
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
Content-Type: multipart/mixed; boundary="===============2320605767425196615=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2320605767425196615==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5Tght3fByM0oHga+"
Content-Disposition: inline


--5Tght3fByM0oHga+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify couple of drivers by using the new devm_regulator_*get_enable*()

Found these patches when doing some clean-up for my local git. Seems
like these two fell through the cracks while other were merged. So, this is
a respin of subset of original series v4.



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

Matti Vaittinen (2):
  gpu: drm: sii902x: Use devm_regulator_bulk_get_enable()
  gpu: drm: meson: Use devm_regulator_*get_enable*()

 drivers/gpu/drm/bridge/sii902x.c      | 26 ++++----------------------
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
 2 files changed, 7 insertions(+), 42 deletions(-)


base-commit: 094226ad94f471a9f19e8f8e7140a09c2625abaa
--=20
2.38.1


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

--5Tght3fByM0oHga+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmN032MACgkQeFA3/03a
ocUEvAgAjCWRtr46zfwvyaXn0DSSFgdHBz/YLZoO1HrDpIxcZuWYpBU4QHi5DzcN
dYCTy1OXLEYBx1FQarMFxcV/DsSskwDPzz/+XvlZH5crOqRPg71QTYZ6FO1xCVK+
Ws9cAFNhFU5EYjZcxG/AVkLAMTaQlcPlPu4hIog283gobsq40ApJbCdQGY5v8QXp
YhMiAnjeHOR3P3mEpTb6dV32WwDykP1a9bPuKb4yPT4F80sPLb7DGKYsAeeMBj2+
M1tuYjMHIJn8lERaCV28WudVTYU9BOCsXxRuitVRn3ro+wDIH9H/YhRuj3ylGLvf
OgiXECbDMP4UlrQdgHmh3TeaTZGxGw==
=joFx
-----END PGP SIGNATURE-----

--5Tght3fByM0oHga+--


--===============2320605767425196615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2320605767425196615==--

