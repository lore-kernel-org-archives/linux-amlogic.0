Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC12C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 18:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FoZINtIKcER1uJYV+uA6RBg9Nd4FtDGlZ78dKYdUips=; b=sFY7VNeOZx+KbH
	RC79XoxUl2j7Cuqa3cdjoQ0YHwq09+fGp4bwzLJogSbufwFPPbAs+9I+5aFi8S6l5fclkVELRoZX9
	V71++TZWWTwG7CTWpXmOURRerA2imsHv5Ft/tlHi/dFGyQF3znbL3y03MuEOwH7qCqFfjIzWmXbdz
	Q+AHjGvp/ZtSJQel8azkpkrCzcsmlHldzXU8XgEzLtpKX1vOEdqAoO9qGLz/O/mC+iJSmH66Eitda
	uKlMbUMlqOZGuax6yBfDvxarHVUBFmyc2YrQYzPorOqIMg2YT+jCCEi4PHU7fGZXnNCXgoT8XnK3X
	MzAmN2ePve1c0WIb8gmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1uJ1-00HD2L-R8; Mon, 27 Dec 2021 18:01:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1uIi-00HCtZ-6y; Mon, 27 Dec 2021 18:00:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id r17so33706604wrc.3;
 Mon, 27 Dec 2021 10:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZQ7gHCQAZlakeETbiUb1MioVO2i5AohZAAATv78NYM=;
 b=PrHCsm0XE/g7kyILFqCoEKld6mssfEEGh0AbSwxZTlaIoxDoa+FussVbhdXziv5TC6
 LbG7qxPRXgniX84SeExqUEjNrJUdx5+5YTdXyUqLg9LbqF0v1YirchKYBlpFhZPOekn+
 sdL1DXEcBtSx1fXhz1OmGscxqU+siP1MxziUBVB4Ls/+kfBbCerm4ifjfn1gvMavchnj
 Jl1tzVl4qHkWXYNgDvUwDMkmN/d8/weUS/91uMArs6OFQhbOcAXIeGcei/MwJACs08zy
 galWcRcRBJdMHVs3yJv5/9d1vW7Yql4x32NvlKMV3yOQBB3GUufGc/PJK2ZjprQvSaF4
 z4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZQ7gHCQAZlakeETbiUb1MioVO2i5AohZAAATv78NYM=;
 b=ni8k+vv0l4lGJAOnw1ofUAsF+6QKWdyNZbrPP0T8F3Q9gK8l/84wQRdre1gp4tWux4
 6A+6edvLTXPVNvhyb27dPYEEr//jP6FNkIdm1lMy9mXw79d4LWw5Xl8BHG6k3V5WLGyE
 8YF8MKFSA4P9ZopsKs4qx03jYhvJyGbza3mdxOMhIyl9EMGD1nNKIWtY9ZAVRZ/8tT0D
 t/8AFy5/I2AsEC20cRPZiTHftvsnKPsgSqbCbNGnGoyq/irlSVPwyz2UNjNRUYb/DRx6
 9ohbDBczuvHYNWtmJjg2Hj2a2RS+JqxgZN5cI3J4Fr65eOD44wxC/aXxC79XxYNNPOK1
 4BBw==
X-Gm-Message-State: AOAM5307uPab8PcUgTF/QKTSHLO/5EEp9OnP7r7mRVzQmR7vspE/0afb
 DOtvd+V2OwB0cNgW8IL16cEYUaLvXoY=
X-Google-Smtp-Source: ABdhPJwztOIQ+ohCI+e9b0xdHnsHB1yXoWTIDrywhAAv1mi1cNk/1YC13UuJgxs0uHI+hDja1E5MwQ==
X-Received: by 2002:adf:dc92:: with SMTP id r18mr13285103wrj.584.1640628042921; 
 Mon, 27 Dec 2021 10:00:42 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c4b2-f800-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c4b2:f800:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o11sm18572946wmq.15.2021.12.27.10.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 10:00:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/3] ARM: dts: meson8b: Fix the UART device-tree schema
 validation
Date: Mon, 27 Dec 2021 19:00:26 +0100
Message-Id: <20211227180026.4068352-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_100048_294823_500DDB9C 
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
- "amlogic,meson8b-uart", "amlogic,meson-ao-uart"
- "amlogic,meson8b-uart"

Use the correct fallback compatible string "amlogic,meson-ao-uart" for
AO UART. Drop the "amlogic,meson-uart" compatible string from the EE
domain UART controllers.

Also update the order of the clocks to match the order defined in the
yaml bindings.

Fixes: b02d6e73f5fc96 ("ARM: dts: meson8b: use stable UART bindings with correct gate clock")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index b49b7cbaed4e..94f1c03decce 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -724,27 +724,27 @@ &timer_abcde {
 };
 
 &uart_AO {
-	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_CLK81>;
-	clock-names = "baud", "xtal", "pclk";
+	compatible = "amlogic,meson8b-uart", "amlogic,meson-ao-uart";
+	clocks = <&xtal>, <&clkc CLKID_CLK81>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_A {
-	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART0>;
-	clock-names = "baud", "xtal", "pclk";
+	compatible = "amlogic,meson8b-uart";
+	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_B {
-	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART1>;
-	clock-names = "baud", "xtal", "pclk";
+	compatible = "amlogic,meson8b-uart";
+	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_C {
-	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART2>;
-	clock-names = "baud", "xtal", "pclk";
+	compatible = "amlogic,meson8b-uart";
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
