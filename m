Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E098C04AB1
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 09:17:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 119A120989
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 09:17:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJacmZTR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JKM4PKuC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 119A120989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHDP7HekHlTdCKwTenKbuUWphGuHH9HQULdBebCUOeI=; b=RJacmZTRpoTkjU
	FJ84VuGyNPMN911vrgOgDbIk8X4dFd47bIjC5btZ9U/xSqFmwD+Up6zlx9gm+q52aEk9S/9/j0L0j
	69NFJFM4FX7F5lfkHSsoiM+Bp2XhMgyl44JawM8O2fGq5Mi58kukA2Ej3drBmbw29oqDWXBzI5qHz
	4ZThherv1fNpiSSEh+iY/CE3lddXyswcoe7NccuKq83V9ks86JpGWWut1V4nmaQfH/OQNSeLRVFP/
	ROvrxr93/ZkNcPy8wYm3OIITubACNNLseemPGhuFMmhNqDUFFHsihkwUl7+ekjm7587mADJkyE4Gs
	PMuU+K1VCk7WgXcAf8DQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQ74n-0006Ft-Hy; Mon, 13 May 2019 09:16:53 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ740-0005CX-5v
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 09:16:06 +0000
Received: by mail-wr1-x441.google.com with SMTP id b18so4362447wrq.12
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6faxotKxNMmgIEg0wYpwPSJedZIS/jOCkKVr0/VGHk=;
 b=JKM4PKuCaOCDQfqA2xTNlavdxZlkF6bf304MnUe0AK98cMu+YsZwoEHHU6Gyb4MCxh
 MyV/8q/FLiltE2V7/QmvqWD58wtNQAi+MqKau9cxNs++gp9kk1lZtKX7elvt6+hoaPQi
 iHAkXMaBlqmE8VwHd2IZ6vow0QMtJhXvZ22yyMTBkiOhlve1+7YgopfkXZVtQrZoj4UG
 g9qc0sgf/IZHiXDEqz0avtcAFw43pGN79pIHdntZZs4J1KR05bmJ187h2JCToaUhzoyF
 M3vl4pLd8Jsmn+ai1iKRftj9doEFEuxccpB0Gi5WM/PxHAGdHmkzC7cct+Cat/P1EpKo
 jOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6faxotKxNMmgIEg0wYpwPSJedZIS/jOCkKVr0/VGHk=;
 b=pFXR86NLkaUSBEr/fy5NWGUd2zCkjH6yEl/DrQJFMVrjcuEzOJ87r9/fkfKV5BaYyO
 kWqfwUnLtiVTNjdClgzMTmA01ByY3bTjpHtTkAv7dEIbpI9piGdIGJi4zWPb/THb5kGr
 bTeHoELEBwrgOIqiqbT+hTyshh+nbiRPGWAT/bvYWSK3/+tbnposoi2WNAtYniyvGBza
 /hTSvn9HkXslVYMx3cot4QXoZRSU11/o/cITtf3Y+yL0Ewgu1PKQ59EDyrOhhPIEUmiy
 ekS1iYsG6+fIGBZ5E54P+HCI2O4fuoD5ViL84GdZqTqbGN3+3pmSTXE2XgW6ZOueeE9b
 k4fw==
X-Gm-Message-State: APjAAAWMfCDi8lhK2GLwxDniZVbksua32+LYOsM/HJhYs1mmusQ9YGEh
 XDPbWQ9tEfwYzp2tFZgHz0epNw==
X-Google-Smtp-Source: APXvYqzC09Q1cp1hmohfvhqGnWmyH+vzmsbzRdbFtc8M6lKAhRHTZLjSeXHo1+LmemD8Qh/4HPS08Q==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr5102548wru.17.1557738962449; 
 Mon, 13 May 2019 02:16:02 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g10sm10795091wrq.2.2019.05.13.02.16.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 13 May 2019 02:16:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org,
	khilman@baylibre.com
Subject: [PATCH 3/3] arm64: dts: meson-g12a: add ddr-access-quirk property to
 SDIO controller
Date: Mon, 13 May 2019 11:15:48 +0200
Message-Id: <20190513091548.16674-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190513091548.16674-1-narmstrong@baylibre.com>
References: <20190513091548.16674-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_021604_516370_1A507915 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, baylibre-upstreaming@groups.io,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A SDIO Controller has a bug preventing direct DDR access,
mark this specific controller with the amlogic,ddr-access-quirk property.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
 1 file changed, 1 insertion(+)

Kevin, the MMC node hasn't been sent yet, when the quirk bindings is
accepted, we will directly send the MMC modes with this property.

Nei

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 5cbfca00f5cf..d8b3441f0c45 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -1061,6 +1061,7 @@
 				 <&clkc CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_A>;
+			amlogic,ddr-access-quirk;
 		};
 
 		sd_emmc_b: sd@ffe05000 {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
