Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC76C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:24:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D0361A1A
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D0361A1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dg12u8SyowmrM6Bh5LezluDWdE3UEgYpHEqBJskRGlM=; b=XfpQGeJXVbf/+XKc4GmQgQeh1
	GMS6E1nhKkDqo1v6d2Kul0WVdMT1asrDB32RFDonG3X4vTwu5Z84R0/1yDmqO+YfhDz1i8fPsZUR5
	sLwd0kVUfygc6weNayiiDv8wfkUR8q0nsZw5DWgYyIWg54hyz272b7zaKIYc0Y3/z631m0TU5LWem
	jcKjnHgeymei/NqN5ZiyB9JvTv7P51eX36VoRm15VCdHpOGb9Njy/0sU+bvMnZPGM+BUCSnZs7cRt
	luLXn8WJvEZteaYbkt/L6WjdpmlxYf6uuXEMHf6mK5T0yo3VlpXrUYad3PzOA2CAXI2HyIG5v/aTj
	BPisMGjig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPRqr-001iZC-Nh; Thu, 25 Mar 2021 15:24:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPRqO-001iSG-PV
 for linux-amlogic@lists.infradead.org; Thu, 25 Mar 2021 15:24:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id j9so962040wrx.12
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Mar 2021 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sgzzDhp79bx35r5jKOLNYJfzzmoZjTRizxE5UOSMnpw=;
 b=ZMGw7DOul3+SQoGvgOttwL1Iac5paKrRtV2ymragAJntKtRTzgfrruwJsrw+Ty0lk+
 wNgqign0naVJIqRttat6mVH5MB14qMPBfiG/zSOvlLQlHMC5x9s/3bjNyLF8hP7lKj8k
 Z3ibFMrbX0zZqw7BBDORGwixnLuRZxuE66wrJ/lH2w6N9gjO7O8fDcDuULfZEhEM7D9W
 5w2hILsvh9ZpNZWP+PmVtX6683aAJJ20mqWEP8BMaElFMedPPqsUns0zIk8TPmt+989B
 AHphs+HFybvOfPqVyJs4BSgHYEHhAkeMYyJPxv7Zdq31hhLD5BIEEHTJs2mw/+FlAJBF
 7/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sgzzDhp79bx35r5jKOLNYJfzzmoZjTRizxE5UOSMnpw=;
 b=BYItbJqfW6h5UQjVW0Ti/d4wItc/gglEXdjSyjmex0DDCLnpt0ZMCee/C8iWSwqb9g
 TH4PUhmvylmweT7h88/1XqjAcvYkpW+1rBnyWYwfzIXiD7z+8/OVn3bHIfBRoRc9eodL
 TUxyHX1tczbMWehYvAlzLngYGjIXeMnQRKy8edBYm/ThPeRh2T1lI9CQchz3ClADR5Hi
 0YQ0Z3EMnCr5UZIKz5cYqEgOqQQSDjaksp77evl0GYRdlE2tuOPcJOMjtz6NxzvHHegz
 o/vZl79Uxbf2m/+nitYgmGmLnLjSXUkD6XJpz9GMjwvnVGojUPUe4nFX75kKqIO2p5Os
 W4sw==
X-Gm-Message-State: AOAM53055EBrgX5GA25IRrUsE0fvZDh8LTyw0pL6CPmEvKL4fz3z9i/2
 vnXm9Hww42CkVYJp2L+QUEFhbw==
X-Google-Smtp-Source: ABdhPJzwib9nqK77IORZQzCGahRNUu/JMVR4TWOE9ehuvIgER+dQxfV5hsZAf8zkflsy93kN7/d/kQ==
X-Received: by 2002:a5d:638f:: with SMTP id p15mr9566480wru.220.1616685859525; 
 Thu, 25 Mar 2021 08:24:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:b105:9672:b0a:5820])
 by smtp.gmail.com with ESMTPSA id
 p18sm7395260wrs.68.2021.03.25.08.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:24:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/3] tty: serial: meson: retrieve port FIFO size from DT
Date: Thu, 25 Mar 2021 16:24:09 +0100
Message-Id: <20210325152410.1795557-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325152410.1795557-1-narmstrong@baylibre.com>
References: <20210325152410.1795557-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_152421_066470_121856E7 
X-CRM114-Status: GOOD (  14.62  )
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
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/tty/serial/meson_uart.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 69eeef9edfa5..ce4dbfb0bd24 100644
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
 
+	of_property_read_u32(pdev->dev.of_node, "fifo-size", &fifosize);
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
