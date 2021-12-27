Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044D2C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 18:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81wZOR6+PKbJQFCjaQ+1+KzdedSb3acUWcUG6zvYJlk=; b=tvDHhCPYQlAnsx
	ydSZAtNndQt+uHANbZvdTBTbUYM/J13xVbUhGzXhEYrMWhohXQJPN8qh/j9OVV7UQr7v6VY3TbLgc
	nsEC6mGXRHEXQDxf1FcnraZmV8Om1NjBiVpfUmAu3WAc0l9BV97FcUUf9oJXEec65nkGqet/atLLe
	XNB8HjeWkann0tDTwFh2tgst0XPirVd+OsazY6lTsmBDkgWCwMO/gPaCte9pvzI8/CRrik/B8ZAZe
	YhkerH0UrmvS+RDAlXXabu8uCws/R6c/Sx9y1jBNN4ZMc4p0s/EFrXXXV80jakIzfm57on28pfAdQ
	QH4AK3R8ndWdbCJ9j68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1uJE-00HD8H-Tw; Mon, 27 Dec 2021 18:01:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1uIi-00HCtI-8M; Mon, 27 Dec 2021 18:00:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id q16so33675779wrg.7;
 Mon, 27 Dec 2021 10:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AifEVwl64n8+jB0pcjGlLMYOzYJ44R5sKYb/8MP+sB4=;
 b=c4ODpaquaFJ1vesePUF39r9v1GVlO1r76gUPCVX9vUqod4/vCG4Uw0nflrxboG961B
 ooT2tfUmpzsYQqS7PdPN1AwdvOkyh2I/tGLYIOi82uyMQL+0P2Evm43th/D913QTfTHP
 08BcsuIOcc7z9/xWRB5m+SOfUujCipq435CaHWnzl2jAur+Zx+eTL7ePsovNYX+TTD4o
 j0XvAZTjxxvDE4z17fdwp0OaZTfIaBw8pQOcOxbl1nFw8XaAfIzVvAn7S/O9YZR4SGim
 sC0XCWfbn0NA7b+0DCy3sMLa+2bwjJUWtz34dD88Gp7q5mztAdbleO3I6u1Ied4Xw/J1
 3cVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AifEVwl64n8+jB0pcjGlLMYOzYJ44R5sKYb/8MP+sB4=;
 b=IntsLjnuwbdxaP++0nurO1qQYwdDZ98Y2bifore/qilpqdsr0WjdOBOqn/08YIYkNo
 mqYYGjsPoEYrq3SjIf2QQt6qOIVvzhMRozl5TfZzYQz9nFqMbqyfiAUwpmwjz10kjXl0
 cTfPdZsXPeocvIh2zhme4g13FKl9DOlWftntcGQFi3pN/Od1Up3p8s7OaocKsiAZvjIv
 gE/+szOxcmymodwXtR0jSihXe/qgHr2YbqiGxgSLOYZeHNaDSbwVlm4lIo2RmTTGPo2Q
 9+rxENv6dT1a3+srigy5+Ch9aBZknzsP1qgoq3k9SW1nYVTcgd3LkqO5DsEAdvcChoLQ
 DemQ==
X-Gm-Message-State: AOAM531UjLA4p9YnthAHLjW1+9fo89s0ZwJR6ee1+5dGtuk1scyLPA2D
 teNGbxMbOjvKOS3gIzlyZi0f8ewcR/k=
X-Google-Smtp-Source: ABdhPJyWwMW74S5bnU02w2MBV1shDTKIeHX9GvY/jJmgla2vz/DdH8PRpGgLn3sNuKlKuw3lvo6w6Q==
X-Received: by 2002:a5d:47c2:: with SMTP id o2mr13517205wrc.637.1640628042247; 
 Mon, 27 Dec 2021 10:00:42 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c4b2-f800-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c4b2:f800:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o11sm18572946wmq.15.2021.12.27.10.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 10:00:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/3] ARM: dts: meson8: Fix the UART device-tree schema
 validation
Date: Mon, 27 Dec 2021 19:00:25 +0100
Message-Id: <20211227180026.4068352-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_100048_334603_C94A8D74 
X-CRM114-Status: GOOD (  11.88  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The dt-bindings for the UART controller only allow the following values
for Meson8 SoCs:
- "amlogic,meson8-uart", "amlogic,meson-ao-uart"
- "amlogic,meson8-uart"

Use the correct fallback compatible string "amlogic,meson-ao-uart" for
AO UART. Drop the "amlogic,meson-uart" compatible string from the EE
domain UART controllers.

Also update the order of the clocks to match the order defined in the
yaml schema.

Fixes: 6ca77502050eff ("ARM: dts: meson8: use stable UART bindings with correct gate clock")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index f80ddc98d3a2..9997a5d0333a 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -736,27 +736,27 @@ &timer_abcde {
 };
 
 &uart_AO {
-	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_CLK81>;
-	clock-names = "baud", "xtal", "pclk";
+	compatible = "amlogic,meson8-uart", "amlogic,meson-ao-uart";
+	clocks = <&xtal>, <&clkc CLKID_CLK81>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_A {
-	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART0>;
-	clock-names = "baud", "xtal", "pclk";
+	compatible = "amlogic,meson8-uart";
+	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_B {
-	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART1>;
-	clock-names = "baud", "xtal", "pclk";
+	compatible = "amlogic,meson8-uart";
+	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_C {
-	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART2>;
-	clock-names = "baud", "xtal", "pclk";
+	compatible = "amlogic,meson8-uart";
+	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &usb0 {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
