Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46576C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Nov 2022 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+WMDi5aLFOVlNUJ/BLuO3komr7d7u3kXik8T8djOHo=; b=F12XRtG8CN31GHbDXDm0tPIg6i
	Jq4/NaBCsyCEmBuGo+wgLMwr09hnsTNz3TH0xvUzTUV3hhWLMQ87+T/WzgroRlUoi7u9varii2z/E
	ssGy5pmPthJnba8bHCGmXnT+Te7uhF0dT4Zld4K78cdaXDo369BO+KLu2qHIOEcC4X5PjK0xl8d33
	HTFQfqtqsLWobRuXGEIDT6NvH0IveSkzq3CacUxQOF1G7NC1f8QfmZf0ak8nCW8L0J4Sv294BP/F1
	x2b9KhsS0YdLJAab/gU9BPbMqNZfqBbnj3sTCVHBSWDa0Ktc6oE1PCMdsAEvu091Bomak68Tmw2V9
	TJ32I/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovI5I-003f52-9m; Wed, 16 Nov 2022 13:04:08 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovI5F-003f0N-28; Wed, 16 Nov 2022 13:04:06 +0000
Received: by mail-lf1-x12e.google.com with SMTP id be13so29414992lfb.4;
        Wed, 16 Nov 2022 05:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/w2U0GiGwFFrflmNCFpCFLaMnMdqbHDas4my61VJ3H4=;
        b=KAgIfzEgdBLkeRinXDVjGiOgDz4zxSP/Q12JRlfv9kc3Z0v1GoUvkrvMdg61Aye5RF
         TzgwQMoR19i2nvfMfobkJVN2k2PS8K7zB7qRjke7MIHjC325iSFR6fcT1OZOg6XqS+6q
         4UbQn7/DqGiydfHGtx6F9lW/VEz0B5KI+bf5I3OniXwsnHcI/QxY4PLrgXhKLHFzJXGD
         OFtQbFrp+uvaLYFxXYJ6TAmoz78B1tV58ztVPwWKLQ+GV/B/qLrdt5GFNd1PAziSQmZH
         W1FBb8NEZYMss5dOJyo/D8lgckfchWPB1dn+MJOQH1vmqmCiIyJMuIzJGH/zsEL9HtRq
         9MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/w2U0GiGwFFrflmNCFpCFLaMnMdqbHDas4my61VJ3H4=;
        b=sj15XErzUF7+lTo1XdQLtSPpySrdMsZkTjsdgI5Jo3txms44w5+OswX35vEakaObzo
         Pptax2vUwJ5pYSw3znvrH1c37mrDvWkv8T726GPnDYg5Q5eYqCERWsYhrVMipW1ZUwbW
         b+trP1d8qgcOKqss3Dm6dnpZ8Za4yQKoF0WYwN0PXMON4B3y+kxuQZcLI6hXsddn4LsG
         p73rxJO+fsvHxPO5M8vy1WdY4C78piSjvJLfMXqEBkM3oTjVmE2YyY6RlipMecCooUvd
         mxwsbqJDgKSfZLhrM5mZTcrJ1EM98O673lfM2Bi61acfoVOuW+sdQNmM2x88L94DZHMO
         9CYw==
X-Gm-Message-State: ANoB5pnpC+uYx8GCTlG9W9zpy3Ho7bXalO3gtVSWjKnzA7PbvU/+HxSd
	QnJA2bsNWBidQAeLtt51b/8=
X-Google-Smtp-Source: AA0mqf5bbbM2Ey8aDDMRRxoQANiNABBR5EuqgbA88InhXkY5YtNllspX8hGfwRC2BZ1dEtaaBfF7Sw==
X-Received: by 2002:a19:8c1e:0:b0:4b4:6460:24d with SMTP id o30-20020a198c1e000000b004b46460024dmr6846311lfd.386.1668603838350;
        Wed, 16 Nov 2022 05:03:58 -0800 (PST)
Received: from dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::7])
        by smtp.gmail.com with ESMTPSA id n5-20020a056512388500b00492ea54beeasm2590371lft.306.2022.11.16.05.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 05:03:57 -0800 (PST)
Date: Wed, 16 Nov 2022 15:03:51 +0200
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
Subject: [PATCH RESEND v4 2/2] gpu: drm: meson: Use
 devm_regulator_*get_enable*()
Message-ID: <a2f0835e8d3b5f5768d887ce47a1575ae11b19f0.1668602942.git.mazziesaccount@gmail.com>
References: <cover.1668602942.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1668602942.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_050405_130172_F9197E39 
X-CRM114-Status: GOOD (  15.03  )
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
Content-Type: multipart/mixed; boundary="===============7791188296151614201=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7791188296151614201==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+AsYBOOQaVjrzzJT"
Content-Disposition: inline


--+AsYBOOQaVjrzzJT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify using the devm_regulator_get_enable_optional(). Also drop the
seemingly unused struct member 'hdmi_supply'.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
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

--+AsYBOOQaVjrzzJT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmN037cACgkQeFA3/03a
ocUqbwgAr9qOikS0LMJyO5GovQMABn825PnykrWGi+dZ6sDx5/TPtK3c6Wa+M75x
AarIBszsCEdzLvBgGZs1OvcsAUvoV/8Xxeg8LkysmC6MOXrHVlklb2ybdezc13Xr
/1ZT1lfyVl+FdgzLgcM6PzjOobO0YDxS8GMoIXft5WeEbsOM5O8/CW7CgOHbi8QP
//3f3nJu8bTsJOZRjgcNEw9InElYaZYwPJUktYOfQ0qTSWSO9HCaeWYV13KQlAP8
7YcST0Jm3ywbRiQAv5hzZhjkcZ634PVGsTpNlLgy+2MHrLOnHIQEw0vPiwKeYiJH
XIT3agwTeqk+1JCl0jFIpZgiepnk7Q==
=WwI9
-----END PGP SIGNATURE-----

--+AsYBOOQaVjrzzJT--


--===============7791188296151614201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7791188296151614201==--

