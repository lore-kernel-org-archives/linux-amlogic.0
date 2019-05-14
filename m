Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1E6C04E53
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 14:27:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 473432085A
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 14:27:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ehjTioBH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gV1IFuQp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 473432085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/c0oV127cS7ASZga1ui+N8zFQoqe/GgCYvpouDJHb98=; b=ehjTioBHUXVkEP
	R6J2ISkaAggAUoNkL/607JlRVcVsiOuodmJTa0DoQ9tqrS+OLffhTfp6xxXnzd0zsturFrKizzbdn
	0xBI+GhCf5UJguKYFlow8QO6rSe9GQn4j1h2ADZLL9ma9NcGB1zRIBEZFK99++kQIIscrgfemBk6l
	x5BFXlDx+10MAAvFTCv4pf6kdmUTzt4wHnyk1oFXB0BF8WXNO6JL+/p86Lp45+ZxnGvQzILCEib+N
	VDTiU+Jzhfn1GEt+6mTWLZdaWdTd4/xWYhi3b6/4ezIWoK9ZaiyIP2LfoFEHVBHVSraEHX19DWy3U
	IyUqNZe7XFaXmkh7r/MA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQYOg-0005VH-R8; Tue, 14 May 2019 14:27:14 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQYOX-0005H0-ED
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 14:27:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id o189so3124562wmb.1
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u0eVRocZPCT0aug7aBTiFNphdt5giEcrh3D7mF/GVRU=;
 b=gV1IFuQpOmQFw5EBRP9Mnk6+S0wuKsb+R8Y/h6VC4FFIzEYHChCYPhCQ2ImKUDE3lS
 h2bCYZSdaC7lFj4tklHmk3M2mnYJkajT4VXzI+vSivcxbPbSbV7eVfCGAnHED5lvEHl4
 TJxTDL0E0jb+NcRHCqwHDa0g64xNzRVbnx/xs5n76zII97qMeEkIe6atSMur/ZYpQLBK
 Lg0wtHBRG28V5vcRl0W+pbtrysUSxHBvjuxokNyOhLc9cZYHl7WrzA2GiS6cQhUM1vVC
 lghBEZaCZyN+uMcDURK3PKVz0locfVwKYVUEnVqF2UfGfcx6S6EJ4Hc8AyNia93C2DPN
 epsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u0eVRocZPCT0aug7aBTiFNphdt5giEcrh3D7mF/GVRU=;
 b=O3k+tFBsVh0pYAVGKaDx5HU67pHbLYETa9th3Yi9d0OEZahz3qoj7hViLR56nH3V1o
 FFowP4DEcsW3/o6ZxhZw1UflsrmhaX6rRcHmkjofQocwacOI7/qawJQwwp2qFJKQhsgo
 2wmbxh9q+e4rs5XGx4N4WvpuJEzQApAafnAwMtd8G4uzfrcc+zgoG8m9LpubdwthBk4Q
 nk1IqpPK86CErv1hXxEiXG+dKAVlOCk2sH5x6uSrsudHzxGnwDY/4nY5w6lE8UyEQKWC
 Q+4b7Yzp8i7fVx0x5AjuGhun5nkYmx87QzH1uGTk1E7hH6eVyKJIy4qdVH6u00aiQk1F
 TrrQ==
X-Gm-Message-State: APjAAAWT0C/XV8HSNmG7MbJvHlPqg/hCdHLsXJcrA/FZ6TrZoqgph4GP
 lmQDr/Kkuk4X7gqk1gP7J044Vw==
X-Google-Smtp-Source: APXvYqyra4gqxcH2sf1ZTeW4iRYuoO9yamYWDI8dEYSE9FcH+wiZmXCr9laJzB7zMx9u0Rv8eezA3g==
X-Received: by 2002:a7b:c301:: with SMTP id k1mr19118868wmj.37.1557844023781; 
 Tue, 14 May 2019 07:27:03 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id h15sm12343642wru.52.2019.05.14.07.27.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 07:27:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 8/8] arm64: dts: meson: g12a: enable hdmi_tx sound dai
 provider
Date: Tue, 14 May 2019 16:26:49 +0200
Message-Id: <20190514142649.1127-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514142649.1127-1-jbrunet@baylibre.com>
References: <20190514142649.1127-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_072705_779351_CC732EE3 
X-CRM114-Status: GOOD (  10.42  )
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

At the moment the sysnopsys hdmi i2s driver provides a single playback
DAI. Add the corresponding sound-dai-cell to the hdmi device node.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index d6c6408281e9..4fd1ed4d434b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -158,6 +158,7 @@
 				clock-names = "isfr", "iahb", "venci";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				#sound-dai-cells = <0>;
 				status = "disabled";
 
 				/* VPU VENC Input */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
