Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2A2C25B78
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VrhU8yL5vNFEOyyzStPWXcSxeiJtA2gmSn6wVyoSFAA=; b=yAI87So7tb1MQJ
	aEpeIANSNF4gPkrZjyxGLeZJLN8j8ljJVIuaCovyIcwDrdgxjEFyr0umAcoK6dT4VUnJys/xHRdHz
	XFPCsEZ+hjyK5k7U65KPRdhO0vBSR0lcAaMkO3+Jk1kmJh8TxBGYXdKRmk58hyN8KUpvLe78aT3ET
	5S3qFv8hn4rS4YK8v0NYxmaQpsFKrhQLFKfNwUjEM6UGh/oZd7GAq3XGPS7BbrWZqBK+CqpmGpdGU
	YVZeRlDwZLBJX22itTHl+tNdfBQjEKAtNPZ0WM7/KIMVsQEgdVWbu9woGpn9MJN34yr1bxLHMkWiX
	Cr+G691p/9pqPZH4NRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ZKY-00000004cUC-3op3;
	Thu, 16 May 2024 11:31:26 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ZKU-00000004cRX-2WVN;
	Thu, 16 May 2024 11:31:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6932918170C;
	Thu, 16 May 2024 14:30:50 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1715859059; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=sUG/HeDQDW4dy64C0qHQoZwiODpoUoBXq67d+LqK3k4=;
	b=egHtQ4F+dV+UXp3/kecB5/+VfV45KSAUR30fC10xz/2JaZE1/uLf2qOoxDeUq3CvvVoANB
	z6CgefUJJBUUGDwHkQEGbNuBmw4RJW/CPdIGKd8lncyzwhIul13hrw7ZpBAn642wlb54Pb
	7zvk/fjDw+KfNGvCTIsdH8bOlcRI29oOieoRb7KHYJ10ep+PZbL6ZP1xQ7j9fbh69Hii25
	KrJtfJvqHFbmt2IJahBXG6387HBHh8RDdRai1xw+g5cZVe9z4E6VqFioHkt+ikCy5iENdV
	PP5e7u1I/njjpcrqmUJSwbZHzs6bLsAGNZ/7NGB7tD86eRlm+lJdIPg6iFsReg==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 0/4] soc: amlogic: add new meson-gx-socinfo-sm driver
Date: Thu, 16 May 2024 14:26:45 +0300
Message-ID: <20240516112849.3803674-2-adeep@lexina.in>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_043123_209278_C1B646AF 
X-CRM114-Status: GOOD (  11.78  )
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
 v3 [1] -> v4:
 - rebase
 - fix double free of pointers, thanks to Krzysztof Kozlowski

 v2 [2] -> v3:
 - rebase
 - update dependency in Kconfig for MESON_GX_SOCINFO_SM
 - add links to secure-monitor in soc driver sections for A1, AXG, GX, G12

 v1 [3] -> v2:
 - create cpu_id structure for socinfo variable
 - create meson_sm_chip_id for result of sm call
 - remove shared functions
 - move from funcs for bit operations to C bit fields

Links:
 - [1] https://lore.kernel.org/linux-arm-kernel/ZfMJ_Z07QkwFbOuQ@bogus/T/
 - [2] https://lore.kernel.org/linux-arm-kernel/20240221143654.544444-1-adeep@lexina.in/
 - [3] https://lore.kernel.org/linux-arm-kernel/202311242104.RjBPI3uI-lkp@intel.com/T/


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
 drivers/soc/amlogic/meson-gx-socinfo-sm.c     | 189 ++++++++++++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c        | 136 ++-----------
 9 files changed, 339 insertions(+), 122 deletions(-)
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-internal.h
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-sm.c


base-commit: 1b294a1f35616977caddaddf3e9d28e576a1adbc
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
