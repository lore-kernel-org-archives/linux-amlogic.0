Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C60C32753
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:33:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 941842083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="llA1x3vd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JeIke4j2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 941842083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCAdV3dy0KAVI1J/drfeGn44bBHdJKvkLdhPe68tYnM=; b=llA1x3vdck6B+Y
	JWkMVzAHBx7mkwEqM8KzhYNzKbqvbwd0SrymvA7Q84C3Su9s1OrcfV5iABr6LQrAi9mE9zp/0iede
	DSXu3KoY41PmrLRuxlxDb18PSjV0tzBAKTMmmJV0efbZ8Ah+QSwmrREtATCRuQmDeEPTQp09imY0B
	ym8t8qss9a4Nz6Q60XateiHxvc/82pW1xcyCejEszY0oFq6dX+GZ1avEX7SDpUTsztI6Tr8hN4fFx
	GXjU2g0+RTfTNhWK7pJ2rXdOA4tf0LSdxFK3Fn4792lNi8iPbCsWXKX1D55+Mlrk5iKIfroDJbE5f
	hmvvYQwsKd6DVaZpT/CA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuLG-0007vK-Po; Wed, 14 Aug 2019 14:33:34 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxuHS-0002mJ-6x
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:29:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id g67so4674900wme.1
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YgaOioBZlXiCl+6+Qenig7yRj93M4S2LcZjul0tGl00=;
 b=JeIke4j2+vBHiU/gxigtg0yTHMObUZbzehCSiQXx94BkdSyCEhiTVNLTTLwxQ5Xmi4
 oCV3XX2zi2KfuiTrK+nQKZWgLwzvfPQC8D5WUBEkT2xPw6pC7HKqeEu3jSeqLuLlVo53
 DCa2pJhNATJuCheITjlk6httU8tTwqF6DT5oPzPzXRT4BruyZ6WDoBabNEhKqfpKlctc
 WW2JB7Ema7hWWv+J7ygbqyVKCKXgogSg8EDSSnQ6Hiqp2X9pZOChQzWi+LPbhrgdpKON
 dBzEG3aETyEudLoUfo/N5X42uAjAKlvYZfCF4BGUQ0lUGWykLHriXpj5uCArXW49psOT
 cIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgaOioBZlXiCl+6+Qenig7yRj93M4S2LcZjul0tGl00=;
 b=WieiXQkGLgNffYVrZ9f62dIgwZuFr8Tf/oVgBCpLLZooMCy6VtLPd6APrvVpSUJTjt
 lUvZP5bD2UyoCqAr6p8Mj1cVXIzdQoJJWtaN7QqroI/rTtBXny7+1RiVFblczWI0mdsB
 lK/aPPKuUeg01ojBV9DDeFJJ13stZ5nNCALKCuXxrOeZeKJsCUEgfuWQuRe5KGjQgNTk
 WfvjhAAors/gp3Z3g8oL6+bUfie/tCV635iYfJJ2Ap7kX3PitgraG1sAIcHZQ3XlVO4K
 XAi7czYWs/E9tSMJBxrknQlCUtoo0xSjcE5YKFwq+Tbu0SXk+/QgKJ/LvZzPPZPATX0M
 Cxqw==
X-Gm-Message-State: APjAAAVMQx96yeW4BtmB+di/Z/I9n29E90kgBMyOk2P2cpchkAWUEbuU
 ooKN3xSLJ/LHc8HIeIlsr/j6sA==
X-Google-Smtp-Source: APXvYqyzIAp/InEQpA/Ec2lH8RrkSyLE8Ef6LLXUs3RtFpmU1+uYke3b4NG0Ke/GRABR+kSETfNBLw==
X-Received: by 2002:a05:600c:224c:: with SMTP id
 a12mr8832448wmm.12.1565792976746; 
 Wed, 14 Aug 2019 07:29:36 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o7sm4202908wmc.36.2019.08.14.07.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 07:29:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 13/14] arm64: dts: meson-gxbb-p201: fix snps,
 reset-delays-us format
Date: Wed, 14 Aug 2019 16:29:17 +0200
Message-Id: <20190814142918.11636-14-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814142918.11636-1-narmstrong@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_072938_493946_7CA1C4B0 
X-CRM114-Status: UNSURE (   9.70  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxbb-p201.dt.yaml: ethernet@c9410000: snps,reset-delays-us: [[0, 10000, 1000000]] is too short

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
index 56e0dd1ff55c..150a82f3b2d7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
@@ -21,6 +21,6 @@
 	phy-mode = "rmii";
 
 	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-delays-us = <0>, <10000>, <1000000>;
 	snps,reset-active-low;
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
