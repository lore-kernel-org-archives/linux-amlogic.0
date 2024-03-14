Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB507C5475B
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 07:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d+z14Ppg1lSRcA9/Y7vcv4SgQCqKt+o1usDuUDt17mw=; b=H+54ETh40ghVWt
	3V5JoRrXwP9wyZRdrrpEquLVCCkyHhpwv/Kw8sLaGMEvRHORW0Okyq6/6Oee2/KkC+iripmg3Xtql
	X/Ff0a2yhdC2O5LugiDhAycxNGEYdlIiSn9qtcpEiomePhEjCetj8QjiUxTrvlGrRJ0Kl/02MKrDM
	jelKh73dKtXvWpwsMD5UlUB0gBQZ3j7jxOm4CMB1OynaE2x8oQepsz/JwXEA5W2smanvJ6J2TFuhY
	sXra1sw8YGT8mhYchRRPEOJ6qrFkNp2pF/wIlbN8K7PKyRbFqAsJdZu9r8nuFGcZs0uboUHxMePSE
	Lo1JYMN5nnNgw2r3sRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkf93-0000000DJ0d-3bh1;
	Thu, 14 Mar 2024 07:04:53 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkf90-0000000DIx4-24QA;
	Thu, 14 Mar 2024 07:04:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3201411E7BD;
	Thu, 14 Mar 2024 07:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1710399885; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=oxxuQS6Ry6UcPPQ8PM8osrRnE4TBooDMROhtJ6NbQOc=;
	b=EDV4Yyt0/0NKKea2i69S38pCAK/svEvZUSezcqBBkThP4Dk+YAx73fKk6J7oDmKBwboT18
	vLwO3Z/Ckz7u9aerEg17kr7XzNqyi5RSzRZ90iVqnNRfXDdB8vO9xW6lcXy6g04Wa4J8gH
	IP2MbTzSo6jpsmqO45LR8xqXnTjZ+gy6yH3lKLl0T6UIPcci7ggscdBkaAO/wQH8Pmsr+T
	jnduqP4BaID7TvpEzTtQsLpgefhNHaLs0+yaRxBQUGQ081T+W8r0I0gnEdQ2x8GHGH48cU
	qm7xbusyDJU0GnzGena0y1YErxHT+MB1Azm/AKfg7uOXlOj9ima11mcCoPoiKQ==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 0/4] soc: amlogic: add new meson-gx-socinfo-sm driver
Date: Thu, 14 Mar 2024 09:59:50 +0300
Message-ID: <20240314070433.4151931-1-adeep@lexina.in>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_000451_126897_F1B3022F 
X-CRM114-Status: GOOD (  10.41  )
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

This is next attempt to publish data from the Amlogic secure monitor
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

Changes 
 v2 [1] -> v3:
 - rebase
 - update dependency in Kconfig for MESON_GX_SOCINFO_SM
 - add links to secure-monitor in soc driver sections for A1, AXG, GX, G12

 v1 [2] -> v2:
 - create cpu_id structure for socinfo variable
 - create meson_sm_chip_id for result of sm call
 - remove shared functions
 - move from funcs for bit operations to C bit fields

Links:
 - [1] https://lore.kernel.org/linux-arm-kernel/20240221143654.544444-1-adeep@lexina.in/
 - [2] https://lore.kernel.org/linux-arm-kernel/202311242104.RjBPI3uI-lkp@intel.com/T/


Viacheslav Bocharov (4):
  soc: amlogic: meson-gx-socinfo: move common code to header file
  soc: amlogic: meson-gx-socinfo-sm: Add Amlogic secure-monitor SoC
    Information driver
  soc: amlogic: meson-gx-socinfo: add new definition for Amlogic A113X
    package
  arm64: dts: meson: add dts links to secure-monitor for soc driver in
    a1, axg, gx, g12

 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   1 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |   1 +
 drivers/soc/amlogic/Kconfig                   |  10 +
 drivers/soc/amlogic/Makefile                  |   1 +
 .../soc/amlogic/meson-gx-socinfo-internal.h   | 121 +++++++++++
 drivers/soc/amlogic/meson-gx-socinfo-sm.c     | 192 ++++++++++++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c        | 136 ++-----------
 9 files changed, 342 insertions(+), 122 deletions(-)
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-internal.h
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-sm.c


base-commit: 480e035fc4c714fb5536e64ab9db04fedc89e910
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
