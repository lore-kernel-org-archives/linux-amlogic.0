Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B001C54EBD
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqUuJqVC8eW+u6t/HiHTYujK24HE85ADVLC59/Xvf7E=; b=fgvqQQQUuivz0Y
	RE1vKH3sqI3OXme8lyeZhJsSdo6fW36PusQE0GNKsE8b3ryaut9VMMCtJqpc1wV0N451H+5228CNh
	QLkDyXrFL6CvrRh4/n6tXlp/RpeS6Rr+teyDef2KRvHe3L3wyKDd0xY97NYuI4llMJ/yREjRW6ZAE
	rwfAFxlXIy5G6XS1p6SszXucYkwra1Gqj6jageNvbjQgybEmhtMyNwJmi5zHZZWJ0e7Qnhb0ODngJ
	nDnxEBRX8pWIT1Kc4ji2PtcKEyY23te2QkrTP5OGZjrnaOmqmFEWplXq4g8LJLvW877Wk/IzyNSXw
	4KapfTKasKRfEqAJ5Ocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErz9-001UQK-1a; Mon, 09 Jan 2023 13:14:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEryY-001U9d-35
	for linux-amlogic@bombadil.infradead.org; Mon, 09 Jan 2023 13:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eHeD4/5Q26ruqFmP/If/k2xNMCXAhjZeCMYfTgUbKRU=; b=aefMcy7+PZRvhcj2Kt56bDP0ag
	M5EXH3zAK0CQwEc6P3HzN7pCqcTiOqk+eNn2edwUTpujNNH3S/BZodtQ2Nv2vVusTcp1qO4aTIjbC
	p/4yPWe+SlJeuaXYqydTIaf+rP+VQOxU2BDj5T4zJJ8oMSNLVQPVodqP5rczQdqTeEwMeOypEmVLA
	YySvDYRZTKZkie4t8WkIs1tBqurDaSf4hBnXvZwTl5wGLwT6EzKnzV0YWu42qs8cUhocK4oESmtyC
	ThrOeQbsHeQ9Hf2VNsc7Au4wod4ozfMotvC5ap6ftK/mxr1TwrXxyH8/YlRyRP4f3GiOhRZzTqu++
	lETZYB3A==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEreg-002jE1-2B
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Jan 2023 12:53:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id ay40so6190471wmb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jan 2023 04:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHeD4/5Q26ruqFmP/If/k2xNMCXAhjZeCMYfTgUbKRU=;
        b=ST+d6exv+eSO89qaxYEHQlIUZjwGyGwBJ4xr+vru1zfL5TKvPyAhqO8Pkx0pwPrsz+
         jgw4926gADuQo43X4dvIXEFVEX+2jkFCW71Ibl6xlz8rEKH4KDOuwPJavaTNh6Xc5P0A
         AjwReWC2HFTNu9qYXgDmUygMPt7ZAvBkFipkWakWAcAxMsf5vwA9wpujm+DSd3CLhQ62
         Fm9K10aodqGSrxbo5Zu0m7mpFDY6eTc0BH5igwv8WsKfuWKKBwQ+/tSlmb8JcRvYv2nf
         gApIKGwFDwKoKVFmWMoGxExR8BxoEEnI+UkTInipxpBoGPl/IFugqltGY0B5Ddf6azXK
         M/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHeD4/5Q26ruqFmP/If/k2xNMCXAhjZeCMYfTgUbKRU=;
        b=MzV0/O7M9Ofhv1RePViEdgdSIQMtinjcj19EYuP3bxEHUsAJBf/j0vZuvH+JMQe4C+
         k4eaeEdChAIiQ7GkGg9mE5CRokITNn2uw7mTR+EGKi4s2V3P4aK6Pwns3ZOzwWkQEXMR
         hOaYPG0369UHRxBGyS7fNea3EcLGDnjsyMynyidIVwjD6OPdfok9onWm7b+9tyfyrkOt
         9mEUCxFLmE75yCtsHsOWfsDWqZsfN6l3qDiH7unEXYekZlDh4dDbTiPEEmDFLZYZeH0u
         myxsKLVXEdTEA81veE8uNXuDZT1QUFqRzOja/V4CvcksNSeemViSdFWPNSwkYK7SWsbL
         sDiw==
X-Gm-Message-State: AFqh2kqyuVKffwH451kU7OYGiFvQxmPs/oyrSXwsU5Q7WEecJWrnku2P
	Fe339BXAASCaewdekfs1xwIHkA==
X-Google-Smtp-Source: AMrXdXsaurQF4EtQDAHouXVvSJBqCu54hP/k4K5wC/jqtSrGfESg6vwwkM/iQm8oVMP1uuBrED7e8A==
X-Received: by 2002:a05:600c:3d05:b0:3d3:5c21:dd94 with SMTP id bh5-20020a05600c3d0500b003d35c21dd94mr48020557wmb.9.1673268820053;
        Mon, 09 Jan 2023 04:53:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12805667wmj.14.2023.01.09.04.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:53:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 13:53:30 +0100
Subject: [PATCH v2 06/11] dt-bindings: power: amlogic,meson-gx-pwrc: mark
 bindings as deprecated
MIME-Version: 1.0
Message-Id:  <20221117-b4-amlogic-bindings-convert-v2-6-36ad050bb625@linaro.org>
References:  <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
In-Reply-To:  <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_125335_037675_3B27CBCC 
X-CRM114-Status: GOOD (  12.32  )
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

The amlogic,meson-gx-pwrc-vpu compatible isn't used anymore since [1]
was merged in v5.8-rc1 and amlogic,meson-g12a-pwrc-vpu either since [2]
was merged in v5.3-rc1.

[1] commit 5273d6cacc06 ("arm64: dts: meson-gx: Switch to the meson-ee-pwrc bindings")
[2] commit f4f1c8d9ace7 ("arm64: dts: meson-g12: add Everything-Else power domain controller")

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt b/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
index 99b5b10cda31..ba5865ae6bfe 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
@@ -1,5 +1,5 @@
-Amlogic Meson Power Controller
-==============================
+Amlogic Meson Power Controller (deprecated)
+===========================================
 
 The Amlogic Meson SoCs embeds an internal Power domain controller.
 

-- 
2.34.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
