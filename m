Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A508C04AAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:43:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A9820856
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:43:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q0+lozjA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Dimz5KWs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00A9820856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LHDNa0NvVY5FKmgS/K7/rn6RX+5JKv1IFssn20ga/Vo=; b=Q0+lozjABzw7S2
	Wwfs4nbgT8km6iePUsA6EX5af7K6Y3aT5s2geUIyzcn1NGXLSBrQxlARZL9xnLd1fNK5oSvytkX81
	BFSeKyu0GT7j2FSoMlkYn4OeanvBJ2HfB1847gugt+S9joLmCMIsA7Bg64wh3HGyxO+R5I40mwBBJ
	Gx/s27/MOuJCCpLChcAdRYjqq7FAYpTd6McfotmCNXIC9jgxr0+FJbpSxJf6nmaRtNwmwxOpXVAdO
	uJWLq/mCrP2UDm8QBa3qVYWt8CpvvBuj67LwqEUsdE01RU+J2bHlRCxVcxt4eHI5hE7Ahz/1eXsl8
	Rk31JNRewSNbpsW1e/bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSiZs-0007FX-2M; Mon, 20 May 2019 13:43:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSiZp-0007Ef-Jk
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 13:43:43 +0000
Received: by mail-wm1-x341.google.com with SMTP id t5so11752880wmh.3
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LAW0NHRYcYNyBkm24e03bjOrNz4ZAqZ8Xq4Q0IzbpVY=;
 b=Dimz5KWshfT69RCp2fuwxLNaVZXc2u41WD6Q5lY9y05Bgc54W+AqzaA7ODdKk0l4dz
 typeW6SRq/is0uH3q00ctV7CeWBNkd1prpRwgkrciXTPqslNPoYc0JU/+L0skeoBt+05
 hC4ltD3lfhM9mqT72B7jeOL4/Qr13jjmAgxMBCZwrzlpDMT2yjiIzRzzJU3s2qbtBKF0
 rOJjLWqmMmTzSBgz2fUfnhzqMHqN12+Z20YmnSJDFVX6taETDRnevZYfRCIHvUxlsqtV
 U9PF6gmK6r3U1DcPI1ai1iOz0fN6g1DbpWD5RrEFcusFowi6wZ0HtAIWsO3tzFjFdpOQ
 D8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LAW0NHRYcYNyBkm24e03bjOrNz4ZAqZ8Xq4Q0IzbpVY=;
 b=YNuCLgoKJqa4/BcwCNs3HKJT09o1BCAvUBOBJM755+GF7GwRh2exH532YyMMd/XPnG
 XY0aIRihYPjPOtknBmvyRLZnY9nWm/0cmOg8+cq6qIvCA/5yvX1uJOOrKBo+R85qhEcA
 3Xt/cMY/R35FtnpwYOZ4HdIseXxkMQmoVABQwRTPu4bxTMqp5eUxx9KckwdaUEegB0nD
 vgl/rIMdk7x0d3aIVa4Mlj+k9IXF89Sa9U2kuBXCEv1uclcASiMrmu3XdqkD3ZT8+P8c
 ver0K3B4HwWLNuiTdA63sKeVfwLs45Ojm/JK5H2A28Md5EkMmIbtPeeuIgkU0M4pZz5S
 9U8w==
X-Gm-Message-State: APjAAAVyDwDpKg3YW3zeMvVexaLPYjzMw4DSDIM9s66tmQUWmOZJqoba
 ss8R3hX842364D2PcEFYZ/y50A==
X-Google-Smtp-Source: APXvYqzS3opLw29csk5N34wBxalNj+6DyubSRQpudJlizqmfm3+OfR94bvvBmUKOjbos5rzB9etkwg==
X-Received: by 2002:a1c:dc86:: with SMTP id t128mr22595141wmg.64.1558359820032; 
 Mon, 20 May 2019 06:43:40 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o8sm15309598wrx.50.2019.05.20.06.43.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 06:43:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] arm64: dts: meson-g12a-x96-max: Add Gigabit Ethernet Support
Date: Mon, 20 May 2019 15:43:36 +0200
Message-Id: <20190520134336.24737-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_064341_651226_FC34A4AD 
X-CRM114-Status: GOOD (  10.34  )
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
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 5cdc263b03e6..5ca79109c250 100644
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
+	pinctrl-0 = <&eth_rmii_pins>, <&eth_rgmii_pins>;
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
