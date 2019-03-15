Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43D4C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:43:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9447F21019
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EHTGZ6H5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ssZ3nbw7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9447F21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gjhZs2StWm3cu3EMjglIJsXKYZ3HGctR67fgYmTYlc=; b=EHTGZ6H5U2OryM
	LT1DuXEp1JVjEQwjNzNyTjtaHCuuw+aS1jV6UWxjyRBZKY1RodRpFSSNng3hoQR6H21Ei19+TKG6K
	ptm6/tmQWr3Zu/LGOFKnBfS0snQ2cABhL8iUKgOSL8GWHFfrpnt4Ynacc/SntDzfdOMIFQMjIlFyV
	gRSxAPGbU+HWiKv3yCp5C4S1yADWLrTjCLj3yXRNUMUR+2chQcFoOiXpCu0qo16dQtuBX6eOB1k5O
	hopPm5d2baYTkuzLeWFk3OJw4gcix9vQF8mAZRqY8UHPWXrNnnOA/XxCinSNaCMp/0f9bMRSuSsLO
	9+gdvrQdAz5a8hR8gfkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4n7a-0007m3-Dd; Fri, 15 Mar 2019 13:43:38 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4n6t-0006cy-LS
 for linux-amlogic@lists.infradead.org; Fri, 15 Mar 2019 13:42:58 +0000
Received: by mail-wr1-x442.google.com with SMTP id n9so5539154wrr.9
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2019 06:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vyS/YZPD5p3AVqB/Q5owFZpxvtTyLZqFLYc5jnuRxaY=;
 b=ssZ3nbw778qWn4FjK6qocnt1XtcEE3TUaUChdc6yDsnleU0nPOe1OhSFw5FErs1yTC
 /Ms1Mbfj1LsNnrrM24MQ770VXASbGxtuSHTajx9gcZQnyAXhpNdNVjx+FSGBsHRPt9+x
 Txdx3sDyBbwV6qwjw7CzshfAYYSSPHyx/yaPF5u5HwHVZozbtUqyGAyCwoDt5G9XXCtP
 2hbwDsIZQ9MwYEDCgrW9f7vB/+FB0u6rV8EuMtjmi+jUoyaKA21yHo13V7kHX04YsujD
 EnMcWgg2uu7aIXu2uUYEn150yGdtji3fQVCfabEFBMGdF3icCFnjx2xeFhe5VCrWXCej
 P3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vyS/YZPD5p3AVqB/Q5owFZpxvtTyLZqFLYc5jnuRxaY=;
 b=n732/Y3nEeJzLGUqmCAuZ4UQUM3Yf+zUQwFABowfVgcPyTnvUe9mWjjVXBtKAoK0ZI
 A6M9ocx6IpjAz7ZZBmaQ1GSsQteKBo6ArceoNuLtQArKXqKcAdYZEKGzOzQW/j1IzBnr
 onNnZrOypEWZ3vwWYIyAZ37hrYRa11Y8F2cp7dwNwxEqkxpkXxLwrWUILX3cLqm2SjU1
 WKXg2g1l3U36a5wBK9cktOFpf5FXjcoQxIzSWc8Qm4x6mOBKP85pzJKGbZeLY01739Ch
 cHfmudNSoQWEIJmdq5VSVnJvi5CqK0DGn4BuLXyyI5GdYO2yJaONWvsZj7SWcSv2wmfp
 L/mg==
X-Gm-Message-State: APjAAAWIpoZfz0J35RLquF1YGodcYb9Audmvo1sbhxow51GRHKcFkAk3
 3RTptsqWO5jvfb7t4NAlmMDisw==
X-Google-Smtp-Source: APXvYqzCvh05ZUHZRuJvmkMSMomtkEKoIBwKANQTpJyxyO9QlAq9SYTYSZT8kYekkd60U0DHWCvlQA==
X-Received: by 2002:adf:f111:: with SMTP id r17mr2594683wro.272.1552657373817; 
 Fri, 15 Mar 2019 06:42:53 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id x17sm4616143wrd.95.2019.03.15.06.42.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Mar 2019 06:42:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: meson: g12a: add efuse
Date: Fri, 15 Mar 2019 14:42:44 +0100
Message-Id: <20190315134244.14141-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190315134244.14141-1-jbrunet@baylibre.com>
References: <20190315134244.14141-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_064255_802408_4CD71A73 
X-CRM114-Status: UNSURE (   8.63  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the g12a SoC efuse device

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 92ee8c895ba6..dcc821cf35bb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/g12a-clkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -55,6 +56,14 @@
 		};
 	};
 
+	efuse: efuse {
+		compatible = "amlogic,meson-gxbb-efuse";
+		clocks = <&clkc CLKID_EFUSE>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		read-only;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
