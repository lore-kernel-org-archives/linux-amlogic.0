Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96728C04A6B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 16:49:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67C2C21479
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 16:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IAHB7fHU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VD9DKzz9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67C2C21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtPWm4zZ2IXp5RctRLq+HUniCqxrqEq9oaOkpwuZoJw=; b=IAHB7fHUA7QcN4
	pHXGFMVsRrWEgQT72VhVgz2KFWds/T+EDuifrtlKFRTEUgCRR/ZGBzTBcZqgCjqmR9B8bdf5G33D9
	+NFj/AJo0xHSxKUTI2vtc7YJ8oLrQ/BAJyVVKtNJNtE7NOz/0/zSWBDxUPADQivysll/Qn74Bvzw1
	NDbWcsxX+qAqy7DeZfoyZmUpE301VrE/L/ym5b4d6vewHSdUUy6xpVxDtwzRyYjOMoP3KHtYfzIt+
	Z4L6SJBwT8vQH4yW+87lyaJ3hL9W/msULa1ti+BuPi3X/yiId3PwAp6IFefxI5xc4PeSE4bjPMTuS
	nL99GatiGGJOBBSAfGCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP8iW-0002Wl-NI; Fri, 10 May 2019 16:49:52 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP8iS-0002Sz-MV
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 16:49:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id r7so8022034wrr.13
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 09:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ymMWA7qGWKTKg4sjga2JHa1g3AkDQJanr/hpUl4TY20=;
 b=VD9DKzz95+nkF7M2qPqLJnLBiyRHTWMc45ShguOvHFsS+EbnWctH6q8qU2PaWi+MH2
 3DngXRS+8cYv2kTg4Yw8kJZRL2SGdgZLBo1a5DuSE1HN+qglmY++uOR02Abm+c5mlK1t
 wwPKvXg7TRDc8Dq5Ip+lyC8r4zF+jmDXLlIJ0OSrcIxbzQjxboRH/8yfM/mx1RdugAAj
 z17GQCVWWdsPK2DstD09KmUPn/E4jjb4WN4CrRjC1mq0/VqGTV7KnVcEjZIYHUAbTX5H
 ATm4YXxTJqEu/vy4UEJwmolN1lLDuDsmVs9dZnehUYhAmWdsphVJXAcaPaPNthAKmlHu
 W36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ymMWA7qGWKTKg4sjga2JHa1g3AkDQJanr/hpUl4TY20=;
 b=ezUUnpD/c9pZhpIIX5LvUmFkeCLTEaZUl0cHqxgNC7DFNYVsEO9yH8DmmpP2rAwEbx
 gXQ1RAYIelCPX37ipaRG7AamJ6eYLzsHNzt8dlQ5yBTPFV0fMTKWriN/hv1NtcikbLEN
 que8ih+yXJX+UBybYOAwTft/UyBgwsBMcGo8c6MjyEFYet2Cne3kyNWjoQLmGBk/6ZDe
 99ycO8D2IO6F6eK4TKTLB4ubAtggDyBwztJPRqE5XBoe46v0ymLqWOqEj7ot5LxZI1qh
 8CYj9oUCeWmHhS754+Tfh20Pm67o29mRnyhifvwrfboj2s0qI4oWAx9FvL9y/Y7xuAdu
 Xdbw==
X-Gm-Message-State: APjAAAXuMXs3dZuC/YwugJbWIi1cFSGdDlNgz01SkYUWQdhEWXDN5cLn
 Mi+qv2JUkgG2K6cicqfYZv49QQ==
X-Google-Smtp-Source: APXvYqzCTtFAhIiU7kp0M3POS//+ppjzgKaLXZ9pNB/HF4k19/83k7W5+CFc2VFcbAQUZbJnYoPQvw==
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr8969231wrn.9.1557506987191;
 Fri, 10 May 2019 09:49:47 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id q26sm5114308wmq.25.2019.05.10.09.49.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 09:49:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/5] arm64: dts: meson: g12a: add ethernet pinctrl definitions
Date: Fri, 10 May 2019 18:49:37 +0200
Message-Id: <20190510164940.13496-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190510164940.13496-1-jbrunet@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_094948_730586_0A07E6F6 
X-CRM114-Status: UNSURE (   8.68  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the ethernet pinctrl settings for RMII, RGMII and internal phy leds

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index a32db09809f7..fe0f73730525 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -206,6 +206,43 @@
 						};
 					};
 
+					eth_leds_pins: eth-leds {
+						mux {
+							groups = "eth_link_led",
+								 "eth_act_led";
+							function = "eth";
+							bias-disable;
+						};
+					};
+
+					eth_rmii_pins: eth-rmii {
+						mux {
+							groups = "eth_mdio",
+								 "eth_mdc",
+								 "eth_rgmii_rx_clk",
+								 "eth_rx_dv",
+								 "eth_rxd0",
+								 "eth_rxd1",
+								 "eth_txen",
+								 "eth_txd0",
+								 "eth_txd1";
+							function = "eth";
+							bias-disable;
+						};
+					};
+
+					eth_rgmii_pins: eth-rgmii {
+						mux {
+							groups = "eth_rxd2_rgmii",
+								 "eth_rxd3_rgmii",
+								 "eth_rgmii_tx_clk",
+								 "eth_txd2_rgmii",
+								 "eth_txd3_rgmii";
+							function = "eth";
+							bias-disable;
+						};
+					};
+
 					hdmitx_ddc_pins: hdmitx_ddc {
 						mux {
 							groups = "hdmitx_sda",
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
