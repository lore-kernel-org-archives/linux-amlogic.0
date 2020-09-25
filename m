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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37927C4346E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D35122176B
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DrwJKwD2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJiAkF45"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D35122176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nm4bBZsi4A/zFJWoHoR3juSQc9CDO9kZo5qFlP5HZDE=; b=DrwJKwD25rTeDyUiF3+d2CSPD
	zpJI+JMd9uq0/7UIi+KkzaHcS4OMOzeiOwCCbzq68QEBekJlpoEO8v83GKl+UNR4nG3FSL6RrnN1S
	DTv6iWeTXtv0hlUkFc19M4VOcnx9oMeFmJQH3GWOuvyFnkEHVcyHanKGf2iNQxhFDGNt2+lSa007D
	FjqEUN6vu0obfcVXzOfckI4dPyGGA02U04n6ZrkA/IGK7BGHV+YrzLOIXPc7fglkTI2Ytt2tiMCYU
	hGU6cet7gxg0iI+X/21szmdIsFbrXQgDus6HEldmQm6byt26RFSEgQK2QrK5Gfe67ZX36mG4LG3ZR
	QZKimRveA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLeSQ-0000Wl-O4; Fri, 25 Sep 2020 03:31:38 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLeS1-0000MI-W1; Fri, 25 Sep 2020 03:31:15 +0000
Received: by mail-pj1-x1044.google.com with SMTP id t7so1148026pjd.3;
 Thu, 24 Sep 2020 20:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KtNtO+Cr0GQID7L6TUSjs7iQgumN/SXyPWODrwazKkg=;
 b=qJiAkF45ucqS9gS/ZNpoXHj4LbXoq3VVmy4eUL4P74gEZ8YMPloEmebxaqrv3lKuve
 7WbRuC1Sz01L3wLqtJKAaHHR3UIfWVwtJiJICWug40VtMrNCZA0cRmgmYFDTXNlf7I9M
 lykHcCPZhauPFh+HpL8FgDt8rMAM2XtXJCJ843KLxf77juYnZ83AGPxs0tvxymbU/YGR
 R94r2jwcjxBT+DIZCAnC9jsTrEdfkQ1hq/h2TR+YCgUjj0hDKGxr/C5J+bu6r1NkcIox
 kNNQCJZ2P9FKtoT2htIVQS/JlFIxL+9QBDhZUs2j8jzxWcOxbLkL92KPoWVabqMmP0jZ
 ioPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KtNtO+Cr0GQID7L6TUSjs7iQgumN/SXyPWODrwazKkg=;
 b=FKf16aJnj5zvoPvdAmvgAaKvIyYhc9ALzy2deky5ltIwgZsg8ONImVz/0eI2q6qUsC
 a5RqZb4m/ek9Vn/vvsIzMnS6qFldpJuxHtCk8l/metcGdIUUJA6NtqNYYTRGNR3cGCKm
 onl24u1Y7P01OvPxClcPoA4TyF5cgS77EM8hTHhjDYmMVGd12p9uzHWI3kZRUv2J4Hma
 tXE86WS/LCIh5U4hf1MKCporxj96pkfwHRcVITom3Jau2d6epQHZqxMyTaC/T5qX1JNZ
 B+0HgkQb/MLLn6z0q3bqV/aNfp+M6j3CoKhPgxVIKmFlV0JRz48Mz5s9XZrgr9IAJJ1Q
 E9KQ==
X-Gm-Message-State: AOAM531J4rlPQeBAKM8OCfwSgFhF8nVziHetFce7hcI6yELJ6i0LTdbk
 WmdHMZqnWk3m1+iZBJy7sfU=
X-Google-Smtp-Source: ABdhPJwbio+Z43nB0tgbrugOdb36C7ZjEzxv9FJJekfEhiSoOduLBjFm09cVQhVvJcONcnSFJufVsw==
X-Received: by 2002:a17:90a:ec0b:: with SMTP id
 l11mr729435pjy.144.1601004672080; 
 Thu, 24 Sep 2020 20:31:12 -0700 (PDT)
Received: from universe.lan (80.251.221.29.16clouds.com. [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id o5sm571670pjs.13.2020.09.24.20.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 20:31:11 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH 5/8] arm64: dts: meson: remove reset-gpios from ethernet node
 for VIM2 meson-gxm-khadas-vim2
Date: Fri, 25 Sep 2020 11:30:14 +0800
Message-Id: <20200925033017.1790973-6-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925033017.1790973-1-art@khadas.com>
References: <20200925033017.1790973-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_233114_129260_B6D5C08D 
X-CRM114-Status: GOOD (  12.53  )
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

1) fix down/up ethernet interface - need remove reset-gpios for ethernet node

`ifconfig eth0 down && ifconfig eth0 up` # didnt works with reset-gpios

2) add max-speed 1Gbit

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index a6baf865aa2..70343da2811 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -195,7 +195,7 @@ external_phy: ethernet-phy@0 {
 
 		reset-assert-us = <10000>;
 		reset-deassert-us = <30000>;
-		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+		max-speed = <1000>;
 
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_15 */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
