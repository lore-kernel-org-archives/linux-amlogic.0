Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB87C77B7D
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 May 2023 20:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a6sN38qmYHsplwnhiiEEfPEAByehDdJDe13DZjjjMCs=; b=OiTYGDOoYDKnrZ
	5hWPdVBtHfDvIbJJMb0xMoVbMlT8/nb4joqH2u8/eKD/4BNRqnmnpS3xUK/fICTYnLpGaBIfLjmwX
	TKX/V43IJVeJrFM8BmUZhlNg5DX5PCruVxl8bDkLMxORkoKPhjrVDd+0bAGM5raF5NkhAw4GYl8iC
	lGP41qRY0S19wsjGeNrvgJsDftT+2jjqukX1NGYc52Jg8h6p1a0pNGyzYkR/kslTKGHc0OJNj01zL
	gyfHhtyrdyvrkNYTXUf9iSk09b1OJ6GqLgsrfdoicC9LMxrzBorBR7aTGzw1YFxxbR5gMS/5EBLS8
	W078EQggKb+F3ok1yWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyIBz-000ANN-1V;
	Sun, 14 May 2023 20:19:43 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyIBw-000AML-02;
	Sun, 14 May 2023 20:19:41 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-965ddb2093bso1767937966b.2;
        Sun, 14 May 2023 13:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684095574; x=1686687574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CAZGDRgIzX5FxRnFiUuhXBp78w1oVd47wiPNPhXAe6I=;
        b=ArSPJz3lBX5aXI8VdTFkH5lzFoT+Pn84eoU5b3DqOpN6MQ2722X4ARnVQMP9lYOS0Q
         Lo01D8kPnjDFzT2XXGUvhd3YQ14w//o9i3m2yhbhK9BELU3Gu7++JpzDvkRHYLBYSIRO
         g8UstJ2eNsPengUYiaZdFSxzWKnjZ6Zn6Fx/fJLOW8gLZVm2bR5peUcW3kmz7331NK4P
         +RQ5MvowhsjeH2KGR6yxdg/32ubIKO+pLJ08U3CdiGM2Cez5EtqdniQVxjwLKA9dPHfn
         By2mQvdoc766VOFHlH1Mu5JukW2uUQzegjALkroaDDQU5QohebjASlQuwagesM0B7W9C
         MCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684095574; x=1686687574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAZGDRgIzX5FxRnFiUuhXBp78w1oVd47wiPNPhXAe6I=;
        b=aRDqlEUQY+qBoAc5JXs6Om7SeLQooehsxJRa5pIMdofCJq4DvYHe3BqOzo0CZDIDbW
         yVHNjfm7eZxcRjTFDVaxykm+vVOyq5Oh4x7kyBmRTrJKIHABHcF5XJv1SpJzS1z7FN5C
         VaVZSAKB6NJ7w9so8fO6FmaBJFYi1odDCJbQp6l2NHBHV2QkgpcBO+TKtg7fAQ7cP9eR
         SRgky0UXN2P4l/n6NEbTb5NGZT4VE5MQ8k2P4PwidhVapNDJBVhew10Cj9LeMFGZoWqt
         s+Yuf6Tlgv4nAnZKy0SHBC1Q3/p3Z/dVeEnpsAVaqwUwA1xdlLQyE1l+wNZM+MtYZXrx
         1Ovg==
X-Gm-Message-State: AC+VfDyPW3p/wL9uCOhfMtYQNt9rH36DMRyPRXoe5menkWDH04RH53fN
	S95aWQM6lKV5z0WBKn6TCxkgsfRIL7o=
X-Google-Smtp-Source: ACHHUZ7n4NGNuyH7m4b/27oPWm+NBnaOfblAd/I9alEfoRukF+KLrmKgITtn7lWZsLnvmLV46W56pw==
X-Received: by 2002:a17:906:7304:b0:921:da99:f39c with SMTP id di4-20020a170906730400b00921da99f39cmr35343433ejc.12.1684095573386;
        Sun, 14 May 2023 13:19:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c22-7ade-5d00-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7ade:5d00::e63])
        by smtp.googlemail.com with ESMTPSA id ze12-20020a170906ef8c00b009659fa6eeddsm8529291ejb.196.2023.05.14.13.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 13:19:32 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans-Frieder Vogt <hfdevel@gmx.net>
Subject: [PATCH v2] ARM: dts: meson8: correct uart_B and uart_C clock references
Date: Sun, 14 May 2023 22:19:09 +0200
Message-Id: <20230514201909.506090-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_131940_052565_4A2E2540 
X-CRM114-Status: GOOD (  12.84  )
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

On Meson8 uart_B and uart_C do not work, because they are relying on
incorrect clocks. Change the references of pclk to the correct CLKID
(UART1 for uart_B and UART2 for uart_C), to allow use of the two uarts.

This was originally reported by Hans-Frieder Vogt for Meson8b [0], but
the same bug is also present in meson8.dtsi

[0] https://lore.kernel.org/linux-amlogic/trinity-bf20bcb9-790b-4ab9-99e3-0831ef8257f4-1680878185420@3c-app-gmx-bap55/

Fixes: 57007bfb5469 ("ARM: dts: meson8: Fix the UART device-tree schema validation")
Reported-by: Hans-Frieder Vogt <hfdevel@gmx.net> # for meson8b.dtsi
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1:
- move the link to the original report for Meson8b to the description


 arch/arm/boot/dts/meson8.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 4f22ab451aae..1054297fa69f 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -769,13 +769,13 @@ &uart_A {
 
 &uart_B {
 	compatible = "amlogic,meson8-uart";
-	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clocks = <&xtal>, <&clkc CLKID_UART2>, <&clkc CLKID_CLK81>;
 	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_C {
 	compatible = "amlogic,meson8-uart";
-	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clocks = <&xtal>, <&clkc CLKID_UART2>, <&clkc CLKID_CLK81>;
 	clock-names = "xtal", "pclk", "baud";
 };
 
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
