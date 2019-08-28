Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE6FC3A5A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 14:19:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC022189D
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 14:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMZ5gO0L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="z3RuttDM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DC022189D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6q/mSCFUeBBqkPbHR0rUXkSpZVv39b7LMdHu8svc2P0=; b=SMZ5gO0LlUMF+Y
	5H3DsUGPy1xvBpfv1Mgozf2EYn7igeHJq1sJtcC5FcJYwzm+0OIl1Bbaxxxc6s6raqm3UenRJGQT4
	f/QaIj2yW68Df90cCouDoMElV5gcmROidQdUoGTRKzG/qON1S4rVO2QNFiPMyH/jn13KYnUUdVkzh
	j4saWGt3LLUfvg4c8ZpVVcKQANg5N23XHYZwSrWx0VhiQYZI49JThsAxu+m9Eq3F2lPvVJQ9pVlTd
	aC1Ug5kqEWxzVTEpxSDwen0gxgHx8wZkCeBweYwh9zp8A2SWbKGvCAGOz1YYk9oL4EjIEemDoJfuI
	SSZ5UfXGehgC2+vWqo/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2ynA-0003ld-Er; Wed, 28 Aug 2019 14:19:20 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2ymE-0002kB-OE
 for linux-amlogic@lists.infradead.org; Wed, 28 Aug 2019 14:18:25 +0000
Received: by mail-wm1-x341.google.com with SMTP id d16so239740wme.2
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2019 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8fPXZy6s7fSXGNVXDgDu4BkBSj5SqALzh4Ghh1aBOk=;
 b=z3RuttDMt3zQy24jOPCzgIyuqq+QsAtA5zyPntuqSomsBiTTNZfb/86imnzx/8ah5e
 zYGzol3Lm6Mu0ZMr8k5Zh/0r40bfepyK2b23EV+Hj5f68+y7ocpHxwNXK5qu+rrZG1xd
 ttyT+uwd5HdpesNRcNxZ6+pQYPg6AwOP89g0gNxz4gX3BFBMVBNHFjRSBWCYRBpAw7Fb
 3nt27CVcWzGJ7LK9uVZOv9hHv6GufTEc0r67+PF16zBpYl1QMwD7BZ9lOzPXVympnp4I
 wxW4uobb0WlmK+ZcP0YrmFE4a9CcKqVaV/U0hja6BhmT08HvOMiLDaQGiWjmUTOMYhDk
 03Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8fPXZy6s7fSXGNVXDgDu4BkBSj5SqALzh4Ghh1aBOk=;
 b=NkUBXzq/r3epgnnBH3fACQ8XWc5S8hf+g0u1T7RzcP7Ap6v1cvRDYa8fKjfDNKAlXc
 PV+A6wtlTuG66CZ8+Mzn++Q7G9O2giHUN3G+fu/0Y/Zyvl3kTQVbMA78eh3Ecyhdzj5J
 2h5xv6tLgj7LGiooqzAuFlzMs7r58HoibHi/q6jazURgWEkMqSWkRLN0U3LcKL+cRlB9
 i4Rm7ipKMG6KWChZFd/EXKl2MJx2ucXZFOL6B0o0jsu5TLfJTq81HE3uAgxcXoIJWq1b
 AiJQ7awBr417qxfan5eohBMrT0ZLIc09cdDCwUlxLjpMarR4a4HGn0NCKE/1kMwNQDc+
 jLuQ==
X-Gm-Message-State: APjAAAWXzpk30mMlTVxH0PCAEZ7PRkYyie5gxQjNO5/Gi7Ybogf6YJaR
 SKWcBCZnIedn+SGTSmjw9YtdAg==
X-Google-Smtp-Source: APXvYqz//1qAjYnMY49bdNYUBOzbmJ/xbIX+Ea4PZTRK756pvLSdafxWSsysjqRMaSATj4WVGPBi3A==
X-Received: by 2002:a1c:1b58:: with SMTP id b85mr3858293wmb.95.1567001901362; 
 Wed, 28 Aug 2019 07:18:21 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u8sm3022354wmj.3.2019.08.28.07.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 07:18:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 3/3] arm64: dts: khadas-vim3: add support for the SM1 based
 VIM3L
Date: Wed, 28 Aug 2019 16:18:16 +0200
Message-Id: <20190828141816.16328-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190828141816.16328-1-narmstrong@baylibre.com>
References: <20190828141816.16328-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_071822_789014_C0069390 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the Amlogic SM1 based Khadas VIM3L, sharing all the same features
as the G12B based VIM3, but:
- a different DVFS support since only a single cluster is available
- audio is still not available on SM1

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index edbf128e7707..84afecba9ec0 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -35,3 +35,4 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
new file mode 100644
index 000000000000..5233bd7cacfb
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include "meson-sm1.dtsi"
+#include "meson-khadas-vim3.dtsi"
+
+/ {
+	compatible = "khadas,vim3l", "amlogic,sm1";
+	model = "Khadas VIM3L";
+
+	vddcpu: regulator-vddcpu {
+		/*
+		 * Silergy SY8030DEC Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <690000>;
+		regulator-max-microvolt = <1050000>;
+
+		vin-supply = <&vsys_3v3>;
+
+		pwms = <&pwm_AO_cd 1 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU1_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu2 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU2_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu3 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU3_CLK>;
+	clock-latency = <50000>;
+};
+
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin1";
+	status = "okay";
+};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
