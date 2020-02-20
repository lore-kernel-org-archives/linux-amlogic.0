Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04751C11D05
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 16:26:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA24206F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 16:26:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mgWPD2GA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KN4+M85M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA24206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=kQxGj87o1fn8uouKNma7L0k8P6hR4DLQorllQsHNKwM=; b=mgW
	PD2GApYPenDeIweF9Ko1RAS0Uirq1vawjQCLkFwnU18CTyhx7q4p7Pm7MAUp1RBJZJMIM3RSgk4Sn
	ZQm53bXutC9saVowV0zVKfQ4eQmYuj/OAMSxy9JX39UEJijHDJBhkKV/LUKhDt6297+EybrZnnNlv
	xCVkaE8q4MabSJkXA+Lc9SoTcbtbL+7ecH3jBXvTCqaJbSKfCdrFajQc1YeZVtHnMXdJIZvneJlnY
	KfsXGMsl8RDabcP/utVVpeKNMAhGpfYqEkGiLBq2gSjogHNauvrUerX/wKfm/ssrHLtMPVxDqubeE
	dlkGx6y6dz9SYKxtB0FHp1OU38NYyjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4oeW-0003zI-Lm; Thu, 20 Feb 2020 16:26:16 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4oe9-0003XN-8l; Thu, 20 Feb 2020 16:25:54 +0000
Received: by mail-lj1-x243.google.com with SMTP id a13so4824923ljm.10;
 Thu, 20 Feb 2020 08:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kLCeh2hYjGPl6+22S9skiaS6Lwi7X9cC+fUScfOkfNs=;
 b=KN4+M85MvqR5gFb7czqWImi4xpcDKLXmqdj8vJd13/UVhbm+Ehz8HjJ45PCdv9t5hr
 EMiY0KvpZQfVFhJsYFB9ydYiaae3jiLf9CHCXv2yXKpHOBH0+QGl+/notDZh2iWObg4t
 niwC1nF9zN8OoE2gcR38Hqv2yu1jtyT3rVENUGhTKctAL/JQo0un1O3sTope2C/JCe3J
 9gPtSyu2s3GJ7wXuFTx/MpR8+K/A04Vh1ylVtqS0smwGUcHMC3+tir5AgZUl8V4KQD//
 hHPWYv06Drm2IxW8GGSZ41Aj7lekNPbGqULcbtgoyvYMn6gXNG5ytM+omknRtTv8sAzJ
 uNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kLCeh2hYjGPl6+22S9skiaS6Lwi7X9cC+fUScfOkfNs=;
 b=ZwXD88kRtIvDVure3DEodN3slzH7xgPnPCmTj5/PwH/TL+XLXxVasAD6OxrrEWF9Qn
 5vF0X83ni0RKzSeLkjzDTDiewnf+IsjBXPXo+CjebgYM5O9RNKVt1FPcu/J111eZlPgp
 hSMxQk+/HsE94U6gx38q2Uai0DWSffZ372tUxR55NvA/iI4yeXWrERS6qvwGZCEsnx0W
 ueXLZ8GFeYG+AOfFRhJSD4SxAEMsTa8NTYtdvCXR49eZkCi4IwLFFkIZ+lPfAXxc5EPz
 VGgZCYLskkKY5XvlANTp8iOuceLb/2Isv2cuKdHsnUpX0kX4uQ2+9CSIpKL3v/sNS4cN
 LdsA==
X-Gm-Message-State: APjAAAVpYqjsXayiZMDPcLdMbkD3qPvBPL2R4LVnphQ09lQF7RmIFvuX
 vu8RSuEQPSHBExYy1KgKhKs=
X-Google-Smtp-Source: APXvYqzbjfJc19VrvFIqTzezHsniNvpL9Nn/rt4Xov1EelOo+z+JciRkBvpVmCJuqeULxMU6fKE13w==
X-Received: by 2002:a2e:868c:: with SMTP id l12mr19455557lji.194.1582215951463; 
 Thu, 20 Feb 2020 08:25:51 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b13sm2217956lfi.77.2020.02.20.08.25.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Feb 2020 08:25:50 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-gxbb-vega-s95: fix bindings and bluetooth
 node
Date: Thu, 20 Feb 2020 20:25:00 +0400
Message-Id: <1582215900-12716-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_082553_329064_1B9127A6 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds missing bindings and fixes BT output.

Fixes: b07a11dbdfeb ("arm64: dts: meson-gxbb-vega-s95: fix WiFi/BT module support")

Suggested-by: Oleg Ivanov <balbes-150@yandex.ru>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 5eab3df..0012779 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -4,6 +4,8 @@
  */
 
 #include "meson-gxbb.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	compatible = "tronsmart,vega-s95", "amlogic,meson-gxbb";
@@ -245,6 +247,9 @@
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
 	};
 };
 
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
