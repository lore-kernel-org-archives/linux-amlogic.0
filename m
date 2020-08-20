Return-Path: <SRS0=HvuL=B6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91EEC433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2020 12:13:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C100207BB
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2020 12:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mFJNERMA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7lZ41k0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C100207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FJ3myNN2U6MdmR4W4Ef6h9wX1RpMopRYoET5L7b5DLU=; b=mFJNERMAMJ1Nler41rQQleJ0w
	r6J81fl27FUueS4PNrSTC34Q2EImD0PCVVxcFvPfABzCb+lCS+0AFDPpzyXjoECiWuA/ofjFBzTUa
	9OfCYXJdBTxiU8QA5htoGtywUTA/fYFSq9T4xnT/VqrCaepr8cjzTy6Bw+uzmd3iODVvZd3gB6HNC
	TttXEkOEGyoxWaS+FTnEd2vcUwn0y2eKkIQjZT7AH6MZGon2R26kGpvaEOUoeWGIMEwN8/a9N/XCH
	AT0vuPtiOjcG9m1DCOc3CnI29cgY5PRrYsuazMiB3B93u4GyJ+AtgQEQE6dEgOV2tO/IBlSVOdRKP
	monlF/lFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8jS1-0003hJ-61; Thu, 20 Aug 2020 12:13:49 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8jRv-0003f9-AE; Thu, 20 Aug 2020 12:13:44 +0000
Received: by mail-pj1-x1044.google.com with SMTP id mw10so895713pjb.2;
 Thu, 20 Aug 2020 05:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jn+5o4H6zeY7VyKGNupBFWwGj562wXXIPMMgccIApSA=;
 b=A7lZ41k0rW3TynpNLvGqOj0lOKmL59ZV5z5ZoxheEImqxqwomvmgAaUx3cXChvhIvt
 33gv9nx9PIKEWZN6hGKH5CHUzgPx3bciFbWy1rmxDuzGeU91HB1cAC8cf6uleexCthuJ
 ZNA7Jw6I9yCYcFE75YQqil3kJhWgV2J2g9Bteor7tnLMDGVvlcRWlRAw4dKq0ZGpQORR
 oiNj8NjMfcoWQBri3/UT3g0Wh/RJOXDb9Z/A8UDycj+74g5pI3fs0vIUiclGJh/iv0Vb
 yZglv0PGLNYEuqleZ4pS55qyrU2BlbkjNVfn5/DzYdGTLsdRxq9dNIpFKjrLw3rWsqDr
 s2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jn+5o4H6zeY7VyKGNupBFWwGj562wXXIPMMgccIApSA=;
 b=YD03dpumP83lTFtHf4vyJl3Sk/Vvq+/N+ua/XSULM8PrIMopxJAHSR1tIzHiNpKwoM
 VD/evWXnQOxGNm6iOwzathYpdF1NEhIeG4OTmXCawXMzpJj514K6nBkljYjzqYmtRJxK
 H6gyaFp+vf4EkMANEcnVsNvlk7fk9z8dTDTNn4mPflNE1eGdX7wQUjktCGuHZRZt/j28
 CdkVHIQJzgIDgwydEHyiTYgvGYm7QsrFj5nccByIpJDGMm8gxcqnJ4oOjkmgfK9k1zt0
 ZYQ/KUxRjq6bSW8q4nXGWi9wzEZPFXBH3j6QybKzL6EyR0zyYsidGRKDIi2LfzFlED8b
 25SA==
X-Gm-Message-State: AOAM531gVHz0oeVJ4i204GYi9sK3826ttK7qJCIsYeGplKPEJyCakhzn
 0xAa6GCZCY9dukKmxVa7iD4=
X-Google-Smtp-Source: ABdhPJxcQZ4Ph+CBUf/FlU6S+Ikk2Tw3836twRc+Mg/vKpx39hVWFfhDfq0hPl5C19/rsB4BAFnCkA==
X-Received: by 2002:a17:90a:ea82:: with SMTP id
 h2mr2256290pjz.75.1597925621188; 
 Thu, 20 Aug 2020 05:13:41 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
 by smtp.gmail.com with ESMTPSA id p20sm1985937pjg.44.2020.08.20.05.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 05:13:40 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v3 2/2] arm64: defconfig: Enable RTC devices for Amlogic boards
Date: Thu, 20 Aug 2020 17:43:23 +0530
Message-Id: <20200820121323.564-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820121323.564-1-linux.amoon@gmail.com>
References: <20200820121323.564-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_081343_418750_1EF1802D 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enables the RTC PCF8563 driver used on Amlogic Libretech-pc
and Odroid-N2 boards supported in mainline kernel.

Cc: Kevin Hilman <khilman@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e0f33826819f..3d9756833e0e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -773,6 +773,7 @@ CONFIG_RTC_DRV_DS1307=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_PCF85363=m
+CONFIG_RTC_DRV_PCF8563=m
 CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_RV8803=m
 CONFIG_RTC_DRV_S5M=y
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
