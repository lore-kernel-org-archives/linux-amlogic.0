Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822E8C48BF6
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANkYrWcCfUnIZmrLiGHYZvJKa8CO+aegWeeXAaUQEHc=; b=Trd2ONaE+r+sO7
	JHkfzj0WZ2ZIWT2YyAv+YAtVdHsQUJeTT5Vx3cR8rwjRtmIZ41VsjzrHHGHy0yHXAFWgNdEUYvMke
	tWg9PMpO/2kDfIOEfLWdFRjwmy/mBzvQYiELFEujwGyyTFf/lw6aT4JzFLwhFciRYKB6vp8uJTky/
	UONFsuNWVBM8Az3NyDRTBSoV3oCF3XiLZtP91JvZdmKOnSUdk3OmunOtTcLmfAgOSsu34JD1VUG8s
	Fm7Z2vy8oBthC/eKnSiMW87G0p5S7zDUFI8mpxIp1C72hBH16pcaC+kgHcMkM0DAHOFWbuPtlsBF5
	5Xmu/62VcaxuOGvZO7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbfDa-00000007bEk-2LdZ;
	Sun, 18 Feb 2024 11:20:22 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbfDV-00000007bBx-3NLA;
	Sun, 18 Feb 2024 11:20:20 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5640fef9fa6so1994250a12.0;
        Sun, 18 Feb 2024 03:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708255213; x=1708860013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPmTNE6EQgfeRHYPjzRQvUwlTRq7in5uTwy6USAXPPo=;
        b=Absz8Cx7ZZ++KAn81H9K/4pALQKjXjy6p4sEbQJ0YH//cGn4+42yuVgxn5czK6YPaJ
         U6z68FWWLO8u9R8orixO9MFE4yqmKsXeslD7r7OHOptRZHxR6mnB7SuxKeonXcKtwA+E
         zxLF3ETfpmlJH0fJbXe2ssCgLFgvqoKg4d0fo62s8TdgUu+HnRIHKWiT2JPGMRusMmRr
         LNANI5hoc0b5L/APRAGSb3jp2mVdZ1du44sRjw4xI4gtLM0Rlp1LSHD0npA654nXdOME
         U9N6z+T6U02dNbE7x9wOHAmr7RGgDFc3iTrC25BQSJVO5G6O2BcFvfkOUzPzzoOq7YjD
         dNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708255213; x=1708860013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPmTNE6EQgfeRHYPjzRQvUwlTRq7in5uTwy6USAXPPo=;
        b=mW3zrIvvXBQOAOizSB9gxS1Lbkia9so/LR87KBK9vm2mVEcYJQogO16yqr9adXi4Mw
         QItHOn51NZi7SCtXK7IACFa7vYyCzSI9GZcnaJHkA4ppyNXR3SRgeS4bvQwrW1FnwUSI
         032TMSZ47T3hsv+Ods/2E4J3xJtsCMJ7H3r/vpU4TR1SXUKFZ/yScALVu7+wjCvfbPFe
         AMimm1Z/6w5/DLJagVWFeqjLoQLUFFb3U6TD0hgV9pJR1fUdLY4/WqsGHzwaFl5biQUA
         mCpmJcNs+fXiWQMt3YJIGqu6eqTcQKePzes0HYe2nu+NChCd9bvMdnhx8mztzOeI8XWu
         pWoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpYGpwTYy6IiIipNbWRkn2J1D8zMmkqJSbnS7hcOZsaBt9py1vrmH/PcKuCqRf2EYWpIlI9Apai+rGQ2rtJ6reIVGYlQMYzjzQqZYj7+8/kKMbxUM=
X-Gm-Message-State: AOJu0YwQI7XIVJmlLOBA14kpfq5ccutBbjtC70JwTa1nUhFo3N7gdR2h
	2fXLtXXyMqXHkLTL3b2a+Usx+eFM/hfU4+n4j5hIxlMXj3QpuIDHh35Dloly
X-Google-Smtp-Source: AGHT+IHr9ZdbJztJjtjBHXqCE/IMhxSFhijBU0XuiX8iDIUv0acD2Fpa4u6xKvRiExVfnNHWhQraNA==
X-Received: by 2002:aa7:d7d9:0:b0:564:3b52:2293 with SMTP id e25-20020aa7d7d9000000b005643b522293mr1997873eds.24.1708255213606;
        Sun, 18 Feb 2024 03:20:13 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b37-4900-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7b37:4900::e63])
        by smtp.googlemail.com with ESMTPSA id di25-20020a056402319900b0056401eb3766sm1675190edb.29.2024.02.18.03.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 03:20:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 3/3] ARM: dts: meson8b: fix &hwrng node compatible string
Date: Sun, 18 Feb 2024 12:19:59 +0100
Message-ID: <20240218111959.1811676-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240218111959.1811676-1-martin.blumenstingl@googlemail.com>
References: <20240218111959.1811676-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_032017_894835_7E1DA63D 
X-CRM114-Status: GOOD (  11.46  )
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

There's no documentation for a "amlogic,meson8b-rng" compatible string.
Keep the default compatible string from meson.dtsi which is
"amlogic,meson-rng" (which is also documented).

This fixes a binding check error.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index 5198f5177c2c..2d9d24d3a95d 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -620,7 +620,6 @@ pwrc: power-controller {
 };
 
 &hwrng {
-	compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
 	clocks = <&clkc CLKID_RNG0>;
 	clock-names = "core";
 };
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
