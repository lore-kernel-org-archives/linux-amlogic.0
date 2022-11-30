Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457C9C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Nov 2022 09:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uoid08ZewfYRONCwFQD784nb4eEpR0IGvffH8wIV54g=; b=b0A0k661aDV2UdazgTQEatJW+j
	0e/8zs3ynljiKDj0mVD/N4VLZk+OsrJkKWMstapLGIpm+aL9CghzT9HjCIKolsGen2lAf9IsGdC3G
	bbbWWdPeL0Z9ZBVPlGTrT1drK91jB27UfsLALrdv3FmpgCi2Zw25VcrmLpI+W/YAWusvyQry3s2rB
	Ov56Gr/7p5o2QlUl49lyxtMmzOD8GOFxHku7I8fFg/Rf9+F0FgirEs5Kw9ZsDJ2NgqTifPKIa5/Pn
	ZszVKxImTuow7d9NzUCjw077m8UbK+d7rHS/1mVlHdBGq4dEh3TOib8M01NBv6u5EYSNugAJoaiBM
	VpQ3SWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JKY-00Ez5Q-SJ; Wed, 30 Nov 2022 09:24:39 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JJ7-00EyTH-Q1; Wed, 30 Nov 2022 09:23:11 +0000
Received: by mail-lj1-x230.google.com with SMTP id q7so20169430ljp.9;
        Wed, 30 Nov 2022 01:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yGai96t0pVD49z2Oe24kTckJ4TAh6OnuSc06LTgbBHs=;
        b=go472kIN5B1Uc+NA0wAic0hCbPCGr8DEEK4Ux8xipfXkD91wky5WY40pHPX1jcHOI5
         JhBAR8KL+7g1Q5ubS7962T/ToIxdQA9IZoFbZknAOflR3Mm6ojHloqIGWj4FTEBLkIdt
         p47glaUsIVE69a/LkSVoX2BZ6IlIQICilLCIP1p61fedXPHQP8u4UK0+J7AcuXsP4kbB
         msDLcrBd+bY/I1IOMpPpO0C3sM2YKO2GwqzJ7bkaBUEfFo4rsIq5aU4/eBh94ip1fiOR
         /NiCJFfXEE1uS6WJf2oi3KxHZ+p9jU4B/t9g2NIW0kLQAUKAir2ezlU1w9DvKsAhuGFr
         C9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGai96t0pVD49z2Oe24kTckJ4TAh6OnuSc06LTgbBHs=;
        b=efoYI2/E1cVHo2Fg7O3oXNvdBUMJHToGOKpSI70Ka88U5w1ZOy2pEAA/j4pTA8pRRR
         l2WcOcuW2hd81rHBWepvvpQG3BvonoVpV321XQnvaehcvvPUBvgyYBloDO3aewqVGGuN
         sUKdGth1VB+vtMF4vweh1fxkLJO3PYK8cczeAhafRs1C4gIA4GYgtO9VW2gpeuARd9xL
         gsGtuzjoJVVvroeOM0X5jJjXjk08fX1SsiGfOfDcjXe9FR5C3tJupJ8L2prtAhAcJNMv
         tY8It7TOSYd+4lbsQYoAJogAyUJL7svaOgBQGhWCS7lP0XEa2UYQdO3gVeCZTzhfm/jL
         QKCA==
X-Gm-Message-State: ANoB5pmd32U8hsBMiTqusjttoKgqls31sA/hOUERsB2WoHKF/4LvdKkA
	0Vgrsgn0cOR+A3+ds2bWqDg=
X-Google-Smtp-Source: AA0mqf6QzfIZXii01B5TmgIaVGOx8hXf2IofQ7Fvz/NTck20aLOkGH6AnMjK33uAlAASv3csnyEC7Q==
X-Received: by 2002:a2e:8750:0:b0:279:9466:9355 with SMTP id q16-20020a2e8750000000b0027994669355mr7804106ljj.253.1669800185798;
        Wed, 30 Nov 2022 01:23:05 -0800 (PST)
Received: from dc75zzyyyyyyyyyyyyygt-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyygt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::b])
        by smtp.gmail.com with ESMTPSA id t27-20020ac2549b000000b0049a4862966fsm182793lfk.146.2022.11.30.01.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 01:23:04 -0800 (PST)
Date: Wed, 30 Nov 2022 11:23:00 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND2 v4 2/2] drm/meson: dw-hdmi: Use
 devm_regulator_*get_enable*()
Message-ID: <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
References: <cover.1669799805.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1669799805.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_012309_892222_D9707AE4 
X-CRM114-Status: GOOD (  15.99  )
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
Content-Type: multipart/mixed; boundary="===============3555588582058539442=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3555588582058539442==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+FpHG9ThwonLOArJ"
Content-Disposition: inline


--+FpHG9ThwonLOArJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify using the devm_regulator_get_enable_optional(). Also drop the
now unused struct member 'hdmi_supply'.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Martin Blumenstingl <martin.blumenstingl@googlemail.com>

---
v4 resend 2:
Respinning unchanged code with the commit title changed as wa suggested
by Robert Foss and commit message changed as was suggested by Martin.

I am doing a clean-up for my local git and encountered this one.
Respinning as it seems this one fell through the cracks.
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

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

--+FpHG9ThwonLOArJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmOHIPMACgkQeFA3/03a
ocWCtwf/SqqXk1TmF3RIampIzoVrQFshZ9dfdQ6qZa4jPxhDGGo8ciDcfn5T85on
kokvVj+hJXDVO4y7RdOCkAHgrpsfpkeP/D0lpuweheJI4D+vQamC7w4IXawx+A1R
4/ep6+L1m/e9IvNDN5wjzonI0tHiiLk/9hevkphEa6ub4+SQJth/D8Lki+MthGn5
7WZlwzG9uZe2dfZBCZf/AlimWeiZffPO4MpG5qDWoX8Ww5c0522DTk9Ve5uDXGzY
B5mi24ZGT7drjnC+tma7tIC11wnFSzm5146qoGIdLN4WM4D9kYFjzNooDHGcGIvG
too31/Cs5RBF1g4dMEGRL1lbeuTMcw==
=cZNk
-----END PGP SIGNATURE-----

--+FpHG9ThwonLOArJ--


--===============3555588582058539442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3555588582058539442==--

