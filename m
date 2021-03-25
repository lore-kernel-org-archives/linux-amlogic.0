Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2905DC433C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:24:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF26961A16
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF26961A16
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e0ne5IvZZ4kUL111y2LUeAlFH3ggiiNySBEu3wOHjHg=; b=bA/BqOwyKCZLjslxLMvCxNxIh6
	AUJ+8VilE9q8IfxwJX8q7+H6hV1t+rUfwypGUKjujaRwS5LsoouZR0XelG2xQKv62CqYjbT/F03iV
	gItfYGk0WBzaXWNat6Yj4wneWpty8CxLWYjVR+GyfQchuJtuy8S2Kbb2t21fJxE+oxaryuGT/EGBW
	La9HU/4eNl2fZL4IoGpO6jZFmW5mxGh4K9IBiJWEw+IViiwJ6LnoJ3Ydfeo3/St2wN1xtyHSUuKHv
	aR2btoOS0CpiocxRaMxrGNcq/71yuM+iKG3W8kECrCYrsgh4eHUn4Ih/VcNeAwZDS0ddK4hb3snl/
	PY9K9yeQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPRqt-001iZd-SM; Thu, 25 Mar 2021 15:24:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPRqO-001iRj-JB
 for linux-amlogic@lists.infradead.org; Thu, 25 Mar 2021 15:24:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 a132-20020a1c668a0000b029010f141fe7c2so3352919wmc.0
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Mar 2021 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vjIiCTomysNBHigYUO2F29y2fu9n4K1mpORfU6aQthU=;
 b=rehPFnP/AkKl027/tuMZ0dZjy9QnfxgtQtJSVXmCLlNHgBtiKGpuIydvjUqstxJ+f1
 bpbA1vG8+/viUmDHV3RKst1+0+mDVIe/4jSWY4U4MYrK2Rfh5KO1q7ganxzw9cwv3KGz
 /jEFmNs3PQ5tZnWZ4TwCAH6pjdYFfuFwzaOoMZ2g9A81gu5i+OxYNjp5K/830ylhR7dj
 F+eGVi3tQ8yTCn1n4pSwJUb4j8lZz0KLWQWim6IEAi8g/gQe4oyA5OHVPOjQCV+vPZDL
 oFn260UmkLUx1YNj8VIagF9/JVKRYW3a7wzL9tnWV5DwSBuMLdAomP9REXKschZg3V3L
 nFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vjIiCTomysNBHigYUO2F29y2fu9n4K1mpORfU6aQthU=;
 b=fhdBgnMA37wOXWLug3GcRD23ztZDu7dae4rFa8N73xmw+ldkRIxxTLyCtAuoGHIuBf
 Sy6F9VwIToXrN7weEX+BkCwYn5cNk9u94V5MGIc7ajqBJFhCaW7IyvyWvGgvH1hiAd9o
 Rplz7r2NNemgrxHJ88yhzNI9njKxE1d3+Fliw06Bx2QZH6hyKTMW76e7ewsAjqLZp5ws
 Aq1O0yIRlPaUH6yY7OgMBQ1p3IvnEHC65qwXgDU/FmQDyaHiLuVA4dQDVEFpj8hRy3GN
 prTUy7wRH2r7DnTw8ByUAd32jBSNWhkmIBHi2Db9lLFidf7f8EowOunqcMA9HRQwxKIn
 yTFw==
X-Gm-Message-State: AOAM533KWPp1bAe8UyN2Glb34lSIRCFC6YIqUXcQdZLwfSgASFhufAgA
 jWeX36ukzdMr1Gn6vYKbT5LnrA==
X-Google-Smtp-Source: ABdhPJx+pqAdNhSx9GFKMbPAXZItlskPfQ2YKeW1riDj8QxU69vfbwXWlnBOaVLScMfrAyLE694NVQ==
X-Received: by 2002:a7b:c92d:: with SMTP id h13mr8624075wml.147.1616685857177; 
 Thu, 25 Mar 2021 08:24:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:b105:9672:b0a:5820])
 by smtp.gmail.com with ESMTPSA id
 p18sm7395260wrs.68.2021.03.25.08.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:24:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/3] tty: serial: meson: add amlogic, uart-fifosize property
Date: Thu, 25 Mar 2021 16:24:07 +0100
Message-Id: <20210325152410.1795557-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_152420_910213_2FD21FBC 
X-CRM114-Status: GOOD (  10.27  )
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

This adds a property in the bindings, reads the property from the driver and updates
the DT with the new property.

Changes since v1:
- switched to a more generic "fifo-size"

Neil Armstrong (3):
  dt-bindings: serial: amlogic,meson-uart: add fifo-size property
  tty: serial: meson: retrieve port FIFO size from DT
  arm64: dts: meson: set 128bytes FIFO size on uart A

 .../devicetree/bindings/serial/amlogic,meson-uart.yaml      | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                  | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi           | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                   | 1 +
 drivers/tty/serial/meson_uart.c                             | 5 ++++-
 5 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
