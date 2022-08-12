Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5F3C00140
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Aug 2022 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7QqvMd0BTk6yZebUMfM0Vmil9Bx3DIp+tRyXr0AM24=; b=Zsup7gfG981biq0OvAiBVksPNm
	qh1LhMFn5DEFcdTcNOz+zyv6RxIC38jQPPBHAHKC9BTgMyBy9yFQ8bFLujR0+pJfC8kim1HG0pZwV
	JUZcRO5R2C8Vwk2MEoEGEyVgrqEYnBMrVsuuyAcAgvNnxz+5Oc5+HSJakquj2Hn0TKjjIRKuknrWa
	kDjsjzTm8hVCP1hlFtnk4pROFAif9Eb+pyxGp7ePMOfhOKPD7cBQcmumx6XCRBZ1Wg7dpUuorCCeF
	NSLvvpftBKL4Ocg0YAHHNr2nHqc2wH6ttPG4Og33KL+ebcH76If/optShEGfbJn8mVCkEvHVzuVhY
	pnlNCLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMReB-004nxy-8P; Fri, 12 Aug 2022 10:12:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMRdf-004n7h-KT; Fri, 12 Aug 2022 10:11:39 +0000
Received: by mail-lf1-x130.google.com with SMTP id a9so684533lfm.12;
        Fri, 12 Aug 2022 03:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=6aDzddAdi44gYxrtGzveI8akk+ZLwKh2Jsp1l+35n5M=;
        b=Q+3sLXPMIeE2lr8ycY3m5xLmWKjUKdY+/y2OWnnTBfTY4EuhUxMHlTfjcNOi1HTbkt
         3dBmfvGNeHbZ0HbmM4st2HjDTDHYu26MMAOXD6OJEcfS/HQvuSBlinhjrPCQc1mAqJzd
         POaxkLRQGk9/fw/H6a1YB80KUrRYJvylB2tJhxXxE15r5GZhc+HhE9QVhGE8b4MG503F
         JAEG67em8oUa4w0Vutxw67ugsmfW8GyNxbRDSL37q+XW1toBFfJoB+n00OG64sHSXULS
         4x0NYx2TlidOqAM+vExwUDYG85Yi5K6zRZhN8Ac0nuQFwxwhHWesDxw1H5+MFcsiKa6c
         iFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=6aDzddAdi44gYxrtGzveI8akk+ZLwKh2Jsp1l+35n5M=;
        b=VPBtFj9dMVHWGnTWVr7MBqsv3D7nA61Jdl4XPJNkHY2I9XxE+qQ6yHxeOknJDKtsSq
         Owiqo+RBXI02Ie2+rnLtgszlU6A4VS/3vYpbtmpHEvDwaPCJihL876FelcWBTl7Hi/La
         EyU9jRlLkCv/JHxQNSa212tewv+Po/2UO+bqn16P/IEoYyFl0DlD8ttarxaqCnjqU/YB
         xcNIb1zOAq5aySIry28kEtLngQeD37TyvvqwZ1kRwH74vPqQoCSUaSales633A98jlXR
         tTLPCuZfhYUSa5s2BvlbKbyRx6qRKUb317e6qNkC1M0gk8QEUTy9YvexpV+WN7ybRF8H
         E0SA==
X-Gm-Message-State: ACgBeo1bsn1BErnu9adHsHWCFyUyD7rGIk0rp94OuxvJcK19UqheJ9T3
	32HdPa0rLS83K7CBPFTwL+Y=
X-Google-Smtp-Source: AA6agR5pNSqr97WKqmglCzCsOwtkCD5QhIzi4+k+Y/zOxRe9qNoFU4jVUA/TOBFEMWXyD+dQOb+w0Q==
X-Received: by 2002:a05:6512:3403:b0:48c:9727:50b0 with SMTP id i3-20020a056512340300b0048c972750b0mr972034lfr.309.1660299094169;
        Fri, 12 Aug 2022 03:11:34 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id t13-20020a056512068d00b0048b052a7980sm160143lfe.168.2022.08.12.03.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 03:11:33 -0700 (PDT)
Date: Fri, 12 Aug 2022 13:11:29 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/7] gpu: drm: simplify drivers using
 devm_regulator_*get_enable*()
Message-ID: <986ab4650ee4fb6fa9ec1a813152ac36da6119ce.1660292316.git.mazziesaccount@gmail.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1660292316.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_031135_782730_8A029A01 
X-CRM114-Status: GOOD (  16.73  )
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
Content-Type: multipart/mixed; boundary="===============7189232967375526817=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7189232967375526817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZglrX0HKdtncVIEd"
Content-Disposition: inline


--ZglrX0HKdtncVIEd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify drivers using managed "regulator get and enable".

meson:
Use the devm_regulator_get_enable_optional(). Also drop the seemingly
unused struct member 'hdmi_supply'.

sii902x:
Simplify using devm_regulator_bulk_get_enable()

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
RFCv1 =3D> v2:
- Change also sii902x to use devm_regulator_bulk_get_enable()

Please note - this is only compile-tested due to the lack of HW. Careful
review and testing is _highly_ appreciated.
---
 drivers/gpu/drm/bridge/sii902x.c      | 22 +++-------------------
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
 2 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii9=
02x.c
index 65549fbfdc87..4bf572b7ca77 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -170,7 +170,6 @@ struct sii902x {
 	struct drm_connector connector;
 	struct gpio_desc *reset_gpio;
 	struct i2c_mux_core *i2cmux;
-	struct regulator_bulk_data supplies[2];
 	bool sink_is_hdmi;
 	/*
 	 * Mutex protects audio and video functions from interfering
@@ -1070,6 +1069,7 @@ static int sii902x_probe(struct i2c_client *client,
 	struct device *dev =3D &client->dev;
 	struct device_node *endpoint;
 	struct sii902x *sii902x;
+	static const char * const supplies[] =3D {"iovcc", "cvcc12"};
 	int ret;
=20
 	ret =3D i2c_check_functionality(client->adapter,
@@ -1120,27 +1120,13 @@ static int sii902x_probe(struct i2c_client *client,
=20
 	mutex_init(&sii902x->mutex);
=20
-	sii902x->supplies[0].supply =3D "iovcc";
-	sii902x->supplies[1].supply =3D "cvcc12";
-	ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(sii902x->supplies),
-				      sii902x->supplies);
-	if (ret < 0)
-		return ret;
-
-	ret =3D regulator_bulk_enable(ARRAY_SIZE(sii902x->supplies),
-				    sii902x->supplies);
+	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(supplies), supplie=
s);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "Failed to enable supplies");
 		return ret;
 	}
=20
-	ret =3D sii902x_init(sii902x);
-	if (ret < 0) {
-		regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
-				       sii902x->supplies);
-	}
-
-	return ret;
+	return sii902x_init(sii902x);
 }
=20
 static int sii902x_remove(struct i2c_client *client)
@@ -1150,8 +1136,6 @@ static int sii902x_remove(struct i2c_client *client)
=20
 	i2c_mux_del_adapters(sii902x->i2cmux);
 	drm_bridge_remove(&sii902x->bridge);
-	regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
-			       sii902x->supplies);
=20
 	return 0;
 }
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/=
meson_dw_hdmi.c
index 5cd2b2ebbbd3..7642f740272b 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -140,7 +140,6 @@ struct meson_dw_hdmi {
 	struct reset_control *hdmitx_apb;
 	struct reset_control *hdmitx_ctrl;
 	struct reset_control *hdmitx_phy;
-	struct regulator *hdmi_supply;
 	u32 irq_stat;
 	struct dw_hdmi *hdmi;
 	struct drm_bridge *bridge;
@@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *m=
eson_dw_hdmi)
=20
 }
=20
-static void meson_disable_regulator(void *data)
-{
-	regulator_disable(data);
-}
-
 static void meson_disable_clk(void *data)
 {
 	clk_disable_unprepare(data);
@@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, stru=
ct device *master,
 	meson_dw_hdmi->data =3D match;
 	dw_plat_data =3D &meson_dw_hdmi->dw_plat_data;
=20
-	meson_dw_hdmi->hdmi_supply =3D devm_regulator_get_optional(dev, "hdmi");
-	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
-		if (PTR_ERR(meson_dw_hdmi->hdmi_supply) =3D=3D -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		meson_dw_hdmi->hdmi_supply =3D NULL;
-	} else {
-		ret =3D regulator_enable(meson_dw_hdmi->hdmi_supply);
-		if (ret)
-			return ret;
-		ret =3D devm_add_action_or_reset(dev, meson_disable_regulator,
-					       meson_dw_hdmi->hdmi_supply);
-		if (ret)
-			return ret;
-	}
+	ret =3D devm_regulator_get_enable_optional(dev, "hdmi");
+	if (ret !=3D -ENODEV)
+		return ret;
=20
 	meson_dw_hdmi->hdmitx_apb =3D devm_reset_control_get_exclusive(dev,
 						"hdmitx_apb");
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

--ZglrX0HKdtncVIEd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmL2J1AACgkQeFA3/03a
ocXSqAf/VegCKp8gEwmyftaqdq9aTM7DX2Kktp0s+iK2JcKZ7zLzga4D3RRXlXs/
CsdpQ2uBx/lHbDi4leEwpCHSabV6AGBHxzGHbuyMckWRak46bOwuybhU/6AZqwNW
QH9sNCqUDjVRqXQ9kpoejELJXJOIts6bDQ12WQHHAv5r5nIyz5Qv4hfIJMUF4AhF
/RLkgLwj+hEpC+Kk0M8m+q/Gu+vdZO7HuZZYIXO8CxnOSYVsySL1COkHDj1+tkPh
NR6XoM8p8LxFzX1HvZM14sonIc6Fok0qIbUDUwELlin8YKMtsWNivVRjv7xiHQva
skZaRpV8t4qzAvHQOAt9hHy027E3Cg==
=TFoX
-----END PGP SIGNATURE-----

--ZglrX0HKdtncVIEd--


--===============7189232967375526817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7189232967375526817==--

