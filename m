Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A73C282DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:31:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4486A208E3
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yr62zZNX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NTYweWIY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4486A208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBeYio/fmatwlZhi8XX9grkKWw51XuVYgSKwI4+eCRI=; b=Yr62zZNXwB1vv9
	stey28+G7kyEZZSe4Rwi2bXVxGhK8kGP6VnRZ+BS388NWECyjuQU2WoYy23CaTi05o0WFAaX8QF4s
	aXWFJb4iNKV7pD9wYIuhlD8zKFzfxanuYDgIEx5KDAJqtYsDguQuk9VnXP36hmlQEH2BXpgxMoiBU
	swCjLqMnvqgmyqB6Rx82cN0YbQtkfx3rnFon13eZlg6tD8LgZj5IeWq0Lqd5gLEHe0UmsupyHwv2C
	/Uu7dgIV7GdvsO8yzmXpjjF7nydX62oot15CRYtrROOn0v9EHNU9U+lftfF4U+w0uEZyA7voVggr7
	verD9HS+4omHiQsET9NA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDQd3-0007sH-TW; Mon, 08 Apr 2019 09:31:49 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDQcy-0007o7-AF
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 09:31:47 +0000
Received: by mail-wm1-x341.google.com with SMTP id 4so13488355wmf.1
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yuCh+SuKhECtlhXkLgX0ABjHIJEelEdglkUNy443sVE=;
 b=NTYweWIYmXhepqAvfuqaTi2ccgIw8ICI/bQqVj9sr+LR3VXUOQS64ZTsSLuCKgnMk5
 WTG1LicN3ZYJzZetFJ9LD9LyCP+CtLMEsBoRR95VcnWV/XpMwyWzJBeQTHR/fqqd0fTP
 hoJQ8pghHdN/JkPPnA9mAw7yAzNFr0DD6Ff3qo4k5DCNwNEkdIwPCobCJR20WW8Fmcx2
 QYW2+au0nQt7pkLof20cwmR++z7Glw/if7IXQVfDMCGRPMHNHbj6Bb430ZlQgNNpzAh0
 sw8//cHjFHVRzr43EoO0B8EnItpNYkrz5t9uQhjJ7V4hxxsyh15xAlGm1ONm98DMyQGI
 Rdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yuCh+SuKhECtlhXkLgX0ABjHIJEelEdglkUNy443sVE=;
 b=REEGZxXkZSW6YBM6PBArcN6Q24XLQxFj+V++fV8EAmcmQc8NoDw3rjLcP6VcZQIMKl
 uno3k4HLVyL5tibk0NUTx2lensuc8hOhQJcT1nUKR6U4Vo/wgsebryHwwcYhh3z/IukM
 0gbBNfI5N8WRUtHevhJ84B878+6lUa9l49Gaw1GK+orZjHkLrxnwk96MNy21ySCo+Ric
 5HGUQw4D0+PEPSYsAsTj63L8g7G5O8aa2ZfdBZS7+QWjd8emLtSUesOvp2CbPskAfgQ+
 QZWEpM51VXL37dvq35xgq8xd1feJRQq5SrD89uSik1oMlc2TbIgBODe9eKUUaKQrONHb
 yXAg==
X-Gm-Message-State: APjAAAWiAlAg0N+Nwl1I5eyrmlPheWX2Tv2IgULRNLsg2RgPtwMMUP/b
 9/Lq/TWQVqtC9xbSkfjlhSw7DA==
X-Google-Smtp-Source: APXvYqwwgFSHs9/3+G824dWffRmJ+HBhlvNc420O8SlQjxOOzcOcXRSSqD3ofmaagP8PnWoXvLmHKw==
X-Received: by 2002:a1c:f909:: with SMTP id x9mr15941264wmh.18.1554715902802; 
 Mon, 08 Apr 2019 02:31:42 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c10sm36777427wru.83.2019.04.08.02.31.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 02:31:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 2/5] arm64: dts: meson-g12a: Add AO-CEC nodes
Date: Mon,  8 Apr 2019 11:31:36 +0200
Message-Id: <20190408093139.27161-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408093139.27161-1-narmstrong@baylibre.com>
References: <20190408093139.27161-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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

Amlogic G12A embeds 2 CEC controllers :
- AO-CEC-A the same controller as in GXBB, GXL & GXM SoCs
- AO-CEC-B is a new controller

Note, the two controller can work simultanously since 2 Pads can
handle CEC, thus this SoC can handle 2 distinct CEC busses.

This patch adds the nodes for the AO-CEC-A and AO-CEC-B controllers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index a696612f8f44..9f72396ba710 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -169,6 +169,22 @@
 						gpio-ranges = <&periphs_pinctrl 0 0 86>;
 					};
 
+					cec_ao_a_h_pins: cec_ao_a_h {
+						mux {
+							groups = "cec_ao_a_h";
+							function = "cec_ao_a_h";
+							bias-disable;
+						};
+					};
+
+					cec_ao_b_h_pins: cec_ao_b_h {
+						mux {
+							groups = "cec_ao_b_h";
+							function = "cec_ao_b_h";
+							bias-disable;
+						};
+					};
+
 					hdmitx_ddc_pins: hdmitx_ddc {
 						mux {
 							groups = "hdmitx_sda",
@@ -405,12 +421,30 @@
 				};
 			};
 
+			cec_AO: cec@100 {
+				compatible = "amlogic,meson-gx-ao-cec";
+				reg = <0x0 0x00100 0x0 0x14>;
+				interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_AO CLKID_AO_CEC>;
+				clock-names = "core";
+				status = "disabled";
+			};
+
 			sec_AO: ao-secure@140 {
 				compatible = "amlogic,meson-gx-ao-secure", "syscon";
 				reg = <0x0 0x140 0x0 0x140>;
 				amlogic,has-chip-id;
 			};
 
+			cecb_AO: cec@280 {
+				compatible = "amlogic,meson-g12a-ao-cec";
+				reg = <0x0 0x00280 0x0 0x1c>;
+				interrupts = <GIC_SPI 203 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_AO CLKID_AO_CTS_OSCIN>;
+				clock-names = "oscin";
+				status = "disabled";
+			};
+
 			uart_AO: serial@3000 {
 				compatible = "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
