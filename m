Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91D2C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:01:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B161220859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N+XCx+j8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Up8nzLbU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B161220859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OrO5jEkeCRRHXj50MkZXzwFoMPopkBx3TYnnLmgxpkw=; b=N+XCx+j8RQB285
	qefvOCF4VKJr+9kDBRJzagBvlbuT/ZLlp7Ir5BU+zjSmVRnjTrMVXsyongeTsi7DhWuv3v6jetNZI
	gDRcP+LQn62xWD1pHItEej8lzL7g/iUJhNo0NdiaO6KCyoyAfM3uRuAfNKPA1wEfCXoHkFWfSHKqF
	J6GnCXVxTXBk/IEtJj3wE6zj0WQwDI8QFY2Qt67exs6Hsk6GSY4mgNPivufptuKqbbnA5c7O4poWE
	Y2F0LnZB+rJMxanzJk7wN9MPwmaYeDAvE6PFXSGmJ1Kcy7bB5BAJiKxSrUU65xwRxa29QXWrEp4b0
	1aIpI2ui/piDTYNlXnPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFFJ-0002Md-Jt; Mon, 27 May 2019 13:00:57 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFFA-0002DC-0H
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:00:49 +0000
Received: by mail-wm1-x341.google.com with SMTP id f10so8654652wmb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=umSEve02562WR4TA1J+Sf1DhtYFqJtcfnl3qYv1eGOI=;
 b=Up8nzLbUmXELSCH+VzXuSkFa+DzjgiGlsLg16q0M42ls5tjlEogTcpQJ0KU6O2IPO0
 fgRJNaYNs4uuluTd6TgYds56i/4Y7XTrId1pjpUYFQgi2NzGOb4jSTU7cE3KTiDEqPVr
 qvNAJs/0XeRhdpcOZ5ugCeOPcpyKBHAWzo7Bh5G2wM5zlDScwsoYaAjGngnTzFz1C/5U
 X8n3ZX6oWzoKaR7B9RxCDbvlA2ezT4iYVeixebZ0zzIk1u0Roxzn4Ln0db23GI/ow5Hs
 Mh8Z9CMnUjK8p6TeawS3Oj5tMMBfavAtZTLZgI1OL/WnnILZquKrcA9tJA/bFz7/cbOR
 RMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=umSEve02562WR4TA1J+Sf1DhtYFqJtcfnl3qYv1eGOI=;
 b=rtiIodILUr3hBlQEFInYn/hy2uVp16IFD9hzBL6pn/Gk87sU0FKlyPKEJ6xM7DM/Lx
 aucagMzmU9yW+kXIcgPeyZDOoEAX5F9myL+5041It/6g2ZTN/kiwjVjeFnMM9N+ptS/2
 WS4vzoMOh0m1p7xYQ5VdOMJJMw71IZIqcY5YrDyu6GH7QpvI76vQLZJepXRathTX2mh+
 Huz8SqFseL8DXUKmZ25UZSn3k3ItbbgP99V3iCJPYhD/OXUojrCfE1Haun1KiqoPbwJe
 tEzmuJFXWDDOb+fhsUI3tq0x0O4KhfxfMAsS4Gt97TVXiYeOwYgjXLjsrE3uYoTuK+Xi
 vtdg==
X-Gm-Message-State: APjAAAUbM6nDo8B0keQS0vxbIRlCzv1OeILhZPtcDVJKm4BGcMH905ok
 Yg+nFohHeYxrH6KT6GX4VDho7g==
X-Google-Smtp-Source: APXvYqzpB4SvzQ6WmxC6WmcUac7SWjVTlYu5Vu5qEcUudrnHnifoGhX1hZdTQT0DJ8CDNxdatjD2RA==
X-Received: by 2002:a1c:4b09:: with SMTP id y9mr5987241wma.93.1558962046462;
 Mon, 27 May 2019 06:00:46 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x187sm10864335wmb.33.2019.05.27.06.00.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:00:45 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2] arm64: dts: meson-g12a-x96-max: Add Gigabit Ethernet
 Support
Date: Mon, 27 May 2019 15:00:43 +0200
Message-Id: <20190527130043.3384-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_060048_048135_8ACA5341 
X-CRM114-Status: GOOD (  10.13  )
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

Enable the network interface of the X96 Mac using an external
Realtek RTL8211F gigabit PHY, needing the same broken-eee properties
as the previous Amlogic SoC generations.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes since v1:
- Fixed eth_rmii_pins into eth_pins


 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 5cdc263b03e6..706753ddfa7d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -15,6 +15,7 @@
 
 	aliases {
 		serial0 = &uart_AO;
+		ethernet0 = &ethmac;
 	};
 	chosen {
 		stdout-path = "serial0:115200n8";
@@ -150,6 +151,27 @@
 	pinctrl-names = "default";
 };
 
+&ext_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211F (0x001cc916) */
+		reg = <0>;
+		max-speed = <1000>;
+		eee-broken-1000t;
+	};
+};
+
+&ethmac {
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&external_phy>;
+	amlogic,tx-delay-ns = <2>;
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-active-low;
+};
+
 &uart_A {
 	status = "okay";
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
