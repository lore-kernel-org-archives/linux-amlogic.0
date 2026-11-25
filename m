Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEFA606A33E
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2026 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GJKt57F/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DFXOQXYK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n41994kl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5kOioeM2hlJ7V3OqhzQ2fH+Y4qIWk6xo7S1TTOAFOE8=; b=GJKt57F/H+tPnRM2X0Oe6+I8FN
	oDz3TjrGhqyfXB9J1o5P+ahMq19A3OgBUrSTXES3WQ7iGra90LfveiCzuoLVQiA83ztFbFGdW4SyD
	AXtON6w7vl+EqC/9ce2QAYrOHia1z9mmD/NIm46ySn9mKBfb6LYwX3NQoeNyUlXbHzdfLVoA31f6S
	XtCOo8LhHPhsjvd2L660YczPoRprMuCoEkjYv/FrXADdleXEQgJszhMXukMu4+k3BKqlEABvc0pAL
	Ost8YMPt5vGsh6TdYiV2ov1U8vnHyrhuQzKgvUF59eqEiOjyvQJES94yhNHpDMz3iqfPSUloaYmlW
	jpCcQBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFsY-0000000AYpx-2Nac;
	Wed, 25 Nov 2026 16:29:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrc-0000000AYU2-3vGn
	for linux-amlogic@bombadil.infradead.org;
	Wed, 25 Nov 2026 16:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Jkpq3Qrv0SgVfFgdH0HjFFR4TiuDoTsfQLCdgkzvL4U=; b=DFXOQXYKZxliNaXEYbQ6nlGOaq
	z7XD/iFrV7DDtMPhuNxfz5Nkt0rlfhVRdKfnugLoTErhAfW5+8e4EEXWywrdI8bzWei8DkQdSYS9a
	zLr1c3AJ+lsQljgCz35fNm21Zm5nU3sRxVVrTgxroEOqsKHisC8JQLY2t5uvz8x07pvDWCISokCwg
	EyRg0/KAGxXg0nrTqEWdRNcukpkpyvQ+noJT573FVyR8TsJz8YkJ57YBb/r9yjIow0bJS5tswJlnj
	+FO3G7sTJOJDEYn/ivOX8Y+S6dzpXJfQzD1BHO0YooTjgFI73F+6aNOJ/iPznflLiQ+XMgAtow1MZ
	MuyPlsfw==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrW-00000005WxG-1Dbp
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Nov 2026 16:28:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so8513055e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Nov 2026 08:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624129; x=1796228929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jkpq3Qrv0SgVfFgdH0HjFFR4TiuDoTsfQLCdgkzvL4U=;
        b=n41994kltmS6AoQHC/glsGT8E44bWagzz1nJ6zpRQxcJxZJopTuHkb8iJvVOKiki0y
         aR7ALEXcCkT7jOm6VWokikuHwBvGhvaH+JcIgiHK5qM8MOYchwwv6mtA1IntIwh9KXCP
         4uzrcnnPRC3waorISEPoCpaGz9BzwHPJ+UC3xvi4Jscw91NdZZrcgrqSTqwRvjy0nLrW
         5NxNH3R9G1Wkop+I5RPk1AzJ/i91Ge0xuTFVq0K7YodfIpZTrky0sOMRfM2m04h9P7BL
         SPDkBe5ia+rOSZkojN8hadK8IIru827KFETLYJ0dK3GPy0VJCwdAvRyVYZdfD3hN14Cf
         wbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624129; x=1796228929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jkpq3Qrv0SgVfFgdH0HjFFR4TiuDoTsfQLCdgkzvL4U=;
        b=JDTfPgipzWYdYl82cS4310j6WQGJlG2J5+ZbluX36iJtZMJNGp76GE1PJypkQvl9HU
         Oen+/M34TYWTKCPSJlwlFEuNabl8+TY/+1g0P2NWVmUGM5dtYOyvBnBmYt6ax+1cmSSd
         X/Cjclq3xVM9RjNG4hKFh5+FZyM3jnUigLl/AmJJsNxSzShDIl/c98u167tHQ2gMQt1q
         r+SsxHVN19yczotGSTbDUJuMFWtlqT7yShgqWaggm86I4NEq5+yMMt7iWIHSyXgmVMTF
         ypIt3eGudJMo5QucQdjlN3qriwOluTQBj+YskiSSa/+SOEHJU/cZAcW+DYh8Px19zix+
         FZUQ==
X-Forwarded-Encrypted: i=1; AL+hErFKi/oMIxT8480oN+K0UadgbCZ+PEbW2yji7GuVN1oz5BR3zkaTvBn4QOBhGHKx1J3N97dVPk1WUOIanWE4@lists.infradead.org
X-Gm-Message-State: APuU4Z9stiowqReQnioZkVBytVV8aZT4sKEyXguMg5D9s5gztsdeWlss
	pJ8KwjscCkYqnPsDvNMWIPBz+DxNZeOzOzPflbSJW2I0Pjnf8dh5g/K1wJDal00XUMI=
X-Gm-Gg: AZFdTZd9csqq96pUVqPbCrvLl0n4b/biNJIoVz/u1IwZlyJF0feIhk7u0BR1pZIbFc7
	AHaCEn+6G47KRY6plOyVD1o2HJsWemukVIaNLzluVHJ+yPcPYw+j5+IFBjL2/WyvtFC8ef/flAH
	/DvA4Bnj0pOGEP9Pb61ZUSz/m0ftOOGenV1tbbydOSSpIz2SOfOjpuSu6g6HRgoPr7MF0I9S41j
	Lp1187tYOEicEInqcv+aTtRxS1DFFE4cDIFPwIj4+exp0z/1xbUO3Kb8QsrJIKRbOQ6IhnmoJBg
	hIHtvHCDc7MPo0FvsAvRl9KEl7eI0CNPFGGNzbwQgqoezjRrgVR17F6SuhVLTyW43lPL0axLbTl
	HhuF47isgfzShux8xiUWKwEOBw3QGToLP3VucZecg6fSBS00uBaAaN+eLq/HPd0MWNhPdAqOtYP
	f9EyPKLnlbnRrWc2C7hoEXbaK5h40MoUXytkT0wkWQCOm2M2VIddgZh2Xgu3E3w0U/C0Z4qgTTj
	K0TfjSn4oQFEerK2gnGz8DH9thOvMvN/3OH3yTTm9P5jB0aoJoZXyqIzDle1ZxGQvLzZCGNOqF3
	69/fBgzDNAg5D0Nu9Kb5Ky9cUrWrBFTvPhkpoPv175PorA==
X-Received: by 2002:a05:600c:8b11:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4bb88826835mr369069605e9.8.1795624128871;
        Wed, 25 Nov 2026 08:28:48 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:48 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:31 +0000
Subject: [PATCH 05/10] mtd: devices: Unify *_device_id list terminator.
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-acpi-mtd-v1-5-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=5688;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=e38PNjVjjK9fQET0Z5RSjQeQUR9n82Nx3ix8ylWZkAc=;
 b=UmynCOwoYM4GS77+J2oETnIgPnWornuOiaAN1UaN6yWzj88g2jweJvGkqkw5pwk01i9dDTzKw
 jhi+aPV+h/XAaOKJSEM/GC0voUs+NMNtgllLP1rD+cGxum6pU8i9x47
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_162850_621635_4E87EA98 
X-CRM114-Status: GOOD (  19.69  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/devices/docg3.c         | 2 +-
 drivers/mtd/devices/mchp23k256.c    | 4 ++--
 drivers/mtd/devices/mchp48l640.c    | 4 ++--
 drivers/mtd/devices/mtd_dataflash.c | 8 ++++----
 drivers/mtd/devices/mtd_intel_dg.c  | 4 +---
 drivers/mtd/devices/phram.c         | 2 +-
 drivers/mtd/devices/powernv_flash.c | 2 +-
 drivers/mtd/devices/spear_smi.c     | 2 +-
 drivers/mtd/devices/st_spi_fsm.c    | 2 +-
 9 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index a8a77de1c6f0..1f0b1b0f4a83 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2051,7 +2051,7 @@ static void docg3_release(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id docg3_dt_ids[] = {
 	{ .compatible = "m-systems,diskonchip-g3" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, docg3_dt_ids);
 #endif
diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index 05a4ebe21e4b..31c0f414f449 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -225,7 +225,7 @@ static const struct of_device_id mchp23k256_of_table[] = {
 		.compatible = "microchip,mchp23lcv1024",
 		.data = &mchp23lcv1024_caps,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
 
@@ -238,7 +238,7 @@ static const struct spi_device_id mchp23k256_spi_ids[] = {
 		.name = "mchp23lcv1024",
 		.driver_data = (kernel_ulong_t)&mchp23lcv1024_caps,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, mchp23k256_spi_ids);
 
diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index c6e83775638d..60dfe0980557 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -372,7 +372,7 @@ static const struct of_device_id mchp48l640_of_table[] = {
 		.compatible = "fujitsu,mb85rs128ty",
 		.data = &mb85rs128ty_caps,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mchp48l640_of_table);
 
@@ -385,7 +385,7 @@ static const struct spi_device_id mchp48l640_spi_ids[] = {
 		.name = "mb85rs128ty",
 		.driver_data = (kernel_ulong_t)&mb85rs128ty_caps,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, mchp48l640_spi_ids);
 
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index e766258d76f7..607c5cbd2a83 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -99,15 +99,15 @@ struct dataflash {
 static const struct of_device_id dataflash_dt_ids[] = {
 	{ .compatible = "atmel,at45", },
 	{ .compatible = "atmel,dataflash", },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, dataflash_dt_ids);
 #endif
 
 static const struct spi_device_id dataflash_spi_ids[] = {
-	{ .name = "at45", },
-	{ .name = "dataflash", },
-	{ /* sentinel */ }
+	{ .name = "at45" },
+	{ .name = "dataflash" },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, dataflash_spi_ids);
 
diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index 55a945c1a67a..63685615a02d 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -863,9 +863,7 @@ static const struct auxiliary_device_id intel_dg_mtd_id_table[] = {
 	{
 		.name = "xe.nvm",
 	},
-	{
-		/* sentinel */
-	}
+	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, intel_dg_mtd_id_table);
 
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..7c6b2852916c 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -371,7 +371,7 @@ MODULE_PARM_DESC(phram, "Memory region to map. \"phram=<name>,<start>,<length>[,
 #ifdef CONFIG_OF
 static const struct of_device_id phram_of_match[] = {
 	{ .compatible = "phram" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, phram_of_match);
 #endif
diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 4bd7b41a03b7..596d592a8ede 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -278,7 +278,7 @@ static void powernv_flash_release(struct platform_device *pdev)
 
 static const struct of_device_id powernv_flash_match[] = {
 	{ .compatible = "ibm,opal-flash" },
-	{}
+	{ }
 };
 
 static struct platform_driver powernv_flash_driver = {
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index dc66ed852d80..947d82bebe4a 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -1079,7 +1079,7 @@ static SIMPLE_DEV_PM_OPS(spear_smi_pm_ops, spear_smi_suspend, spear_smi_resume);
 #ifdef CONFIG_OF
 static const struct of_device_id spear_smi_id_table[] = {
 	{ .compatible = "st,spear600-smi" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, spear_smi_id_table);
 #endif
diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 94872e03a04d..abdcef3c91b0 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2124,7 +2124,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(stfsm_pm_ops, stfsmfsm_suspend, stfsmfsm_resume)
 
 static const struct of_device_id stfsm_match[] = {
 	{ .compatible = "st,spi-fsm", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, stfsm_match);
 

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
