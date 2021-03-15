Return-Path: <SRS0=3MJg=IN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C184C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Mar 2021 08:37:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B929E64E89
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Mar 2021 08:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B929E64E89
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hrRRjFFYVbKaHh+3zdx2tw9ObggJLrdDEI43Bd4s8H8=; b=ZWQTUHhFKxIEZd38hvYlITkon
	y+y83BUQbXFRzmpHUmnyvi4KxmehUZvPc91w1G0+b2aotQjd9AXsr3Gd7lDtXNSDtRO5i/rAKsXOA
	i1OciHEmfV8HhycdlD2nZmW5XAt0IQ+JkUFmJXKQ87aR9m4eQvcn7TVythto050YPeixMl0eY71Rr
	XoEH9xtN0sYEvGrn8ohIVkeXuV1pjgpsj/9LeXQHEfJk8asWTmWwNZfCCCWBV9hS6gDNQG5y2Rbdd
	3KPnoFBv0G2SZlicg/nWFAlK1P86Tbom7d7cj708OtTELv/evYcMNs+cjjEMECaTHgqUWsZAi+XS7
	LlUQE6bGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLiic-00FFIW-EQ; Mon, 15 Mar 2021 08:36:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLigr-00FEsm-EP
 for linux-amlogic@lists.infradead.org; Mon, 15 Mar 2021 08:35:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so1868916wmq.1
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Mar 2021 01:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4O/Pa9QoYF77T5Q9QdbcadRQvPAdN3INVfdUHWaUtt8=;
 b=X+QUFVzKkQbG1ViUEZ3ss5XSu9heNtdx5TJHJrU1CiqtByufNS4VrOXAvqk+I5bdR2
 em6RSTaKU9idqiQITHDzc/DtiLlLvKYg/uBLAmPPmR/IkaXePdP9iIX9HdsWNYFpEaVv
 5dGrwHCoVJMiWt0PpoSUZH8sU4eNdWw2W/IqmLN96S4abciDPztuzn4k/buBj7xHJpRS
 cSvv4WbCBojzRz3STHiTyDwHgO6NrShwOGryzZ7HaEkv8mxpKJToLcx5avhbZcla8VTD
 uSmZAaVVomd281PQ00gMbDzr9ndev8s4cn7DzY+yfjMmDHs7ZLMKm0UC6kBDHSsefrtu
 Ea0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4O/Pa9QoYF77T5Q9QdbcadRQvPAdN3INVfdUHWaUtt8=;
 b=jbzvVlzo/GrBIMM7ZeiKVLbTqnWCGL0HhxeTXV6yzRfaXI3YfefsQij1fpw47zD+AU
 R5v2ANNPGsDO14Yk4BPGtld39nBK5IZkYspitfTVHRBJ07VS7wWkQ1Ze1GHfhsyOn4u/
 CO9lDRFLh1PSxZvH/yMi/m17NKbBCaOQlH/3OcBBkK2j/xwmAxk/7Vy1Mq0JYdm4fYju
 GxbCCWRhdWL1JmwvfOH2Qp5tomSwm95tu9ZGRZawYyu34S2dPDfm4uwNbpmN8r8Z+IHF
 vwImZixhDBP+18lBb8E35eF7iVvQ4NBtpv4PQ4d9xq3R8c8Q44OEEkjkJoE0r2NcbPXP
 BIMQ==
X-Gm-Message-State: AOAM530uTzPtTJEfdFktPvrVACGnX/jG1VkRX2x8OuOrasVjAhIGkSHK
 vljhmpno0+tM6fKG2U9nTCJfbk2iIdRFITQA
X-Google-Smtp-Source: ABdhPJy3UE503fgAhTS0RzBbZfuwhb5FPKRFm4Jpd51LGdchtrvmRVxO/iaQkDxynO+Xstf/56XjoQ==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr25166362wml.147.1615797302244; 
 Mon, 15 Mar 2021 01:35:02 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:708f:15aa:638c:22b7])
 by smtp.gmail.com with ESMTPSA id
 o2sm8372028wmc.23.2021.03.15.01.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 01:35:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/3] tty: serial: meson: retrieve port FIFO size from DT
Date: Mon, 15 Mar 2021 09:34:58 +0100
Message-Id: <20210315083459.359773-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315083459.359773-1-narmstrong@baylibre.com>
References: <20210315083459.359773-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_083507_897569_CE104584 
X-CRM114-Status: GOOD (  14.52  )
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

Now the DT bindings has a property to get the FIFO size for a particular port,
retrieve it and use to setup the FIFO interrupts threshold.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/tty/serial/meson_uart.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 69eeef9edfa5..7244b12aefab 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -717,6 +717,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 {
 	struct resource *res_mem, *res_irq;
 	struct uart_port *port;
+	u32 fifosize = 64; /* Default is 64, 128 for EE UART_0 */
 	int ret = 0;
 	int id = -1;
 
@@ -743,6 +744,8 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (!res_irq)
 		return -ENODEV;
 
+	of_property_read_u32(pdev->dev.of_node, "amlogic,uart-fifosize", &fifosize);
+
 	if (meson_ports[pdev->id]) {
 		dev_err(&pdev->dev, "port %d already allocated\n", pdev->id);
 		return -EBUSY;
@@ -772,7 +775,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	port->type = PORT_MESON;
 	port->x_char = 0;
 	port->ops = &meson_uart_ops;
-	port->fifosize = 64;
+	port->fifosize = fifosize;
 
 	meson_ports[pdev->id] = port;
 	platform_set_drvdata(pdev, port);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
