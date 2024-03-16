Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141E3C54E5D
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2024 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozo5i42JShHv7XZSPKVgZAU7WC2hUiTwhvrYoelcYyM=; b=z+cVsxUOxpceIp
	oHskBox3dawj8GBeTE1jEJ4/Vv/ixz/kc7vfSIM/DKDYJO8L5PePNE80EN/WBCtOC35DjKpapnhKP
	ugfQE4LJFBQHXHptfLpkSR0jMwoOtxKnCGno2IaUGYg9p1KU4DDXlA0mTgBahjp1KZbSrDDKZKxXI
	oblMlHp0wkf4tnNsKHDUS6oBeHBb/W5DvXDmRVuGV1coXUedmWhTGJL90yavWZ+pDHUhhDt35FKw6
	13V7p9lhAsJrKpcymuPWrc5MjxxUmqjvBxZv7zzgotMvVqbVeKTMWMrXgpsuw3RNVpIpEL/c+aNbz
	CPL1TLsSl/uZHC60R3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlUUk-00000003DmD-3rup;
	Sat, 16 Mar 2024 13:54:42 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlUUh-00000003Dkg-3xOW
	for linux-amlogic@lists.infradead.org;
	Sat, 16 Mar 2024 13:54:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41409dc5becso1059255e9.3
        for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2024 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710597276; x=1711202076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze781fdYMJC8X6yPwfz4FQS/isO5gR11eLckzIKPCfI=;
        b=l4pOyVvXV0HiqFwMEyqA/9Ehwj0sUMPJ/2DUozh2/rZO8RyTD+EfpRiFCpOpK/hZjJ
         6qxGZWvekOAILt6bI8Y3Lb2SodncRdr2oWsxFfRSHOPWugDTkKyEiQtD3Sl70sqPoIqe
         /zEuJNooy5z8XZSNdILAE/6UyCQKcXUKTTAWjTnn5v8iGS59eo/k6gYJd40Ygx3CDHyH
         /EHCOTN6rgYSJVypS9CvjcIPqQ+2Ex5KdOYNANznpjN8j6+sv3EHi8VrE0ihJFQD0IQ3
         HwtHR93FsVxOzXrRPPnnDddwRrYWzyb4CMO91Agl32SRwkNVWwsCX57VIQ5qXNw0cMM1
         n9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710597276; x=1711202076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ze781fdYMJC8X6yPwfz4FQS/isO5gR11eLckzIKPCfI=;
        b=auBrR4nELf0xDguDnlJe+vxtMhTCT7gd5fFXqIUJ5e3YxsexsIsI8tilTa1/GAvH6x
         0VkkKaU8qdUni6zJkvwlCpjb0b+F1rkt0aRUVQ1FmqI6h9Oqdsv6ti9kSuX0QF5Wqzgt
         hy0dBdUloIyfpgJcJtZz0x5mJgZNQv7Sy43nX980hT+BOB2wqPiczElwfQD7X43weFEX
         NXAef8NKO06f3bQUHCY2BHstlPJfyQvxgfFk6RYmYFQUl6nKMUjontgk5YCR8JqNc4bW
         Qh1N1QzB6+MJJbaX53zmmZc1d3V4eVnWfp+IGb0TRL1EGd3LqJht1CfK+ZwRNNoKLW6X
         1DTg==
X-Forwarded-Encrypted: i=1; AJvYcCWadJZu7Lr5LVNXX8O7QtD5Bii6j4IDth28R05J4TOF/md/KhDikNw0hv35YvmNbRfg+LO4HpQHDYxcGrLkEPS/Jhh6jvP8H7ctw323zHO/DsE=
X-Gm-Message-State: AOJu0Yy7YZhddqgx+oR1TJGzaHdlWPWWIenmpZK9n4JPyc5+PzUAZio9
	xRYNoIk4tcpDw4IVuq/0upzk8eLsETsQ73ui/3Tb8P1Hf3mkvsKj
X-Google-Smtp-Source: AGHT+IEBXJ+LDSb8yez8jw+oMX7DHpcrqiZApeJ2kmzGEWKJQ5sNvM+K+W2hgSajgULIqDUK/wrA+A==
X-Received: by 2002:a05:600c:1f8c:b0:413:f2c6:df3d with SMTP id je12-20020a05600c1f8c00b00413f2c6df3dmr4290047wmb.13.1710597276625;
        Sat, 16 Mar 2024 06:54:36 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041409fa57c4sm523963wmq.34.2024.03.16.06.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 06:54:36 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/3] ARM: dts: fix Ethernet on WeTek Hub/Play2
Date: Sat, 16 Mar 2024 13:54:28 +0000
Message-Id: <20240316135430.826898-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240316135430.826898-1-christianshewitt@gmail.com>
References: <20240316135430.826898-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_065440_006404_9ED2D9BE 
X-CRM114-Status: GOOD (  10.72  )
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

Placing the snps,reset content needed for Ethernet to probe in a common
uboot.dtsi results in the content not being used and broken Ethernet. Fix
this by creating two board specific dtsi files with the right content.

Fixes: 67d5128df950 ("ARM: dts: add support for WeTek Hub and WeTek Play2")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 ...u-boot.dtsi => meson-gxbb-wetek-hub-u-boot.dtsi} |  0
 arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi     | 13 +++++++++++++
 2 files changed, 13 insertions(+)
 rename arch/arm/dts/{meson-gxbb-wetek-u-boot.dtsi => meson-gxbb-wetek-hub-u-boot.dtsi} (100%)
 create mode 100644 arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi

diff --git a/arch/arm/dts/meson-gxbb-wetek-u-boot.dtsi b/arch/arm/dts/meson-gxbb-wetek-hub-u-boot.dtsi
similarity index 100%
rename from arch/arm/dts/meson-gxbb-wetek-u-boot.dtsi
rename to arch/arm/dts/meson-gxbb-wetek-hub-u-boot.dtsi
diff --git a/arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi b/arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi
new file mode 100644
index 00000000000..3743053eb9c
--- /dev/null
+++ b/arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-gx-u-boot.dtsi"
+
+&ethmac {
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-active-low;
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
