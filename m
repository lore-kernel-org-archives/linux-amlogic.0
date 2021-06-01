Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195DDC4708F
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:03:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4A8961364
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4A8961364
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbIFlOIaVEpjzaKSBCKhtPEsx9Ddc/lNk9FcVbW4YFY=; b=EZ157dmO3waG4w
	yNiNPRqj5RQKAzzShVs5qD4k8RYyBpdSrQolDqK03EusL3DaNcseumP4GVn0mjpDMBDxsz1eeEiGy
	kBUrwnRx/7Qgp6unQRXToldw4RD8WMJWTbt2zKHOONzLjm0Vklzl+n3qbyk26hSZZ5Uek4qqTJxle
	/evjAUyGmORe/3YhxRXmAdX34cLcTUyhaPm5bpl8nXPUejvgI0uud9rK2aPMfxQ9DlWeheVOx4zRG
	lBSCDtlcP1V3GcUmgKWPYqXtVJfInKrApFHngoUib3CpNGEcTDU5z2PXlOeQim0YxaY4ObXrZGJ4B
	qzeq3GoDpk1V/cvtHsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo0Ij-00FUWQ-UW; Tue, 01 Jun 2021 09:03:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo0HY-00FU0b-8f
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 09:01:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id v23so11086526wrd.10
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 02:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M/EhBdL/mcwjthyCLjo7WM86qd4xvEeOPLsDx4c68dM=;
 b=brIgtgyXP5wH6/eJGW+yCKboXD+vUEy/oq8cVeFXz3/ICuFwChJgt1MD6QATwiWytj
 y8jK/aaF6VCfPE1jv8nN9X4CTB1cdDtehwv0Ug2TWFMfkY/ACJd4wunQNIw5DkrwlhHX
 8KXt2YOKyP6TWJyD+JdukwEOIawXI809cN21DeHtLQuIXPZC7JPQgrhHV58MzOy4mFvK
 B2tzlvTy1opf/ctFjWEBOwbSs+P/4YltrwwEWBJLJt1VcXaRkZtq8ZdCvVNJ1KbnsxTh
 HpqwXQDDGhQ1N6unhRwtPsMkiI8ZArx9kdFxzUFOsEmvvHjP+NkKD3uu6bnP21Pz22JW
 YRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/EhBdL/mcwjthyCLjo7WM86qd4xvEeOPLsDx4c68dM=;
 b=C3R2VH3uqZoh7VP6YckI08kzoz2NPwlXhW2Az17zg3XEwS0rNvhJ/wzVBjS2UsHpoG
 6LhTVaM0Sek094LgKoZNEOh6Tls+Cty20bbKxw99rPkrzl+Si2oWI9vyBJBAsDFcXs0j
 sw2q6Aec6c3QYOrIDAuPXbX42PIrilEJWSQTDFJctMOf1f3W2WDQrZj6SpQbD8BT6Tg1
 lG3o7JLwYkMryeJ9VVCMdZbsQNmjfR5q1G9WJyCCm4+sieEHx9WXTkAIJR6l7lVyUHvy
 YDPgoe6dnRH09ZZcRWkDGl2XKLVkz5GrEI09kUsBEuAU/xVtgr0ukHQiLKUm0R7HzTIT
 KT3w==
X-Gm-Message-State: AOAM533vdNSSTieLiVwT0GfAbf1yTup4TxS0Tj7hZr408j0k921AD/FM
 AWKGAQVYAuXKhBiHNHyZo6Uk1Q==
X-Google-Smtp-Source: ABdhPJwXhg802s5xEq9kaawNtBg4wA52SPsR6PFx/qF0B/gQ89XcZZ4uasLjdOblWXv0UD7QUklXsg==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr21836907wrr.374.1622538110933; 
 Tue, 01 Jun 2021 02:01:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id
 e17sm2668199wre.79.2021.06.01.02.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 02:01:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/6] arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0
Date: Tue,  1 Jun 2021 11:01:38 +0200
Message-Id: <20210601090140.261768-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601090140.261768-1-narmstrong@baylibre.com>
References: <20210601090140.261768-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=856; h=from:subject;
 bh=wmaKsMmGNI6Mptjhlh3CWm/GG+i5sUZ0+LOTljh2gmk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgtfc7TiwJuBdWNWz+GFjbrmG1iwLtkpiDhF8p9NNz
 lkUlPM6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYLX3OwAKCRB33NvayMhJ0dGHD/
 sF+s6vTMAe+c6LXAhuzTXJmf1LGY3Vxsw+/J1CaksxHDoIXmzLtGBikdOfMGRSZGgzv4xFI+ZPJJq3
 0Mahhc3EYNa7mNMT9jofX0Y475dgX9YFavsnMfvswiiB50tcKTXqNbM9J6Lm0xiHps010mqRaNnD4s
 NaLRxqcolX1mFcN5sPCGJ62bzV69EgquwtaI9ot6ddfR6X0kqFx8uOMQ5rtfxgQ+AGgzMmxkigNbPI
 OWuZgB/jvX3p3/WXQYSbNP4aPTatkS0rmaQA0B9NrlqeFs6gVzGYN/kZrBNiOZP0V7HMWxWWD5+NI3
 TJdhgWxIu850srjrzlvdP65mxA6mjmzZsjkUeDBCT4/Jz+5lAUGmtipd1cWrQJPrqoGjK+Sap03x/5
 bOTegFIrWQxp8GjpNKNvJ9EkoxkR++xpUhAP9GlJYU//4aZHTit+jAKKU0hq5G7C7ipYeIX+FqcYfo
 qcsfllNI3Yd2hwoqSsoKhLs/zk1wvVLSHLqP/ONJLS12aJhfvCG0G5w9b0hWn0aJUuuYgFLauVqjZf
 PXgK8/3DU7RJMsNRToUqEv7Js6BviSY+oUm/co/AUZcaWHDsh8QGr9fjIcdY7nNwpz8V3yw/Mia/Y/
 KFxg7EsMLn7LUHI3Lgy+kcxSuWdAaYnkz6pjAZV4A/Y7BoroMDcKfFomx2tg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_020152_318895_7BA2D875 
X-CRM114-Status: GOOD (  11.23  )
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

As described in the HC4 schematics, only the USB port B is used,
port A is left unconnected. Thus disable PHY0 and remove it from PHYs list.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index bf15700c4b15..0a34b658f994 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -91,6 +91,10 @@ &sd_emmc_c {
 };
 
 &usb {
-	phys = <&usb2_phy0>, <&usb2_phy1>;
-	phy-names = "usb2-phy0", "usb2-phy1";
+	phys = <&usb2_phy1>;
+	phy-names = "usb2-phy1";
+};
+
+&usb2_phy0 {
+	status = "disabled";
 };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
