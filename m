Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCFAC54788
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/gvz8rcqEnS6BdlMnCCQZEZZciqbxoHNJkdZVlPME4=; b=bbL45sM7KOPp4o
	Gkmw67dzS3bm+9QWx0uYRlzh/4BJaBtAd6x+KxptPu/Spdgh8mpTowRAgk7Fj99UfA84Au8xYxWBB
	VDCKxCqwGEDxDa/qb1FIHwSEN9CxmYE/m+YACOOmTbMRMC7rmBLPgK8TD1dZ4BqhzwSK8YmHDOCHl
	dmQHmAtYj4sONBHMEX60Iep+JC66VAE5YOYS8zKJTUbKkY+x5JMOJBaXgJqfsrXngt/DWSMXi5pZX
	3KfA+5oAfm6FQD/WKCH4PsD15DZAmAp9mZs4185ZM/AwD4ZYWUSLZ0Qb7THroPyUFdRTc8bx2z2+8
	1fEdSI0385EK4sUleDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnin-00000001J3R-1zU6;
	Wed, 21 Feb 2024 14:37:17 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnih-00000001Iz5-05QT;
	Wed, 21 Feb 2024 14:37:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D99610D6EE;
	Wed, 21 Feb 2024 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1708526221; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding; bh=xOI+di+u1t+xx84e/LdGPQbr3Lc5cpKuos/uIxbddAE=;
	b=U1ME9svf2hGDxCabb2U4g5IaHVT6xZEAd9N2zQz2yGXyLPyiPt4W7sR5N1BZo7M+vG7yQd
	+uAB6fCO06MloQI2Ag0mc2opsItrt2b6ojehwTLTywvsQzZIHFiMH9bh7SVepliq92608+
	Je29QX+q+f4tx82ykpAQi0f1vHOVyZGLFaClzOfGDB7zTVCb+Kq446KFJ5aBnfd2w78zwQ
	pOqgMSP2yTl/m8WUjk9lMmwpt68Rl3Wy4QoEnrX4Ug4PvZb2mBBm9o4ojbIuUzS7SuEUyp
	ImliwEcc89OourAMELt9AqRkRkpK8ZVkMzUHzEtLYsI9FPqFOHPGYjQyKHvVnw==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/3] soc: amlogic: add new meson-gx-socinfo-sm driver
Date: Wed, 21 Feb 2024 17:36:13 +0300
Message-ID: <20240221143654.544444-1-adeep@lexina.in>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_063713_226885_01923F7C 
X-CRM114-Status: GOOD (  10.52  )
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

The Amlogic Meson SoC Secure Monitor implements a call to retrieve an
unique SoC ID starting from the GX Family and all new families.
But GX-family chips (e.g. GXB, GXL and newer) supports also 128-bit
chip ID. 128-bit chip ID consists 32-bit SoC version and 96-bit OTP data.

This is the third attempt to publish data from the Amlogic secure monitor
chipid call. After discussions with Neil Armstrong, it was decided to
publish the chipid call results through the soc driver. Since
soc_device_match cannot wait for the soc driver to load, and the secure
monitor calls in turn depend on the sm driver, it was necessary to create
a new driver rather than expand an existing one.

In the patches, in addition to writing the driver:
- convert commonly used structures and functions of the meson-gx-socinfo
driver to a header file.
- add secure-monitor references for amlogic,meson-gx-ao-secure sections
in dts files of the a1, axg, g12, gx families.


---

Changes V1 -> V2 [1]:
 - create cpu_id structure for socinfo variable
 - create meson_sm_chip_id for result of sm call
 - remove shared functions
 - move from funcs for bit operations to C bit fields

Links:
 - [1] https://lore.kernel.org/linux-arm-kernel/202311242104.RjBPI3uI-lkp@intel.com/T/


Viacheslav Bocharov (3):
  soc: amlogic: meson-gx-socinfo: move common code to header file
  soc: amlogic: meson-gx-socinfo-sm: Add Amlogic secure-monitor SoC
    Information driver
  soc: amlogic: meson-gx-socinfo: add new definition for Amlogic A113X
    package

 drivers/soc/amlogic/Kconfig                   |  10 +
 drivers/soc/amlogic/Makefile                  |   1 +
 .../soc/amlogic/meson-gx-socinfo-internal.h   | 121 +++++++++++
 drivers/soc/amlogic/meson-gx-socinfo-sm.c     | 192 ++++++++++++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c        | 136 ++-----------
 5 files changed, 338 insertions(+), 122 deletions(-)
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-internal.h
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-sm.c


base-commit: 9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
