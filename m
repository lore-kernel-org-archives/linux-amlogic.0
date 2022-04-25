Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB96C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Apr 2022 20:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gkdMBaFgaeLVmAG1zr2Q0/5jpyHMzpioGGcRv7ST/Qg=; b=U7UaYaWqI+Fsfu
	bbv4JX4SW/0YeT8JlFgmERbIbgo5eQSTMmTxV/mcWHC6HV1Yp3i9R2OOqq4pWzA7b/dqV6s1lybuX
	LGX2+Y8ievZmXF3fCWYX74uuByWi1pxbujZ8oHdKFuTMTPiwUlqA6u0N85hREZV/ZpfQEYewJaCL0
	MjHzVzyxjm5Pf4t8upgOtiz0UqpPfLnPxQO9ffNU/4CRHqZ5CrIZ3JpnWquIdKKY4brTz51wOw1i7
	CmN29+7nhueg9AK/GQtV0T1jSM/+k6dgnKk1iqfTQDIhDLRSGCh2JhyJPMn1Wm1KF7S2ZrQJyYwrY
	EFYBcpU26bOAxs2G0FSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj5hg-00BOrS-D4; Mon, 25 Apr 2022 20:53:04 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj5Um-00BJDs-My
 for linux-amlogic@lists.infradead.org; Mon, 25 Apr 2022 20:39:46 +0000
Received: by mail-ed1-x531.google.com with SMTP id z19so6632693edx.9
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Apr 2022 13:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=Z9FwUceYcR74V1CmqzWa9/a/fadTNC6K2PTu+7gRSQU=;
 b=VDEpSQycrnCjKAVfM3bwl6IKN+7oqz+u0Kqv/6gYwHt3cIwfSc33Sr6j2CCKjQh8+4
 yavInkxk/tMx1HG40qhvZvZ97s51MP6zgdvmKBH6zQZHdxSnYxvsQ8/E/ZR+m9SSe1/i
 nYi2FuDhS9uODYP2PmRLivHf7G1hPunox6XSnOIlEfOzBVTXVM5n/Cr8M60RozF9CApR
 vJSGV94s0+vSWCwR/aJNZjjZ1+i6Gqxn5pZPBEoGdHbQ0xSPaUnlJtAUohsM7LA5Kv2x
 ws6WVVEwwy8dXmCTiU3qupnQb8sniMioDMTcX0qpoQUqjuripr/BqN865GAyUoVveeOG
 A75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=Z9FwUceYcR74V1CmqzWa9/a/fadTNC6K2PTu+7gRSQU=;
 b=XqTaR64si4ZvG5cRfdAhpMSHgVzd/ONko0Srsn2f7HOImZ+MFwvRVYWhgzHf3CVF3W
 9xuazoiX7pSYLnL/rmmp5b0UGvbkfrXZ7cJLO+h0/fgPEeeWnTZrQZ0biZ9+I9xHPD7+
 fzS0bjerFKbxG/M25HSmIB6AW5LvBcSq1DhdYz+UN9x9ZzKlztDEjK2mtfh39a22yLFU
 MeB1sAPgxlrKzLfuSH5/ckaPsGRou8tDFcnMU9zjA74w6vLrfn6cPgtB4OK2KFdx/y1/
 KQ0rtQknh54ixYfOmmhT4G6rFFGCe7d0vMGAAhuGp+JHYubSAjlz7er5HTtVsW97iKGf
 CHGg==
X-Gm-Message-State: AOAM533QmF4d62IgEA/1B4ZU2KBxrN29Hu4UYVPIiELvV+dw3ca1xQYO
 G+GuXr3OCykXacfCPxKv7e4yLJSTUcw=
X-Google-Smtp-Source: ABdhPJzdCRzxq9eqTOXfTAAR1U6E9DvN5WAjEnVLVaqNztWY+de1fgY1Aj+Kjk18SoJJpbKLLmSSjA==
X-Received: by 2002:a05:6402:40d1:b0:425:f2cf:eb59 with SMTP id
 z17-20020a05640240d100b00425f2cfeb59mr4036400edb.66.1650919182609; 
 Mon, 25 Apr 2022 13:39:42 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7b47:9400:3041:ad82:4e56:6dd5?
 (dynamic-2a01-0c22-7b47-9400-3041-ad82-4e56-6dd5.c22.pool.telefonica.de.
 [2a01:c22:7b47:9400:3041:ad82:4e56:6dd5])
 by smtp.googlemail.com with ESMTPSA id
 x19-20020a05640226d300b004228faf83desm5339141edd.12.2022.04.25.13.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:39:42 -0700 (PDT)
Message-ID: <fd06c40a-4f63-3b93-8471-477506f4ef38@gmail.com>
Date: Mon, 25 Apr 2022 22:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, Yu Tu <yu.tu@amlogic.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RFC] tty: serial: meson: add new compatible for gxl uart
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_133944_802366_14ABA82B 
X-CRM114-Status: GOOD (  13.76  )
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

My SC2 test system (ah212-based HK1 RBOX X4) uses an uboot console
speed of 921600 bps. Being able to use the same speed in Linux
requires using a 12MHz clock source. Ideally we'd set the new
compatible to the first chip version supporting the
AML_UART_BAUD_XTAL_DIV2 bit. Not having access to chip documentation
I'd appreciate a hint on when this bit was introduced.
If fine with you in general the final series would include a
separate patch for the new compatible.

Note: This patch doesn't consider "tty: serial: meson:
Use DIV_ROUND_CLOSEST to calculate baud rates" yet and therefore
won't apply cleanly on linux-next.
I locally used the same DIV_ROUND_CLOSEST() changes before.
----------------------------------------------------------------
Newer SoC versions support using XTAL / 2 (12MHz) as clock source
for the UART. This clock source allows to support 921600 bps as used
by vendor uboot on certain systems like ah212 ref board.

12MHz / 13 = 923076 bps
With the currently used 8MHz clock source only 888888bps or
1000000 bps are possible.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/tty/serial/meson_uart.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 2bf1c57e0..0a0a0636f 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -68,6 +68,7 @@
 #define AML_UART_BAUD_MASK		0x7fffff
 #define AML_UART_BAUD_USE		BIT(23)
 #define AML_UART_BAUD_XTAL		BIT(24)
+#define AML_UART_BAUD_XTAL_DIV2		BIT(27)
 
 #define AML_UART_PORT_NUM		12
 #define AML_UART_PORT_OFFSET		6
@@ -299,10 +300,15 @@ static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
 		cpu_relax();
 
 	if (port->uartclk == 24000000) {
-		val = ((port->uartclk / 3) / baud) - 1;
-		val |= AML_UART_BAUD_XTAL;
+		if (of_device_is_compatible(port->dev->of_node, "amlogic,meson-gxl-uart")) {
+			val = DIV_ROUND_CLOSEST(port->uartclk, 2 * baud) - 1;
+			val |= AML_UART_BAUD_XTAL | AML_UART_BAUD_XTAL_DIV2;
+		} else {
+			val = DIV_ROUND_CLOSEST(port->uartclk, 3 * baud) - 1;
+			val |= AML_UART_BAUD_XTAL;
+		}
 	} else {
-		val = ((port->uartclk * 10 / (baud * 4) + 5) / 10) - 1;
+		val = DIV_ROUND_CLOSEST(port->uartclk, 4 * baud) - 1;
 	}
 	val |= AML_UART_BAUD_USE;
 	writel(val, port->membase + AML_UART_REG5);
@@ -782,6 +788,7 @@ static const struct of_device_id meson_uart_dt_match[] = {
 	{ .compatible = "amlogic,meson8-uart" },
 	{ .compatible = "amlogic,meson8b-uart" },
 	{ .compatible = "amlogic,meson-gx-uart" },
+	{ .compatible = "amlogic,meson-gxl-uart" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_uart_dt_match);
-- 
2.35.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
