Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1280C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:24:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A3F661A1A
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A3F661A1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H/fk1RXf8sHh2Bd2+FkesA6YvA0rxFUvJhN2KuBXfUc=; b=Hsz+lhBEkhNu2cYW2zcdCw0he
	iFliAazUujWpoqvAjTcHQpJHDrLET49DauzcYD7hSpePJYf+Ez2FK9MzYuC/IWL4HGHhytlowMWFc
	fusNufckhBEOfL75dQVf6SU2onZlfuj7ADBmjfVoSmXJGT2syGmDn0/sGCTyyIiVdXGOdv6HinxKj
	IBtnvY5m1ktEjMlFeuWpw1TTl9lc6/jRJX/YE66rT+GN820gzoT1JBocmkkJj7ep1XK2/6YUmWXIw
	gQzd5DtxnYd67QtkPoEeM1wHZwMmimjbrwHgnW3hrS7Hu0qfQT5P8La/ScsBD0LI101LQljUtnUys
	Ou6CFailg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPRqX-001iVJ-5J; Thu, 25 Mar 2021 15:24:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPRqO-001iS8-Sc
 for linux-amlogic@lists.infradead.org; Thu, 25 Mar 2021 15:24:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id k8so2706570wrc.3
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Mar 2021 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1E9sF10HVEC86a98PFuWKJ9Mp74ZD46Q6KDRkjpEZM4=;
 b=aEGht26bWiYnI/bWudlTQ+gOMbnqlc8w4EQYhzEYVrx5udt6E6ps2sXMD48X2qbsuN
 y92CKzFQ9Lfb8SpbMUm3rcp2ThcEH0FaGHeaxY3COdRc4qxVYh2Bm3XOPeNiqikr5qkc
 uEgrrkIW+YBt/eVRSDBIg3Y/89i1G3WhHly8noKVLeJlcIdUBJ8GVIOE554/CSvgCgLp
 Wo+iyNx8hQ/b3ZRUsfpWOvuxp4K49Cw/wYZdUP1KbYDm7dWS6ArLmmlvY72HE0kXdMOG
 xKFKIuv4I1jXPPoNKtLE+0EmWepzGjCa/YkCJ3QCbDNX1Jpp5u1avM3aFMiR9PYO6yO3
 gdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1E9sF10HVEC86a98PFuWKJ9Mp74ZD46Q6KDRkjpEZM4=;
 b=KOYIgR2vyYuiE4eIQk/4gJVcHb8VJi9wdXkFj5GFmRasvVz8dFJiuADgTnXHBxshqO
 0vHr+ygJEcuFiYrbXNvXCydQTdxeUrPV7jhXPlPZbiGaIS3gXgplNX6utz1oB45I+2m9
 rbwXuBpolkUFZLzOhq8rYrQBRrApgSHM1JKRco3BVYv0Z94VvJYfYYlyS3uRmrUleICs
 Lk28Os2MXgt+/qwOLPJhgRnsbPHBnaKUmUfERgRmie4+JW0sisE9zgMP4NlqpXWGk66N
 43KHmfwgWtJy7vElWU4IDdV3KnjBu3zjHJOf9ggSojYRGZnAsjhXVnJLgrtIhurTzcui
 jHBg==
X-Gm-Message-State: AOAM531P01HeWQPuvgsWsYZN28wjtNXESol10IOGfVMdH1rRiciZF8Rk
 iVijyv1uVQfYy0ieuA/CU6yJhA==
X-Google-Smtp-Source: ABdhPJzqTDL4lVT0INpPHTS+dzfkxTVO9rRKAg7IxpMLVWIsTbtXmKcT+OazzGEAYTUZL1Wj1b51hA==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr9433139wru.259.1616685858371; 
 Thu, 25 Mar 2021 08:24:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:b105:9672:b0a:5820])
 by smtp.gmail.com with ESMTPSA id
 p18sm7395260wrs.68.2021.03.25.08.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:24:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/3] dt-bindings: serial: amlogic,
 meson-uart: add fifo-size property
Date: Thu, 25 Mar 2021 16:24:08 +0100
Message-Id: <20210325152410.1795557-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325152410.1795557-1-narmstrong@baylibre.com>
References: <20210325152410.1795557-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_152421_154416_7E2ABCE0 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 75ebc9952a99..8ece7f420c19 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -55,6 +55,12 @@ properties:
       - const: pclk
       - const: baud
 
+
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
