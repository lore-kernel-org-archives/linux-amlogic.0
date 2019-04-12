Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01963C10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:52:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6E352171F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MjokZE7+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="L6sPYtYc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6E352171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pvs/2chWHBKEPLcqYqjtNmNsr35KPUBcigvIfnCQbg8=; b=MjokZE7+5HuYZ8
	GK6hRP9/UA5RWrsQzZFdU46DaGMTGKb59ENmaCFtejEOBaxwWAsgsVlDrPSN3qv+nlVQ6U3Ujlr/1
	RmfiT7QCPxQAdAMDqpJYxdB+oQuTy3Vih8ecjAB78uZKJ4e97pA/BJgt/3fnthl9T3fLv/Masvn/B
	tMJ8I2mbTLHp1X/bXQFl0VkU42KIworRQ2SCbGaNEU/VYS9RMHbUL+JQXVLasXWY8rtb1YVRUeNIB
	N7dQnu7TZp9FAi8mL/m0FhiZjq5lPlsvN5hNW7jVHNuHMU6J2yJJ1BqLgXtGFILBdxS+6H6n6nToi
	pfK/nouFLA1TnidElWVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEvfE-0003KJ-Pk; Fri, 12 Apr 2019 12:52:16 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEvep-0002qo-Mg
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 12:51:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id a184so11099794wma.2
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LyEpL17LgBNZeGjq/1bCg8MXLn3ABQcKDag1wbyqyFQ=;
 b=L6sPYtYcW2TpMtcF2CXTtyvSfab1PYutcI+IRWV06fe/fHjYd0kO0dxeElOFb2HO7M
 M6tYMDXWM7Dar2FshOm/ezWzIGBkkF6g6nZL3TGqRxXdHaNUsIInSwDhGCd4pWB4Uuo+
 9vtTQIVxtgM+GV9oM0/tNDr7s4wbqI0uuGQoeofInM/rBk6JURzCQrpvne96slZzyEcZ
 MH4Y2NARyZNHUryKkctOwDoKGbQO3QdxgAD5o0JTQZHgeRKRoDOMl4U7PPihKtBKUOQp
 msGVbJhN3qHOAonr7O0q3Zpik/HmJfuTlyEzi0MJL02uOA72cX0KCUYJPxt8BCmbP0l6
 i80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LyEpL17LgBNZeGjq/1bCg8MXLn3ABQcKDag1wbyqyFQ=;
 b=mzOE1Gke0EqSzNDACoFRxIlxqerx98tKX04eHGe66hVK1tEMPpGeKF19jc8Yj4KRzh
 DkWSOmIB3lJieN+LdxR+dX73o/m36nPyxC0vKo6Krra7oGbKTBlWBCiAXtlfnJo1hnmB
 elEy6U22OHHEqQhGW6J8ijutt5bnuIWqaZmbBASYoqva+WR14/xUf1yYLnJCDe4mc4+Z
 Cyiqx74WpNpVEgVLoatrreOVE8P8H8HmohrFG1gAdIVWKVceoZtrDUW4qD3DiyQzj9Fr
 alI5X3GYqeM6Dt6U+JBiJw6Gpki+lJssGEtM0po/BHTkBkr1sOv95bo1JpPp+WySPWvk
 hpyw==
X-Gm-Message-State: APjAAAVrqnlhBencJjsVxh6d0KNyL796algN5k+5sitjv4ZlPeEcN8mz
 3Tq5BuOAwRxqQx9M56pCW+1/mQ==
X-Google-Smtp-Source: APXvYqzEGdtoEfCd85te0YIevixYWmQNLaY+2lAnWUA8HaoI4yIi7XkNcL10AdjISzwUjO+BWkGIiw==
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr11154540wmf.73.1555073510078; 
 Fri, 12 Apr 2019 05:51:50 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 b3sm42049702wrx.57.2019.04.12.05.51.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Apr 2019 05:51:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/7] arm64: dts: meson: g12a: add audio memory arbitrer
Date: Fri, 12 Apr 2019 14:51:31 +0200
Message-Id: <20190412125136.28232-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412125136.28232-1-jbrunet@baylibre.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_055151_949480_30549415 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the DDR memory arbitrer dedicated to audio subsystem of the g12a

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 1ab2a77b01eb..b2acece1b66b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/axg-audio-clkc.h>
 #include <dt-bindings/clock/g12a-clkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -238,6 +239,14 @@
 
 					resets = <&reset RESET_AUDIO>;
 				};
+
+				arb: reset-controller@280 {
+					status = "disabled";
+					compatible = "amlogic,meson-axg-audio-arb";
+					reg = <0x0 0x280 0x0 0x4>;
+					#reset-cells = <1>;
+					clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
+				};
 			};
 		};
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
