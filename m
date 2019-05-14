Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433B8C04AB6
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 14:27:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15AD521537
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 14:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j685RUoX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="K7GcW9FG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15AD521537
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K99T4gp/Yde2W201PINKeshJoKo2mHQcMVaY9GfUT3o=; b=j685RUoX6Ax3ex
	+31to/q1ChjxblTkEl0/LeJpdeamrnYSZXpUmFy0ilzyMeEZJau6KZ6wBc9jzPwPRu2AxU0Y2w/zZ
	RnW2kygBzEkK48RlpMWwN10c68pV3fK9YWThGJvp2iFVTSnC+VPrYMWSBvvo1Ar5zYjsqji92GM7J
	SSfL8muhooiTQVc0valeYiafyzxGHy/arQmaq/Hku42SgHYuGnT8kO8bFa94PDulJqHgFUNli4wW3
	QvGtzzqyzquGyQe4DSGOlQhGe87/y6TpQG3El/MLn2bux8cNGUDlkwMq3srajyymaO0OCJiqex45F
	BfC5XLd9neyuuTVk77lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQYOV-0005G0-Mz; Tue, 14 May 2019 14:27:03 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQYOQ-0005BZ-Tw
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 14:27:00 +0000
Received: by mail-wm1-x342.google.com with SMTP id 7so3052162wmo.2
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lVjP/TUvsFtzE93nQgdFOmYpEZuIaIcrKuBduhrv6Ws=;
 b=K7GcW9FGsMDGxGWbxMWdDHlnWThhYXf57bdn121CmkzrQDob5RNGybirJGZLfAsdCu
 T8QutaUYs3/d0X26GcQWtcCkl1fVXERlWhF3ZLTvMnk8DURyMRhuf64vBo6889GyysH8
 yVsCi/pIm3xMznYNNo2Jk9Cb9XseuEFj4quZrXBJIycHUXbI0/qEkKYDK4EEpPSnz9Pw
 LTQ4YMCI9XNNND0yoVVQSmZcX0WUJCiY0Tcb2muUXHAJF3/sxkz+XD/2z9vizen1kHlh
 c6PsAbjN3X4sXxrOcG2WSmI4bo8g8RiYwfLapqwu9UOp1rp4plPyfddQHAZN+0CgRsJQ
 EWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lVjP/TUvsFtzE93nQgdFOmYpEZuIaIcrKuBduhrv6Ws=;
 b=Dc2diFgCTWuUZAT8/nyrqkgx0zZv+cH/ycpJ+2sNbdX52E7nSptXOUjlX4ZYpk/nuF
 ZdVXXeP9++hgWlfWo5EL46GPz/7tXUEDftUwTouqHn4p2vbTjxp51x73FQWvZANGbJrc
 YHyrEN05fbPln+5CuDoKRrNgx7AwVJXVJ5l8Pv0IsLiDY9+M5wBGaGtftcgKbD0Cp8a2
 SP7AAa7wlvoHXw0Vv/vFIhMRh6TnsK/X5GMoalB5uepPQ45+lU6frNzoBbMuATpPKFyv
 7Rs71L1sCSxpwKL1kKUcpT2dI43wyZP5jbCKdrhmZg+G+ozpdhCWGDk91Z7Gi0/9/ZN3
 umRQ==
X-Gm-Message-State: APjAAAX1mYq31EPIlKmAA3faSrHKf3qlfaxVulNrjNhvirgRtOKaazyi
 xjCNhta6vG2f5wvDi+CYXuXq1g==
X-Google-Smtp-Source: APXvYqxzRoLfq1Pg+NWyMjtpd/8d6g1yBno1wegJJegosDrCNpzpZ9uiC2M+yIMJE5sQnvO/xvylYQ==
X-Received: by 2002:a1c:c016:: with SMTP id q22mr14286292wmf.6.1557844017646; 
 Tue, 14 May 2019 07:26:57 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id h15sm12343642wru.52.2019.05.14.07.26.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 07:26:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/8] arm64: dts: meson: g12a: add audio memory arbitrer
Date: Tue, 14 May 2019 16:26:43 +0200
Message-Id: <20190514142649.1127-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514142649.1127-1-jbrunet@baylibre.com>
References: <20190514142649.1127-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_072658_962041_CC1DA9AD 
X-CRM114-Status: UNSURE (   9.31  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the audio DDR memory arbitrer of the g12a SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 09aa024d9f0e..2d5bccad4035 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/axg-audio-clkc.h>
 #include <dt-bindings/clock/g12a-clkc.h>
 #include <dt-bindings/clock/g12a-aoclkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -707,6 +708,14 @@
 
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
 
 			usb3_pcie_phy: phy@46000 {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
