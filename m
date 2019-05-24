Return-Path: <SRS0=5BKV=TY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68940C072B5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 13:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BEB520868
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 13:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N7Xe4YeZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="owRAgPfG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BEB520868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mpgf1+894oHc7viWNrOIPOemlPJKbtUfmIckCqJZjgw=; b=N7Xe4YeZ7CcJUW
	MfoFKafPGOAdcWaqm8BNbixw58T+g70SQalR/2nnPGEO2JmC49e6e8CnG8O1W8j0OpYtl6asVa6w6
	wHboUIywGRPei9jt8NH1uO1M6haHGfuivKJ4Gwn1tBp5FoIItm7cUAyt9YVRjUgYtK3uiawYma2Zz
	UGdTamyacVFskyev+6qk0ypl9WS4WjTmHuCfaTqpkUsCeqQSi5sYXF1rK2jFKjbKua97gK84gsG/2
	pIBB5gYaWtyNU5VcmQH/+TiQpvgIsTgUU2s1f7vQwxoDmfd1dH9Z24ykUDt9XlkuPNV9WBkvXmquk
	rmUv3xzzGAaaBpdKH4fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hU9vx-00009f-45; Fri, 24 May 2019 13:08:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU9vu-000094-E7
 for linux-amlogic@lists.infradead.org; Fri, 24 May 2019 13:08:28 +0000
Received: by mail-wr1-x442.google.com with SMTP id l2so9969088wrb.9
 for <linux-amlogic@lists.infradead.org>; Fri, 24 May 2019 06:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OgQG33xuk/EhzH06wld3kb9oAEYUVKAKXc70PtpZrC8=;
 b=owRAgPfGikxZtUG1BQRct8nWEQoZ+vHOSKdD7iOhXd8OMGFf32ex0MPT6DfeY3lxuy
 bhWjO3JH8oYEAla3+xVUmPAW7EyA7Bh+ag6nXRT7NIlhZ13NHoZgF2L1mcLF2kiS7m0N
 kTKmcvO2AzJUcwMHMThCxt2n7Hf7/NvxDM7hBBzxrD4kdtYP/CKwvGyIF/eFdbNaJJ7q
 2pKwUSQGwHrbYFfPTImyiZ/JAFlLnntm6NCYFJ6bUruR5T+zUWT8ukMR66zJ4fwTwLrW
 8Dbv4MEKoW2GXHd++IyIwDxs0gxoDLL4zOG1bRfeArEaZSgmJ/Gaih3eBfnmGmrcEYXK
 K29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OgQG33xuk/EhzH06wld3kb9oAEYUVKAKXc70PtpZrC8=;
 b=uTlPqDfta6NbII3NEfypJmOfdrO4TnOUNbpozewF8+IUUjqIO6rXcUFZ4s1lsZhXNs
 iOA4/ojrfAIBx1nL9rTalTrOrGAUxeq7UXVAcTd3flut8vh+5yoRmpCVq5HhR0OW6bh+
 k4uBIZNoneDFZYFeHsmWYy5FHmVU5YRbyvBdxc3Blp4asZ0QOpCAhHChr+ajcJzggmKk
 LvPXHJQ3ZryXoKcVDc8OI6sz556wfLraO56ZWgVUjncHmATw8KIH9xOv7krbEWg4kJzu
 CcbN2w7wp+4FJzJaVT6b0caswP4Ff6doCjkRJXn7E8NqXOkdABuERljE02Rg9vBo015P
 o3Gw==
X-Gm-Message-State: APjAAAUAWC00kPz+NG599stjvhM/hn8oHMksmEiIOXx8WvPYWMn4DfVY
 0zlbTy3StYze4U5AHm6rXldJjQ==
X-Google-Smtp-Source: APXvYqzR+reL4mcAcIjGdB6vyMDbG1N7JQb5wDwT7uZCcD0jOl7OaN2viGm0Xl/fbGghcGMUsqIY/w==
X-Received: by 2002:adf:e408:: with SMTP id g8mr30766656wrm.143.1558703304789; 
 Fri, 24 May 2019 06:08:24 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f65sm3557698wmg.45.2019.05.24.06.08.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 06:08:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: add dwmac-3.70a to ethmac compatible list
Date: Fri, 24 May 2019 15:08:17 +0200
Message-Id: <20190524130817.18920-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_060826_531405_1E5B679A 
X-CRM114-Status: GOOD (  10.68  )
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

After discussing with Amlogic, the Synopsys GMAC version used by
the gx and axg family is the 3.70a. Set this is in DT

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi,

 The same should be true for the meson8 families but I did not test
 it which is why only the patch only address the 64bits SoC families

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 +++-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 38169c85e91f..6219337033a0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -171,7 +171,9 @@
 		ranges;
 
 		ethmac: ethernet@ff3f0000 {
-			compatible = "amlogic,meson-axg-dwmac", "snps,dwmac";
+			compatible = "amlogic,meson-axg-dwmac",
+				     "snps,dwmac-3.70a",
+				     "snps,dwmac";
 			reg = <0x0 0xff3f0000 0x0 0x10000
 			       0x0 0xff634540 0x0 0x8>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 6772709b9e19..74d03fc706be 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -486,7 +486,9 @@
 		};
 
 		ethmac: ethernet@c9410000 {
-			compatible = "amlogic,meson-gx-dwmac", "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+			compatible = "amlogic,meson-gxbb-dwmac",
+				     "snps,dwmac-3.70a",
+				     "snps,dwmac";
 			reg = <0x0 0xc9410000 0x0 0x10000
 			       0x0 0xc8834540 0x0 0x4>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
