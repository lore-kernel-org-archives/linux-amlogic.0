Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8826AFA372B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 05:08:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559C62067B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 05:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lX7TygjJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2KerGRia"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 559C62067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=c1M7qV0n4lnnid+5mawyan7p9B3LcbC3Ii0OxKtMotA=; b=lX7TygjJw5JMEdAq7DBoREuP2u
	8jKS97a7xiVR8ACxEwbWVIsSfzgxg+dvG4aR/txpCOhV5tE+tzXDc3UThnujp93EhuB6oNMGGyoJ2
	txSYFr5YP5SdWwrvrqQxZNUrnvjOgRQSV8DGFMLt1UYtDYJIv9+tkidrASe0uPpA5HeFI2Hb7OLSf
	MZEeFFyGEfTo15Vnk8rXMJauQoUYt+RK1Al8EPmJrZESL35sIJxvFCSO7u9MQiLI6RjuOZSPLO1oQ
	/E8WCNRJZocegw0KuUNSsZEqmbfWXwr7Lfzzsl1+gg3F91ePYfB6TTX2aCLvIkre9Og6BGJEzY16l
	6VnP4Lqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKy13-0003i1-Qo; Thu, 17 Oct 2019 05:08:01 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKxzr-0002ZX-F0
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 05:06:51 +0000
Received: by mail-wm1-x341.google.com with SMTP id r19so1039772wmh.2
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Oct 2019 22:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pg/p3AMzyR1Wsfbjwo4TUDBEOFDuNcbzBHUL3mVG5Co=;
 b=2KerGRiawXAcoyU5jZdb0jN3uqQDas6YiYGKblTYiUv++5sGE29UBHO37R2wOlCCtZ
 jm1ojMM6n32rM3pie09wLOogX4O0RXkPAqYFEDq6Uwk7xGsNnKtXMEbEaJPyciOPDJND
 tYsluIbhk8k8oFJfwp/k559K1UhuRvKzW2iAXiMW2xfoTimq2EmUZkDpv5jcd/ESQBsI
 dyxBBN/Xzn6VbtVb8JwD6msoz9CztW1MENjN5mqpPYYGyNE7MtrEQplHxhir+wpTzWFx
 ZM60i8qRFCWqArLQvGrg6FS4WWepa6fq1oHCZUmUVEJ3eV01qR5DvKFbf+i+LKU1gQOx
 qSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pg/p3AMzyR1Wsfbjwo4TUDBEOFDuNcbzBHUL3mVG5Co=;
 b=NUeszc73rmhcLkdVJ05qZJpziuk8bXJPVX++meK6nDWlokzBBeWmLjca8hKU3mKJG8
 bjfVhqzABP1YU4IImptrtzeg9HgcNtNklNkVOMLvcmb7EZZ7WVR27WiBaDqgcEWyg/P3
 piKgVkV9pAdNuq83vYVgRc6Jk41QWJdGhBt1tYCntZG004JazvqYYIv6Y2h2UKDUUXfm
 kMPdzJC0/g8fIglKlWoiWe8ArRfSYxUBU7ctL7lCjmpa7qdQuR3PwlZMvdyKLbUKRxFH
 4n8lPeh6O2dvU3iDFqGmEcn+34MCztxfaphmsXsWBJtPSh7MK7qmSZxg72i2tQwuP+V3
 kswA==
X-Gm-Message-State: APjAAAVrQZ9MIWrWy9BDqOyev3ShXF0EkBpAiHEtrlTVrIKI1u6S/06N
 Be+z3wLrC2h3LSYghB92Gp2vkQ==
X-Google-Smtp-Source: APXvYqwsyi5V+5cR6/K2hgajkrfncw2TMPjLW5hIO9IlryAJhwY0DliIR8XdvOONvx2HmfA/ssyQXg==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr1071924wmj.2.1571288806246;
 Wed, 16 Oct 2019 22:06:46 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.googlemail.com with ESMTPSA id b5sm1010762wmj.18.2019.10.16.22.06.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 16 Oct 2019 22:06:45 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org
Subject: [PATCH v3 4/4] ARM64: dts: amlogic: adds crypto hardware node
Date: Thu, 17 Oct 2019 05:06:26 +0000
Message-Id: <1571288786-34601-5-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571288786-34601-1-git-send-email-clabbe@baylibre.com>
References: <1571288786-34601-1-git-send-email-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_220647_516584_7246F414 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the GXL crypto hardware node for all GXL SoCs.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 49ff0a7d0210..ed33d8efaf62 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -36,6 +36,16 @@
 				phys = <&usb3_phy>, <&usb2_phy0>, <&usb2_phy1>;
 			};
 		};
+
+		crypto: crypto@c883e000 {
+			compatible = "amlogic,gxl-crypto";
+			reg = <0x0 0xc883e000 0x0 0x36>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_BLKMV>;
+			clock-names = "blkmv";
+			status = "okay";
+		};
 	};
 };
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
