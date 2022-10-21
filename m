Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49491C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lbo+pjaZQao6UR50X8A5d5TqrVgKZ7InDHpg4eacPqw=; b=w8hOZP/DeY7kM4//BVODGX0JyW
	ihVo5ON4NjCNSOydoq+dkOJeTSJHcYZUSPLr1Ltl5YtnInOxtXBZyF3I1u8c8sUKI6KwUKcgETeLt
	O3hYQo1usJrppzu936D0i9CtdACsTvFrDSf7HN0wYFLcQiSme4WURbun70W6tbqaq/iYFuUU0WF3a
	2okMoRbLUtU/87C6n4uaSpS6lFJW1MTCc6+KG5lqSHvqq5CfRABaf3J4dHfn1V9V+eJSftoIbFFDZ
	0JYk3L3EpceMXFOZH/ytffT76YTy10FGhdG0sNo0au32koam7J5UAg02MSSE5rtrRkV0YdH+jdqZZ
	Tf38jvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrvm-007s8R-F0; Fri, 21 Oct 2022 13:19:22 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrvd-007s0q-40; Fri, 21 Oct 2022 13:19:14 +0000
Received: by mail-lf1-x131.google.com with SMTP id bp15so4996085lfb.13;
        Fri, 21 Oct 2022 06:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kSylMpx0YFsO31Hjkjkcjn2msnx+oITUaLGfh+0vVIE=;
        b=pCPCyBdcW1Dxce4rSpZGxMbdmm3k4A8+8OJ+rBpD3sbTSRkrm98zqrhlvRnQWFeiPg
         MvE5i8PbKLTNGMCyql6GsXQQQ4AR2ycbx55uOON8fjLAXKw1N1IBmzFeQxB0fFF0QTvZ
         sCGFD9eb/7U66Fpi96reXKRp56nrV4AmnyftOqBEv2yi3p1CsRspKkhJVvp6/3qJ1su6
         pkHlAUz4/0AKk43eHoddYd1qtd+kWkhCaZublMPgaLlXzl7DWblkEvA7QSZTmVRiU630
         2QBEo8/zjdrjSYeh4Rw9zactbfWk8r4o2nbgHhwqzAUkO1V/qtgpjOR8LbtCfaPN8YmA
         /Xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSylMpx0YFsO31Hjkjkcjn2msnx+oITUaLGfh+0vVIE=;
        b=LhQMAVy0C+0uS6eLF5c1qczxYJhYnm7qr080QoE6k8dzOvzcc8H/mpCpxHzLSpUTzJ
         /HdW5pC0t8SH7ru8aYNDsm6cAb1SIuyZSSaEvVnPfHwRXZisO2Hx1k63MLamXlOTILYH
         EBf05M1xwqa9OK4jBAzIbsiTCgw3ej6PZjhkGo3FjF4xO/EWwOjdFuyP+HKwsVdTerHt
         33X0M2nGjIUbi3QaUxrraatqor71vE+LXXx7GJgfb15SxZoBcZgNPUdU/NlqxxK1zp1n
         rJ3ED/2CeQvfM/WkwpwqXpDTXsobiPvkdSaP1/2W65CwEDcYtgZ9I4BgccP0SK4qjeBE
         KqqQ==
X-Gm-Message-State: ACrzQf3hFWLHMewSXIJeBwPYXKYP3rCXBmOPz6MfKg1+a3TIMAHWpGiF
	jZLC+jsiB/8Jw87yT4tkbUk=
X-Google-Smtp-Source: AMsMyM4B1Gz1PwwH2+BbftHuFfixXyGIDvs32ddQqbNWh+grybL2k3HLNZB+9j1dXvJuph8bTTYW2w==
X-Received: by 2002:a05:6512:1681:b0:4a2:1925:e3ff with SMTP id bu1-20020a056512168100b004a21925e3ffmr7580907lfb.517.1666358350758;
        Fri, 21 Oct 2022 06:19:10 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
        by smtp.gmail.com with ESMTPSA id t28-20020a05651c205c00b0026e02eb613csm3398419ljo.18.2022.10.21.06.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:19:09 -0700 (PDT)
Date: Fri, 21 Oct 2022 16:19:04 +0300
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
Subject: [PATCH v4 4/4] hwmon: adm1177: simplify using
 devm_regulator_get_enable()
Message-ID: <7773541795f280db31dd981ffc21df8a630b794a.1666357434.git.mazziesaccount@gmail.com>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1666357434.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_061913_229087_85DAD75F 
X-CRM114-Status: GOOD (  15.65  )
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
Content-Type: multipart/mixed; boundary="===============0085039236562696127=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0085039236562696127==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LNJ8AAv0zmlHvO2X"
Content-Disposition: inline


--LNJ8AAv0zmlHvO2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Drop open-coded pattern: 'devm_regulator_get(), regulator_enable(),
add_action_or_reset(regulator_disable)' and use the
devm_regulator_get_enable() and drop the pointer to the regulator.
This simplifies code and makes it less tempting to add manual control
for the regulator which is also controlled by devm.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>

---
v2 =3D> v3:
New patch
---
 drivers/hwmon/adm1177.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
index 0c5dbc5e33b4..be17a26a84f1 100644
--- a/drivers/hwmon/adm1177.c
+++ b/drivers/hwmon/adm1177.c
@@ -26,14 +26,12 @@
 /**
  * struct adm1177_state - driver instance specific data
  * @client:		pointer to i2c client
- * @reg:		regulator info for the power supply of the device
  * @r_sense_uohm:	current sense resistor value
  * @alert_threshold_ua:	current limit for shutdown
  * @vrange_high:	internal voltage divider
  */
 struct adm1177_state {
 	struct i2c_client	*client;
-	struct regulator	*reg;
 	u32			r_sense_uohm;
 	u32			alert_threshold_ua;
 	bool			vrange_high;
@@ -189,13 +187,6 @@ static const struct hwmon_chip_info adm1177_chip_info =
=3D {
 	.info =3D adm1177_info,
 };
=20
-static void adm1177_remove(void *data)
-{
-	struct adm1177_state *st =3D data;
-
-	regulator_disable(st->reg);
-}
-
 static int adm1177_probe(struct i2c_client *client)
 {
 	struct device *dev =3D &client->dev;
@@ -210,21 +201,9 @@ static int adm1177_probe(struct i2c_client *client)
=20
 	st->client =3D client;
=20
-	st->reg =3D devm_regulator_get_optional(&client->dev, "vref");
-	if (IS_ERR(st->reg)) {
-		if (PTR_ERR(st->reg) =3D=3D -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		st->reg =3D NULL;
-	} else {
-		ret =3D regulator_enable(st->reg);
-		if (ret)
-			return ret;
-		ret =3D devm_add_action_or_reset(&client->dev, adm1177_remove,
-					       st);
-		if (ret)
-			return ret;
-	}
+	ret =3D devm_regulator_get_enable_optional(&client->dev, "vref");
+	if (ret =3D=3D -EPROBE_DEFER)
+		return -EPROBE_DEFER;
=20
 	if (device_property_read_u32(dev, "shunt-resistor-micro-ohms",
 				     &st->r_sense_uohm))
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

--LNJ8AAv0zmlHvO2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNSnEgACgkQeFA3/03a
ocXPvwgAun6eU41kkrvzy+dbHSs4Z56InICDSb5ZiwM1LMLovJ07qcF9l187tw70
FKRnuRPz02GuzMiZbxxv1vbZ9mQtvKrHgQikiuhopx4O8fdesdNGvf/5LGKGcr7n
uuWSI+R+6obt7WyZOoO85KrCIXehRfRGMWEAqJtztlfF+SmQDbbPuwxePYNt5tyk
1/v3ZHiDBFWIP5SdVBkn/uEwGisVbodkhh8g6G9CF68ubMIpJEtO2YfGmbwOJGBs
hWzuPnYcun0hdtOQs0iyvHzbGV229OqpDJoTbe7+ZmkQgNVG5wq4NREC9U8kg0BN
5WaVxylnzRD6aew57/PKqteO4AWbkA==
=Tmnu
-----END PGP SIGNATURE-----

--LNJ8AAv0zmlHvO2X--


--===============0085039236562696127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0085039236562696127==--

