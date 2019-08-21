Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4461AC3A5A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:22:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C8822D6D
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:22:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ki8vj/Hj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qe/OLHqY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C8822D6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jW63hlzS/3LtbKUPZiO9D0yy2J2sgva37stos5LDVc=; b=Ki8vj/Hj6SOiie
	Nw+a2k8uZZbfleHi+zmM7E/aMIL5gpFTL79oYBFXFXOsLG/dcKG8OTrLF9MuejEHqSNP/cQUtYh2i
	Ha6xRxEKwXjufTM0Qz/0zprW1zUrKExlPq5QDoAABQVM8qn4W5W7NL+2KJrOKua5TzfnAPjk5mVHt
	zxuvJapmwV5OaQOiA/K1OcaEnaZ/+UVVd8pA9g5GLxzM+rVRKq5JORYOssV85Y6+JoghEHtVqdmTn
	fpA8Xb34dvz4ItB55t2gvCRpSWWemjjVGLzfOUcRb6Yw/S1ilbb2w3c/RrWZ7zaNUUXkpGOYhkzDq
	sZBu9RdHuIgI2AijgWgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0RVX-0008Qu-VG; Wed, 21 Aug 2019 14:22:40 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0RTw-0006k0-TL
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 14:21:02 +0000
Received: by mail-wr1-x441.google.com with SMTP id t16so2231131wra.6
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VmjppQ9kSJIbmhrJG4zlGsF2GtCs0UQY5wgxZMdQ2C8=;
 b=qe/OLHqYfp7Cha4Xtsn+k5Rie/1zqnA6BkAn3UbobgKnv99doCcDfCsT9raoT3DwWT
 Duhbp2Hwv0aRCwQfhGw5tpmTAmWOdGnULdiMCy1yEbqByk2k1lKkTFiC7zmAO5gUqxAP
 3Et7hXC7VNpt42QmpSkjWQEYIJAM8GvqXKv5Ho5g04tcn1eIaUVzTQ5NKz0E373InoI3
 zRHRK62m8CFRYBP7dJloJs3OSI4her46DbZH5FpPa/cYLZKzTHBAt6dzB1I/84vjA3rH
 wJoKT6EGUV2Ye9SNj2kpA9pguKVzpJndsNGqN45Lle5YHxz651jNSUvzeGORzqbmC9JL
 aFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VmjppQ9kSJIbmhrJG4zlGsF2GtCs0UQY5wgxZMdQ2C8=;
 b=KLNYRqLamNy4Cvu8wla9Kgl0GHxfpIVACrqCffU3FaVnA5YiMCAAFRzbYxaTbVyzvU
 t5FQGoH0wtji7JB8ETpBXtitfrMjdUoDz1JyXlcCd1Dvy2ZFP1vmfi/I4UPbfctHEM/o
 TrBaibgyp3LXL2IPfOpZlopt3bOC4I+oVxRuC9mx6eAONQAW6sC9qhmdv8VhukgtVX0d
 om209FwMFzJ3/Pf3UqW3NF+c7ITZCXFPhQ4TIl7BdDyemxrSJ32+2f0DLCM9ruT2nP3P
 0s21jt55h+GbnKOnr51LScLDZ3B+hiDfOCU8R4PHdiZTD1txPjGaCwtPrlmGsjQUlDkC
 GVFA==
X-Gm-Message-State: APjAAAXb1VoxIfgXhuX7xdem3ZkzwV9OqMwum3ig8wY4BTO4iqBvubsG
 eElg7a0/FnJNNtdCpHpmjM5XH8rW3m/3Iw==
X-Google-Smtp-Source: APXvYqyuJkv1+UxkiRrWbP6jf1b1y5tgQuhS+XTokxV95Wiw+0BUZP4OEBBqYv5ZWcVHzVadhPsHZw==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr688501wrn.264.1566397259055;
 Wed, 21 Aug 2019 07:20:59 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o9sm33418939wrm.88.2019.08.21.07.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 07:20:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 05/14] arm64: dts: meson-gx: fix watchdog compatible
Date: Wed, 21 Aug 2019 16:20:34 +0200
Message-Id: <20190821142043.14649-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821142043.14649-1-narmstrong@baylibre.com>
References: <20190821142043.14649-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_072100_979605_128B07F5 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxbb-nanopi-k2.dt.yaml: watchdog@98d0: compatible:0: 'amlogic,meson-gx-wdt' is not one of ['amlogic,meson-gxbb-wdt']
meson-gxl-s805x-libretech-ac.dt.yaml: watchdog@98d0: compatible:0: 'amlogic,meson-gx-wdt' is not one of ['amlogic,meson-gxbb-wdt']

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index e2cdc9fce21c..00215ece17c8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -325,7 +325,7 @@
 			};
 
 			watchdog@98d0 {
-				compatible = "amlogic,meson-gx-wdt", "amlogic,meson-gxbb-wdt";
+				compatible = "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
