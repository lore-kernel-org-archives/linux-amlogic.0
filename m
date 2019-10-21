Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD36CA9EAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:31:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F88620656
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k+CSwp34";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EgzjKJzH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F88620656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtzoYAsXmTpfv6XqbUmaItdH52y/3ekPo4lctnGp6eM=; b=k+CSwp34ZGBZHd
	77DQStkc4K2VNJagrNLHkDrygHSrfBWpF6NKba1EhTXdF0D9MXDijeBYXAEr1AGrGTfuTH+l9qNYv
	VZcmTXRqSX6q/QGB1Fyi+3rn4xtyRC0pYZF6VyzDRAPDPEyUsFHr14N865cNSpLdQfHBbXIyFLr0s
	CrRCgFnPhPgq+GmiHVc5s0w/WCAP9B6TtwJty1vL2oNdprdyygIZDGbNmuj8uQmNj7wv0VnnUVn9k
	XkW4KZ+11xgppMqiwd4DHMpQSNFd1bHEkKIUqbjKV3HF0Exjd5Gzlw43Lq8mIieuac1B9aM0umH+b
	4p7lO/WTowLjeeZZ+3fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMYi6-0001Tz-Dh; Mon, 21 Oct 2019 14:31:02 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMYgL-000745-5z
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 14:29:15 +0000
Received: by mail-wm1-x342.google.com with SMTP id i16so13582563wmd.3
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 07:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWYTqEyFtCOGakjlsNfRufixkNsbXr5lNP4UMlm1PG8=;
 b=EgzjKJzHoYUGkXcnmYBxTE0wwlWMADawhLiOwzthjwpM1Ze4VnIiYHorWAQ6NbSDEM
 YW5c06uFVcHIChoHfLaQ0SvlFkLJNSFsKf5ebIIMyU9OLXdxHxZOI6dkPVRPeLGwVupX
 xMTyteIssTql0hNdb1y+de+JQmn1KIYoYLGGMsLRK5v7HRAU74z8sEAwbxxfmCDNYw8S
 m3qy0Sru9ygMm26ot8A1Rg5rpJ5hxzPN1/6P7hhc3jThrHYdrBEObRxtUoQXz/vR4toB
 IVPI+OmAxFpbKzHQBN0xMmrXQWDzYT9FA3MEafy8kENyEIGnvFVr7i2TuGi1tsbmbguR
 Zeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWYTqEyFtCOGakjlsNfRufixkNsbXr5lNP4UMlm1PG8=;
 b=qDLa/E+IMMeuPPiciRHRMNjK0KDjiZysr2wDxzIOnsP6XVLuycQ3YgkVdtKiYRMOlo
 fFNNEr412trH0vkBE1KRzlAnjuniIEAzMlED6UGl3jTkJXk55ZCXlc/iq7Gxswud9SJw
 DxlFkpcHZkKbCEK2o+lL6gnxb+dy0HPlzlMmKHU0810D6CxteOlmbi5SOST1IC2is7t5
 95xuqL54x6TuUv+pQxUkx2ZPRL+DdPsjc57CgO506QhwhaaKh8YARmhN7UdXk8g30y0z
 JDw4DQeYZYfAv6EJu7x/7i7QVT990SQWtFgKeY2Hv55UXDSh3Ri95CVDBFDx2EGljRuo
 Ftiw==
X-Gm-Message-State: APjAAAVmpISJXonTV//JAins2zQ6u9lGUOk+2dSzrWwDRDd0F7t1+sJy
 q4zzuDsUn5hFNuzOv8z4Z43NQw==
X-Google-Smtp-Source: APXvYqx1AEQ9qTWronewXaRO1McG5B1AqN27qxt7hs3CmBfk/ag/v361jhGFZEtnnnnr2xXiMMDQkA==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr19213259wmh.40.1571668151654; 
 Mon, 21 Oct 2019 07:29:11 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d11sm17304463wrf.80.2019.10.21.07.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:29:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 5/5] arm64: dts: meson-gx: fix i2c compatible
Date: Mon, 21 Oct 2019 16:29:04 +0200
Message-Id: <20191021142904.12401-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021142904.12401-1-narmstrong@baylibre.com>
References: <20191021142904.12401-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_072913_229860_4C8507EB 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxbb-nanopi-k2.dt.yaml: i2c@8500: compatible: Additional items are not allowed ('amlogic,meson-gxbb-i2c' was unexpected)
meson-gxbb-nanopi-k2.dt.yaml: i2c@8500: compatible:0: 'amlogic,meson-gx-i2c' is not one of ['amlogic,meson6-i2c', 'amlogic,meson-gxbb-i2c', 'amlogic,meson-axg-i2c']
meson-gxbb-nanopi-k2.dt.yaml: i2c@8500: compatible: ['amlogic,meson-gx-i2c', 'amlogic,meson-gxbb-i2c'] is too long

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 042132bf5b76..10d5c97cba4f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -240,7 +240,7 @@
 			};
 
 			i2c_A: i2c@8500 {
-				compatible = "amlogic,meson-gx-i2c", "amlogic,meson-gxbb-i2c";
+				compatible = "amlogic,meson-gxbb-i2c";
 				reg = <0x0 0x08500 0x0 0x20>;
 				interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>;
 				#address-cells = <1>;
@@ -290,7 +290,7 @@
 			};
 
 			i2c_B: i2c@87c0 {
-				compatible = "amlogic,meson-gx-i2c", "amlogic,meson-gxbb-i2c";
+				compatible = "amlogic,meson-gxbb-i2c";
 				reg = <0x0 0x087c0 0x0 0x20>;
 				interrupts = <GIC_SPI 214 IRQ_TYPE_EDGE_RISING>;
 				#address-cells = <1>;
@@ -299,7 +299,7 @@
 			};
 
 			i2c_C: i2c@87e0 {
-				compatible = "amlogic,meson-gx-i2c", "amlogic,meson-gxbb-i2c";
+				compatible = "amlogic,meson-gxbb-i2c";
 				reg = <0x0 0x087e0 0x0 0x20>;
 				interrupts = <GIC_SPI 215 IRQ_TYPE_EDGE_RISING>;
 				#address-cells = <1>;
@@ -415,7 +415,7 @@
 			};
 
 			i2c_AO: i2c@500 {
-				compatible = "amlogic,meson-gx-i2c", "amlogic,meson-gxbb-i2c";
+				compatible = "amlogic,meson-gxbb-i2c";
 				reg = <0x0 0x500 0x0 0x20>;
 				interrupts = <GIC_SPI 195 IRQ_TYPE_EDGE_RISING>;
 				#address-cells = <1>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
