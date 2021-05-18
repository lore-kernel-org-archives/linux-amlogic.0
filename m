Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B4CC433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:59:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69F3861261
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69F3861261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IysJ4T+uexngAMxVR1Ud46KqvhXp/KN0RjYkHyeytGY=; b=U8XN+U+GRjynq0X7OxB4Rw4Gi
	b5yu2RlCJVG9XZ/ZvuG2DBBVUUYUIkkRaJkiz1Emj4VmI6dYOyA6Au2COdQ44D6dcaTl9gvQjVU8t
	ylBqxyWb4uxhw1d9VAZuIb4na1iIsVfO/pUJX9QQf63Hq61rLjrd8coAaM+ToS0yE6G0nmsnkujJE
	ezCaQLkZpZaiG7fv6JikuSlkcTDbwIy3Q0d6zYVmEFJnVFrBcQXnpsqn/zQZRd3/GZeWN0oShXyF1
	wdheIMcUjwLMGT0O3ecCjFktujXw8zdwWIdebWyw0z4S7eoh5Zhoj0gCgAcUlRTTHRVWKPVw4SWO0
	vPbvGCJAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liud6-00HU1w-Gi; Tue, 18 May 2021 07:59:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liucp-00HTxe-Qs
 for linux-amlogic@desiato.infradead.org; Tue, 18 May 2021 07:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=5P13XdRJ5R/5Y8xqS3/eplu5G6R3raia4VI6wdvH9Ik=; b=WVlZ/kwP1FfHDPYKomLsvzLdKD
 /cCMR3Qq3HbVBP7aEoN8XusMwMS3+MW8qX4RgL2NtyL3jA0SUB809f57XulcH1rSwrR4LcRdCEuOb
 qH2T60ff0x0ZnplLkkOWzZ63gwF/uQh+swvi55o00tisRcifXeslqQs+doqkDJSqDemmtpx0nczWO
 21e/lDuUzawn6aRHtkCuquj99qBw3LFh4hhmhAIrMyKwbrpBKe1qp6CtnIw4J5DNP0jnE7mwKMhHZ
 227rYlxCQeH7GxPTTFm6xv1snGQlqz3TsjTH+lq3jouXTkOvet7vST7buBVC/Ob0LILJ3WqIr3xIB
 SjlsCQFw==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liucm-00ERDk-6x
 for linux-amlogic@lists.infradead.org; Tue, 18 May 2021 07:58:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id c14so7291032wrx.3
 for <linux-amlogic@lists.infradead.org>; Tue, 18 May 2021 00:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5P13XdRJ5R/5Y8xqS3/eplu5G6R3raia4VI6wdvH9Ik=;
 b=nAIosDiI0M9zpMXy6SmYuUyikkN2Y5kzizB4+p6bL4/wXwW5XJNJDGPWDpFnp7wlLk
 JzsGYf5zr/W/7m17ExyVWK98IK9y/BbfFTN6yzvmFJyhlzvyUunbbHgTSAbs35DCFatV
 qn3Rw+ngZJJhZYN60GnE2L9Vfy9hAkKii/YFy1sXXtjB0aKaK7CMdBdLu8lVbuuzAh2z
 Z4MLKQrjbyYAP8eZzIXywV52v6jFL9EoWVNDNH+VL3Z8K/DEQwJ0FdckuCeTfhF+jYwU
 q7vnCZkpPeNAm/3LciIj/uce9L3JiNl28LwOAyD7tBOYVkjyvZJlk2SOOJpJx2pOrFeS
 cjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5P13XdRJ5R/5Y8xqS3/eplu5G6R3raia4VI6wdvH9Ik=;
 b=kTHtJiUpySuKAC2RJohzOpujId+d8y0ePfInyvbT8Rv9AytttQv0kij4y7zqP/zzrP
 lX/S43AKCRmCXj1cZth5tdohOk5SrGb80IyTiq5kZiE5PrUAStvMvoUEVGh8fu9e0NOy
 WxZUahI6TxIBuKCiAjjw5sOV22/dK7ZNya+V81aoY5yA3jX5u7EMe8fYc57AbuEgG3lR
 LLht4Klnl8/AEvI6qH74DpFaaE4vKO39GzNXZyCp5TtSN5a0WyZxZf4dz4ObDXnChhmo
 eYX2jiXgkOUgYcxJ5+8WsFHDRtHWXRieKrYpY+xANaZYxj7ydubwReB14U9LconGjwBm
 3MGQ==
X-Gm-Message-State: AOAM533LtvoqqERLBoqSq6pcM8Gu14/u1Tw1+FXroRrStGQd/Lzq9H8r
 LilM7imPUQ6CKm/Psr0D3zfsIw==
X-Google-Smtp-Source: ABdhPJyRndly5u8TalfalAaQOTRDWC6iTH+suIZiJ9ud2vBJ0tW6ZTaoSfgolwkhjrOWeedIvdsnJA==
X-Received: by 2002:a5d:53c4:: with SMTP id a4mr5156417wrw.195.1621324722285; 
 Tue, 18 May 2021 00:58:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:842:2d82:a1ae:1a91])
 by smtp.gmail.com with ESMTPSA id
 v16sm735448wml.6.2021.05.18.00.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:58:41 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 devicetree@vger.kernel.org
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/3] dt-bindings: serial: amlogic,
 meson-uart: add fifo-size property
Date: Tue, 18 May 2021 09:58:31 +0200
Message-Id: <20210518075833.3736038-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518075833.3736038-1-narmstrong@baylibre.com>
References: <20210518075833.3736038-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_005844_270682_84290E2F 
X-CRM114-Status: GOOD (  10.33  )
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

On most of the Amlogic SoCs, the first UART controller in the "Everything-Else"
power domain has 128bytes of RX & TX FIFO, so add an optional property to describe
a different FIFO size from the other ports (64bytes).

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 75ebc9952a99..7487aa6ef849 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -55,6 +55,11 @@ properties:
       - const: pclk
       - const: baud
 
+  fifo-size:
+    description: The fifo size supported by the UART channel.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [64, 128]
+
 required:
   - compatible
   - reg
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
