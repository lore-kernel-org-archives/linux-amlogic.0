Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE99BC27C5F
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 08:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RZkzFDJ0s3Y9XVSo7+T/PajM8miLCuoQvsDxfq2JfDo=; b=T3cvX1BY7Bofra
	5EuyznTlE7fXOuiOl0WnwURlcZWfv+x+/aIC+Ylz6hjuDm7Vw/odkCfpPkBp5f78akbQL3ljMHI80
	41phpS0k9FcgMI2jc7PXMLLcDxitOLdoHSD+6U1XtLl5PRhO7Davuei/D7Zayt0YRabYJzqWa+Ftt
	mJNdJuf279kpS+qNOPfPhFZFHzJcsBxy9qda5m8NqfQydzp9xlll3SwPLj6m4iIKAZgNzKKhDLGlw
	0Q0hoEwn1KUuls+s0nXBRldTwIKgIuPbbOvP9bB1oKzUm5mxPLJJX4UwgY1sIutBEXOlPYMbviPAb
	y4Kt+43YAj/SlvMMm1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaaU-00000004HXS-2mbZ;
	Mon, 10 Jun 2024 08:41:10 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaaQ-00000004HVS-17MA;
	Mon, 10 Jun 2024 08:41:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDC5AFACA4;
	Mon, 10 Jun 2024 11:40:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1718008860; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=KX0WP5RREiDGDx3/PUkOePlvWq8o7D3HqgRLqhu8168=;
	b=EJ3IuO7ZXTkFnLeqgnsSL+LWgwJVOHnqXujoQN37ycugx5R5+OFSVDaLw0rtmexW7rmeAo
	eNMqCN9t324oj9IkTOd3s4+AWD+OjlFxnTN9P42f4YvcoNQ/2WTssF5zVYBGVi0Pa5SFcP
	5U9CBPhwpIQRx+LGohte99gjM2N8PpZCJwXu9gyX2+PrO4p9Uare87/VCPy/83IJCh6IzY
	F8/m/km/2EwbUbI/QnAbDsh+g1YrNvzjKx4ex9JiI1T31aYYvpGGmmdBKkSbityqVR7rm/
	R1ZK5+ErcA5FfacM0fgMOuHn/8rVEXB9tnErOioBo3NsLl7U/dFIMibwHYfUxg==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 0/4] soc: amlogic: add new meson-gx-socinfo-sm driver
Date: Mon, 10 Jun 2024 11:39:46 +0300
Message-ID: <20240610084032.3096614-1-adeep@lexina.in>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_014106_698371_D81A6EA3 
X-CRM114-Status: GOOD (  11.62  )
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

Patch based on top:
- add new A113X SoC https://lore.kernel.org/linux-kernel/171766521601.3911648.2220702176918701226.b4-ty@linaro.org/T/
- Add S905L ID https://lore.kernel.org/linux-kernel/171766521524.3911648.14792995642693649032.b4-ty@linaro.org/T/

https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/drivers)

Changes
 v4 [1] -> v5:
 - split patch for A113X SoC id
 - fix warnings
 - add dt-bindings
 v3 [2] -> v4:
 - rebase
 - fix double free of pointers, thanks to Krzysztof Kozlowski

 v2 [3] -> v3:
 - rebase
 - update dependency in Kconfig for MESON_GX_SOCINFO_SM
 - add links to secure-monitor in soc driver sections for A1, AXG, GX, G12

 v1 [4] -> v2:
 - create cpu_id structure for socinfo variable
 - create meson_sm_chip_id for result of sm call
 - remove shared functions
 - move from funcs for bit operations to C bit fields


Links:
 - [1] https://lore.kernel.org/linux-kernel/20240516112849.3803674-2-adeep@lexina.in/
 - [2] https://lore.kernel.org/linux-arm-kernel/ZfMJ_Z07QkwFbOuQ@bogus/T/
 - [3] https://lore.kernel.org/linux-arm-kernel/20240221143654.544444-1-adeep@lexina.in/
 - [4] https://lore.kernel.org/linux-arm-kernel/202311242104.RjBPI3uI-lkp@intel.com/T/


Viacheslav Bocharov (4):
  soc: amlogic: meson-gx-socinfo: move common code to header file
  soc: amlogic: meson-gx-socinfo-sm: Add Amlogic secure-monitor SoC
    Information driver
  dt-bindings: arm: amlogic: amlogic,meson-gx-ao-secure: add
    secure-monitor property
  arm64: dts: meson: add dts links to secure-monitor for soc driver in
    a1, axg, gx, g12

 .../amlogic/amlogic,meson-gx-ao-secure.yaml   |   4 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   1 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |   1 +
 drivers/soc/amlogic/Kconfig                   |  10 +
 drivers/soc/amlogic/Makefile                  |   1 +
 .../soc/amlogic/meson-gx-socinfo-internal.h   | 128 ++++++++++++
 drivers/soc/amlogic/meson-gx-socinfo-sm.c     | 190 ++++++++++++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c        | 140 ++-----------
 10 files changed, 352 insertions(+), 125 deletions(-)
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-internal.h
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-sm.c


base-commit: 9584e2b31432a608bf29d074ac39e855eeee2207
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
