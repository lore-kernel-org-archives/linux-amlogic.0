Return-Path: <SRS0=YQie=ZM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3E4C432C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 16:49:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C04612067D
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 16:49:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AEnGNMX2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZ0tvPHt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C04612067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FdjOf3E/y/kWzQ8fvHS5/iv5WXfhsWTCifJU4Vbwws=; b=AEnGNMX2ZcmoS6
	ty8XiDIw7+IKxQHQs5CLxf7PRDAgFvB0rCfa8ctXovT7bGt1Rc8MQ6NIPCq4Evd/lDGbnKxw38X/9
	WM3p2qLoZ4Yd5kvOSz8esUX90zIlJ7BiC9auLuJU4etHEaXaNW0Nh1IG+ZUeyqDz6hix10Flsl4Ez
	c/64CNhkiyJk67s5R9qLxbGM+phbpT0yJfkUqQieWnQQaZvozc52MyNptj1m05362bTQ9JDFTPgcX
	P1hRkk4bPqJ4lNgTUgk/7O1WswqPe6JRV37qZKuxvuBrMtd+tKBqHP+2MQfA6IF/A/6ynF4rXbflL
	GSjzmYS64YwiI2D+ulDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXTAZ-0006Xb-M4; Wed, 20 Nov 2019 16:49:31 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXTAV-0006Tx-Cz
 for linux-amlogic@lists.infradead.org; Wed, 20 Nov 2019 16:49:28 +0000
Received: by mail-wm1-x341.google.com with SMTP id b17so359734wmj.2
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Nov 2019 08:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vmSi8EVrgfkOwDbdlBJAaLzmI4f0gNbA0ZY/mXAh7Y0=;
 b=iZ0tvPHt+6sLoiKx5i9QaG23U+NP0Z8FlKj8secF60emaLvyEdt7mHazIOi9yiEdxO
 5PLpwpThoWbBhN6K8dSUiicm/t1pMoaQ8s1lNdRCH8L7Q7SWq/hrxjXXJ3o0yAzBbg63
 7NG8dJvw8AHsDsbklaEFA4efQR3PzCj/jhmA5ujvrk6dC2MLk2K9r+0GSLsr/q2YiuOn
 UFzqeNCBjzLTUGUS+AbZaEEtA73zMAWGbtc/QtVfeCZxcbXnf95b8koiYNq2lIBzrpWo
 boND2XPDZXKZ59bEFaRIRXM2n/XfUere3zVvwuPG12C97UFNKS7JvVvnYlbyJV1CurjM
 B9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vmSi8EVrgfkOwDbdlBJAaLzmI4f0gNbA0ZY/mXAh7Y0=;
 b=KmzI75rhWIr3SUB/oknXm8Lp78EaZwujbzw076CtWAsj/PDG7Fr0OgdQT8xWjR6L+L
 SZ20ydFGgBD3pynSeWbT657uL77p+JmtaPQPGCKmbOfyZo55okZmfeZ41+tcFCqeRrWq
 tG1U9VbjFCQoGByfbVUEzWUuS9BmD6a1xPyhWB2Ox8/8oMUlrwvmubLwbdahs6iqGFD4
 tV6zCkNt7e0A1+eJ/kfYWozHOTDGAmMvfnGwJZW9WqcA9IZKxNLNn17c5pg17jPreTzl
 5YbaqnJFzwMkOIXzw5wv+4GzvXyJ13wmAbd3mMStOdC77oTMN/SkVGhBH9pNhVcXUOwy
 iKlQ==
X-Gm-Message-State: APjAAAVUOJqe9UgGIiT3VYgsaaDDRVQnAZzVVsrXj3Sif4s/DuY+8S5g
 SV8UlV3sucaau7MdohKLFbDChS38D6K78Q==
X-Google-Smtp-Source: APXvYqxhZ8lbeO9GoFwdNyav9xP6d7aReSI2RiAJWQN6bakutR1VLRCdWpMDrWQ9q5bSTazIjuvOlQ==
X-Received: by 2002:a05:600c:3cd:: with SMTP id
 z13mr4377825wmd.105.1574268565764; 
 Wed, 20 Nov 2019 08:49:25 -0800 (PST)
Received: from localhost ([37.238.189.2])
 by smtp.gmail.com with ESMTPSA id b66sm7466599wmh.39.2019.11.20.08.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:49:25 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/2] arm64: dts: meson-gxbb: add support for Videostrong KII
 Pro
Date: Wed, 20 Nov 2019 19:49:16 +0300
Message-Id: <20191120164916.31698-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120164916.31698-1-mohammad.rasim96@gmail.com>
References: <20191120164916.31698-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_084927_440728_6CC2B64F 
X-CRM114-Status: GOOD (  14.30  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Mohammad Rasim <mohammad.rasim96@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds support for the Videostrong KII Pro tv box which is
based on the gxbb-p201 reference design

The device tree includes a new compatible for bluetooth "brcm,bcm4335a0"
which was sent as a patch and under review

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 84afecba9ec0..a795a170dcab 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
new file mode 100644
index 000000000000..2aa0b01aeb6c
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxbb-p20x.dtsi"
+
+/ {
+	compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
+	model = "Videostrong KII Pro";
+};
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4335a0";
+	};
+};
+
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_rmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0>, <10000>, <1000000>;
+	snps,reset-active-low;
+};
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
