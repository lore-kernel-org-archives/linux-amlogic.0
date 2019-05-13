Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1E5C04AB1
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 13:26:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F2F208C2
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 13:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TyQJh9qE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="g8eRb+2Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11F2F208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X7RxkMu0CDkOV5/gILhUTqigK+DUO8ToLWQWL26trXg=; b=TyQJh9qEQcYLfm
	TkhdqIuZBpmYEpdlFMNxsPu9c9gDZj78Ld7wgDuJCd7cCp5wGbdxHdUACOY8IJ23AaNto/ToO1p+V
	9rUiPfj5zl9QQk0BZ1OuSmmC8WEu2DNP0f42NzRXnGQF6N38r0Z5IPAETZ0Og/xnEV/A68XvYCedE
	+x1Yb3bKeUK5C1ZGDUlUvpXlftp5i2/cyyfy1XUVKqYpUR9+dJW9sux7Gpl9VJu8G2wD/68PfUqXw
	0xl05AUNCPaZJ+TD5QeWErHMTwnEjVXkle1W9/3fWoe6Jy+b+y5yClpNvouLLnzJpj6tl1O6XMW/Y
	0g6UF4a4i2HWBjf5wU5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQAyb-0002qd-D6; Mon, 13 May 2019 13:26:45 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQAyX-0002px-W6
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 13:26:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id v11so15284885wru.5
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vPE3jxCO3dCQR+ybH4Gy+efpIpySYIwlVy/qEuYWDIY=;
 b=g8eRb+2Ye5bChbQzqB5uao6VM8WXp8fKutdZSzNyT+KSAaYvR0EequtAtjOPxZAiPW
 geHXsBfDa5q4YSH7jEEHce3pQ480eBTmAVgtGKTksz96oPgnZ9sDb3kXpi5Rxx7MUKD6
 Q7x8NplJmezylTtJYTzw8t+vhFN0VRk93+whQ/cIJgosstN6HundDjINH409Xu2RTNn3
 W92hgrAd/KiabsLQaEtIbKXWSlJ/2TIf3ueJ/qyec6sVPaMTV0YbGapLgU0Ywyh2VyVG
 g/hPZvO9EVWWi4Uj6JvDdoVSzzu4JMRcTe3JaLFMj9aZpBmxMV7NdK18KkQysCDvKryy
 29zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vPE3jxCO3dCQR+ybH4Gy+efpIpySYIwlVy/qEuYWDIY=;
 b=bkEwR0mQYbjgDHvCHKaFlY7JhJPStPZPqi95pp4semztyX1NJwgXm9HQrif/9CI97X
 /obUZZ2QioEEqrn+oK2fxxeXPUqIGhXwFTv8krR7LCu0h7WIqhBV0aFWze4ab7PfCDuw
 Iy6V53L+bBNAg8SxsHTkbHQuOlCU3n5+sRDGOecfKGeMGVIwQyO8VL1c4EaPjVbWaKYv
 0FNMSPjvhlKkrCddFnEoJlwIgk10FmvC0oIUHQ1qyXtNEhzlqMflqWRA1UbI/ZHbqNB+
 181DYwyBQA68zff8GrIx+JekcLoM49OUyfVxsLWLqqh1FbebMF7qE5KFUrzWhikmdopO
 nGOA==
X-Gm-Message-State: APjAAAXpWWg7ZtPz9mfjtj4dfj98vPHxyS9GIuuxIKV7UBLQRJrmLnI8
 6EGl+Zwax2CKzheAbWCE2QI4nw==
X-Google-Smtp-Source: APXvYqySFgPHBjr/wKnTqEBG02gIwRobVpzN22Zu5VUMEwIG0+8bMfpops6VWDvfUHaJpt3uXuot2g==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr18657626wrp.67.1557754000110; 
 Mon, 13 May 2019 06:26:40 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t13sm16400701wra.81.2019.05.13.06.26.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 06:26:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH/RFT] arm64: dts: meson: odroid-c2: add missing mmc modes
Date: Mon, 13 May 2019 15:26:27 +0200
Message-Id: <20190513132627.25149-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_062642_027685_D9EF4053 
X-CRM114-Status: GOOD (  13.73  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add sdcard uhs modes up to DDR50 and push eMMC up to 200Mhz
With the new tuning method, these modes appear to be stable

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 This particular board has always been painful when it comes to
 its eMMC modules. While testing the new tuning method introduced
 in the last cycle, I have not seen any issue with HS200@200Mhz.
 That being said, I only have the 16GB module.

 In the past, problems have been reported with other modules while
 it was fine on the one I have. Clearly, I don't have the full
 picture.

 Kevin, I don't know how you prefer to proceed. I am personally in
 no rush to see this applied. I'm sending this mainly to make sure
 it is shared and give people a chance to report issues.

 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 1cc9dc68ef00..5a139e7b1c60 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -255,6 +255,10 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-ddr50;
 	max-frequency = <100000000>;
 	disable-wp;
 
@@ -272,7 +276,7 @@
 	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <8>;
-	max-frequency = <100000000>;
+	max-frequency = <200000000>;
 	non-removable;
 	disable-wp;
 	cap-mmc-highspeed;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
