Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECEFC04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:06:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C8B82081B
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tJbAafcU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Tgpo0w35"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C8B82081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qZDBoRhfTM7pHst8f6y9m58cIXz9jffcBTTQ5cMJV7E=; b=tJbAafcUGCNWhz
	mEVQ3aKaWFD8vuaMDvMOapZdM+9fthOOYr0qtRaE8EFwrgHHgwtdNJMfp/thdYPXU3f+LB72UcPOg
	VRcVazB6jSnHuXg9ktcHlEmG4Yy67qnKUvKYJBu3DEDuSZwY4ZmO/UsIr8OB1P3p97klwCjXtqWdB
	RUZz1xN5fJil81Qpof55eNUS9KBtQOwWgb1xCrWAPWSgASqyGU6eOTEEQyhx57nQuMdZ0k8ZkSzCp
	4mU8igbG18UeRjLsaTdsWUqF8f/E1BY7zleDdQ8CwrsAGg4Uksbhm+RBQIzdH6Am5OTvUauxPogAH
	fhmm/k7gimDLOxA6qFbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUDCy-00065f-Rg; Tue, 04 Dec 2018 16:06:00 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUDCB-00040W-Fw
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 16:05:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id b14so2950970wru.12
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 08:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uh+PFowAKQvogk55Z+R1IT+39Udfd4McmTR0V+3GPZ4=;
 b=Tgpo0w351A+NwCYzBNdnWZAOVeqJWFCTcpvWB0p3zOeTBJbJUNV1f64MiQj/Z/Z+zB
 SBM6C7Qq2Y2CpiPgIrPFYoYKYszU51o9Svrc2TGLDDPw9Ae/z1Z4lg31gEN2mdNrr8qr
 NUHkOdZbEYJbIRtYEnBb7sjRtBQxHAzWxDAtznHGVauW8CRCY4MPIvnmvQOYHHzEqkqw
 asWy4pZ+OEAetBL96F9177ks00FSH6bYCk/41jWZSnitUC6leQzCZIiuv0XPCw2UCdxi
 hZueCqOwhEmxheJXR9DkSmt3pz4smEvLQpPIfKqSPlub9dvhHzyEogRXON+8AZmShZOU
 zb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uh+PFowAKQvogk55Z+R1IT+39Udfd4McmTR0V+3GPZ4=;
 b=Ph+nhmbJHiXBUj42xqh2yZRKERRQXCO4ZlH4VLPsj0I3lAh2bDhG6i7Sx1wG0ZYYB/
 GlzDwG2bqo8OYZKPtPJiAcz+K0HAubXiwuzMhOZeApyiX9MKJOAgZqBmOEw1toNwfmCD
 na0U2OY1IaAdcRqk610AvhlnxPsAuoA+uP2MzJCF27qzv/sTDahYMKfW80dTQk7s7n8a
 W9lsKciRuc7f+EEtLBC2sC7TFLAAinQ9OgKVIPkycF+YHYyEAs7fRDeDQtbanghzS35W
 PFc2nrApuKBAz6OEZXwla8Z5sHtzO5w64VpmjWzqXBMqM1G0UXqJREwhJ/ieyGpv8mXV
 4+VQ==
X-Gm-Message-State: AA+aEWbo7Ek6bY6v2w1K5ciYcokrS3TKjgzQcmBaTnjJoOKm9CWnKskH
 dAdg3/gWuSTz0uJaO41yhIc14A==
X-Google-Smtp-Source: AFSGD/W69SbVBEzXPJ5Dok89hkHxKl5xnN3f9nGN88KkxPwJLoxe71jaFvRaBYcldtoaOGz4/N4pLA==
X-Received: by 2002:adf:9d08:: with SMTP id k8mr19830153wre.203.1543939499579; 
 Tue, 04 Dec 2018 08:04:59 -0800 (PST)
Received: from xps.expressvpn ([2a00:23c4:f7a1:ce00:1581:6f5a:196:51f2])
 by smtp.gmail.com with ESMTPSA id k23sm5451585wmj.32.2018.12.04.08.04.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Dec 2018 08:04:58 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com
Subject: [PATCH 0/2] meson: Fix IRQ trigger type
Date: Tue,  4 Dec 2018 16:04:45 +0000
Message-Id: <20181204160447.27869-1-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_080511_586024_FD8C9EA5 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The wrong IRQ trigger type for the macirq was causing the connection
speed to drop after a few hours when stress testing the DUT. The fix
seems also to fix another long standing issue with EEE.

The fixes are tested on a AXG board but we think that the same fix is
valid also for all the others Amlogic SoC families.

Carlo Caione (2):
  arm64: dts: meson: Fix IRQ trigger type for macirq
  arm64: dts: meson: Remove eee-broken-1000t quirk

 arch/arm/boot/dts/meson.dtsi                        | 2 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts      | 1 -
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi          | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi           | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi   | 1 -
 7 files changed, 3 insertions(+), 7 deletions(-)

-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
