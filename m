Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458B1C00140
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Aug 2022 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b82ryj17E224JOvD8KNh9H1L6efFnWYo/4gIYRxL9QQ=; b=jq6rsAgspO7357FVCNpxCYW2h0
	TtfbYX/cnVvuShCS8BfRe3TwR75dB3baPHwRI/HQE/FY6ijCgSKGTpcMntBsTQx0RUBAPVjEAwMc2
	V+Ku2MAisX26tj5RKowxKgEKefH7Mhh5ENcmgfjA31MBsC6d18KEayr9FxbIuaBjpgy5JGB1UkCNP
	3Ec1H3PkGnbJ+2fvIJZqP5XW6KEcLj2oEoNSROCyg6kzKqXvMIGWZg6gnjbfHsY9vzT34sj5XdEPM
	gYxToPC46k70rBkazIYYGsdlbk+WE7+tufQwKWLiUN5wjWCWb6f5W42aETQ/DW70RdgXbDCORSYfC
	1M66LJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLjwa-00Bald-Ru; Wed, 10 Aug 2022 11:32:12 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLjwQ-00Bajk-PW; Wed, 10 Aug 2022 11:32:04 +0000
Received: by mail-lf1-x135.google.com with SMTP id a9so20777848lfm.12;
        Wed, 10 Aug 2022 04:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=0n1Y/OzhfJeE+j8g4UzOYZL6N5O4tDg71xSPH024khI=;
        b=kA7ZPWE9auNagXtgXGfNtwEbiMHmU8S7bBqOGTC5NBs+JJVZUXFFFEKRBKXN0LiZTT
         8P2baQgcumnHOmqX6NsVEjubxnpriOq+frTO+MO9OeJaYrKLoifhAi7spYfhjOGPpc3y
         /ymTjg8OFT7ro70OslfoDXPppb7eNMwKTJTDA30Gddtjtl4aCrS5bq2+0lwscyTjwPgZ
         9XqVPHRM7dh7/p8X7XwoaajDzVBGXk1VM6g2+HW02gSiMnKvuyadkG18Jhgnln7nzXph
         qujTz7lr0LXTEintAq/wjENu1LQF89E4HU2Wm7mJglCYq5s9eQaZghukzoNwdYwEdEpF
         TaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=0n1Y/OzhfJeE+j8g4UzOYZL6N5O4tDg71xSPH024khI=;
        b=ItBaEJOPoZKlS58hkQH531h/UYGWiwEmUbSSPHYRCou67hAja6q5pzyzT0E0WCzHyJ
         i2lfdlds08ZhklYlWn74raOlS00dho6vJiGciFrGM+evfSh9Nw9TXTWxLxBclv+8YCgE
         S/qKxKym7I//1fB3pz2DcXVOFIp2nZDQ2ZGYZs8DXXlXB6Xg0cfZgwuLJ2P1dG5M4R7G
         Y/dDiol4KGTnT+LOO/e486ped7QdNT5pPzWZNysGcxRKqkPnH2t9XkPtBLdNnzazA7V+
         zPnm31qVKsLNxOnknnCgqm7FRmh9NisBKBCRHYEQEHjURPjNJKl7JCT2jzb+u7kYf4c5
         hPEA==
X-Gm-Message-State: ACgBeo3rRJQHqgGSOGUVi0HVa/Vl/R7EV358wXlY7/0/W6hdJVuNCp+5
	+vwqYPBXdMPRF4B3ni30jrI=
X-Google-Smtp-Source: AA6agR4HJ7z9C6Qx/mQgUXeus0gaIaf5bRpOkkYd5YSpgaeaMscj9In5G4yyt6jyUcuHoI4k+C+cpw==
X-Received: by 2002:a05:6512:13a4:b0:477:a28a:2280 with SMTP id p36-20020a05651213a400b00477a28a2280mr8901373lfa.689.1660131121036;
        Wed, 10 Aug 2022 04:32:01 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v10-20020a2ea60a000000b0026008acb55asm134927ljp.113.2022.08.10.04.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 04:32:00 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:31:46 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/7] gpu: drm: meson: simplify using
 devm_regulator_get_enable_optional()
Message-ID: <cc21cea63a24bf5d372e4a5903de303516c3db98.1660127865.git.mazziesaccount@gmail.com>
References: <cover.1660127865.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1660127865.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_043202_863936_F47C85E9 
X-CRM114-Status: GOOD (  14.30  )
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
Content-Type: multipart/mixed; boundary="===============4958137789299437917=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4958137789299437917==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ON+BJfnFjobaZBs+"
Content-Disposition: inline


--ON+BJfnFjobaZBs+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Drop open-coded pattern: 'devm_regulator_get(), regulator_enable(),
add_action_or_reset(regulator_disable)' and use the
devm_regulator_get_enable_optional(). Also drop the seemingly unused
struct member 'hdmi_supply'.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
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

--ON+BJfnFjobaZBs+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmLzlyIACgkQeFA3/03a
ocVZnwf+Lv1xHGjupIg4noibrWXhjS6WmrvGpZqs49VnTsvbxRbVPjEzn6JfF+8i
SbHdoe+KSl5d/OfYx7CtXlQnJwJ5qLZHIaYcMewnJHMzQwSWQdeu+/W6DbAmuPPi
rOZtSzW/jDUANoxUtDX5sfgimagrnUWh1VPSxOz4CYjq6r77TquMfF1hclrECSVD
DrElf2B0R3Yw2OHJmoWsg80uk96ZURuXJB1/H5entU0CMKZZbpEeX2hhYDu7c6rl
EXbfot5+kVmIc7PwYI0D8ysIXmylHqKzJUqy8kMiL9zHXNm+eXeBvpxry7ryt2S5
7wITQS0z6ReN4U0nhXrniyBKGJ8MIw==
=4h4p
-----END PGP SIGNATURE-----

--ON+BJfnFjobaZBs+--


--===============4958137789299437917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4958137789299437917==--

