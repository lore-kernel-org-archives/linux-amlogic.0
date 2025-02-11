Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9492BC021A5
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fL9VtsftJz8sB2dK8LHN8HrrKnKQr02DzkIZFuU6/Bw=; b=0snri42JoWvdMb
	zjB/e+PGna0eGsVcA/0C1aUv7Vj0k0voTScR0RnuKTYlnN5bl9eqvKXbThoCGUCoQZYcDFyFA4dTB
	8rdAOMW8v7Ztu5G1nvgdD5VyKJPqcQ2nwwtQ9wB+6utP6+X6dEJvL4FWpezEj5/0OVrmgcturFzTy
	LaNJDR3soyVmMojJ6atXPc1Slka0OCQeNK+D+7LX6iBINcjkWBzKlRC3HdqDlScrEmmkIoV7z2Sbs
	4MZ/wVMtSrQhJahZit0+b1riD6tSIzKooSPETsRbrcjqydnaJzzL11+aI/ujyqvXa6LTFMweq7qM+
	ulPTRg2xz6Hdxg8qnZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHj-00000004iSG-3joD;
	Tue, 11 Feb 2025 17:42:59 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu3t-00000004g5z-0GSe
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Feb 2025 17:28:42 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so4463724f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Feb 2025 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294919; x=1739899719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiUH4lqEkZUY+Ysux6Yiqp87vOhypZIO5pd5GZP5Rxo=;
        b=DwFiIFthXd166YWDwsiSvS2hdx3/ha3YjZ/ZP4U+YhYypNcTa0gi1vgYJATMBdenUj
         aOeM06hBEZ9fuDzH2HsoVbyZjzsCOoynGW7q1UVa36OQ3bbcd1mz8pEIet2rw0t2wd6C
         fLNI2Q3MzvTp6PmCAdvt3jgXGOjX/eh5FFpfvWdMyv/FTfoW6QI8qhzY8HjIsnjwt6tv
         a+DiZrqJ7ru3w9S5Dwh7ROZ+YRjOeFoLoK4bNidu2JFDcqVVhspdIEjxa6om9glW7d2Q
         OHlcobFD6UaMjd0C5F30MrSHk1zZK6P+nsGL9j8+xQnCGYSWZA/cLd1zVG7+1fPHPFFW
         Qk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294919; x=1739899719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiUH4lqEkZUY+Ysux6Yiqp87vOhypZIO5pd5GZP5Rxo=;
        b=vB4bysCiOLTdZGAv3Yb296iepwW/pDD/H02ng5t17/5O5eOXHUI3nAzP0ipg5wcRlK
         tVh26hhraye4WIAeirm8mloZongSEhp+W9fcK0z+GL9N8Hmp8c2qKz/4v3vxVs9dpES0
         hnrMHnpLIxJ+/mb3GqH+ea7HztFuNQ3Nzyzva1SAFt7Pf9GPVhAuG4XAujrrT4Fplltc
         q7w7QA709S62lSEQEeYZMFvgVXDWwv4XyyHFgsIvcf/tR2T2BcOG8+dXnSkkgZ+sf3Pm
         4vwx559plGnsEH7mWz1HL+CEEhjY3IR4CgrCS2NAmnwVWdBSVkjuostD7GMa2n2TbALa
         BfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3Myu3FjMNmRlIa5HSi2LOLLAbpC0iflo6oXKt23eMpYCWvzTqw5f+970Ia6ErDVE3BW4IhmU2c0tJDzn@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi6JrS4fTbT+LV26PeS94CL/tDKK0Z3tIGbeT9fyATvAoaXtpC
	7hNWAPXQFxuhk24iO2rZqe+HP4nyeYx8YY0qlmWuGdPPrf8f8zjWOoE3wizmjZA=
X-Gm-Gg: ASbGnctjaKEg5Ee2xMjYYLnM+k9IDr9P2ASIIt4Cs8nmoheKBca03zDH9BLwKEcQP6/
	A0PY7XPn38i03YlrdTWtUlF4vPKGzZzShxZxMk76qENPz9kH0q5lu+aK324aX6jIuFST4PBaQQQ
	EIB63+tCdnWm/FhsTluEbykDp+uFRRvZTQrt2rYZOyxvGZMvNNwRAYml7eguks9gC4qD/v5GQ+e
	unRpbSHpkFw1Yh4Usy4Ch6KB7saYaWRvfZzj6LGqRUvgto8u4gafgCphht+J3oVa9htCEMZ16ei
	btpOAVOy8h+jhnXYaA==
X-Google-Smtp-Source: AGHT+IGWxF7f1yWAujS2u+KdxRxs6BCZ2vWSSXW9ul24NRbBrNVcf/bzFVrq/LcbH1iHWIudtU2p/Q==
X-Received: by 2002:a5d:5f42:0:b0:38d:e250:d962 with SMTP id ffacd0b85a97d-38de937cef8mr592405f8f.30.1739294919069;
        Tue, 11 Feb 2025 09:28:39 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 6/7] clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:28:03 +0100
Message-ID: <20250211-aux-device-create-helper-v3-6-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yh1X3NdDCdUsA9BLxtXchkn9/M7vIhxyVwRqzsjlThI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g60PKNni6dfU5BjvUnV/GlJm8Z/Gp+nsWrU
 9ZnwgOS2NiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uIOgAKCRDm/A8cN/La
 hbC0EACdDyfv4ruNFNCmp9zrJN9GhUKhduy0uDZfmX9xFwkj19yNB791PVovwlCxBtsVN+6iC4q
 rwLI3P4vdZ1EwlqCmVrmNdGoLnghwRNHwHALo5QxefOPT4NljAxW1vZtixroQfv2C49vYyO6W4P
 kJzYPrSQ5gCAhV9vK40Lrk3hKz6idlpK6fP6E452DnIlVkMEuBRhoWIYcW3UYiHeM8GZVGnhBCD
 gSJilnljJ5OTQH+GOh4JJ+ljp3eDNfLB8W4KHF0CAyQTUEMe8AcjK03WlL/wYkVKOkgcGkEcQp9
 BIY3F82Fe2CRnNyNNI0avHJK4Dow3qn7iDNJJpC3ovn48iYglF/d0jXmcEMhXhQpSbeKMeTqa7J
 fP6G9puoFGrvGncXPPVDyslRM/0C+t+9jrKuXcFKpUC6JEFDzD6J5ZEVwY4UiSURMnLq30q2O/b
 Ji2uLCAtXuMOhYX2lnsQA5d17uDRDdwUJp8XCH4Oz6Dnb2S55Fsz9tvBGlSUODkUiKV8l+xyrVc
 1dbrvgTF+WDlDaLoybOYZRNVsuxR6nnuPg843dEMXQ4KBAAvubECmtqd3Rp4YaM5ppqsxBeoFzV
 cuZaX5kv0Po8QUX3SAVM7K3Fpx7ZYg1fo5142KlYv+iDGalSNmwxlsLmgMTIAr8JL2LCqw+Y9jn uIY7Dp1qPMaPorQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092841_102051_6B1BE2D9 
X-CRM114-Status: GOOD (  14.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 56 ++++-------------------------------
 1 file changed, 6 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index c409fc7e061869988f83c7df3ef7860500426323..988a5fffeb4e0e481ec57038d9d1f1b43432fc98 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -228,64 +228,20 @@ struct clk_imx8mp_audiomix_priv {
 	struct clk_hw_onecell_data clk_data;
 };
 
-#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
-
-static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
-{
-	struct auxiliary_device *adev __free(kfree) = NULL;
-	int ret;
+	struct auxiliary_device *adev;
 
 	if (!of_property_present(dev->of_node, "#reset-cells"))
 		return 0;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = "reset";
-	adev->dev.parent = dev;
-	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
-
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
-					no_free_ptr(adev));
-}
-
-#else /* !CONFIG_RESET_CONTROLLER */
+	adev = devm_auxiliary_device_create(dev, "reset", NULL, 0);
+	if (IS_ERR_OR_NULL(adev))
+		return PTR_ERR(adev);
 
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
-{
 	return 0;
 }
 
-#endif /* !CONFIG_RESET_CONTROLLER */
-
 static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
 {
 	struct clk_imx8mp_audiomix_priv *priv = dev_get_drvdata(dev);
@@ -408,7 +364,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_register;
 
-	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
+	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
 	if (ret)
 		goto err_clk_register;
 

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
