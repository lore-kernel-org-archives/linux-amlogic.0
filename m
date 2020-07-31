Return-Path: <SRS0=qkt4=BK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6899C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:21:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90DB62072A
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0PZfU1e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="urMlrhKZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90DB62072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K4rBvDb6Frp4YQg6L2i+38Neran03mzhkWmUgLy+Oxc=; b=m0PZfU1e/qzU/Ilj3x+JRD97M
	atnh63wMBXr4AjxnnPAAY0fHcHWS4qbDBulXAp1D2jSeVqj2NbGhkF1ku7LC/ohJlYf05DdNcbthz
	WOUSgdhp5GR7C1OKgHFnZjv6elLyKLdFwggx2N7NhjJr4W8A7j3/Je/bmUtksHiyJYYrReCBZleDi
	yNKL691iCT5IUxZ+m52IPgeiPqhHAojixmVZx99llGtdkDAvYDAY1S5Orf70uSNAs6Z0FaZFOv+iN
	6OGx52X41FWDZjddDpwmrMWwn5gZPraNss4Inr07Mziso6EqB0WW5JPxO+IByM+YK26sHTaMsbSBP
	19r1DYXrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1QI5-0002hs-FW; Fri, 31 Jul 2020 08:21:21 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1QHg-0002X8-QH; Fri, 31 Jul 2020 08:20:58 +0000
Received: by mail-pj1-x1044.google.com with SMTP id lx9so7145889pjb.2;
 Fri, 31 Jul 2020 01:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EAeGAtIVrSVa+XtAyFFPGmEyfij/VDCDtDCWaTPKURs=;
 b=urMlrhKZUiBFWXmWI2T2HlAKyOKQCOLXcjZUgEzXECrKoneutcgTx2MR8u5cvdRx2b
 5w5a5KId5l5AXfxtmFe1tyUiwWnpqflR0bXUM00zlcHznPdoMt6GovBRhWBz4eUcShsR
 xJFJxyb+fLQ905DEgZmhjUv2xnffLg+JDEk9I8CZ20x2/sw1IVLQjJ7laOvYw+zO9CBl
 17N0ykXKwg2UixfAKN8iF+ICpK1j0S86JA7XWN5erclB8zcoa2eLQpxrZjOTLyHKDpqg
 y2j5z/7EUJM9XuK66+M0Yf7XK6otjAllnJPSU4pLUDmtlz3omTB2Wgh53UbUbNdzCCDJ
 Asiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EAeGAtIVrSVa+XtAyFFPGmEyfij/VDCDtDCWaTPKURs=;
 b=IRRG+zdyU5z0vjgwUvC0eKpLF70n/um3R75AC6MbnZjCQUWCkZ44BJhxUz8BMTFrzO
 +8nlRgc7L81z7Y/wBCk3MNzmejW60OLxtEC6mXz1znt/ctf04rPlZrlbGx/vgQfoj31C
 2kGU3xid+Kd0sJTVpGyEKeX0dVdg6YTtjOYAiiv7DyDNW9MTNtLAWluD4aIrAqEJNVDr
 Rj8yc3AtZQboiBzAztNBgIzR6cFl4/YCwDBwI+yEsYrt/2tuiIAnrcPzkjltGQJ+DXHK
 /6etI8DBE1l9QsruNBvoSZKQp7h7Ut7W8Pyxuwq3dz2/MCpVCD3huybWclCuQvPKuvGS
 r0yQ==
X-Gm-Message-State: AOAM530q+7vS3+E9RjpIoP086KGky+tGtBCBU4sP00FtdJpLSkBfQnxd
 9HCe2+LSWsk7ZRBX4Pgm6Sk=
X-Google-Smtp-Source: ABdhPJxgL0lhx3Q80JazIJvxeeNOZVy7i1JZ3IU+YYaa6/GwlMKp/GJSxz3GT1+wEgUPcZAd1BogsA==
X-Received: by 2002:a17:902:b902:: with SMTP id
 bf2mr2805513plb.100.1596183654722; 
 Fri, 31 Jul 2020 01:20:54 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
 by smtp.gmail.com with ESMTPSA id 202sm5892917pfy.6.2020.07.31.01.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 01:20:54 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/3] arm64: dts: amlogic: meson-gx: add missing ethernet
 reset ID
Date: Fri, 31 Jul 2020 08:20:41 +0000
Message-Id: <20200731082043.1682-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200731082043.1682-1-linux.amoon@gmail.com>
References: <20200731082043.1682-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_042057_407035_3E9036EA 
X-CRM114-Status: GOOD (  14.28  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Anand Moon <linux.amoon@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing etherent reset ID for reset controller to reset
ethernet mac controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes V2
-Rebased on linux-next-20200730
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 0edd137151f8..726b91d3a905 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/meson-gxbb-power.h>
+#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -575,6 +576,8 @@ ethmac: ethernet@c9410000 {
 			interrupt-names = "macirq";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			power-domains = <&pwrc PWRC_GXBB_ETHERNET_MEM_ID>;
 			status = "disabled";
 		};
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
