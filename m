Return-Path: <SRS0=3vaB=QP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB37C169C4
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 14:43:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F8D02075C
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 14:43:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKppEEh8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hQgcIPkN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F8D02075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nj2lUhuz6XArvLHeNTA7JY/i9tvN74I95OmlPG/kToU=; b=RKppEEh8QkY0lg
	lsd+Phi/J4BvId7knWrt3d+GK700wy+iDutbj9NSwdQwPhjDG9eXtKg+EgPrr56f8yRoNgULo0oF2
	Uk23cnPzI+e9NIlhXlm5ngop9KiWJdrJsB/vyUNFbw3BZpCXnYskrhUEcN4dYIy3BTpORR2KmQGOq
	QBgCLFucrJ5dOGiabnUh8jfRS0/5T6FUNzUNPRgCTRSokNM2BKDjI/MFrsSwe0ySOFb7BestySOFk
	5DrDMhibLIRvNTH89mZ+KYtMSi9xwdXor5KShxFHE7+WR1/Gr2qCVtveEIbRrkGD56dFt4lWq0wWY
	yRmdgL+BItgFqk8tvWxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs7Mp-0005vD-Di; Fri, 08 Feb 2019 14:42:59 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs7MM-0005RJ-KO
 for linux-amlogic@lists.infradead.org; Fri, 08 Feb 2019 14:42:32 +0000
Received: by mail-pf1-x443.google.com with SMTP id z9so1769965pfi.2
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Feb 2019 06:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tyT92C3dEmrnaIfaPycI37ukcjwYqWOVbzH9NVAKCkQ=;
 b=hQgcIPkNJWUasAOAsWSBAai28MX3Htbs9EmKAbkONioNSb+u7oHDsYprgR9YQoTwjK
 s1SJVnOLPFhAbaXk6MEXjtnTxLbsNwDJQEquojEvSWCU9DsX8g6SRiAcJp2YZLMw8ovo
 bZSrwI0Q2jmFuw5zveKpBnlcB4Zzj5/DHCWQWC3ngbp5zwvcZxjei9wteMcuLILyibOA
 TMsAvMZK6UOzvIDhWfYKrMY3fLfNR9K/3eV+YqRLdzsPyT2uTCQdoNzYSXQz4F8Ng3ct
 rPdI18hCJD+AkaIPJg/60F3UbZhIDQNVwQGtj61JvQwHRYy5VPS7KXp2hiZLKw/3auYB
 AktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyT92C3dEmrnaIfaPycI37ukcjwYqWOVbzH9NVAKCkQ=;
 b=XCx6XQl/rZL1c4Vcp8FsBiUw95hPZCj2NMBq1wQmLRuMFqdEZytRwouq3dH6DfiPUW
 aOcKBmMlGT2oylgXObVjfI2gdUTYrRs7K9BNH5SysmEZWv7RvIhx76zPuElTf2NXjOiv
 yCSWQuDIHSMfM4VSCw4ne0QvvLLK7qgt/PO2gzNpqIuUW9eshGOqYCihIB8sgC141+Pc
 pt27mfpZ2LtvWojpBFJ5+vwhn0EfpMCdEPNHF786iKmsla8bAnQwhgn86gYMUpMe5+gq
 dYFfYjBa6gK2KwAqIuyphqlMtH/PhyiwNA/LgndYdmgl/tTBDMa/WubjsuqY8lB3w1G+
 LkQA==
X-Gm-Message-State: AHQUAuaEepI2gS/DyoGGwZHRUttzLtmbgGqOBxxJ6xWgyRXnAJHYuODs
 oO7DO+Hqfa7XZESbH/62tz2fb6h9WdA=
X-Google-Smtp-Source: AHgI3IYPcloHlBmDINdKrbNSwZUcZvoiLV3Q353/5/Rs/7JJ2cgni7ENzaNsPzF5TB6SMJzOkQV3pg==
X-Received: by 2002:a62:5658:: with SMTP id k85mr22411480pfb.231.1549636949149; 
 Fri, 08 Feb 2019 06:42:29 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:da9d:67ff:fec6:ee6b])
 by smtp.gmail.com with ESMTPSA id e11sm2425573pgs.53.2019.02.08.06.42.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Feb 2019 06:42:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH v3 2/2] arm64: dts: meson: add g12a x96 max board
Date: Fri,  8 Feb 2019 06:42:26 -0800
Message-Id: <20190208144226.15102-2-khilman@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190208144226.15102-1-khilman@baylibre.com>
References: <20190208144226.15102-1-khilman@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_064230_669653_3C363AF1 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the G12a (S905X2) based X96 Max board[1].

There is no branding for the manufacturer anywhere on the product, so it
took some digging[2] to find the manufacturer.  But since there's
nothing about the maker on the product I've left it out of the DT name
because 1) nobody will know that name and 2) keeps the DT filename
shorter.

[1] https://www.cnx-software.com/2018/09/25/x96-max-amlogic-s905x2-tv-box/
[2] https://fccid.io/2AI6D-X96MAX

Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
v3:
- add dtb to Makefile
- add link to FCC info

 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index f12efa27c636..0821fed4c074 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
new file mode 100644
index 000000000000..c62d3d5706ff
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2018 BayLibre SAS. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "meson-g12a.dtsi"
+
+/ {
+	compatible = "amediatech,x96-max", "amlogic,u200", "amlogic,g12a";
+	model = "Shenzhen Amediatech Technology Co., Ltd X96 Max";
+
+	aliases {
+		serial0 = &uart_AO;
+	};
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+};
+
+&uart_AO {
+	status = "okay";
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
