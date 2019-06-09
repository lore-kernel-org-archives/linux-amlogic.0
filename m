Return-Path: <SRS0=Y0fp=UI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A105C2BCA1
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 18:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37B2D20833
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 18:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="exgI3Kfb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rIPNPBN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37B2D20833
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gLPdJerDloMbviS1F032AeHgnEIZb2iqUGzB8yPiYg=; b=exgI3KfbxLQFmj
	qokfE1GKfc307u+KGmF5NmRJK1CM6pY3cyeLfxKB2U+inFpXPg1kCavyzX1RL33K8dAyN9/Yy+j/4
	gZ8HzX/WNPvvg2zWdnDCK0/kVx/iFcP6CopCLEVqXEcrJ6Eei9k/d97eXyBwFCCSgdLpWQatZi+sk
	Fd0SAorBkQ4kHcLZ4Cnqk1BPMGvwEueiHn19tmTWz7qhMPB5A6ZL8s3fOVyt6El92ogo6llhAIaMg
	5r+fxP/gDptHQB08qcHkgnA0bz2IaiBezjEWJk5KCNsv6Uzdu6ANd04+ttHnvSzfqgs8JysZAbCAZ
	clqFpxSPJMHfhUESMGwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ha2DM-0003eQ-JC; Sun, 09 Jun 2019 18:06:44 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ha2DJ-0003ct-1v; Sun, 09 Jun 2019 18:06:42 +0000
Received: by mail-wr1-x441.google.com with SMTP id r18so6873146wrm.10;
 Sun, 09 Jun 2019 11:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L+JDC+lw/WChmI4eIlkxJqi4XA35RjFjMXnl1SFE8Zw=;
 b=rIPNPBN3FxtgYpi973wdZA5hbzAbfgGEA1sFuHADXWrscohB30pZOv4p05jtvcQhLB
 H5/1lXIiZFfOcpSXtLheGEyypOY4cDSZtvYrpdmBHCTKks5okNEG/VrzsusLIvbaSqGa
 HKyQpwz/kES5l+WcpB/zj+6/gJRhqYrCB0D0CZbSNC/1NVKM7i73s++/uHpE4kUNW0TG
 OQkam1yor45+bRDZd+mxuNN5ZYIKCN/EAapXGEDiY0gZbGNDeLYGuRA7n/aPZH2A6Vo7
 1Sv2IgXVy9g8XIByrnLu+aoHeFuRwTAXjpqo+QlSXpC/00KmGfPqodT37rKahdX09div
 tmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L+JDC+lw/WChmI4eIlkxJqi4XA35RjFjMXnl1SFE8Zw=;
 b=c6KsVzZ7tLFig5LxSDGEmQrDnbKWbWZW4AQL6i3R6fqAocHMTRnUwWBqYBcQw5QilX
 L6A2AmkTyxmaD/YaElfmxw/qzVJOWLGGRdRo1Xq7gtTIrDzTp6o6gakPoomne0xsawaw
 wwr0uPZtzlb4HOKLpS3FJC4UfRrUQ4y7Xol1obggm/DaUwfj4flMoLrNjeBT4fcRSrk0
 lyGzpQ/JWz6pd4lIc0v2U7TSE+8wU3OIOl8qlAOAks536W3Nglxtk0KRdEmXX7EBBCG4
 mjv6+iUYJKlVhK3qw7NtelWTc1LoVNSTLF437H5KGqv9k9o8oD47IqZuoz4txSi2txUk
 eH9g==
X-Gm-Message-State: APjAAAXZ3Wt+X/lP7qj7euBUxqvKD+Wu9ndfx21KA6GDXlHdO1DWzy9D
 HWR8KGQ1dcqPVTOj71F4ZTs=
X-Google-Smtp-Source: APXvYqxL3wLbt7xnWlgNfBsQLu1vOJsDLKzJ5xLFdJ94Txj4JCWTdM3Pa3jsExSk+j1V9ZUl26XLIw==
X-Received: by 2002:a5d:5007:: with SMTP id e7mr14502557wrt.231.1560103598868; 
 Sun, 09 Jun 2019 11:06:38 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400B42D8EB9D711C35E.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:b42d:8eb9:d711:c35e])
 by smtp.googlemail.com with ESMTPSA id h14sm2007731wrs.66.2019.06.09.11.06.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 11:06:38 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com
Subject: [RFC next v1 2/5] gpio: of: parse stmmac PHY reset line specific
 active-low property
Date: Sun,  9 Jun 2019 20:06:18 +0200
Message-Id: <20190609180621.7607-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_110641_106050_CF185186 
X-CRM114-Status: GOOD (  11.83  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The stmmac driver currently ignores the GPIO flags which are passed via
devicetree because it operates with legacy GPIO numbers instead of GPIO
descriptors. stmmac assumes that the GPIO is "active HIGH" by default.
This can be overwritten by setting "snps,reset-active-low" to make the
reset line "active LOW".

Recent Amlogic SoCs (G12A which includes S905X2 and S905D2 as well as
G12B which includes S922X) use GPIOZ_14 or GPIOZ_15 for the PHY reset
line. These GPIOs are special because they are marked as "3.3V input
tolerant open drain" pins which means they can only drive the pin output
LOW (to reset the PHY) or to switch to input mode (to take the PHY out
of reset).
The GPIO subsystem already supports this with the GPIO_OPEN_DRAIN and
GPIO_OPEN_SOURCE flags in the devicetree bindings.

Add the stmmac PHY reset line specific active low parsing to gpiolib-of
so stmmac can be ported to GPIO descriptors while being backwards
compatible with device trees which use the "old" way of specifying the
polarity.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpio/gpiolib-of.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index aec7bd86ae7e..2533f2471821 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -158,6 +158,12 @@ static void of_gpio_flags_quirks(struct device_node *np,
 			}
 		}
 	}
+
+	/* Legacy handling of stmmac's active-low PHY reset line */
+	if (IS_ENABLED(CONFIG_STMMAC_ETH) &&
+	    !strcmp(propname, "snps,reset-gpio") &&
+	    of_property_read_bool(np, "snps,reset-active-low"))
+		*flags |= OF_GPIO_ACTIVE_LOW;
 }
 
 /**
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
