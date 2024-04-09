Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489CFCD1284
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2024 12:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBaygQfUnYh9jZ5UJQspg8wAt493trs5ZY1VoHTGbw4=; b=c0G9bS98g/zCKsEtv36lQQcSYX
	So7zcHNB/ocKiacLZvpq96J5YUw6gxJv00uSYmwEZWZmfRjgF9q85BhFkk81kFwFa+kVVxNoqFurI
	hYpT3fKyKqcB46jbGbGca5bhbrPC73oFw6JOK6lEOrbQd5Sj4Atd/fRXx12VPVNwm4EUV+TyT21Zh
	7V/vd1kXiQ5sTCphfWYoGz+zPOzSJbvGNC5UCTfi5GtdjSUCnf3gvHpwm960OQ6ezc84zjeZTKG8b
	Egf4u4zrtRIEZKfsfwfVJiSXF1szp8EijB3f71MPo/nTRf5Gk+Rz22B41ALf/eRQAY2NOl+iH7Ftq
	wS8geLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAEV-00000001qbb-39Yh;
	Tue, 09 Apr 2024 12:05:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAES-00000001qah-29fb;
	Tue, 09 Apr 2024 12:05:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD20F616BD;
	Tue,  9 Apr 2024 12:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BA3C433C7;
	Tue,  9 Apr 2024 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712664342;
	bh=7qi1cMK5dRJQInNs3AL4K9gdeAr6SfvTbPPIekOHUbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KC3YdvxPDVSFDHy5RJY8puUCc/6DjpRCWphFw6K6Mr5VVYApXYI+zwZcJEaSgXen8
	 2r/pJ+nEyjCMa1yR3Zg4CZbrKlbcw7ZLRRk8iRw4J2rbES75Jot0WosLPTJKW2RE7r
	 EDJ0Z8Mt9HlnOkI5t8gDqcBR9wzxKfz7c4VHKPCL59poFiO0zai33UsNP7fseyEgNs
	 V8ExNqEs6o1GeU8VmmQMpwP3GBKD9Y7bSLZCvFRC+3k0HmfWMcXnDXMfGXpQwwbUR2
	 7A3IIVWXwOfaTZOPD3QnbnlkeebX8XutbG1WVXmuI7NIxSaQYaQ03qYRQC1MXurFSw
	 McQp38C+/p0/g==
Date: Tue, 9 Apr 2024 13:05:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's code
 to separate module
Message-ID: <20240409-shallow-voice-c84ed791bc7d@spud>
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
 <20240328010831.884487-2-jan.dakinevich@salutedevices.com>
 <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
 <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org>
 <f01cdd910ab35316b8012795f73fd2b34c8e6f8e.camel@pengutronix.de>
 <13617b7a892424d2b024c725505a6f4f.sboyd@kernel.org>
 <20240408-numerator-escargot-a642507a598e@spud>
MIME-Version: 1.0
In-Reply-To: <20240408-numerator-escargot-a642507a598e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_050544_699511_1DE5700A 
X-CRM114-Status: GOOD (  35.60  )
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
Content-Type: multipart/mixed; boundary="===============3383320118044505750=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3383320118044505750==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cKlzmloSN+OqzGax"
Content-Disposition: inline


--cKlzmloSN+OqzGax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2024 at 06:05:51PM +0100, Conor Dooley wrote:

> > > Seconded, the clk-mpfs/reset-mpfs and clk-starfive-jh7110-sys/reset-
> > > starfive-jh7110 drivers are examples of this.
> > >=20
> > > > The auxiliary device creation function can also be in the
> > > > drivers/reset/ directory so that the clk driver calls some function
> > > > to create and register the device.
> > >=20
> > > I'm undecided about this, do you think mpfs_reset_controller_register=
()
> > > and jh7110_reset_controller_register() should rather live with the
> > > reset aux drivers in drivers/reset/ ?
> >=20
> > Yes, and also mpfs_reset_read() and friends. We should pass the base
> > iomem pointer and parent device to mpfs_reset_adev_alloc() instead and
> > then move all that code into drivers/reset with some header file
> > exported function to call. That way the clk driver hands over the data
> > without having to implement half the implementation.
>=20
> I'll todo list that :)

Something like the below?

-- >8 --
=46rom a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2 Mon Sep 17 00:00:00 2001
=46rom: Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 9 Apr 2024 11:54:34 +0100
Subject: [PATCH] clock, reset: microchip: move all mpfs reset code to the
 reset subsystem

<insert something here>

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 90 +-------------------------------
 drivers/reset/reset-mpfs.c       | 74 +++++++++++++++++++++++---
 include/soc/microchip/mpfs.h     | 10 ++--
 3 files changed, 73 insertions(+), 101 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-m=
pfs.c
index 22eab91a6712..432080c35cec 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -4,7 +4,6 @@
  *
  * Copyright (C) 2020-2022 Microchip Technology Inc. All rights reserved.
  */
-#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -361,93 +360,6 @@ static int mpfs_clk_register_periphs(struct device *de=
v, struct mpfs_periph_hw_c
 	return 0;
 }
=20
-/*
- * Peripheral clock resets
- */
-
-#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
-
-u32 mpfs_reset_read(struct device *dev)
-{
-	struct mpfs_clock_data *clock_data =3D dev_get_drvdata(dev->parent);
-
-	return readl_relaxed(clock_data->base + REG_SUBBLK_RESET_CR);
-}
-EXPORT_SYMBOL_NS_GPL(mpfs_reset_read, MCHP_CLK_MPFS);
-
-void mpfs_reset_write(struct device *dev, u32 val)
-{
-	struct mpfs_clock_data *clock_data =3D dev_get_drvdata(dev->parent);
-
-	writel_relaxed(val, clock_data->base + REG_SUBBLK_RESET_CR);
-}
-EXPORT_SYMBOL_NS_GPL(mpfs_reset_write, MCHP_CLK_MPFS);
-
-static void mpfs_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev =3D _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void mpfs_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static struct auxiliary_device *mpfs_reset_adev_alloc(struct mpfs_clock_da=
ta *clk_data)
-{
-	struct auxiliary_device *adev;
-	int ret;
-
-	adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return ERR_PTR(-ENOMEM);
-
-	adev->name =3D "reset-mpfs";
-	adev->dev.parent =3D clk_data->dev;
-	adev->dev.release =3D mpfs_reset_adev_release;
-	adev->id =3D 666u;
-
-	ret =3D auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ERR_PTR(ret);
-	}
-
-	return adev;
-}
-
-static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
-{
-	struct auxiliary_device *adev;
-	int ret;
-
-	adev =3D mpfs_reset_adev_alloc(clk_data);
-	if (IS_ERR(adev))
-		return PTR_ERR(adev);
-
-	ret =3D auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(clk_data->dev, mpfs_reset_unregister_adev=
, adev);
-}
-
-#else /* !CONFIG_RESET_CONTROLLER */
-
-static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
-{
-	return 0;
-}
-
-#endif /* !CONFIG_RESET_CONTROLLER */
-
 static int mpfs_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -499,7 +411,7 @@ static int mpfs_clk_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
=20
-	return mpfs_reset_controller_register(clk_data);
+	return mpfs_reset_controller_register(dev, clk_data->base + REG_SUBBLK_RE=
SET_CR);
 }
=20
 static const struct of_device_id mpfs_clk_of_match_table[] =3D {
diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 7f3fb2d472f4..27cd68b4ee81 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -8,6 +8,7 @@
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/delay.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -28,10 +29,11 @@
 /* block concurrent access to the soft reset register */
 static DEFINE_SPINLOCK(mpfs_reset_lock);
=20
+static void __iomem *mpfs_reset_addr;
+
 /*
  * Peripheral clock resets
  */
-
 static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long i=
d)
 {
 	unsigned long flags;
@@ -39,9 +41,9 @@ static int mpfs_assert(struct reset_controller_dev *rcdev=
, unsigned long id)
=20
 	spin_lock_irqsave(&mpfs_reset_lock, flags);
=20
-	reg =3D mpfs_reset_read(rcdev->dev);
+	reg =3D readl(mpfs_reset_addr);
 	reg |=3D BIT(id);
-	mpfs_reset_write(rcdev->dev, reg);
+	writel(reg, mpfs_reset_addr);
=20
 	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
=20
@@ -55,9 +57,9 @@ static int mpfs_deassert(struct reset_controller_dev *rcd=
ev, unsigned long id)
=20
 	spin_lock_irqsave(&mpfs_reset_lock, flags);
=20
-	reg =3D mpfs_reset_read(rcdev->dev);
+	reg =3D readl(mpfs_reset_addr);
 	reg &=3D ~BIT(id);
-	mpfs_reset_write(rcdev->dev, reg);
+	writel(reg, mpfs_reset_addr);
=20
 	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
=20
@@ -66,7 +68,7 @@ static int mpfs_deassert(struct reset_controller_dev *rcd=
ev, unsigned long id)
=20
 static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long i=
d)
 {
-	u32 reg =3D mpfs_reset_read(rcdev->dev);
+	u32 reg =3D readl(mpfs_reset_addr);
=20
 	/*
 	 * It is safe to return here as MPFS_NUM_RESETS makes sure the sign bit
@@ -137,9 +139,67 @@ static int mpfs_reset_probe(struct auxiliary_device *a=
dev,
 	return devm_reset_controller_register(dev, rcdev);
 }
=20
+static void mpfs_reset_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev =3D _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static void mpfs_reset_adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
+
+	kfree(adev);
+}
+
+static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_d=
ev)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return ERR_PTR(-ENOMEM);
+
+	adev->name =3D "reset-mpfs";
+	adev->dev.parent =3D clk_dev;
+	adev->dev.release =3D mpfs_reset_adev_release;
+	adev->id =3D 666u;
+
+	ret =3D auxiliary_device_init(adev);
+	if (ret) {
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
+
+	return adev;
+}
+
+int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *b=
ase)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	mpfs_reset_addr =3D base;
+
+	adev =3D mpfs_reset_adev_alloc(clk_dev);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
+
+	ret =3D auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev=
);
+}
+
 static const struct auxiliary_device_id mpfs_reset_ids[] =3D {
 	{
-		.name =3D "clk_mpfs.reset-mpfs",
+		.name =3D "reset_mpfs.reset-mpfs",
 	},
 	{ }
 };
diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
index 09722f83b0ca..0b756bf5e9bd 100644
--- a/include/soc/microchip/mpfs.h
+++ b/include/soc/microchip/mpfs.h
@@ -43,11 +43,11 @@ struct mtd_info *mpfs_sys_controller_get_flash(struct m=
pfs_sys_controller *mpfs_
 #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
=20
 #if IS_ENABLED(CONFIG_MCHP_CLK_MPFS)
-
-u32 mpfs_reset_read(struct device *dev);
-
-void mpfs_reset_write(struct device *dev, u32 val);
-
+#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
+int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *b=
ase);
+#else
+int mpfs_reset_controller_register(struct device *clk_dev, void* __iomem b=
ase) { return 0;}
+#endif /* if IS_ENABLED(CONFIG_RESET_CONTROLLER) */
 #endif /* if IS_ENABLED(CONFIG_MCHP_CLK_MPFS) */
=20
 #endif /* __SOC_MPFS_H__ */
--=20
2.43.0




--cKlzmloSN+OqzGax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhUu+gAKCRB4tDGHoIJi
0kCjAP4iVo/eQdDHCbVvm1zsQfnAp2Jr2afB3emmQxtfeSGFbgD+LIn2QDPNJN83
EYfK4Gs9BeyhtmmkFkPfWCUodD6yDQM=
=g28U
-----END PGP SIGNATURE-----

--cKlzmloSN+OqzGax--


--===============3383320118044505750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3383320118044505750==--

