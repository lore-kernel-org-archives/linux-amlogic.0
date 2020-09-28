Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0574C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 09:26:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7EE221EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 09:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bWPxbD9L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naAPnVjA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A7EE221EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JMgVGEDOC4XEaG5w02hmBunRs619kMx2CPAS176fzmo=; b=bWPxbD9LNKgiG+OROsUPGOHg+
	D9jqG3bn5xwyOqckjUqIk+XDiN2drmgvBlOkpttmuFoVGq4T3hFKRT7wmbBeTjboMGIZQnArdjZTK
	jg0pYTFcfbI+Hl+zuD7sxpujiOyeice0ljiga2SMy/u3Dzx6xm1GDAC1xXJ3oxC+J3fL7Si6U3nsi
	1kDRx/NK+ZXMMO6YMpsLA0PpNDdJr2O7IlkpOxGd2LKoLZJa+QdCcC8uPZg1+72kow6uBXcyYCtxL
	UO5GhLhQFhVXp3fFL5GrN0K2LtIgfFAq7E0ZlyVPHWdSnkwXsl64bD/NFNhMkI9gWinK8cd9Q1onM
	yF2URmwsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMpQo-0005uc-Ns; Mon, 28 Sep 2020 09:26:50 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMpQc-0005qY-3v; Mon, 28 Sep 2020 09:26:38 +0000
Received: by mail-pf1-x443.google.com with SMTP id l126so435606pfd.5;
 Mon, 28 Sep 2020 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vwyn4jhlyCUJ12eIYpSepswUnoOpxvJJ63W/OYA7PGU=;
 b=naAPnVjAA0vPKDoq59x+zjNL74O4Z3obOogbM3hiX0oWiY1UXXJymahauzU9SkaFqi
 CAis5ZPCnhs4Lv0wSAOY5B3rByJGBMFxcllnR3MTbo9NuTuzlTVons5XsW1bDuZ7EFdk
 OKpXqcZ9/6yRxicIoEEVI+6JRwrViaRXN2Wh8cIN4MP9xFzfU8at+AUyOJ+nLxAVGPaK
 6lx8ZL8YE2sqLz6v56MyoS2w40Ny4PxOXPo6zck5t2KmqeHIzGq5cwCeQR9EyVpswfFe
 Kh8Ii1Qbza9mEYz04kufEqrts+PLfa+HxphGp4kLsmfN/bvJzupDH64GglQVADB0m3tM
 i4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vwyn4jhlyCUJ12eIYpSepswUnoOpxvJJ63W/OYA7PGU=;
 b=l6ACX9x0t+wPNyT210A3Z4kK/PJ9lTL43xt1YjDGHjCmzePwnYNNRZ1qPyVRsXJbqC
 1ZsHAozli9h/mX7+fwC9AhuAMVp/QL6y2VPwJ8JKX0GZf0KE/3mGPcp1pYe7II8uB21Q
 lvynWWhoPDqj8jpR27WwCF25vteEq0MpT45kji2iTfkesDrKOzOZ7bEfYrk0Q74OVGmA
 Xb8feh4xp/ut4UIjSCM+rwDFvjfUyw2l9CnyD64CLrmZmJU1RN9iw18aFA+yVwep4BeP
 xoY3F78N5CRxzgIf1ur58/wrXTB2fWn0O7DYSP+vh/Rj4DVHnA7f0s6mHRAV6HFVcpGl
 OwlQ==
X-Gm-Message-State: AOAM533mzsuRByhIlEhq+W7Gz7vArM+eOx/lF9s3simRONh6onTN0F/D
 HK5dZBct77Zxnev2x397uZQ=
X-Google-Smtp-Source: ABdhPJxgHo3bRpFJaffhsxpnrN2gJ2QQVEdNGNHMVeaOR5uqV8jz9ncKqI1Uv9yAEuJoAqdNZXGKrA==
X-Received: by 2002:a17:902:7681:b029:d2:88b1:b130 with SMTP id
 m1-20020a1709027681b02900d288b1b130mr801170pll.20.1601285195958; 
 Mon, 28 Sep 2020 02:26:35 -0700 (PDT)
Received: from localhost.localdomain (80.251.221.29.16clouds.com.
 [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id mt8sm638606pjb.17.2020.09.28.02.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 02:26:35 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH 2/2] arm64: dts: meson: change spifc max-frequency on Khadas
 VIM2 meson-gxm-khadas-vim2
Date: Mon, 28 Sep 2020 17:26:13 +0800
Message-Id: <20200928092613.273998-3-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928092613.273998-1-art@khadas.com>
References: <20200928092613.273998-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_052638_163049_2CF69EBC 
X-CRM114-Status: GOOD (  13.45  )
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

change spifc max-frequency on Khadas VIM2 meson-gxm-khadas-vim2

max-frequency is 104Mhz

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 624632f06b5..23e6c63fefa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -341,7 +341,7 @@ w25q32: spi-flash@0 {
 		#size-cells = <1>;
 		compatible = "winbond,w25q16", "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <3000000>;
+		spi-max-frequency = <10400000>;
 	};
 };
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
