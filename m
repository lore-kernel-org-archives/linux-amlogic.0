Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AE5C61D9C
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q7IHthwSLL0o0zLFltNX55F2+JmOIX9tCk7x2YXrXVc=; b=pMpwlPzjr03/5f
	RBewIix1T9KOd38rC00++2IiQ/QQQoFgjqOfTx5UL/HKuXxyDJ51Q2ExpR0eaPbjG7OG/IvvanWmn
	d1Cwl4QQ6GGVXEc9ebhVaE6KlU6aXLO+8C7TO549xQz6IshOFZhFaoKKSP9UHp4tAY0e9tVogWMDB
	ufnzbX1JZqUOeZRoRueZyXakEKgsXvvrR6xNrbLf84g6Gl31n4FZOPBuohx32p9pZcv0KWx5jpJtv
	Kfu3oG3gi0uyFb4goHbqCH96eO32n3nDeYqFhvZookPgpMLIX8CVZ+IJb05NB9+1XUJmOcoYOmsIt
	F/MUUEOjIBuqDErJYr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mmw-001sv2-0w;
	Wed, 22 Nov 2023 12:57:06 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mmr-001sqK-13;
	Wed, 22 Nov 2023 12:57:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99D4153ED3;
	Wed, 22 Nov 2023 12:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1700657813; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding; bh=NJqnHAtPlKbGsmXwWt6Mzhb01vRIrHrGSJJ9KKN9CCc=;
	b=fetTjSddAWPcFfjStVgAKIIqceJ4c6B6mXFlCugrJlyGmrjsGOelHSc2y2oEnfWrgWJKz3
	NLFhStEMpLN0We0NMEWCrw2XkTJuyLOrmS8/0tUUCuFcqrKBwcWwKv9POQb+TmpuVCWymO
	SWf4kPm41WaAKEoDHAdZk1ZV4xhIfhrSCru/2U0sUM7ya8y7GaGelOt6CeaM41USx/TqMa
	jv6fXyLf+ndyTD24zb6E1F84eJshhYiX1TdTE2ujLP+2ONiFTrsLx4gkzqF9SlO66JPc9D
	8PuRzxhSfBE2p/T+7++iiRHrV6u2FnK7wTJbhD6/y6F0BMn87uy0Ze5DmqQDDA==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/5] soc: amlogic: add new meson-gx-socinfo-sm driver
Date: Wed, 22 Nov 2023 15:56:38 +0300
Message-Id: <20231122125643.1717160-1-adeep@lexina.in>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; h=from:subject; bh=DcgIzLHIf256LOHM599wpJilJoTBV1o/3eeRP7SNgIc=; b=owGbwMvMwCHmnhFhrJcZuJTxtFoSQ2rstyOOs3z8P159rJUk2rqkoqfX9FXs5NANbz6c3bD/8vfk R2/fdZSyMIhxMMiKKbKEdQRN3eex+uLEBUYHYOawMoEMYeDiFICJPM1n+KfjHLLE+OoKdqc4v9s8T4 zMIlxC8/07525l3F9pqiR4/CnD/zAjyWnzdLtDZbPTbiWKOO3Y1bQsvmmpcnZK0TN7uTnr2AE=
X-Developer-Key: i=adeep@lexina.in; a=openpgp; fpr=E2FA1A767ACB0716E02E3E7AEE36B110025A8DFA
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_045701_989454_34CC4560 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

This is the second attempt to publish data from the Amlogic secure monitor
chipid call. After discussions with Neil Armstrong, it was decided to
publish the chipid call results through the soc driver. Since
soc_device_match cannot wait for the soc driver to load, and the secure
monitor calls in turn depend on the sm driver, it was necessary to create
a new driver rather than expand an existing one.

In the patches, in addition to writing the driver:
- convert commonly used structures and functions of the meson-gx-socinfo
driver to a header file.
- transfer the chipid sm call constants to a header file (perhaps they
need renaming?).
- add secure-monitor references for amlogic,meson-gx-ao-secure sections
in dts files of the a1, axg, g12, gx families.

Viacheslav Bocharov (5):
  soc: amlogic: meson-gx-socinfo: move common code to header file
  soc: amlogic: meson-gx-socinfo: move common code to exported function
  firmware: meson_sm: move common definitions to header file
  soc: amlogic: Add Amlogic secure-monitor SoC Information driver
  arm64: dts: meson: add dts links to secure-monitor for soc driver in
    a1, axg, gx, g12

 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   1 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |   1 +
 drivers/firmware/meson/meson_sm.c             |   4 -
 drivers/soc/amlogic/Kconfig                   |  10 +
 drivers/soc/amlogic/Makefile                  |   1 +
 .../soc/amlogic/meson-gx-socinfo-internal.h   | 102 ++++++++++
 drivers/soc/amlogic/meson-gx-socinfo-sm.c     | 178 ++++++++++++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c        | 106 ++---------
 include/linux/firmware/meson/meson_sm.h       |   4 +
 11 files changed, 317 insertions(+), 92 deletions(-)
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-internal.h
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-sm.c

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
