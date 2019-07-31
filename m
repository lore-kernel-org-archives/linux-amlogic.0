Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D9EC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:41:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD58B206A2
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:41:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sqXZVusM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mQ/GItiV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD58B206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNlxkb1MmrQrYT0ETeWu4rSAQ2jchKcB36dX2NzsMTU=; b=sqXZVusMe6lxNr
	72k0R/kngpyqHlPRztUG6/dPeQmGPeuNzXFKn6YbncYt6XT59z35/KJWYT0qH3mwqJDaJe1JckBaC
	OSt4DsouuHvXKtlINKKtoEDG4XjKsrZG/qzX/mfdyk0d9993GTgDLFZXG0GwgJ5HMTWCGtmSmyxO7
	kLgvoWBIpU9sEW0HvmBCgCEdJo0xGLUjrrrLOIW842gjvqIcyJ8KF9G2PHNquUpMIxvBTaO9xB48l
	xNP0HBaLRw6P+mRJn6qYe0gxIIl8KBByqaIM26fbauMlzcUgZZVNGAbqYDiiaBmHmh6TrVFOJCCD6
	sye0l40G/2oh8i+SrMOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hskBF-0007Eu-25; Wed, 31 Jul 2019 08:41:53 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsk9r-000624-EL
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 08:40:30 +0000
Received: by mail-wr1-x442.google.com with SMTP id x4so15530541wrt.6
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 01:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=75XNmhFNb9+dcVa4YPmR0y+UGapfOVB2uryDAdPU4o4=;
 b=mQ/GItiV/jIekXUfQF4MaKyeF2xxU5ZvV65tC6WZtOplsowpKXAcaU2ed76arFJ2HF
 FRrWiFna/EnHvHxzgRZqv/+XpaJ27aSEQLNVHv0fTRsStQlfzxlUE31f7kYDoDoGEM2+
 LR1I6fEfN+WigiRr1yzP2X2YunGiuAh4/Ya265Ada7lN82hSuP0n9z8pIs/wPGx3F5AV
 AcivDHZutEmkStVMWqMtfAEqbMTZG0dN9LyQ7aoN3T4h3BlZSMLDbguHvRT3ydv2nQSU
 Uaf4bN0q+oQm12t0bypww0qe//veBeJZ9glvWslrbP1JBZQIW7BrI4CZULyhUkGiY0xF
 EiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=75XNmhFNb9+dcVa4YPmR0y+UGapfOVB2uryDAdPU4o4=;
 b=F8bJ50qf24D4fwadft/VUJXJOhbie1/OZo1rVfsllKZfgfiSVqvGsEVNLTly2EfVOU
 pQPkOIxX4kJ20Y23mQpMFJKohfj5RgaLjKV8J6koGGmkFZSuo7ygn+3MxSYN+IA3kMB8
 Z9/b/vBX4eTGT1MS0uRa6LjEUmq3IdXkbG1xvqy17CE08Ndgws6c5/Cu46oa58aJNUDn
 A3meQrA4YnwI1eLbub98vU4UsAasMRzvN2TMa8hfn+K+d52owH2QP291F22OVXDCHtiU
 j+78hiULDaWCNXDjwEG+CYU0mypAk9edy1YTKWVgO/XF9L39/Ku/fxLEljwXDkFyY/SI
 A6qA==
X-Gm-Message-State: APjAAAXtywL2u605ujXS1zlRbCq2WMVMIQRcVvh4WDeRyNaClxHy1RVq
 Mqjos+Zac9JNGjgzjaVOqQgHqw==
X-Google-Smtp-Source: APXvYqyi4k1XS4obufEQe9GPrtTQh4Ldosu/Cj3LUEjIEn/ydGYaGOvK4niO7KpZnRyZkkeRGMiirg==
X-Received: by 2002:adf:f04d:: with SMTP id t13mr17572698wro.133.1564562426143; 
 Wed, 31 Jul 2019 01:40:26 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 18sm56049308wmg.43.2019.07.31.01.40.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 01:40:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 4/4] clk: meson: g12a: expose CPUB clock ID for G12B
Date: Wed, 31 Jul 2019 10:40:19 +0200
Message-Id: <20190731084019.8451-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731084019.8451-1-narmstrong@baylibre.com>
References: <20190731084019.8451-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_014027_485420_44609092 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Expose the CPUB clock id to add DVFS to the second CPU cluster of
the Amlogic G12B SoC.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.h              | 1 -
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index c8aed31fbe17..559a34cfdfeb 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -216,7 +216,6 @@
 #define CLKID_CPUB_CLK_DYN1_DIV			221
 #define CLKID_CPUB_CLK_DYN1			222
 #define CLKID_CPUB_CLK_DYN			223
-#define CLKID_CPUB_CLK				224
 #define CLKID_CPUB_CLK_DIV16_EN			225
 #define CLKID_CPUB_CLK_DIV16			226
 #define CLKID_CPUB_CLK_DIV2			227
diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index b6b127e45634..8ccc29ac7a72 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -137,5 +137,6 @@
 #define CLKID_VDEC_HEVC				207
 #define CLKID_VDEC_HEVCF			210
 #define CLKID_TS				212
+#define CLKID_CPUB_CLK				224
 
 #endif /* __G12A_CLKC_H */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
