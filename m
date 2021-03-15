Return-Path: <SRS0=3MJg=IN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A0DC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Mar 2021 08:36:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB0764E89
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Mar 2021 08:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB0764E89
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PPoZmcM9yuuKK2ZeQrz0JdoL/49ZCjFnO3cSzDUQiKc=; b=DFkmJcXUSPw18/+BXit8MUGgI
	rFIg7XBUwnJIHMPt0i1FEss81nFCm48g9t8lmA+fd9LpMzj+BMOPbUmCrBoPlunZXxLXxdF7p7vHb
	SiI46vkpKz7CanylHgj7snbg8Prd8KubsfczKtn8kyebhuSkEIrieMKGQ5yvQ2JiZIwd1SFG9J44v
	32XZUdws9oTp/k7460ie7OsGgzIWFXRBhlrzFEVmDPLu9Epb0Zne16f0ttTRdXQzKOFXwp2tGasnB
	MebkxgPwNc1bmsfwHUZiRdaZp2OZ4XkVTN+APhdrptstJ4TXd5DxzxOIIq2bgf51WohOuXqAxbFlj
	s5nB8jxEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLii9-00FFBl-EK; Mon, 15 Mar 2021 08:36:25 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLigr-00FEsU-EV
 for linux-amlogic@lists.infradead.org; Mon, 15 Mar 2021 08:35:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id g8so7584782wmd.4
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Mar 2021 01:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h/Gkz5RJgx9sQ9b5NmpdOjRc9DJkyI918kN+6MDqa88=;
 b=pjzaBNJa/Cp5phiQwo5PRMNYoWo6/wuEFJl1pKg6/K5/G0qyxPc1TflAYa2B4876Aa
 9W6uiziwIiAXf6WueesYR99qLSwPGeXltfm5YPSNtVQj+mTrFUfRWuJWF6Fsfwo0HeaZ
 ZjStNW543/Qg6svtOW8WV/o8CiHpsZp3lh/jAdmUJ2+98KDNiSfmWT0gVlqzbF5gxWE3
 OC/n0slCAHgSC4T8SWBNcDHavvcoDLgH0RRx1+QaknM8ApANZw5SM0b5DOHMkXe1yGQD
 0zCWQNarmtMLf+yfToY8IYbF84u13FaE+vKOVpJAJNHUeImSNoSmBr9GB48qzqDG/7M0
 8R7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h/Gkz5RJgx9sQ9b5NmpdOjRc9DJkyI918kN+6MDqa88=;
 b=Izl1BnO7f+c3dOH/dxC//ERAEJ86g8XLzXznONmGXuxXY+E6nHQDsLNCWpJsJXCah8
 rAcoED1D1Kf8rjQgBsECOy6i+tWzOi9LV8Qvb5M0pgCf7zG3/Ssx6ryNCHRBzqH5kb2s
 SbLQCSHYY4KybFmvLvN+yknIzSSPx9lRYIQ7ZdABeB4oCWO3HaStX3bukzTr/TIbXl8R
 jAZuhZc84UbHLAsl0kci3ZMcV9QylUgN7VgXMizrK58BGYcxpxMZR0qG4KXdIcSsnsW9
 w0vQ+ZExVZPXVtZnJdOzcBt7FZpZKjxp81EGHf+OuIRD95LBOk2JLaYsa4l+Y0xO4trU
 K2Cg==
X-Gm-Message-State: AOAM532cZiQasIgSwavTeoxSyMLGZyGnGOIw2qVHgxPbInyutdRoD2Dc
 VR/EYwBvNLzu3TkFKwMSyrZkXg==
X-Google-Smtp-Source: ABdhPJxkvfTQ4A0oqVxQTXvK6iCVYYqj/CHlIUOzPNQx4tTvdjm1Iu18EVe2v3EEEUNlrUPdl0x/hA==
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr25061709wmj.26.1615797301209; 
 Mon, 15 Mar 2021 01:35:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:708f:15aa:638c:22b7])
 by smtp.gmail.com with ESMTPSA id
 o2sm8372028wmc.23.2021.03.15.01.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 01:35:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/3] dt-bindings: serial: amlogic, meson-uart: add amlogic,
 uart-fifosize property
Date: Mon, 15 Mar 2021 09:34:57 +0100
Message-Id: <20210315083459.359773-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315083459.359773-1-narmstrong@baylibre.com>
References: <20210315083459.359773-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_083507_893752_DA31E139 
X-CRM114-Status: UNSURE (   9.88  )
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
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 75ebc9952a99..e0a742112783 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -55,6 +55,12 @@ properties:
       - const: pclk
       - const: baud
 
+
+  amlogic,uart-fifosize:
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
