Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFD2C3A5A5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0CBC21971
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RhQCeAsO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VdmoyV2G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0CBC21971
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhEYpQeKHAZEIwOZraA5r8SIxWCrskzAjJnhad6d9OY=; b=RhQCeAsOs2WfPq
	vydXqpKFcYLNTHj2HbWyHqod1NW9iZxngMrQx3zdVVppyC0ZbmO2YZZ+t0ZQW8/foE0D0xNO3B+6q
	3C604jdIziCqZkKlq6YARB3/e3JHRb29PkFLBq3YyO2KvxJZp27+et6WxJv0+JRtXk2TOw6oYmCxo
	goPBw5Fgp2SpHtkiq1zcleQegLJf66+CgMHMgpK6LoFO+P2vqGMWjzSn0T9JhbvaOA2aBCuOUIUgv
	SC5O1OHBnrVDd3qWuCGScKQi/j1/XDglJycuG5vhoJK9pgzfzW4BxrIsIF1tDksDXZ2J/cX2lN8lG
	VamyJgW1c8Q+cidVbTAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5rMz-0006Zo-JC; Thu, 05 Sep 2019 13:00:13 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5rMt-000684-Pz
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 13:00:09 +0000
Received: by mail-wm1-x342.google.com with SMTP id c10so2709327wmc.0
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 06:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Fy7M7fhIwMYXWwgYxjk3dKvxE3VtX41dFWW4vYeizE=;
 b=VdmoyV2GFf68u5cOuuZJp+zO4JtRHb6ufNYTVBiqOEosYCBvyoAQCseEtKiVMloE/j
 kU/3nIpPNHq7hbBEod+k9kr6y6z/rQI7QXP4n0L8QDNPcxPD++o4u6/YI3bCSUnOEPmn
 rKQWXhwE4On6LNa0ZAi4r8iOHA5VRFOaSUMtbss/lao9+ZkBSyDAGeP0DLEYPH2JgnF0
 Pm7o5EjxhgNWZMiu/jQRNObmhEnBitXLwSUcVwf+MXfR7pj4XcY3Rs/ZzPZlzS0QWRE3
 qk7Q9/K9KzCNNqqzR2BUmNlaxlJJxet6KwTrtL02JQDiiHC4DXqGWKbb+aRO4KjZPIcB
 veYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Fy7M7fhIwMYXWwgYxjk3dKvxE3VtX41dFWW4vYeizE=;
 b=C57j1qR1kFGGu28jhsY4sTmMe1iV5fIEDo6eMxIBBfnATq6A5eUDv9/F21l3C26Jii
 JicFBrys4f6/MFbYvUK1PCEfJrEEGu8YS6SKCvPDfoJvcbim/ufc7vdmBP+HqWdd8ld/
 qkYtYgcgV3cY8wAFwz3vzzz4AdDIRB5v1CEDbU00hsHL7F374/x0OGMHzX/2/ZQKALoi
 waTBVN5ZWMKIf/cHmxtrxRoZDmygqzPczfrM1jvAkgL1qTDKi4YM2mq8gi3HNfmdxJog
 3IrHU+6RpZn41Y6vI/NEabpNRKtdxlf0XCOzvSb6RqCerWdVs1tB7vSS4RVwDMAW7Sen
 u9ZA==
X-Gm-Message-State: APjAAAUGf47DkU40zmi2nnrOE/ICEbd/5O/5b4QqPDCJLhCbJc3eIhJZ
 OQi09RDrXHVwmMzvQfesGPCvVA==
X-Google-Smtp-Source: APXvYqwdWRfcJe7WNtZFLvTZ+W60rV8daZ9/FFFjadu+rO6EUD9fqSV5kfKKtp3zWU65QBx0LrKXrg==
X-Received: by 2002:a1c:2b85:: with SMTP id r127mr2812339wmr.30.1567688406192; 
 Thu, 05 Sep 2019 06:00:06 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z189sm3727903wmc.25.2019.09.05.06.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 06:00:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/5] arm64: dts: meson: g12: add a g12 layer
Date: Thu,  5 Sep 2019 14:59:54 +0200
Message-Id: <20190905125956.4384-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905125956.4384-1-jbrunet@baylibre.com>
References: <20190905125956.4384-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_060007_856765_47077CBD 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While the sm1 is very close to the g12a/b family, somethings apply
differently on the g12a/b and not the sm1. This introduce a new layer
of dtsi for part which apply to the g12a and g12b but not the sm1.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi  | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12.dtsi

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
new file mode 100644
index 000000000000..1e30061fb2a7
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#include "meson-g12-common.dtsi"
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index eb5d177d7a99..69339d69dfd4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -3,7 +3,7 @@
  * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
  */
 
-#include "meson-g12-common.dtsi"
+#include "meson-g12.dtsi"
 #include <dt-bindings/power/meson-g12a-power.h>
 
 / {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 5628ccd54531..eefac0ef092b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -4,7 +4,7 @@
  * Author: Neil Armstrong <narmstrong@baylibre.com>
  */
 
-#include "meson-g12-common.dtsi"
+#include "meson-g12.dtsi"
 #include <dt-bindings/power/meson-g12a-power.h>
 
 / {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
