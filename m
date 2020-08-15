Return-Path: <SRS0=38m5=BZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0472AC433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Aug 2020 18:20:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7D5D23B44
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Aug 2020 18:20:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yb5UHJ2I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="V3oTzjYq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7D5D23B44
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3V+kjOXhZn5pnzhss+8A2a6UaMy7zvjLEfJIJMWtKPc=; b=yb5UHJ2I64PSJK3z9KNVvCHTQT
	bzMo+akihX0x3TnYcuudm9yrvwbYScWbvOmia5hFxSjsjWQCCFGk2Ju9CisVbV3HuFlmCEjV5GQsC
	Qow0eTqs+V+UnjlBQn3B6zUf4yA60ywVOcaevzA8QMWoAOfHUJCya0ZPo7/+VvtyURm5bpNxfA1cG
	CsDap/k+IKiPahmU7srGMN7xdqCF7qIkq1YWr76G+rBcjMtjFRxQdCtewVKHQg7BmDCsFqRTt2ELA
	DLuQ9TeYkd2Y7wCqXCNX+zJ3hD8jwPvBYiLPHQV570/7b94YlLJhkLgZBHnXySzEk+U4DKLh0iRbM
	LIFNzcEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k70mr-0005Sg-AF; Sat, 15 Aug 2020 18:20:13 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k70ml-0005Rp-Un; Sat, 15 Aug 2020 18:20:11 +0000
Received: by mail-ej1-x644.google.com with SMTP id t10so13249213ejs.8;
 Sat, 15 Aug 2020 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OpZZK28b8NffZ5B6TNfkcT7DySPSUfUL+HBLi8ymZuk=;
 b=V3oTzjYqO9jTTYGBEiyf2ShErrFEq3jU/oWgQAJGZyC8jk7rfxUp/+JMzVQtQ6fK77
 m8H2Gm1/6/SbOfXKPJyH9tFEL8EZMNAfs5h99a1J1qvVeZJA7UdCzA86H7HDX8FdA0Ep
 Zm+HmzqBMOAEBb6b3qtm0btBSNHDtUr8M4pbBp6cBip9EZv5QGLKIGlNjj4ZaR5tD34l
 HOs0G2kBkmpwrkQCVvsJzcv50aEu4w5Vl0kEs6tGK8PxiIaEKDRsWSgsLkKDCl/2lLa7
 xNSt1uRbf2ymzz7S7H/YLojd694kvZzxp0CxaVHhaE4GQS0p2Q8NYI+05I72GpgSJuuL
 xj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OpZZK28b8NffZ5B6TNfkcT7DySPSUfUL+HBLi8ymZuk=;
 b=o+Nb1lROXOiopVW5NhHe7KblaZjkLxGv9d3CM2wQzSqBaKaLQOApVuKx0dkGQPdNbI
 kNrGj/sflQ1s6mMG2hR1HljfQ/AO0TAgIkHFSF1QiDHwuAbRbjVSxetnSBNCHyZIjxXa
 KlAo6Kw4srOmvMFMv/3OVtcKns2THyRpfeD2dB/8Fw4G3KGNz0tQyiadUe6MHoFFDhlf
 5dUFV+K9de6aQgC88QTYteXtNg+fHhuEfioSy3E5Q+8p2Ujrz7Df5dhu/d79fXNbpBPC
 yo7dXe9B8DC2p1weEgBCJntextqYYHopIqdPxuxZNB8hhxAUQhh0LPiLcu6ypz3Yw8h9
 90Dw==
X-Gm-Message-State: AOAM5330LKfcVSZWIPYuv7f8i68GuxroW4O4KnlFStnR1ktep8DazZw2
 E2PaG5WfhD/gZPNiQ3y2GjI=
X-Google-Smtp-Source: ABdhPJxAif+DHTGIAVE8RS/VpsGIEnHOWkllB8nTHgbQiXkpv5KQMmpXc1hoO29G0LpqIJ5e1wSw/g==
X-Received: by 2002:a17:906:c406:: with SMTP id
 u6mr8344063ejz.47.1597515607044; 
 Sat, 15 Aug 2020 11:20:07 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371a97000000000000000fcc.dip0.t-ipconnect.de.
 [2003:f1:371a:9700::fcc]) by smtp.googlemail.com with ESMTPSA id
 os4sm10054989ejb.117.2020.08.15.11.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 11:20:06 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: khilman@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH RESEND v1] ARM: dts: meson8: remove two invalid interrupt
 lines from the GPU node
Date: Sat, 15 Aug 2020 20:19:57 +0200
Message-Id: <20200815181957.408649-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_142008_077674_557D150E 
X-CRM114-Status: GOOD (  12.21  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thomas Graichen <thomas.graichen@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The 3.10 vendor kernel defines the following GPU 20 interrupt lines:
  #define INT_MALI_GP                 AM_IRQ(160)
  #define INT_MALI_GP_MMU             AM_IRQ(161)
  #define INT_MALI_PP                 AM_IRQ(162)
  #define INT_MALI_PMU                AM_IRQ(163)
  #define INT_MALI_PP0                AM_IRQ(164)
  #define INT_MALI_PP0_MMU            AM_IRQ(165)
  #define INT_MALI_PP1                AM_IRQ(166)
  #define INT_MALI_PP1_MMU            AM_IRQ(167)
  #define INT_MALI_PP2                AM_IRQ(168)
  #define INT_MALI_PP2_MMU            AM_IRQ(169)
  #define INT_MALI_PP3                AM_IRQ(170)
  #define INT_MALI_PP3_MMU            AM_IRQ(171)
  #define INT_MALI_PP4                AM_IRQ(172)
  #define INT_MALI_PP4_MMU            AM_IRQ(173)
  #define INT_MALI_PP5                AM_IRQ(174)
  #define INT_MALI_PP5_MMU            AM_IRQ(175)
  #define INT_MALI_PP6                AM_IRQ(176)
  #define INT_MALI_PP6_MMU            AM_IRQ(177)
  #define INT_MALI_PP7                AM_IRQ(178)
  #define INT_MALI_PP7_MMU            AM_IRQ(179)

However, the driver from the 3.10 vendor kernel does not use the
following four interrupt lines:
- INT_MALI_PP3
- INT_MALI_PP3_MMU
- INT_MALI_PP7
- INT_MALI_PP7_MMU

Drop the "pp3" and "ppmmu3" interrupt lines. This is also important
because there is no matching entry in interrupt-names for it (meaning
the "pp2" interrupt is actually assigned to the "pp3" interrupt line).

Fixes: 7d3f6b536e72c9 ("ARM: dts: meson8: add the Mali-450 MP6 GPU")
Reported-by: Thomas Graichen <thomas.graichen@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
re-send of v1 from [0] because it was never picked up


[0] https://patchwork.kernel.org/patch/11582619/


 arch/arm/boot/dts/meson8.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 277c0bb10453..04688e8abce2 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -240,8 +240,6 @@ mali: gpu@c0000 {
 				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
