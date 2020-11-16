Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B32C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 16:59:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4AD020E65
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 16:59:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CBqPWuej";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hNwjUvnN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4AD020E65
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1EVnh3auuSKatGOkocGTnn1Iz4T1u9OMuWIsW2jW4Ek=; b=CBqPWuejmbsVRSoRCV0mzLaCrd
	cRy0aGSBgkrQ4P/m0yRqZy/ndpFNm4Ak5ESHMTtqskQzWXgeo5mWM8QvCRi2XIPtdId0AhDy1CJJF
	wic4RwhXsPfwWwcZbl5dzWMyLAcGT9L9IU7MoDYbETIIANrPcwmClP+Adee2/1lm6Jl3OT3Umtzh5
	uB0uBeKjaGeBrUYNKbqsk1coJyJPwjw64usZds3XEtPjj4vR3JjvRbIxubmMJVtiVnODCq7douoFF
	dg9P0X8/njGZ/dklITjVEBh2smpj6LjVCpMvSzz0cbxuD+vQsTjdEMvnthx0WhSoVvkJuuNFulhZq
	MWZhBp9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kehqL-0003nG-Bd; Mon, 16 Nov 2020 16:59:05 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kehqI-0003mC-9B
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 16:59:03 +0000
Received: by mail-wr1-x443.google.com with SMTP id m6so2272430wrg.7
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 08:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W4o16G5GsEBzaMz1BZ2zcZ9qXzaDUaxARAp7qkrnK8s=;
 b=hNwjUvnNzsCBml6kwZR5iJ51i0E49/ZIjaKRBb1DOl8pzpI8wYtdpV0caP4OVb5U80
 0XpHY1GljQ7vMNY7oOd12FMDQ+6LqgibOD94hI4msC7PYt2OnDmSLDTcdY+ej4CX8ab2
 78PEbC3Bkm8WgVHwoJLEQO8Yhwarz9BgTPF25YYXGTxM7dFXIhImveocO541qB251SCW
 UBXQODA2HyU+f0eB0zyn7A74k8ocGocUMj8AiZBKWR0g/JUPB16wRtVhuJ3RyfYiYxwY
 CLD+lIXOFBdCdsIeEAXFDJjT73OCqZ0Dtp1CnuFsaDP89kh6mc2E52a7x+2u+7mO0a9K
 iqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W4o16G5GsEBzaMz1BZ2zcZ9qXzaDUaxARAp7qkrnK8s=;
 b=sBc91Zh415eJN20nCKNT+dYpVswXhnLEiyp1+6Yp/DHsN5Wuc7MzhpLyTUAFB0gPfC
 JItr10mFJ6VecR8i6gfJLK5DKvm8P3CmVk+isuppYoTwnsvYMp+BxzRROdixWC74ixff
 ezk8hPHRkG7zXpJvlqSk9MDM6+2ItbLyJLkLCQxqd3ExwDW1AlmTQ2jTc7HKuFzX8Syc
 l3mACI+nTHYVE+Exk2cowZ+R+c7hiKJc0LMmigxxiKgJHwEQRkEcKoIOVXmrKU8qS7KW
 U4/MPxURfpduA6CamWOG9zD5o2qFT9AAj0iSLTwemlQZT7jyxQ4iX7imJwa20QEnKKjl
 z00A==
X-Gm-Message-State: AOAM531GN4uR9pbWMB6zKm942G+gk6nlqIfShk11IX0G3Hu8hmYtTFQb
 7tc5VCSxFfsAz8GFFP5jcUMeSA==
X-Google-Smtp-Source: ABdhPJxAVdffrUmZu/MYmWLDC1IA4nYoGvNkWJgPrDQlADP0wxYuEUxekdaZMa9gUe34hcpIdfhD5Q==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr21892549wrt.158.1605545941309; 
 Mon, 16 Nov 2020 08:59:01 -0800 (PST)
Received: from starbuck.lan (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.googlemail.com with ESMTPSA id a14sm3582188wmj.40.2020.11.16.08.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:59:00 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: meson: select COMMON_CLK
Date: Mon, 16 Nov 2020 17:58:53 +0100
Message-Id: <20201116165853.544263-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_115902_415552_1344B539 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fix the recent removal of clock drivers selection.
While it is not necessary to select the clock drivers themselves, we need
to select a proper implementation of the clock API, which for the meson, is
CCF

Fixes: ba66a25536dd ("arm64: meson: ship only the necessary clock controllers")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 
 This fix is a side effect of this 0day report:
 https://lore.kernel.org/r/202011151309.DVCsUlLh-lkp@intel.com
 It shows that we need to select an implementation of clk.h

 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 329e22c09cad..484e81f39db7 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -151,6 +151,7 @@ config ARCH_MEDIATEK
 
 config ARCH_MESON
 	bool "Amlogic Platforms"
+	select COMMON_CLK
 	select PINCTRL
 	select PINCTRL_MESON
 	select MESON_IRQ_GPIO
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
