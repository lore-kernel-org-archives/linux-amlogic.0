Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60390C10F00
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:05:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32505218AC
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:05:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kdiTOj8u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="t9MvNlOy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32505218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsMhgRkaOwPJeKl+rJQY5CE0KyU3Q95O8JtguV9jxrM=; b=kdiTOj8u1RtjKg
	JUh/mdpu1IrYEWnV+7GdVbddNadl4fkS/Yqr6J7L+I8kBwAljW7ito2glMDAo02ZMUfB9NUbX0oAd
	YHAH7lfFvrybsf3W+++EEIboC6OzVqzKOGditwQOYBAwCsnaaUS/bjzwDDy3u/cbCEpdDq6GR/Rjo
	IQEqO0xg/SKabfoodH7Fa65u14glZ4D2mutRoYOP/C18snrLk7AsTlaAwPNZSGtPue/UCYWUhz61j
	O2CMoqPclnlUYWM+6iWISyYeAPOmMo4ofSEfnq2KHbhywuiot5QmQPWjVy/RYMt2IQUlV4Q161PW5
	jIFLrMo5S6cNQctrJhOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p90-000159-JC; Mon, 18 Mar 2019 10:05:22 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8h-0007zT-Kj
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:05 +0000
Received: by mail-wm1-x343.google.com with SMTP id 81so4784589wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ffLSiIBKhAZEtCPU3WfiQte2GBnhMcDRzZ1LFjIZ1s=;
 b=t9MvNlOy3+rjGhT5bWMuvzz6dMy1bnIhlVEsDaXd32jB8OdBptfjUzyZ6Mastth1Xa
 WTFy8/J+hzWDycng7Hp71b1mkv8JaOnX/xljfs2OsQhieXsBZQz0ye79Yc3143y8GZg/
 nuCCLHuFtv6yG85hyoaSHxX5PUEu0C754EzKa7czKAWJXw+QZzv6ttQfL73ByrvG8AcA
 Df8Fj/aytEFflpJZWsaS7ux89buJScDHFxTbCTpqdFX0otATEM5p2IE9Bij0R3Em9mdS
 e4oK0vHYXHW1RgoCSHM9FKRJnxFnCfqdS7iTCfJPNQaqr5fCTvWEH82QSCBftfVT6wvd
 ZGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ffLSiIBKhAZEtCPU3WfiQte2GBnhMcDRzZ1LFjIZ1s=;
 b=DmQTDfP2VWlyBrvav2x+Rn869fgzv847e+gApQU+NdzxAc/B0ahJEwqDsbEKTa6OCw
 RPw8beXtsad9F6hLPOUG0nVgTxC3qT/hP+Lb2wWaEMx5vAe8azz+DYQ4a1WISGvA1OmC
 //CJBTneP+4V7S/Td/1U+4THlb68K27kpqOlTQjj3J/VNl6orSxAwtkK0eOswaPssCSW
 7D8P3bbqFa6u5L5Qh5x9/r+MafMrRHxMfXRQ8LOvaa2nMUyn5W4xV4T7eLXnc6xuwMap
 U7JZp+7WpKcLeUgZJsoAka/s6n6SQYiRnk4bnDeRSJt7NssRuhsxZf3smgi6FdQuBmnn
 hZjQ==
X-Gm-Message-State: APjAAAXB8Zv95fGBs57o376W8HMWYw55X7Fr3BV2yuhImyHU+G3lB5y2
 PhFL1lO797zx0wTIoNxyn5Q4ZA==
X-Google-Smtp-Source: APXvYqxB+vufFtnxr8h5ptDHe6SYvw6JH0nlHKjFR+QB0kxtua+cRcc16MeL6hiURQaV2NeLGF/xlg==
X-Received: by 2002:a1c:7008:: with SMTP id l8mr10093647wmc.63.1552903501947; 
 Mon, 18 Mar 2019 03:05:01 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.05.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:05:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 02/11] arm64: dts: meson-g12a-sei510: add uart_AO pinctrl
Date: Mon, 18 Mar 2019 11:04:49 +0100
Message-Id: <20190318100458.5619-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030503_706949_9F92864C 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add pinctrl on the always-enabled debug UART AO.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 6a7c3241862a..63c515fe4996 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -35,4 +35,6 @@
 
 &uart_AO {
 	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
 };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
