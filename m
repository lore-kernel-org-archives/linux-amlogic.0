Return-Path: <SRS0=R0qk=Z3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E24BC43603
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:35:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CB5D21823
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:35:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dHQzSCsr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Vtzf6YNq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CB5D21823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxnPPIT4p/nX5eiwuDsQy7iWVJSD9iwbo2iubKs9cKQ=; b=dHQzSCsrVpA9Km
	RaOYvmoX9c4BhGBZPk6MLXKvk3E8ZSu0eGcpn8hUmIDpcnsNWmmkMsjFVmx46SVjteAbMdPv4gsQt
	zp1kGGtnG20Iw83fBij35JFLpXS0DbSo3H76yDONgT0iPBpIwOrq8klloAPg3k1JcGyrezzCyqcTD
	mZa/vnCaN98kiAAySf3wNnCl674Rz9e90xSpIZWEbahSdTEnNvrL9lIHFd/3Z2XI4GmHHHGwKeQbz
	S7/1ZDnnXlTr99QiYPCQxaRuwn2kJuqYqF6vAC+N5b3yeBOH/IWeVhtV+FP8cwqr/FbAL3YPxZGcy
	FKlnxb6QcWSIx7g1JrWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ictAC-0005sf-JU; Thu, 05 Dec 2019 15:35:32 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ict90-0003VM-S0
 for linux-amlogic@lists.infradead.org; Thu, 05 Dec 2019 15:34:21 +0000
Received: by mail-wr1-x444.google.com with SMTP id q10so4113366wrm.11
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Dec 2019 07:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cvIKYbv02jfkUFc5yq+y3wt+kyYSZpa4lPRFM3efvsQ=;
 b=Vtzf6YNqgoAaCepibQJqB+oRUraYuYM4z8tSKK59qmq5stMUvAdB+5q+XIdsKOABIl
 VpP08vBGgGPR8Y5f3xG1AMOHGvmMkWvU/Oca1xY6ANqlBPb8nVAqzxNEmOAcv+3QICm5
 T0VME75HypIlfAukkXmcATSTMQkKMZlFi4y652RFyDNg8fbpq6ZzJWp/9mQ1Epdo0iS3
 RPsYVfmjJiH+w4INMrHQRt1bgSz6bJlx4OQRxRdyhIPmSeH0g2k3bnxVlyeYoZC7KwdE
 ZVyzhB5UG+UTEHwz1loKwzmn0BA6e6oPkpKaEcfbyaeo2O9txuwXlZAvzkF/hqw13RVR
 6lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cvIKYbv02jfkUFc5yq+y3wt+kyYSZpa4lPRFM3efvsQ=;
 b=P2Mq4Pb3HqPMwLnhO7torzJyu9U68fvABjWE6PDQm7lm6aLMOx9eQsj9RLeFySSrfL
 widpMCkmIk8/T1zufFBMSjdQfGOOr50xbex+pDYIIjDh5icC819nvGT2zzI105p1VqfU
 Ivg053XpxqzEmcHvZeWP7Dds4EpS4FxVMXFpM0iBNhHZ/CjX+pAnb/Vb8yiwXXVaEqer
 ljq0UBjO2V/FBBdWCHKi1fgGx/RurWEqK7SCnl5Nt8VZsfL5LHzWrMbSLsbwYOSxXr7r
 CQsiq/qeElhoBOdJp6izrjeEGct1QNhnNhVuBR8OChIGlTq5JPWL0bEpuLKf+YuzOC9F
 OPcw==
X-Gm-Message-State: APjAAAXjfSkyNZJR9+hMFHEWKYaLcYvLTWlwULp8/eGOcWUIOVyZ/d0I
 /GcY4vSEiieF/6ErrXifdiV4lw==
X-Google-Smtp-Source: APXvYqyHR+QR60eFIPYWpUC+I+EzJhKER/8/scWXEk6o2dHPHZQW02oXEkm5YTJXCK4A04iQ0bW1wA==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr10388098wrw.391.1575560057417; 
 Thu, 05 Dec 2019 07:34:17 -0800 (PST)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id u26sm191894wmj.9.2019.12.05.07.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 07:34:16 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mjourdan@baylibre.com
Subject: [PATCH v2 4/4] arm64: dts: meson-g12-common: add video decoder node
Date: Thu,  5 Dec 2019 16:34:08 +0100
Message-Id: <20191205153408.26500-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205153408.26500-1-narmstrong@baylibre.com>
References: <20191205153408.26500-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_073418_991771_81F1D2C9 
X-CRM114-Status: UNSURE (   7.90  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Add the video decoder node for the Amlogic G12A and compatible SoC.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3f39e020f74e..6fe7dead5a92 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2152,6 +2152,29 @@
 			};
 		};
 
+		vdec: video-decoder@ff620000 {
+			compatible = "amlogic,g12a-vdec";
+			reg = <0x0 0xff620000 0x0 0x10000>,
+			      <0x0 0xffd0e180 0x0 0xe4>;
+			reg-names = "dos", "esparser";
+			interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "vdec", "esparser";
+
+			amlogic,ao-sysctrl = <&rti>;
+			amlogic,canvas = <&canvas>;
+
+			clocks = <&clkc CLKID_PARSER>,
+				 <&clkc CLKID_DOS>,
+				 <&clkc CLKID_VDEC_1>,
+				 <&clkc CLKID_VDEC_HEVC>,
+				 <&clkc CLKID_VDEC_HEVCF>;
+			clock-names = "dos_parser", "dos", "vdec_1",
+				      "vdec_hevc", "vdec_hevcf";
+			resets = <&reset RESET_PARSER>;
+			reset-names = "esparser";
+		};
+
 		vpu: vpu@ff900000 {
 			compatible = "amlogic,meson-g12a-vpu";
 			reg = <0x0 0xff900000 0x0 0x100000>,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
