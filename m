Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39510C3A5A5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E53821BE5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MJlugTL4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VegfV2GW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E53821BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkzO5A4m6cuwHOZWy7OcXWOp3o1bibWLg+ctGN7gqNw=; b=MJlugTL47b0gWE
	6ibQr5iSapTytloQ42Oh5XEc2rIrqVLWsRXydJ51l6oAK+NLhPCmZIbPf4u+bQnlkZ1RshtEy28fc
	LlVWnJw2DzRqpDXB0h3XuQq3tuBx9A0JxpVzmYGEnVj2JWRdeYqNp5ePsX6dhBRDgMAUW/kTMM9kr
	2LxvjUCmN2Z/OIplEg/rfpZUesVrzeBYt2zoF9/W+LX8dwD0OD2aMVazIUF4z3dVM0p8VtSSGEcVQ
	YxXj8EsL+kcVbuwTV/jUFVielY/MysEK29e1So3F4FiK0peru/h5HHQbpvbepIckYwpOCgEJwrLdI
	mPO5XSDp9FBCrMZQshXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5rN1-0006ci-JX; Thu, 05 Sep 2019 13:00:15 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5rMu-0006FU-6l
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 13:00:10 +0000
Received: by mail-wr1-x443.google.com with SMTP id h7so1667271wrw.8
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 06:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ItMEpDF/ETBC68Y7AhaUHvdMI96KH343D0YWB3ja2rE=;
 b=VegfV2GWqvxCgtKh2Ptv65EU7va3mIh2cL4VnsBiVf6HgkbmXczGqy6XmSLL8OiGCm
 fsYuOIXoYsOKnLu8H/jc1Avip/zhnIj/tSgsj+DTOI7Zj0HRUhunQ+7CbtVgQp8aDYyQ
 kx2wYunEd2LnRthR76r9s6m8nFGMXJbK8ktb66zZ+GxCFK8sb9+3QGoBXwHGUKQFen3/
 F8TAHj6SrpyQFaqO4I0nGuv296Ay3FuoKbf4ELAXBw9JVXHKEVYyWTbma9+FhRXXnldk
 SFXDoPoVlZyp7mv5R1skyRCeqagUj2HUMbdFz8xBXkuo4pA0Q9zNi/au+F5G/WGpi5CL
 lIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ItMEpDF/ETBC68Y7AhaUHvdMI96KH343D0YWB3ja2rE=;
 b=bdq+B88djqo74u6zYTwgSG41sO0icjihNlIAlujWAMJkJOg+F4QALRUqoYDiWjaC2P
 eBfCgBvPrauqrWg066RLEWxpZvQ1CtM11Dx3bMKGJCa5xO6o4LRcLRIgL2iC+zK8A8y0
 Qiy1brWfWFDB8BQTZeOW17BTgAHgNTFrRifOzJY9Y0gn24kKZZpORAVODFhducjf+CHC
 zHI2NvQ94vDEKy0pzLx3UaOEEpVOCnHhUeFEhdDEk8kysejCseCvU6HmWFh4nvSOUM0/
 9drMGsPriUqxLwsPLdLU+CGQ/M1mQ0QEPILxCjxl5sJnayhhDP7hKddJW+eip3xkofzq
 on7Q==
X-Gm-Message-State: APjAAAUe1zmQ+Df4fqaMX4LDZm/Ni4UjeFCmfY2uYCCKLCmjMLENrvLV
 0Tr02oHjmPOX5kvR2b7qd9Wq6A==
X-Google-Smtp-Source: APXvYqwp+SuTEV+a4KTcSrYQENWCJMbhMJDAtYIjIi8jQWshU64TGTVKI1REbj9eA4A5SGa/Yz7QEw==
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr2364545wrq.328.1567688407008; 
 Thu, 05 Sep 2019 06:00:07 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z189sm3727903wmc.25.2019.09.05.06.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 06:00:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 4/5] arm64: dts: meson: g12: factor the power domain.
Date: Thu,  5 Sep 2019 14:59:55 +0200
Message-Id: <20190905125956.4384-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905125956.4384-1-jbrunet@baylibre.com>
References: <20190905125956.4384-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_060008_249147_C7C75456 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The power domain declared in the g12a and g12b dtsi are the same.
Move the declaration of these power domains in the g12 common dtsi.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi  | 13 +++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 13 -------------
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 12 ------------
 3 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index 1e30061fb2a7..ac5833781611 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -5,3 +5,16 @@
  */
 
 #include "meson-g12-common.dtsi"
+#include <dt-bindings/power/meson-g12a-power.h>
+
+&ethmac {
+	power-domains = <&pwrc PWRC_G12A_ETH_ID>;
+};
+
+&vpu {
+	power-domains = <&pwrc PWRC_G12A_VPU_ID>;
+};
+
+&sd_emmc_a {
+	amlogic,dram-access-quirk;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 69339d69dfd4..07450c4babfc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -4,7 +4,6 @@
  */
 
 #include "meson-g12.dtsi"
-#include <dt-bindings/power/meson-g12a-power.h>
 
 / {
 	compatible = "amlogic,g12a";
@@ -110,15 +109,3 @@
 		};
 	};
 };
-
-&ethmac {
-	power-domains = <&pwrc PWRC_G12A_ETH_ID>;
-};
-
-&vpu {
-	power-domains = <&pwrc PWRC_G12A_VPU_ID>;
-};
-
-&sd_emmc_a {
-	amlogic,dram-access-quirk;
-};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index eefac0ef092b..a9e1db0f1158 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -5,7 +5,6 @@
  */
 
 #include "meson-g12.dtsi"
-#include <dt-bindings/power/meson-g12a-power.h>
 
 / {
 	compatible = "amlogic,g12b";
@@ -102,14 +101,3 @@
 	compatible = "amlogic,g12b-clkc";
 };
 
-&ethmac {
-	power-domains = <&pwrc PWRC_G12A_ETH_ID>;
-};
-
-&vpu {
-	power-domains = <&pwrc PWRC_G12A_VPU_ID>;
-};
-
-&sd_emmc_a {
-	amlogic,dram-access-quirk;
-};
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
