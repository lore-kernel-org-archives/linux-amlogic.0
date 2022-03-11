Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0B8C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Mar 2022 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bszt/thNPBwc967G9HGWnHYN27oSZlLjHmi3wWOqUKg=; b=LWSKt78jxGJO/o
	v0GwzEL6mKGUKTrkP3frNzcvbJn2mzLr543F52Kkkwe3XV2D8DPGwzgmjRPd96cUVrtM0por5Dbke
	QHZBiuRYm4AJX0D/FrBTBYbyuW/jNO3euVPuuNk5IxFwdBN0bkBWHRuXpsWb3o1Ftdj7Td3TYLlde
	PFFSwZ9WoggYuo9vgdlNQWsYpnDvTtv7U6eDiFcUf6BmDluzVdHdOPLivmEugLDE24tEgRAqb4fYj
	jopFlJWUzmCeDuFVJCpqCsHAIRzxgr6OxnTi7JYMJqvQjMDGlrUwiW1KbevJtvw+CgYfVhJZfR7ef
	91qeUg6ITB/kBeOPupyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSfxh-00GeVt-Rd; Fri, 11 Mar 2022 14:09:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSfxa-00GeNG-Qw; Fri, 11 Mar 2022 14:09:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5118461ED9;
 Fri, 11 Mar 2022 14:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533DCC340F5;
 Fri, 11 Mar 2022 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647007777;
 bh=pBU8eWzce6ApAIANMXvFwA0HyPcMlWbrMfVuhgBa7Os=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pNWsT92fWbyJas68mktc5eYgi81P13AVCqRIQlSN4XVfYmPy7gohp1e+/cMVl1q7m
 tafbr0UXzn/H3voKegA5YB5PEfwUyd8nRUzv+lpNR1KrBKecslGiyrUR6xDf2iHJ5S
 YQW/2n9zGauDBWf5x12aJXDWEzMwd3Og3RKe4g2Pcsg8Y+9qCP4haMoIvGZeJloWwc
 L1cVBekdxcZPTBYBvYZJZPNn5CnEThQVH1XMUeSTl3BGrntEWO+NwfFof7wDKq1GLb
 CQ9addVbQXyPcYAN0vKJJrWsdxO/nHTGNZGlxeqgY9RBU7ase2cAqgGELpyxC3Kk2P
 AQh5lCDg2Td1Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nSfxX-000lHJ-4N; Fri, 11 Mar 2022 15:09:35 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Dmitry Osipenko <digetx@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 15/38] media: platform: ge2d: move config to its own file
Date: Fri, 11 Mar 2022 15:07:28 +0100
Message-Id: <b57b7e055791a38bf441be85f7c0bdfed5998d44.1647006877.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647006877.git.mchehab@kernel.org>
References: <cover.1647006877.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_060938_980925_223CC8E5 
X-CRM114-Status: GOOD (  15.10  )
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

In order to better organize the platform/Kconfig, place
ge2d-specific config stuff on a separate Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.1647006877.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig            | 15 +--------------
 drivers/media/platform/meson/ge2d/Kconfig | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 create mode 100644 drivers/media/platform/meson/ge2d/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 103f3771fd29..da1fa4642bca 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -54,6 +54,7 @@ source "drivers/media/platform/coda/Kconfig"
 source "drivers/media/platform/davinci/Kconfig"
 
 source "drivers/media/platform/exynos-gsc/Kconfig"
+source "drivers/media/platform/meson/ge2d/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
 
 source "drivers/media/platform/aspeed/Kconfig"
@@ -284,20 +285,6 @@ config VIDEO_MEM2MEM_DEINTERLACE
 	help
 	    Generic deinterlacing V4L2 driver.
 
-config VIDEO_MESON_GE2D
-	tristate "Amlogic 2D Graphic Acceleration Unit"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
-	depends on ARCH_MESON || COMPILE_TEST
-	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_MEM2MEM_DEV
-	help
-	  This is a v4l2 driver for Amlogic GE2D 2D graphics accelerator.
-	  GE2D is a standalone 2D graphic acceleration unit, with color converter,
-	  image scaling, BitBLT & alpha blending operations.
-
-	  To compile this driver as a module choose m here.
-
 config VIDEO_SAMSUNG_S5P_G2D
 	tristate "Samsung S5P and EXYNOS4 G2D 2d graphics accelerator driver"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/meson/ge2d/Kconfig b/drivers/media/platform/meson/ge2d/Kconfig
new file mode 100644
index 000000000000..8c3f3b1b6b05
--- /dev/null
+++ b/drivers/media/platform/meson/ge2d/Kconfig
@@ -0,0 +1,14 @@
+config VIDEO_MESON_GE2D
+	tristate "Amlogic 2D Graphic Acceleration Unit"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_MESON || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	help
+	  This is a v4l2 driver for Amlogic GE2D 2D graphics accelerator.
+	  GE2D is a standalone 2D graphic acceleration unit, with color converter,
+	  image scaling, BitBLT & alpha blending operations.
+
+	  To compile this driver as a module choose m here.
+
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
