Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C586C47082
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:58:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36814611ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36814611ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KoTadk5VJvF6xuQYS/sybukOpyulS+uIMF14HwoUMvg=; b=Jxjg6QKwdcE5xr
	5tQ9qLQHbj+vvLGciYqzlbLb6xPQy8rfCBVnRx5V87GxqHHf/QPpJ1L71IodC6gcFZD2Hrp4o1SzJ
	Cj6Gkb0ZKtlsYJ9jIHXHMaWhrNZkVzz0klnwI3xoLG++4pOpJMdLCKxi2c/39BQGCn2al7ZbaHJ64
	d12Tm+wLnw/G5g8hgtChcnbJxJWNhIM2Z3rdUNEECeR9C7qUyr7kqRivEJR1S7UvFji2pUC6jxlD2
	jKsmG38foH2yBMsP5xgUvNTtPogUHEpEsipigg24nueFbsJNqHzX9ufO9OLwXJZNIaIrUm7oCUAu9
	wOG/j7maCRDGn/8IwvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9DG-001qtN-Gh; Mon, 07 Jun 2021 06:58:18 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9Ap-001pkd-Ey
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 06:55:49 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso6628421wmc.1
 for <linux-amlogic@lists.infradead.org>; Sun, 06 Jun 2021 23:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cUdkaQG5aCgHatEguGsmkfAI10h8bEeuy1goie3+ZSk=;
 b=WDso6HKZrHk1K6rSvjJhR4nNZ0jhdzTEAfy01D2gMmQ86WwgcUQ+9+grT0ELB4f5Pm
 zuZNjO8THQADGJ5JNEPzpqgFg5YxLzEhOtZejkefqIoVljGN2gz8AubzhxM6kAMi/k3k
 wRW5ilAq8I3Wj+MveeCIFXfKIf/kPRbuiysBSRTQCleZZ500El7UNsHEnZWZU8TdZe6J
 H93XFuVSq6juUZHyF3za1ucdrRDwKRMrkTdq6qHBgMgOw9ZxywRPZjvwE1FkxDAAO6yr
 9SGbC35h1Tt7SdHdMKOoFc3VPTQYF4s3ZPcyNttTK5DnwlG77ka0BMJI8sUSBDJO2C5D
 bhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cUdkaQG5aCgHatEguGsmkfAI10h8bEeuy1goie3+ZSk=;
 b=neXi2rzipB0fCZz0T5rHag5HIyiicjHjo8nChosZJdUS6hGs4yW+8FHdmGu/T5CDB9
 io0EsOISEl78ka+PECW4sHPfnGMzpqokHZ+xMmJjJj7FFoIp66U8AItjLhOUHWHDQR0N
 AqYYATApHBfcUM7AMhB6YKqL+Qq6Nq3qAYVOZHuIgqZG9reefJoXVfazMYnFX3KJbR/5
 XLBEOHJJQ2YUCm1lhPz5rO/loqUnbqWcn4xh65TsrDmfm7D0ShGI0SdVb2H0Dy6XbgHl
 AhsjTK8f+3mNviLk1hXJt+N+5a65gMAnIp77lyH/FQO8E4gg2QN9b6qfa0EHl6659YpC
 jguA==
X-Gm-Message-State: AOAM532EzmDZH8fuya0Zg1SAL1BwtC2E87h1qSXWVJxz+CLNftocXfDL
 ej26HOZ/Vnu6WXfVlxHGj9Ap7A==
X-Google-Smtp-Source: ABdhPJwiDNdO6oTLu7kFd7H0SHtUmizxfdESY8WoOZ2WbTXoMX1kTqyAoudgxGWYwU+AcPBph6qy5w==
X-Received: by 2002:a05:600c:4e90:: with SMTP id
 f16mr15450015wmq.116.1623048885543; 
 Sun, 06 Jun 2021 23:54:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:7c1f:1c9f:555e:7398])
 by smtp.gmail.com with ESMTPSA id
 l5sm16145742wmi.46.2021.06.06.23.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 23:54:45 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/7] arm64: dts: meson-sm1-odroid: set tf_io regulator gpio
 as open source
Date: Mon,  7 Jun 2021 08:54:30 +0200
Message-Id: <20210607065435.577334-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607065435.577334-1-narmstrong@baylibre.com>
References: <20210607065435.577334-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=986; h=from:subject;
 bh=9RLJIF8542k5weQ8o009+F4gMN3x44LN7xQPDqGEmsI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgvcJAXfvdglKywKTI3zwqpiZBdnc9f53ieiHONJqJ
 /T7QyESJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYL3CQAAKCRB33NvayMhJ0fuhEA
 DH5yC5rmFUKnbMibJEA89uOMJVjNIKJbMkhgeQb3A9FLzpA89+FkDZMtJFMNU3ahtxQ4R9cA01evu8
 aRoEf7R69nXafiZPEvVfOGrf4gCU+suKtb16/OWdDk1epugGSh3raj9eLz0ZLTvp1qP7GxvQHXK6eU
 wJdr05M+5S3k67QOkurhB9qlrwH7y65K1u4K3OF7vjVNkw3AvKuCh5NXVE6nYeqvfLgtO9OvCFwbeK
 mJrjCj5fnCj1gevTH3DqU/94OBmh5CBSNaUl1pnwgA0lgdYXjYqyePAIoUDQ/4K1vd0f7tCXk5hFwg
 ohVHt10mzanN60rPgvrDsNTL9jBvZJPxsmp4PRN15TKlF++K8/ijW4mMFpWHR/XM4QQe7JlT8F95cs
 lX7n/khxFQxaquW7Uxn4ZRibsiRvq6RV0mNCf6lnLzOC9zRszE3bCefodUFUJayu7abrUfwPJ3n8+f
 kRmgFTUiy6yWAB0DBiFJ8tShhHwos8lWqv5jewzQ9YBEwSynEgveuQLUGJfosiBM04mwGpR8inWcTV
 PivNB6hpkwOuL3G0vyCYoo6AGjv74RMEc+GWk/ZCh4RCtds2AM3k9HDisY0NGU1ZQX0/VDHBBvnzVu
 iZ29NaEh3l0yZfetc290mdux0TLUaT7Ff6IkVCuqZ/1+n6AcP7vbTI0jzDbw==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_235547_545917_AF087081 
X-CRM114-Status: GOOD (  11.37  )
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

According to Odroid-C4 & HC4 Schematics, the TF_3V3N_1V8_EN can be in Hi-Z for 3v3,
and since it's the default GPIOAO_6 mode at reset, let switch this GPIO as Open-Source
to drive for 1, and input for 0.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index af40ba461074..e64359163331 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -52,7 +52,7 @@ tf_io: gpio-regulator-tf_io {
 		enable-active-high;
 		regulator-always-on;
 
-		gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio_ao GPIOAO_6 GPIO_OPEN_SOURCE>;
 		gpios-states = <0>;
 
 		states = <3300000 0>,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
