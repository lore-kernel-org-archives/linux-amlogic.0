Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943D8C43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:15:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6152D20840
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GZ72h+pA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LJYbRSl9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6152D20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pe/JHtenEe8qKeXSTwfxZ09Y5CG4NKGS2DfAB1jwKV8=; b=GZ72h+pAKZl9bZ
	d/8IUOhVTrauWVCRhs0H7EN7i8ZbXMjc7rhfPnDqVYb6PgKcsGb12BDxeMo6ZaYc/6EKi8g9dxJ+P
	hUctU2wGW/hgQLm8LkjUyhzTXhKjkA/OmAHcfSyGY10d5QAZYrfJO31YcPhvkEvskodOVpyHmEQHr
	riXrMF5REqg+DNm9dmH3BNlWbbZM0dsQQGwUiCGB033JxfmDB5FynI5bTbsS9CL/NDFUc0Jhlascw
	elaVO6cYV/bJheB5nfkEEWz2WNxG0deICx6apMIDGdi9UcsIlM7jkSS+6tzjR3ZFtsStrDMH+NY/j
	yHOyFFO4HEQj6GU/R47g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1ukG-00073S-7Y; Thu, 07 Mar 2019 15:15:40 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1uiU-0003Sj-4h
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 15:13:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id n2so17854872wrw.8
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 07:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g90x653fp10tWOEz2NsdqDP+qS+7JhLDzpCoi1kfPmo=;
 b=LJYbRSl9e48UyWFjWVOS8FsXzY4tY+BP+USZp0/nQIfYHijpq6xi+i273vkKLTAgLS
 Gvz8XxOWomYScRLdMdoWBn11HheL/WRcSGssxAwChbwLEItkEo6bem9id5x1Wvlb2wHQ
 OVGFruqk9cex+jsIqoQWSqdID87eWamQHjKuxOsZt07AIHMgsA6xghybwMo0GwirdPDH
 3Wp+8p1eNM5DR63q/BDI3UApDxaoqo5KVB755zzXQFxaTEmxEHH/z/bFaOkR0J8SFA9b
 T5OPKB5F0rq8TweQOHKrytI53vy7iebQQVzvQblfBpHDU6MN/wNn2JoUCW3KhZhDBwM1
 7aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g90x653fp10tWOEz2NsdqDP+qS+7JhLDzpCoi1kfPmo=;
 b=LHPeYx3weBUm43zuxMFMZBrlSRErqKF2U6TKA7WfPkq31OIlKBfRzfrNvEul7104vT
 SpAhWs1ehlA7gj8A2em7YpvwfNAqBahJGGLnkj4QZn8UVJki3SLVFOME8hakNxQBR9LQ
 fvrQjM+8qRRK7LFp2zkk4FztC4pOGp15Ni+rphoGV8PJmh8D0yNpo471fQ1S2YV0xqjN
 7tiRllrcMl9o28sdsblmZGhpqnKStZOq9gtRxuGYafwnzIyPh7XSPdj+CY8r2qvEpIRa
 IL8l1Fxwr4RYI6PhQyr7fZMx/5ZLCZMWoItSX2s1fcjQpxPsYo1kURRWS/TRSCR5TMZf
 3Rcw==
X-Gm-Message-State: APjAAAWAmeQt/qv4FdNH1HfXCrLyyveuGce0irQZVlkOfFoFEBiOGRUl
 dsD345LT5mVJSmCHWctxPIpcBw==
X-Google-Smtp-Source: APXvYqyjTkFCM+4w0UmrWDhrI9RijhFS56AiX4SNVemfSJpcl7INIj7i7WGwmtPnMV/qrVG+QhgUgw==
X-Received: by 2002:adf:a49c:: with SMTP id g28mr6968409wrb.147.1551971628621; 
 Thu, 07 Mar 2019 07:13:48 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm5756563wrt.37.2019.03.07.07.13.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 07:13:48 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 6/9] arm64: dts: meson: g12a: Add UART A, B & C nodes and pins
Date: Thu,  7 Mar 2019 16:13:38 +0100
Message-Id: <20190307151342.7381-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307151342.7381-1-narmstrong@baylibre.com>
References: <20190307151342.7381-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_071350_471547_F8DF14FE 
X-CRM114-Status: GOOD (  10.54  )
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

This patch adds the 2 UART nodes in the EE power domain with the corresponding
pinctrl nodes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 82 +++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 2a700bb45d04..50e2cd36e08b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -113,6 +113,61 @@
 						#gpio-cells = <2>;
 						gpio-ranges = <&periphs_pinctrl 0 0 86>;
 					};
+
+					uart_a_pins: uart_a {
+						mux {
+							groups = "uart_a_tx",
+								 "uart_a_rx";
+							function = "uart_a";
+							bias-disable;
+						};
+					};
+
+					uart_a_cts_rts_pins: uart_a_cts_rts {
+						mux {
+							groups = "uart_a_cts",
+								 "uart_a_rts";
+							function = "uart_a";
+							bias-disable;
+						};
+					};
+
+					uart_ao_a_c_pins: uart_ao_a_c {
+						mux {
+							groups = "uart_ao_a_rx_c",
+								 "uart_ao_a_tx_c";
+							function = "uart_ao_a_c";
+							bias-disable;
+						};
+					};
+
+					uart_b_pins: uart_b {
+						mux {
+							groups = "uart_b_tx",
+								 "uart_b_rx";
+							function = "uart_b";
+							bias-disable;
+						};
+					};
+
+					uart_c_pins: uart_c {
+						mux {
+							groups = "uart_c_tx",
+								 "uart_c_rx";
+							function = "uart_c";
+							bias-disable;
+						};
+					};
+
+					uart_c_cts_rts_pins: uart_c_cts_rts {
+						mux {
+							groups = "uart_c_cts",
+								 "uart_c_rts";
+							function = "uart_c";
+							bias-disable;
+						};
+					};
+				};
 			};
 
 			hiu: bus@3c000 {
@@ -256,6 +311,33 @@
 				compatible = "amlogic,meson-g12a-clk-measure";
 				reg = <0x0 0x18000 0x0 0x10>;
 			};
+
+			uart_C: serial@22000 {
+				compatible = "amlogic,meson-gx-uart";
+				reg = <0x0 0x22000 0x0 0x18>;
+				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_B: serial@23000 {
+				compatible = "amlogic,meson-gx-uart";
+				reg = <0x0 0x23000 0x0 0x18>;
+				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_A: serial@24000 {
+				compatible = "amlogic,meson-gx-uart";
+				reg = <0x0 0x24000 0x0 0x18>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
