Return-Path: <SRS0=UjyX=ND=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D40C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Aug 2021 05:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C493960FED
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Aug 2021 05:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C493960FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=owRvNYEdU6BJ0Dr2E+aaVt1s2cuBMSIixba6XmZhpwY=; b=nLgCyP4hjaMDRi
	322lVQ9FCYxm1ULeVeEBM3m96drILwA7tPxYFkwkJRqek0aoVv7fKDtKrb5WX8pg83UVGnRFEg3WA
	GQqfd8/fyjPriECKMV0M/RByONWHn90e3NPPOKu872Zl/AjOM+O1NOBHll8Evn451Enp3UNm24QAK
	T6eM/JGiogLMdn204IQ72dMHmjO0yt4QvZqSqyEeucSEycs62YQWgNorNdRVKaQrO2+MvoC9+Ns3F
	zUW8Y8exvF+1bwJq3lIAhYy2EMfZd5WKYUWegBbwdoDnlxuU00ahOeeEdCtq1BG/8YiuWwjr3pmPV
	rWqchThYvrhyh2JHqlcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE303-008eMt-VR; Thu, 12 Aug 2021 05:11:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE2zl-008eCy-RH; Thu, 12 Aug 2021 05:11:11 +0000
Received: by mail-pl1-x634.google.com with SMTP id n12so5074627plf.4;
 Wed, 11 Aug 2021 22:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWR2mXkg51krjGDZKbq6W+12ZAbjOnmXR2AtIiwcOUU=;
 b=abqseVDjEYnDP1IrFXt8rh5oE5TVI8E815JtxAWGbn4VXtQTD/CDlXUmK1wRW2wV3J
 Ez1v18B9oTFjJKPHPWmiT663mi1SzfFQx7pbFIfvi7gsez6nw0T8g3nYuydB1p9bSVXc
 Ku4ofIC+0sPQvr40rbn77PIph6QEH9O19N9OY5jUGGy/mNG7o68OSA5N8xqqPsTbdDZO
 H6Qk488v7sGfln98r/perUTPDhahCmyDT2kNYQl1i4SMY/HCENA8k4TEZh+LrjhU80or
 CBcX8BpFtbuHBrynR2+sJq45LBXSBULNyuUaJDOPtC0VT4NrLZuLU1kPeoTUvK5tmTBW
 q/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWR2mXkg51krjGDZKbq6W+12ZAbjOnmXR2AtIiwcOUU=;
 b=jAvTVfSg45bFp3m86arXDKx5Sv7dbryhJ6YIV61hOCiMkez3zKJcr3ySuVGDZRcn16
 ED57SpeKpgepfOqEKkR4GSAXy0kIMWFbmuHhA95MvIHL8JJjLBoDeQI3W33jTqgkg3/j
 8ZZPvqqKnsWfriQaXyPcuFhJDqQRfuJmXr5jOIBjL2HJXXef4SPzwRdGW62zfDNqyM15
 0n/n4R3zMNLyvS3/SeLoKS74S4cQ0c7SWBfnHAV77qpEQ3/bafeGDMpXwX+4w+YziAVC
 aWzPx+7seVvVdhVOuaOoJJKrdqul0jWXBdzX85PloyrZdmRVyfWmG95Z+JCwFLVwdR6q
 io4w==
X-Gm-Message-State: AOAM5331nDoTrTAFef5gNa2u78MOf1nt8ZFcqCou97p4uaReFemfMtOl
 5e0XMAalYWv9RejuO3ZaOr8=
X-Google-Smtp-Source: ABdhPJy43CERi69z2IwDxKPjKgZ1CPvwTJr71N0R8AGHc3YGb7JVs+2zPLsYvpWl+xH3fjRCzZI+vg==
X-Received: by 2002:a17:90b:3b83:: with SMTP id
 pc3mr197734pjb.30.1628745068662; 
 Wed, 11 Aug 2021 22:11:08 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id y23sm1544224pgf.38.2021.08.11.22.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 22:11:08 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH] arm64: dts: meson: sm1-khadas-vim3l use one sound node
 configuration with VIM3
Date: Thu, 12 Aug 2021 13:10:59 +0800
Message-Id: <20210812051059.1103641-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_221109_942638_7AA93F0B 
X-CRM114-Status: UNSURE (   7.90  )
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

Khadas VIM3L board sound configuration same as Khadas VIM3, its already
defined in meson-khadas-vim3.dtsi and no need overwrite it with different
card names and routing configurations.

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts     | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index f2c098143..06de0b1ce 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -32,19 +32,6 @@ vddcpu: regulator-vddcpu {
 		regulator-boot-on;
 		regulator-always-on;
 	};
-
-	sound {
-		model = "G12B-KHADAS-VIM3L";
-		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
-				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
-				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
-				"TDM_A Playback", "TDMOUT_A OUT",
-				"TDMIN_A IN 0", "TDM_A Capture",
-				"TDMIN_A IN 13", "TDM_A Loopback",
-				"TODDR_A IN 0", "TDMIN_A OUT",
-				"TODDR_B IN 0", "TDMIN_A OUT",
-				"TODDR_C IN 0", "TDMIN_A OUT";
-	};
 };
 
 &cpu0 {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
