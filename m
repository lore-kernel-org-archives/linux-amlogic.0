Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E798CC282CF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:23:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B633F2147A
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:23:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IYp60c+j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zjHDbhlk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B633F2147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaBHjTiQEQes5KRgVr50CyRIzf2niz7DRIkkqvfQIkQ=; b=IYp60c+jFEztJM
	fW6N0xhXhEhn17Aro8Q8nIpvnp98c1C0Vs/1GS0rx9rvLkEstZETU7T3kELmSbw92ZGyoJxSfxJng
	9o2C3KU8KYo1kG3e/EhxA1ArX0iTV35qld+z++lFGPJqf77kAUuQTpyuLpRxDdSUTBoCe1ddQGnud
	leRDIN9GQMNIUaFLfA8D4CRoChYfNPBCyZHgsvmc3We8dFbiirTxR1D3Hdtul0NI0GxyFAVpHrUBv
	nL0o3XKkPFcjpbn5Yn2SLlCUnRwvrpi8knbfU95hzcL3FjVerjSf0lrdqQR5FdfN9MnjZGY/GrzEo
	kW6FQQAM9/4QDsYXH1wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goBZJ-000091-08; Mon, 28 Jan 2019 18:23:37 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goBYk-0007yE-G1
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 18:23:03 +0000
Received: by mail-wm1-x341.google.com with SMTP id m22so15074983wml.3
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 10:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KF36F6q9GQzGHJ20m9zEs0OSKLwz9Wn20oRSDsKSvn8=;
 b=zjHDbhlkRCr07+TN1SMYNQ5eDsCYWPn44MbDZJoK3N4hCs0Ou/GHl8txK4GZCV/UeU
 ONr2lwM40JdODhiJzwQquNRpyDcZ72xiI83sDVIZXMR6wOMuZMn/ikiUdeRN+eVg+kzZ
 qaXTyLwoqZIPX5ubXieyc5QpU9CptnqN2y3RjedjkRTKD1HmroGseXq4y8G9b73VU2zF
 +WVpb2uUJCKXn0PnQFetdRhLWU2NXrJOzcem/6s5KRrHsvzd4nEA7QADgS6rHGeb4y6S
 6fQ7QVrnGa/TaKJmzFmdD60blf26Zwo4TlMZfHGquaTLstW96ReTPiHzAOnf7ewAYxVh
 x8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KF36F6q9GQzGHJ20m9zEs0OSKLwz9Wn20oRSDsKSvn8=;
 b=HVAHUesdWHxtGIBknBrkHx4qkoQlELvP/5qZdhOEd40nNzaaiRGAovVfBSA/sS1iXZ
 P7xREggSbth9U9Obatn6F63lMkWbgWeeIUec/U72UEBHp+M+M8AOIdFOGePIPff08Oas
 a1HQT/9SjCxrXLK2c5LsFRs6Au9i1Z5mrnk2EHzTE0e9XpqWtWAn+riuv5TpfzRFJNwL
 nSGpSvBA8cM97ONsEgb3hoH7lWlMx8gj3MX6L/61eyTfn+KyNsDY3Ew5rScAIr+5eeS9
 vLKziRcwz/Hs7CiQuPnEV19C6XtbmwsbogEoSRNEY8Nt+tfYH2w7gy3qTjGr2b0s1hD6
 w5Uw==
X-Gm-Message-State: AJcUukcXZ7gdvFix4RDt1e9t/0vlKl/9+p84g5FxtQ8kHVWZqK0r3atp
 CkAdoq4mbHuRtnwtTJFp/vLG2Q==
X-Google-Smtp-Source: ALg8bN49XeLSs+dhj5l9IQ/0Ag8h3yAaNs1LWB9trd1NPYyBk8ti9OKURggjsFGXYvd6jAbnXkQOhA==
X-Received: by 2002:a1c:d00d:: with SMTP id h13mr17657339wmg.13.1548699781116; 
 Mon, 28 Jan 2019 10:23:01 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s1sm169223758wro.9.2019.01.28.10.22.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 10:23:00 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] ARM: meson: remove COMMON_CLK_AMLOGIC selection
Date: Mon, 28 Jan 2019 19:22:52 +0100
Message-Id: <20190128182252.32589-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128182252.32589-1-jbrunet@baylibre.com>
References: <20190128182252.32589-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_102302_533202_918A7ED6 
X-CRM114-Status: UNSURE (   9.30  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Selecting COMMON_CLK_AMLOGIC is not required as it is already selected
by the SoC clock controller driver

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm/mach-meson/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index b16831697183..15e9cb75738e 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -9,7 +9,6 @@ menuconfig ARCH_MESON
 	select PINCTRL
 	select PINCTRL_MESON
 	select COMMON_CLK
-	select COMMON_CLK_AMLOGIC
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
