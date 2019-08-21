Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63952C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:23:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 357A422D6D
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:23:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hzvYOzJR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hH5RdNmj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 357A422D6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJ72FhgDoG+LpjL0yQRJ9LUA6kOflqTAbDQ1bQl0BFY=; b=hzvYOzJRhqOnRT
	ItW4bSmA2VfOXCpBBKTBQcqVcbXyozEsTNiMgOtq45K3W/BA5bD+6wobqtB+5T85lhgziSokdgpdz
	qd/8FATyjaB8TNraML2CREy6AA3/E450ZpsrRAuAtkpehjx0FtlbChz37f0pS6vVxWw2LPWy2RSfM
	FFv7HnSe5J6MGH8ZgTJH+TtGabSObWFTFzDaCyqTi6VYpcGXsy7SBESKN+nU10lwM8EMqcj4EUXEw
	a2X2RdoOqQh9Dam8fEn/G05keIa0zgz47zKFYur4dOs3U1+S9TJGE20DYwnWIqNElgjoUTkfpdBXl
	6MGIWZ1dZlfh/EZuaZCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0RW6-0000fY-Iz; Wed, 21 Aug 2019 14:23:14 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0RTx-0006l5-FB
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 14:21:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id j16so2220731wrr.8
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YiVmfKlzhX6+dDL5MvsL5C8YsLLtVButKhe8QPNlosA=;
 b=hH5RdNmjJBT3vYOf4J5894Cvw2Zmb84ZuGMO502LyGx4AnTAzCTn1v+kpKBzaQfura
 AwEbyduOMk/aWyY/Zy3wXKW3463ceYmpLBoIJJy5YmTjGkXAhGFcICtFKM/BRZAki9sq
 wQ2YmFDn/UgZL3s2JQVi0vgJ9oAce7Kg5LJvclONdqBz0QAWa4mIvSMyHEY6jMAL/A8X
 5AW7uC2J3FYKYcnlANlVpvV+ZhKit5y5AMmfy36Axbez3TT6ZTMWyDaZk61htlibFy9m
 PGeKgpC0BE9aA4ZeAp5HRRDl1AaPRVnb6uBW59ssn0VvqUFgiLIflcj7A9Wiqqq3YmSW
 6JMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YiVmfKlzhX6+dDL5MvsL5C8YsLLtVButKhe8QPNlosA=;
 b=V/7UDBiQ+zgs9Ur6YLv/RM29heVEAzjLyHYo3B6gfgn49euP6PWAUckD67ff5Mufa9
 iCDgNIk+gvHyDxfLHhXSRMGrC9AqVq2mPWggq7N7qItIDpe1JPCZfIxAvm85wjrHJ1Rd
 STxjpFxrB6gIaSTDxu2evk005E5dJ8tcSLtH/W9wastzmhQjnUrjrGtrDYfXg07e5Iab
 vodCSsgjBBNs/PrCuKRbRqMPat2RZ8VCOy2ClFFso1Ie6vxCELUB3dIT8dWrjPGh16ly
 TaXQIV5Pbwgs5MmltwS4lDlTAIQF9Aui8TL4EhDarWd4WjsF9SeVpwxHUKQ24fhostVw
 1PSQ==
X-Gm-Message-State: APjAAAXvBJ/sD/aDRCLHduFtzSoVGwO1nKtgkoDIFI6jXU8xkakUnyzT
 +McZTPEutFwgBLlL1yIzB7GW0BRokXtV1g==
X-Google-Smtp-Source: APXvYqytA+IeL/TCAscedhtLS8+0EAHXjl0jLspWbuKk28WrOv8yxzZKMrlxagIGQlNyH/+Yr4ns8g==
X-Received: by 2002:a05:6000:4f:: with SMTP id
 k15mr4084382wrx.221.1566397260022; 
 Wed, 21 Aug 2019 07:21:00 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o9sm33418939wrm.88.2019.08.21.07.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 07:20:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 06/14] arm64: dts: meson-gx: fix mhu compatible
Date: Wed, 21 Aug 2019 16:20:35 +0200
Message-Id: <20190821142043.14649-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821142043.14649-1-narmstrong@baylibre.com>
References: <20190821142043.14649-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_072101_598312_9D733EC4 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxbb-nanopi-k2.dt.yaml: mailbox@404: compatible:0: 'amlogic,meson-gx-mhu' is not one of ['amlogic,meson-gxbb-mhu']
meson-gxl-s805x-libretech-ac.dt.yaml: mailbox@404: compatible:0: 'amlogic,meson-gx-mhu' is not one of ['amlogic,meson-gxbb-mhu']

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 00215ece17c8..d8127f863b55 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -476,7 +476,7 @@
 			};
 
 			mailbox: mailbox@404 {
-				compatible = "amlogic,meson-gx-mhu", "amlogic,meson-gxbb-mhu";
+				compatible = "amlogic,meson-gxbb-mhu";
 				reg = <0 0x404 0 0x4c>;
 				interrupts = <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
 					     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
