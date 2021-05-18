Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84368C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:59:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D0FC6124C
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D0FC6124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mnm9xzZMXqyyJDegvcvxCxFyRIJU8sQUaoVDRNP29AE=; b=nO477beYanzSR/XtmxpZYEceC
	9v87uXVDe2rzDdJwXS3BdXzMyT0azxVVAQvMiLYz1aR9hbSuTIh7PaGHuu1Kd5LKL5GpdbVcRmQe/
	UNXaAyFmUmH/guN4V1ZqLTaP6XtDPi+8rM6hQkMAiG64BI5j8iCecerrlmQTsKs+Lq9W5NNbteW6h
	RAx1fk49bA50WExd9LsJnFPJf105l3mE8V/qF/IvEZImmTarWLiie2n+dciKk2pUhjTe6K8ER7NCS
	SHiXOWskL+biA88HvlWcIQvAhfI2VyQWCQ+OJF260tCl8vsGDraMaa0Q99tA3sdH1fIDCefhnE+en
	yw3XBWBUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liudF-00HU41-NH; Tue, 18 May 2021 07:59:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liucq-00HTy5-SG
 for linux-amlogic@desiato.infradead.org; Tue, 18 May 2021 07:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mHKyhnmvKk11GFq9mc3k0CCB5T2Yy23YqL5vTU1rIHM=; b=lEYab3eCY1Pf87n8ZNiFrmLGkB
 FCeMR85yFGeNlFPeQDvxiOvvTwkhPpdymeCfjfyHxbIM7zI6q4S4O2hMGhj295VbgIcVbk//K9lBb
 tYIORoxuJJZvY0dFBXtKKGO+d2Qp5wLfy66kS1JllyDIIy3hJjbn3oceekojkbTPksoLNs9x1TnJ+
 swxClpTGKWd32pCnu+tWL8JkTbE+l8c00K3kgmAX4NG4/erfLec4TpDRVcPfGw0SYTXJZAM4kmIxd
 WqH43LzbbBpftXXfFiNYIrIm7jkZkG2Ywkb/BVEP7HhRFN2Mgq2FIIPqRxinjXro3wfE+Vcggh4GS
 ndUfm45A==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liuco-00ERF2-7t
 for linux-amlogic@lists.infradead.org; Tue, 18 May 2021 07:58:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so1094813wmc.0
 for <linux-amlogic@lists.infradead.org>; Tue, 18 May 2021 00:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mHKyhnmvKk11GFq9mc3k0CCB5T2Yy23YqL5vTU1rIHM=;
 b=TLzVMRaU60Ry1jl2TTo02UAb+xMSS4f1u7+jzg+ygsfwvJE5Bh/NW1LW0cTasWyxOb
 3XhMx0Cr3ufsX9oWrbxxqzE/UzMpnlExQuMvv+nFH91wqpXYwLRmsxos3omvkWO4ekEL
 TnxH3FwZOYqQkEboz/d2UU6zCT7aSRIFotUlfI1R3jum6CgTh9TPUXqqntnA4PYyVPYQ
 6XofKqconWPPcPgyX/jomdi0ES/9rJbLgfsij9uj3qRSOGhsjfWM51r975BGdgAGylTJ
 Sa9gxjFLMKdLV3ctIERAQ+ekJHaPW7hCS0Q1bfbGA7N+zdmllqXjfPBQ09QPWzDzduJ5
 eFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHKyhnmvKk11GFq9mc3k0CCB5T2Yy23YqL5vTU1rIHM=;
 b=oGKYnsVNcqauC2bffcwK6BJagBtBSD76jeV4Yrt1hV2y6FXQ9P/DY48pATsreMvRFY
 3NfCMq6YnarMpQSLH6hr3lep3PIOZsuI1bdpE48mCmWwVzj0y96KHpPL8eZB+p28LQAV
 VFrj0zH6G8ZH4XXzT2Evg8+43LPmq1tDMZydmfIX8CJ6adI8fmMhQXDNRbUexG6ClblN
 f+kV40JeQsAQlriRlciKgJCJnMoIXr2i50vrPNwoupW8JvoQo/u/idlrX0Kana3VCG6a
 zwA5xuSbNsgbljyt4whzYTy+/ZISaXxrn6WxJu9gxh/UFOlopl/JhDp2uUENFK/z+6GA
 hvQg==
X-Gm-Message-State: AOAM533VKMiGO9bASvMfdNxEB2lVNnpPVonbRD9ViBMsscezNA8IYD3+
 l4fjR4MnwMAHFb5yXD/1biUp0Q==
X-Google-Smtp-Source: ABdhPJxvxIvNsm1JFAqKsBRZuZmJ3qDWkvq6GK0i82QVya6OwYocA4vbi1aiTE7jdaPnG0jVMyxHRg==
X-Received: by 2002:a05:600c:4ec9:: with SMTP id
 g9mr3821136wmq.173.1621324724424; 
 Tue, 18 May 2021 00:58:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:842:2d82:a1ae:1a91])
 by smtp.gmail.com with ESMTPSA id
 v16sm735448wml.6.2021.05.18.00.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:58:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/3] tty: serial: meson: retrieve port FIFO size from DT
Date: Tue, 18 May 2021 09:58:32 +0200
Message-Id: <20210518075833.3736038-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518075833.3736038-1-narmstrong@baylibre.com>
References: <20210518075833.3736038-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_005846_289576_51AB8555 
X-CRM114-Status: GOOD (  14.42  )
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
index 529cd0289056..10bb29202e43 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -715,6 +715,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 {
 	struct resource *res_mem, *res_irq;
 	struct uart_port *port;
+	u32 fifosize = 64; /* Default is 64, 128 for EE UART_0 */
 	int ret = 0;
 	int id = -1;
 
@@ -741,6 +742,8 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (!res_irq)
 		return -ENODEV;
 
+	of_property_read_u32(pdev->dev.of_node, "fifo-size", &fifosize);
+
 	if (meson_ports[pdev->id]) {
 		dev_err(&pdev->dev, "port %d already allocated\n", pdev->id);
 		return -EBUSY;
@@ -770,7 +773,7 @@ static int meson_uart_probe(struct platform_device *pdev)
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
