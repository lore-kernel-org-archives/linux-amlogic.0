Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FF7C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Mar 2022 17:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEl2ufmrJ4wCSFfDiPq8O284bEy5cnlAfhMG4HswTvY=; b=0QYH6Qty/wK95v
	IsaCEUUuOV39nqzvCFF8d566tQ3WnKPn6ug1JTFDGvWnPyem502nlmSABGWmP5VRxHnLKGuxFpvdI
	sWiYDmGGrPB/e21mujftpsCePdYh555C7Bgd2/a3A4laYg4qiVMKCWckrJ7U3OYOAnADrC6H9dlse
	iIi40Q2fU9+wQkTeMp8r6bLDF+Z4DlizfdXuv/dEINhZofuqg9rnHBdouDiaVZbrJDWaQZ175Avxl
	NkDkVacgpbchf4isuvLZ0xbv+AZ8ofI1Ymm038j8LpIoFeYbW30yqeBtrV16bSpRA5UVmXEeXuctC
	10QvEtS2JZGSL/bpmgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nToNh-006LQ9-UJ; Mon, 14 Mar 2022 17:21:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nToDF-006HQe-S1; Mon, 14 Mar 2022 17:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=polWvja3vMUWvUfJ1G+VUUYdVS0oovwHGRgUfrtOjG0=; b=qKD4gQ4cHM0Ldr/kqV9L3m3yAG
 hg+phl2enbM80WwUCH+Sf+1l3vpct4WSCR9WpQ5X3naSoNddpK+mOK+PnBfJMeVEF245RvzC00x9r
 baFjvy/EWfE8f+nTjtMZL20dR4LQcoprChXImUWbqQ8FdJsJtAjl7+O3jqrQDjCJejNnSXFbH4Zlh
 uZNnk7qLLl/7IhtLyIzO6Vcn7kMumQ0B3lidXj8VTeX047Vqz1/tYTNSLX4xPwnqdO3yUbruatxe1
 8b62NFYZajwR/BDYcv3c/PliniXvOkJKQpJKIIuAn9CHg0YQNXHzfK0d9OqFoOqvDtO5a3DFOwnfx
 yXIVHM9Q==;
Received: from ams.source.kernel.org ([145.40.68.75])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTnf4-000uEP-Vl; Mon, 14 Mar 2022 16:35:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85D2AB80E9B;
 Mon, 14 Mar 2022 16:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F57C36B00;
 Mon, 14 Mar 2022 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647275707;
 bh=uaiopVtJBKfx6miqmhyDXFmsPK2jSz5M/upaCokt73I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZK5KsmaIe+Pjxj6TBsrpqTEwQ62r5lJbkCJlGRwOme9adM3y5cRdQ3egluf5zhYUq
 TPrda85VbeItGN22zRwYbgM3lwlwPXwX4hvMzzjGSPklOoa+f9wXyByNZ43RavV/W/
 QPKDPtCHKhW8YGQVNKo3q1KwLXI2/LVhwF9pw5bH/RitK/yjRc8WHNOoi3xWAW4O2u
 qhRgjOha/YYqlwm+MWntF27XhSaXTmzX90OJQRzNBx1Ik12Cz1Os1FExZ/klUa+L0G
 6dZGvrqgDGaQYQdq0bU6SCW3oK2e2psVo6S9QD5vWqnpJuwOuHLq2Z8Lj56/w1n3DC
 MycMqv4Ps687Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTnez-001wx5-2F; Mon, 14 Mar 2022 17:35:05 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Dmitry Osipenko <digetx@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 15/67] media: platform: ge2d: move config to its own file
Date: Mon, 14 Mar 2022 17:34:10 +0100
Message-Id: <a0d2dda6b0cbb3ff342207c20e846a5e2ce6bd33.1647274406.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647274406.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_163511_457229_8A5BC44B 
X-CRM114-Status: GOOD (  14.77  )
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
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig            | 15 +--------------
 drivers/media/platform/meson/ge2d/Kconfig | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 create mode 100644 drivers/media/platform/meson/ge2d/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 57ca2426a83b..d3b7bef19237 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -47,6 +47,7 @@ source "drivers/media/platform/coda/Kconfig"
 source "drivers/media/platform/davinci/Kconfig"
 
 source "drivers/media/platform/exynos-gsc/Kconfig"
+source "drivers/media/platform/meson/ge2d/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
 
 source "drivers/media/platform/aspeed/Kconfig"
@@ -273,20 +274,6 @@ config VIDEO_MEM2MEM_DEINTERLACE
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
