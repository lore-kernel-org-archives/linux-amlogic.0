Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364CEC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B7F206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FpFzuhiJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xjm19XfN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08B7F206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsF12gY6bGFq2kaX5PVSSrTRvfoiYLwKA8ADc1T+z8w=; b=FpFzuhiJf4JmQE
	rvoLZijcFEcSitKj9968zWkJJVrTcdhU7oo9Dcm3dXLIAJRz3Zk7zYUSdkGTSIofl7rh3Ziwfiy5N
	8j3yzLsvy2qz6cg0IXkFUEU9mrbE+X+geLxiOCGyOMhB4o4TyXAvascla1t8qJjPA4ChRins8584u
	018677miPkBv7r2TEXLJDfBvulcXWRKGYamiG+JeeTl4PVkOLQ8FZmkkLypESWqOX8vl6OyJPVGoO
	ba8k/cKglf9VXB3azBPOy8Uoz9S6qwhQ6vC6g0vqslNB7CdapfWn6aSSrdsJ8x6t2STvwr2LNcNfz
	gNKwZQxJcfyKMydSQqrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3HgN-0001ei-P9; Mon, 11 Mar 2019 09:57:19 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfU-0000HJ-9I
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:28 +0000
Received: by mail-wr1-x441.google.com with SMTP id g18so918854wru.3
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xc6TAi3Hh+qeOL4saESoM75HmTfiu/18FSF6TCAEiY8=;
 b=xjm19XfNfCS7KEJ7sSM7HS0WXvcWEegjXgv3l6mPS6jY+FAuYBxyiXEMypQtlKnSKj
 pMP0Igaabw8t5gBK83w8ZuGu1hpzkV+wAohlcMFQikwZOuDqPeKdeHGqaqjqLlPJW1EK
 f/TKwCL1nWkCB/bPNZBoOaFw3mDTs0P4E0vZ4sPQeziKq/T2m+cddgPucxRZB9EXOxmq
 VK4/wf/bqV32vW8JtUsx2RSnL47E9IyMGv8g58WCw81Bn4rPBJI9rDjxeXdlnXAX16Os
 pV7HczhEKTCyE5519Avu8gx/3wTda6qUXs3QfibVwRlPJSv7FTmKx8ov+fmFBSzhdmAw
 /R1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xc6TAi3Hh+qeOL4saESoM75HmTfiu/18FSF6TCAEiY8=;
 b=iHOLr6M3CpJUSLlnRhx1qYN7cs7Z4oSHcEj4aSCSBauItj5NjZlERDtORykMUiEw0L
 oZm4X7ehStv9zYDwgKGjPAuPIuL03vL0q2h0TaeFK7MnkwYyGxBnob/2E9Nu0seq3XRH
 YZBvB2XMOvuQeIQEq62WhrLiC4IUsVQs38Lo9s4ybXpgw3RhNzaYYFhT8wyGO9LPF4C+
 O1AEdrEn0V6ZR3bw0Wt7+VBVW4v5uxZefbQ7EcE0NdltbBN2LnP0A3mXp6PM7C7bl13L
 s/CMuXKPYfsbmbIlcRzHZBeWtoebH0tLjddEc/BQ2q2TOfwb+G5JRJ+425F0vItHPAbp
 OFgQ==
X-Gm-Message-State: APjAAAV5n5mIqYWRaOHgp5SUnBOj19mVzmU0T6Pk1q55HxtDCDBEUVLm
 27vF8AwkoDlwdTLk8JQ3oHgJaQ==
X-Google-Smtp-Source: APXvYqzLahKurVD0KnSDQYMIGe3vOtIceOe0rIUlpNrHOWc5PH7u02E3ym5CHSITyz1DXzlgbmr5XQ==
X-Received: by 2002:adf:f88f:: with SMTP id u15mr13249571wrp.117.1552298182652; 
 Mon, 11 Mar 2019 02:56:22 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 07/11] arm64: dts: meson-g12a-x96-max: Enable BT Module
Date: Mon, 11 Mar 2019 10:56:09 +0100
Message-Id: <20190311095613.11371-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311095613.11371-1-narmstrong@baylibre.com>
References: <20190311095613.11371-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025624_585273_7AEC482D 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the Bluetooth Module on the X96 Max Set-Top-Box.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 21e5de48613e..61606601fb4f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -88,6 +88,18 @@
 	};
 };
 
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
