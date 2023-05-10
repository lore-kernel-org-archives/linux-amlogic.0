Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D8EC77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 May 2023 21:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dw81PRbQrkVjsu3T9Io0KIHK1LeKX0YEbuRqQ8IuKlM=; b=QNSsFzbkRI1DdP
	I9b7kifNADOuOQrE8U4cVsLDW+sYEMUOI9q/hAT15/xgIvc/leW6udUw9w5qEKFqcSbSySuFKEwHN
	+mjhfqd2pK1+PlsqVZy1cpNMRqjIXu3UTHpOsUwyaCw/HorbqujLvButAGyiWJbXOxt6IbAH+Ee18
	z5FnUq4b+MQjpLniXtXoAPv+i0QZSLtN6G58oefcXhFC5gUkqMzYaTC0gMrEdB30hiCXpJlP8N0YB
	iYwvuRIHK0DCdrfUyx98x/F/QgbkZiE40PhH/oR9LZx3ViZb9ekQb2AUPLbwk7oobVP0K+VcCtU7/
	XpcTcLokIDcdwGoACtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwr3W-0071hi-0X;
	Wed, 10 May 2023 21:09:02 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwr3T-0071gj-0q;
	Wed, 10 May 2023 21:09:00 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so73019354a12.0;
        Wed, 10 May 2023 14:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683752936; x=1686344936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Klp0CuqpJHxhI4O+L3MmlfTlbLGWu6X4eGPiSxnBnSI=;
        b=JwjeiFB6UnwVN5uAvfMWTOvZjUOtG7e+DtdxPbcjmkpuz0YYSvL9ZrXzfV8SfjkvUq
         r9TrPbOSEkS3IKfqy+Qi8PXJCtVhazB//l5wQmSibutGIR9NS/Cbsw0vufV+PI7gKuta
         Ed5KIVXnzpV3N1NtzvdE8wcPMbStIWTqzFROHwIsbydjJ+DmQ8KHiHxWV/1SqXYo/XiD
         7hoyEgRkKEn1pdzPyaj2YlUYcfTSwbD37MMoQaxTXgwdzvMwl4Oa15eliz3R9L2yO9ST
         p0mS+a+VgSOj+bpnvMLrjg9kXwsqIAmh8QTj+iRS8ZcpFZAPYwoE5jPP7c+AmYBl/dlI
         2KQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683752936; x=1686344936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Klp0CuqpJHxhI4O+L3MmlfTlbLGWu6X4eGPiSxnBnSI=;
        b=ClZyuSUZmMH2Ku9mQcUM6ANGUsAdh1NsX50z/TnITJRAl+GiLnFUSwWig87UoNkBQd
         TzXnsYd2WZsg1vXJPRaV/lRql7J749mMq1xRMu4Di3KHeSHyM13B813j/r0yRS1pJH2V
         JyuHUFvt7gzMbi2JMJziUztada9GP1XGI9q2zh6ftL0AYtjogYmycAEtqbuyzC7ueJFK
         UlxepZO/FGRoMx3FkMwAwI+qgdV9F27tjzhVINm9hxJ92+pLed22BKpHaBq+9HMHdgW3
         NcjT+IjFur5dNKKN9AIdjestY0ZzRitoiKNkVtRU0LEKcKQKpx9g5JkPAjqRRAzJy8Te
         MQtQ==
X-Gm-Message-State: AC+VfDzg91hZaHP8bSKFfJyNQVJErJHx7e0Kzt0Zaki0nnIgzZUuuomt
	rOF/U4uY04ks2mlDB3ipfU8LIJeIuh0=
X-Google-Smtp-Source: ACHHUZ5qIS4HeK3MbSIU0JahyE4JOxNqgOyqPJvhEDQJXjfmm3bGD837sTzTbsdypjvcqa8vX4teWw==
X-Received: by 2002:a05:6402:5202:b0:506:bd27:a2f0 with SMTP id s2-20020a056402520200b00506bd27a2f0mr17050000edd.15.1683752936065;
        Wed, 10 May 2023 14:08:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-b859-1e00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:b859:1e00::e63])
        by smtp.googlemail.com with ESMTPSA id m24-20020aa7d358000000b0050bc6c04a66sm2234239edr.40.2023.05.10.14.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 14:08:55 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans-Frieder Vogt <hfdevel@gmx.net>
Subject: [PATCH] ARM: dts: meson8: correct uart_B and uart_C clock references
Date: Wed, 10 May 2023 23:08:47 +0200
Message-Id: <20230510210847.996980-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_140859_297358_2347968D 
X-CRM114-Status: GOOD (  11.96  )
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

Fixes: 57007bfb5469 ("ARM: dts: meson8: Fix the UART device-tree schema validation")
Reported-by: Hans-Frieder Vogt <hfdevel@gmx.net> # for meson8b.dtsi
Link: https://lore.kernel.org/linux-amlogic/trinity-bf20bcb9-790b-4ab9-99e3-0831ef8257f4-1680878185420@3c-app-gmx-bap55/
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
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
