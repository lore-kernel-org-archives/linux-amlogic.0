Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB575606A324
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2026 23:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0EcLB6hs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=BaBsMro8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=L4svri4jvSCYc8XqUrAopfFXWCrDHs/Er7LZ3U60VtA=; b=0EcLB6hsssip8lhTsLvop2YO8o
	ASZKuB1e9bQLEUH4dzSHBFS6CVLMd9VP1ftdGyn6tDLCEPLGAXhNYi+VxQzAOdqcjr02PUD9RIfO/
	N/MpccRcKr4ssT13VzuQDxrmQOLkOF9BuMQ/zrH00GBOwKbDZwkqNVpgI+j3XPPCVcfa1xiw7AIxi
	h9Wc5nLGdDtRAdbZ2cCrb2eQdgw5ExQng2wzNpLwvIFXcXLVIBPuh4nvsg7fVpj4cY9Pr5E8lWa+3
	YCixb6t75T0s9V5D+dOQd5iqB4aI+PvIjif7puFxsc9wYK2uOy4RLr4xBVlRBdEBeEHErrBlvlGxr
	A42HE+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeqh-0000000FCr1-2GSk;
	Sun, 01 Nov 2026 23:20:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeqe-0000000FCq9-2EpO
	for linux-amlogic@lists.infradead.org;
	Sun, 01 Nov 2026 23:20:26 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so21974785e9.1
        for <linux-amlogic@lists.infradead.org>; Sun, 01 Nov 2026 15:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793575222; x=1794180022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMz7QH5hxHuI4HppoMOO6E5SNWmF8pkb67kqxTZZ+hI=;
        b=BaBsMro8FBF2AZZniu0HPnuyu1/85VznIGFIDb4nXBbz5KIetXkfDupNHcTkN4C1Ps
         V8QeJ3DAI7dpFyGypiO1mbB7No9MCWjDgM65A6b8RBAU1431hGcH5h1c9uXHn5c6hGW8
         GEmyWHYlkZfQS+VQi4rraY6SvKpdKoXcyKla98mjTglgzOKnhRi7hv32bBgrhI0alGnV
         52Yg9HmChXybnYD1xranhDGRYo6mFhWxeBR3/r3/6WcTfhwSQ9Isd1T749TyAfbTDuiK
         /dr5iI36CmRLeRwrK31DcWv4pFx+d0ZuVWFFYxN6ToNzqzFYca6DsOAakQBUMpxMumz5
         LTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793575222; x=1794180022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMz7QH5hxHuI4HppoMOO6E5SNWmF8pkb67kqxTZZ+hI=;
        b=FGPLaVMVCoWul0D2/3r6u6rtbbdFEWz+XpP/6oH8mw4+3sVFt5cLW2bTcrps/DDMD8
         aJeM+XZjIIWPjPvx/lRng0bpcBfVEnKO2x3H0wt6fIHywNGaJtjoPwIpOaxVNsZy4lLF
         k4o0ld+/yRMsSLR8FseyV2BgNgSEd4nn8ROBvTNSblCEQM6qXxJixAmpPCVQDU/fQNB7
         Kx8ShJnEmZwyv/1yY96w8EOm0+Mrb5AfDMvzav/ZIvPlvTUbSjWjwiEMjl2SUkY/iTQC
         yfdxqiuBd6JOGucaxetCYhl/vq05QleHWABzlkp/E5YzcEbKR9Nu6v6w2s/A2BzF1rvz
         pKqg==
X-Gm-Message-State: AFq9FYL2yeKFfVmmbzSMecKENHy2bveuP3KtLtjRJPcJw2yHHOceWWOg
	UNZGQV18dnqYH+9bnmx02J09KCQTXJnjz/6qGFDU0VkKNta/cl2nKKJ2DKcN3w==
X-Gm-Gg: AYBFou2MczhFENV9mjZ8sZrK8ZPill8skUElcNyEvSLkK9JZIYwjEEQt2jwptxHbyWZ
	eAYS3YAWzb2Je+AbmALAylzgT1GOVImUMFmtyrQQYbOznNuGBL4sHDawJgZ+F/iAIRPN1qpDRwm
	90LPnzFv/Oc/gtwCxtmOpSSVlgI/51MjDXmg7gnzZKpWtpsHN5dj9DHWRGVNJia3QnLwWXOprs9
	myyEofcTfwpHKYtoQhVS8BIg5HHrYBVmrJB33LnG1coESOOgJ+9LzfbFLHxX6ZnNAuNoAVz2NHR
	spc+0HwrFYwV6+aqocmtJ5WkBZBjpUIWbmIc/lP8AAX9xwxEmf82UnhjTtHJfGOnQDYvX1mjmn0
	SRswoG8q3DjCLJENl3gOcD3WIBMXY9y7YeK93kQGWnO74EMV1Msry45qmcYYS0Y3HfW9327UNAP
	O9Y1U4WYQPXMbEtq5HwpYY+wwO7/fa89G1P3vxUyHHf2xmZnMAqzgbEWYwB3RHPhFdwPbfkz6Qx
	B9392SG/1qcncPV+8E305/QsDBDHZ3by5lVCiv0BveevWSnwtgryyZ1S76wNAqzsbX6CU61n909
	u4ljkiZxB+wBBp9U9vaAhP6Oj9gxHlj1+ugwAx88zQ4oV3q8IDRKrTv7n9AW7d3q3FTFNr12xeX
	H1GlXUMGouM8kHfKDeGf+ZbsawnwRCOnte7EqcnFECiAVq7nXDjIbGfi/
X-Received: by 2002:a05:600c:470d:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4ac1899378bmr187344695e9.17.1793575222418;
        Sun, 01 Nov 2026 15:20:22 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-b1d0-8200-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:b1d0:8200:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm303691815e9.4.2026.11.01.15.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 15:20:21 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
Date: Mon,  2 Nov 2026 00:20:11 +0100
Message-ID: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_152024_567222_1DCF6D21 
X-CRM114-Status: GOOD (  10.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
identifying it as a Synopsys DWMAC 3.70a core.

Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8m2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8m2.dtsi b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
index 6725dd9fd825..cdc47ee1a233 100644
--- a/arch/arm/boot/dts/amlogic/meson8m2.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
@@ -25,7 +25,7 @@ canvas: video-lut@48 {
 };
 
 &ethmac {
-	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac";
+	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
 	reg = <0xc9410000 0x10000
 		0xc1108140 0x8>;
 	clocks = <&clkc CLKID_ETH>,
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
