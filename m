Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E864C4741F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5321421D7F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lykgbsj4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YosSqy7c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5321421D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y7Axkc9vHPH8uo9Yk4dYPr4a1Ref4zkwyFJkhALgf5I=; b=lykgbsj4sAzMfyX6YL9iWByZE
	TWp/cTIPSFvyYANyQJQhMy/xaSRzXS4QoMmWM2235R6gdYQQEcFZRNMc6tiu4mc9IW+1il9CSCVTR
	EhRAQhA/lG3EidQW2qpFYe8Gd4+rbaWEE1jUFSitZjmXGslq43+m9bS2/BTcOABLu3NRS0RWh8xrc
	Of0Hkm1VZ0ODaoupU5+ZUgkV/K/GZ2ebGpsmP6CsHLS3atWpcf/9WWDrJ6w8ZQRw+nD4zRhhT3Lrc
	eUYwWCC4W3Xv57XecFGbVQ8Szws885qmHWyJk5TBV3Z4TXXTLhNHxPB9OkFOY9mZEG9zrd1HK2N4K
	D6ij+QbIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLeRu-0000JP-KL; Fri, 25 Sep 2020 03:31:06 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLeRm-0000Gg-Bk; Fri, 25 Sep 2020 03:30:59 +0000
Received: by mail-pf1-x442.google.com with SMTP id d9so1855119pfd.3;
 Thu, 24 Sep 2020 20:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9KQTxZf0bfhyGYMi8KtzFD8YblRkrVomATGLrXDwnog=;
 b=YosSqy7cobotutcKgn4G0gQvn+0v2bwFE+G/DDsJi5aI883FCbg6wvlf1fguBzxGOZ
 cTmgwZoMMoT/Pk2Fx/HPlrT9Vo1P6zeJ2UcO/cQRiI5iWH1R2eacb2Ry8cUxVwO5dniL
 O7DAoEsOBGxQTJKNg6Kq6s9Y16A1xsTh1shQdZ8pJ0MZ3fcN06/N0qm1Wy+FFyvRY+z1
 TvsJcWxaE0G6GiyRygJ3+K4TETxJo9gr8KyM4xjAFUmkplOFI13WpeQXOj3pzkCclMZQ
 bLvhBVsOROeOuZokwHaRlSFwHNXaDVvQLOfIqJO4yCoAFj7N2tmEkt2LJrr3Iozc62tO
 WE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9KQTxZf0bfhyGYMi8KtzFD8YblRkrVomATGLrXDwnog=;
 b=YxkprUM5iWOiV3nj+umi2JGRdaNcDMFFml5YZ8V8oWIIFoS/DPYnGuZ6YPhO1WPezU
 cWSjvhF1i+3cKJNwJEHP9hs3hxuWzA9Vn4UYa5ExKhAfeLHJI9M8pXJGsGu6UcE2mZFZ
 KyK9oI0ZtBwodYw73hVLzLwZOSbSaU0h2wowo/Rnxk5VtRMLi112pnW6SGvAYmd28DgL
 w0Gm1tXEvC/dy8akjEuG1kQn+IJ6rEv/n3crQZrEED4MjbW1W94nvAvggAPDQOnPtdaS
 QN466Wmu5IW5wf24mREMQDxjJJvx+doUPj8ARfNEMCxwkUffXhJsaskbyW9N+INrFf3q
 aSFg==
X-Gm-Message-State: AOAM531VKIQBMuvXAdVVldcfGeE1XGWQhXngvzK7iKftgNG4mXzxP6cJ
 atjJ0SBIH2APHBGfSCx+cRU=
X-Google-Smtp-Source: ABdhPJzcMyQu8E1h//EbcZIJYXFLs9rjclUB2aHrJuSyMd11IG71W8mAVetxRrNjR3weZMJAZxf4Dw==
X-Received: by 2002:a63:1d5c:: with SMTP id d28mr1765740pgm.82.1601004656271; 
 Thu, 24 Sep 2020 20:30:56 -0700 (PDT)
Received: from universe.lan (80.251.221.29.16clouds.com. [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id o5sm571670pjs.13.2020.09.24.20.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 20:30:55 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH 2/8] arm64: dts: meson: update leds node on Khadas VIM3/VIM3L
 boards meson-khadas-vim3
Date: Fri, 25 Sep 2020 11:30:11 +0800
Message-Id: <20200925033017.1790973-3-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925033017.1790973-1-art@khadas.com>
References: <20200925033017.1790973-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_233058_448347_BC75A271 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

GPIO_ACTIVE_LOW replaced to GPIO_ACTIVE_HIGH for white and red leds

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 94f75b44650..73783692e30 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -41,13 +41,13 @@ leds {
 
 		led-white {
 			label = "vim3:white:sys";
-			gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+			gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 
 		led-red {
 			label = "vim3:red";
-			gpios = <&gpio_expander 5 GPIO_ACTIVE_LOW>;
+			gpios = <&gpio_expander 5 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
