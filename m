Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC11CC77B7F
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 20:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jm6QVvTG0ngl98w6aXi8BgCoXAXzkK3a18jynVLu1cA=; b=rqto1L0BYGnsrf
	ZqrhNLLNiH0BqF9ii7BE00HdD9e/5C2v/6NxjhZQtCzRWBDxf9o/3pwELwk2ZV9kec8b8SOWb32Tb
	mYpClP5ifFJN4+epQvm3bS/oPG+fg2kPLkrqWzILGj661pMRFsqCcvi6z60F+p0/RipOI34KcFgzA
	1GsWM2fpVobyUe8YczIdnEjN8FzG8kXDYMlWRV+GgsFRHfcGZMdGRM1tFA8dJEwvnIrk7HJg71SJF
	7Z8CrnZLIoEM32vqRpwt50godY5lKmRZAcN3rrDRBSQ0hn31zBpIOqp5RRyL09akW10+uo+BSXoyk
	lhjR/7wIfiyZ0B3oZAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz1Jr-0073ni-0h;
	Tue, 16 May 2023 20:30:51 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz1Jo-0073mJ-1G;
	Tue, 16 May 2023 20:30:49 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so14240946a12.0;
        Tue, 16 May 2023 13:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684269044; x=1686861044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HRBhEUf7CYGryet9ZxbEaGtt6QxEKGJuiA85AVv0BIk=;
        b=sCapp58iRDrRq6V4PfWOO/Y/fTUFnOlRvbDiSpey+KtmAWkC9JFwJmBuDkfFylP8d6
         otK/LRYiFKzgMrzWcjPRCgUs48TFvAbuXlm9p0KWQja1flK7g+C72QsTptxIsjifZsE1
         aX71kT9Fdspb1EX2SKJpf9jgyfWQrJQ6uJXPbyjxqAfT4x5SWuf8NL3xO8IkFOFwiHX+
         xrKcq1bhJ7OQ7WkgBoQrGtuW8+O3ZuK+eNuyNhQ9DIwQ7ATUhvstsU8DhyaJVgpKTN4p
         W/nYCXdaqf1ULP5VtwTpLDayN/9adJeSvlSZGVvhmMiWIttbM06X8/PNYad70pW5RwN9
         MiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684269044; x=1686861044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRBhEUf7CYGryet9ZxbEaGtt6QxEKGJuiA85AVv0BIk=;
        b=E/4lgZNypztc0/L4O6NveYcRP0RgbyPq8LSHDoiD8E2nxVqmszn4PrP9jZK35Eni6Q
         PCQAeBRq3TUQAY04211fs2WbeOU4EsZDkEx3U5rkIB4htyuz0Weo8K76WLsClpdl1jmP
         1Ds7g4nvg+Or8eZOxXYeMINu8qnHYGY+jlhp0ua9hgBhqv51nXugzQRFvnAJGWCfOhhB
         SGiAOOO4Ov1el9agNWb1vHGNHYUS669eFiy++Eadcce4m3QkOAWgYgzn+L/yn6M/F1nc
         fpMKiBVj/wmR7aHQPbJH9sYI9hMbpTKMgCNEKfLq+QrxCkoUz44N5NVCrGQKn30Qzq/e
         D9iw==
X-Gm-Message-State: AC+VfDyM/QxD+W8D3PyAMyMVxkOb8citPOcRITeE/W3AP540nD7X9Jlq
	8z9bM0gKvYVW73SDiK/WPQOokPy9Q8I=
X-Google-Smtp-Source: ACHHUZ4jgUHMzCjzMXjjFQWpF0nsFR8MOJrzw2we9iCGlm41WxlkZ/izm+GYAl4PBL9qUtWr0EUb3A==
X-Received: by 2002:a17:907:928e:b0:96a:8412:a43d with SMTP id bw14-20020a170907928e00b0096a8412a43dmr16563797ejc.33.1684269043970;
        Tue, 16 May 2023 13:30:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c47a-4900-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c47a:4900::e63])
        by smtp.googlemail.com with ESMTPSA id ci18-20020a170907267200b009659ecdf29fsm11304715ejc.1.2023.05.16.13.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 13:30:43 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans-Frieder Vogt <hfdevel@gmx.net>
Subject: [PATCH v3] ARM: dts: meson8: correct uart_B and uart_C clock references
Date: Tue, 16 May 2023 22:30:29 +0200
Message-Id: <20230516203029.1031174-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_133048_432224_6700D8CE 
X-CRM114-Status: GOOD (  13.51  )
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

Changes since v2:
- use CLKID_UART1 for &uart_B (thanks Hans-Frieder Vogt for spotting my
  typo!)


 arch/arm/boot/dts/meson8.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 4f22ab451aae..59932fbfd5d5 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -769,13 +769,13 @@ &uart_A {
 
 &uart_B {
 	compatible = "amlogic,meson8-uart";
-	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clocks = <&xtal>, <&clkc CLKID_UART1>, <&clkc CLKID_CLK81>;
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
