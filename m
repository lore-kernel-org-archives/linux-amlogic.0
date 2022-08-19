Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031ECC32792
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Aug 2022 19:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/lVxqaSlWpPv9rcCuSvfCDxDLftjbwJoTB+EY/DV7vY=; b=txX
	YgHJrDZhVdqrDq5VLGj5b+tzbiD7nZiq/c+A4F08/J6H4lFA79/OdAvu4cXxIUAMEjmJcTupYZp+u
	YGseRifBWTtbbGm5OMVLFdEeVyd9izxyHFCqfj/Ya/sjWSANBXy+GDmxl0Gd5MlrciespoBoSQ4un
	lperUojsb6eOw3YIAujWOoDTagMj7kXBzOaG9Qe7K315uwjE8IoNWnpx0OpGvsYcas8nTevdt9l0e
	a/F+codZAUdB1ViL8VsCBK+9TiHjwCNXVoUL+13mvxX516THCPMCno2uBzKekVK5cKSwRRfw7qIdz
	Qw+82uiNgByzqLyepE1F5W+ourGCGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP7Uc-00BWSo-BP; Fri, 19 Aug 2022 19:17:18 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP7UZ-00BWQS-7N; Fri, 19 Aug 2022 19:17:16 +0000
Received: by mail-lf1-x134.google.com with SMTP id a9so7261019lfm.12;
        Fri, 19 Aug 2022 12:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc;
        bh=9edAeyqaKV/eGnwpb24p/sONsQF5z28Zi5ENLBQsjis=;
        b=h6ypV1yJJL0qgQWg/+xo1mrjVedomBmbMvZzcElTA/w5mp5AzC6W+u6FM9JDglXkIG
         f0EFLHWGo01cUs200DNYrrE6L7hXnRJgrmsN3nxPtq0WRtbiVaWN0fK7/Bozw+co8ct3
         N7jegGVnAPQ6/HVWGzefch1Xj7qjpj5QD9aeg6b/BAwEzRoHMSeCzqFpyzI7bt44XxEf
         PkgVNQHotIjqfqbYWMSGqsZl1QgjFRS16rUzvyO+euq9YakFRFWR0EKnqy86MKW/Qf2G
         +C/mu5/XgdOkFRaygzwDwmWhPYn3zHZ7r39kQU7pF39sfCqo+neujKXn6s0k1jENe6My
         ngQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=9edAeyqaKV/eGnwpb24p/sONsQF5z28Zi5ENLBQsjis=;
        b=eI2ifyHWNNhWZLDbr7MuE7d2yLP+GElWQ1NihCm/Un7RVHS68Tw9tqhSIDF/SAfwyp
         ruum4AIL4vKkLVFDJ79RDvNkG01DBCm5FcGiJDBjls/K8xlTi+bolAP/u84i/A+UlU/R
         qd/9bSdc/K8nhATyyg+NaV3MrkFhSuUqvVS7wVWmVOgBq++ogBfSwFxpJIEvUiqUpf18
         TRxt1eOdo/VmnI8+aW3Xn8YURU0JNZQeZjo1Qy/LNCY/zTKRFI16xK0/kgOWjdWvkZ9f
         edcOThTuaIhjDGQY01IVjuCuhJGtKup/KmO7hxlOgfYKe1RzZ3LHZrYB6UxjcLQRzNne
         DOlw==
X-Gm-Message-State: ACgBeo2WbH1NJJryen3HBPzIjnwuuuXkn8RHmYX6Wx1MrlepwL9WjYeq
	X+oEMyin/wapm18Qs0nH8hs=
X-Google-Smtp-Source: AA6agR6L/s1W7mzQnKhc+50x8bAWnpqHS1+yAXDPOhAZzl8NwA/GrakaeTQCnoodLt11WOWWYq+qjA==
X-Received: by 2002:a05:6512:23a7:b0:492:b613:817 with SMTP id c39-20020a05651223a700b00492b6130817mr2872025lfv.492.1660936632748;
        Fri, 19 Aug 2022 12:17:12 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
        by smtp.gmail.com with ESMTPSA id u17-20020ac243d1000000b0048afeb4ea32sm737760lfl.100.2022.08.19.12.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 12:17:11 -0700 (PDT)
Date: Fri, 19 Aug 2022 22:16:48 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Peter Rosin <peda@axentia.se>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Alexandru Ardelean <aardelean@deviqon.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Alexandru Lazar <alazar@startmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Xiang wangx <wangxiang@cdjrlc.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v3 00/14] Use devm helpers for regulator get and enable
Message-ID: <cover.1660934107.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_121715_325735_D89DEBE5 
X-CRM114-Status: GOOD (  15.13  )
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
Content-Type: multipart/mixed; boundary="===============5877659711537485409=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5877659711537485409==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+OPEAUCAFHQMa3jU"
Content-Disposition: inline


--+OPEAUCAFHQMa3jU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Use devm helpers for regulator get and enable

NOTE: The series depends on commit
ee94aff2628b ("Devm helpers for regulator get and enable")
which currently sits in Mark's regulator/for-next

A few* drivers seem to pattern demonstrated by pseudocode:

- devm_regulator_get()
- regulator_enable()
- devm_add_action_or_reset(regulator_disable())

devm helpers for this pattern were added to remove bunch of code from
drivers. Typically following:

- replace 3 calls (devm_regulator_get[_optional](), regulator_enable(),
  devm_add_action_or_reset()) with just one
  (devm_regulator_get_enable[_optional]()).
- drop disable callback.

I believe this simplifies things by removing some dublicated code.

This series reowrks a few drivers. There is still plenty of fish in the
sea for people who like to improve the code (or count the beans ;]).

Finally - most of the converted drivers have not been tested (other than
compile-tested) due to lack of HW. All reviews and testing is _highly_
appreciated (as always!).

Revision history:

v3:
	- Drop already applied helper patches
	- Add a few more drivers

RFCv1 =3D> v2:
	- Add devm_regulator_bulk_get_enable() and
	  devm_regulator_bulk_put()
	- Convert a couple of drivers to use the new
	  devm_regulator_bulk_get_enable().
	- Squash all IIO patches into one.

Patch 1:
	Add new devm-helper APIs to docs.
Patch 2:
	simplified CLK driver(s)
Patch 3:
	simplified GPU driver(s)
Patch 4 - 5:
	simplified hwmon driver(s)
Patch 6 - 14:
	simplified IIO driver(s)

---

Matti Vaittinen (14):
  docs: devres: regulator: Add new get_enable functions to devres.rst
  clk: cdce925: simplify using devm_regulator_get_enable()
  gpu: drm: simplify drivers using devm_regulator_*get_enable*()
  hwmon: lm90: simplify using devm_regulator_get_enable()
  hwmon: adm1177: simplify using devm_regulator_get_enable()
  iio: ad7192: Simplify using devm_regulator_get_enable()
  iio: ltc2688: Simplify using devm_regulator_*get_enable()
  iio: bmg160_core: Simplify using devm_regulator_*get_enable()
  iio: st_lsm6dsx: Simplify using devm_regulator_*get_enable()
  iio: ad7476: simplify using devm_regulator_get_enable()
  iio: ad7606: simplify using devm_regulator_get_enable()
  iio: max1241: simplify using devm_regulator_get_enable()
  iio: max1363: simplify using devm_regulator_get_enable()
  iio: hmc425a: simplify using devm_regulator_get_enable()

 .../driver-api/driver-model/devres.rst        |  4 +++
 drivers/clk/clk-cdce925.c                     | 21 +++----------
 drivers/gpu/drm/bridge/sii902x.c              | 22 ++------------
 drivers/gpu/drm/meson/meson_dw_hdmi.c         | 23 ++------------
 drivers/hwmon/adm1177.c                       | 27 ++---------------
 drivers/hwmon/lm90.c                          | 15 ++--------
 drivers/iio/adc/ad7192.c                      | 15 ++--------
 drivers/iio/adc/ad7476.c                      | 11 +------
 drivers/iio/adc/ad7606.c                      | 22 ++------------
 drivers/iio/adc/ad7606.h                      |  1 -
 drivers/iio/adc/max1241.c                     | 28 ++---------------
 drivers/iio/adc/max1363.c                     | 11 +------
 drivers/iio/amplifiers/hmc425a.c              | 17 +----------
 drivers/iio/dac/ltc2688.c                     | 23 ++------------
 drivers/iio/gyro/bmg160_core.c                | 24 ++-------------
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |  2 --
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  | 30 ++++---------------
 17 files changed, 41 insertions(+), 255 deletions(-)

--=20
2.37.1


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

--+OPEAUCAFHQMa3jU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmL/4ZsACgkQeFA3/03a
ocX/Ggf7BfEmlDeq8mQqIXNuIXUyS1wDwJS/W6gY4qdxaESlklGTEbvGXSG+Ve1e
6z2kt2sAFyfZgJSLaTDNzwzp2ddc6FvVVxzdvFlb1cbJdr3Js/Tl+HGFM327Qjl3
lP8vDwi2tXXnaVyjY0/18mp6HkaziCMhzqN9LNBmF2XSs3F8pGfu5cs+EabMIo7Q
EOF+5ZbFeXeL9I7Kk5Y17WDenMn+glY/1mQnPjkSYoNX7riqZLY5clklNTHzcxPT
ADtFQBjEbRSgWzs2BApI3nDFMtjzqHewqo4iLodHgg1REBOoPDCP6PaKfKVDcArw
9GdbTYiQd0lG5g9zBodvD9ZjaVpRlQ==
=C7qu
-----END PGP SIGNATURE-----

--+OPEAUCAFHQMa3jU--


--===============5877659711537485409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5877659711537485409==--

