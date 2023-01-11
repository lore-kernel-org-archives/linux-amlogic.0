Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7ACC63797
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 21:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/45vFIP4I8Zyi2xmZsDfMe/CyU8nfYRoC6rZ+iumKMc=; b=CJ71+yJk2GLuwi
	SnyqNLxRXztue2v0JRsGJTXmLyheHBNAb6eLlvdVceB8kTaLfiiBRCHX8aVCYVaxnJ08UE1UOkkmx
	5tS6osdft52WHShU+uebQfy5qgQ/yirLUFoq4fwkHvexrzZGjay29bMH0tNHj9QYkzmHhL1gCoQ37
	tmgk650ECDiucM7qM8Y0R5d/cHl+6Ng/GHIutOD++g/hKDKugBhVyr1w/iH1/0EMnIS3rwgW5R2m2
	VjBM9kF2CLfW/FxujKnEqm/k7rQ7/03Qv7B+73dcnSGG8zwU+ulyv+8Sy7JcAgSJqfg4Nz/Er73PV
	B9luoonw1gSlhOpYf75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQf-00Cvzx-8x; Wed, 11 Jan 2023 21:14:37 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQJ-00Cvqm-To; Wed, 11 Jan 2023 21:14:17 +0000
Received: by mail-ed1-x536.google.com with SMTP id j16so24221607edw.11;
        Wed, 11 Jan 2023 13:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgmGHq+wF/nfzia7H7lvFLfbILv7rJsZCdugVo5WIaQ=;
        b=XiyRXezSdBqHop4xsub958Jt3NOyOQqHZtve1fccwUhYXTiZi/x3H8HMhEKq9t7yBR
         MmZmSFYzkWFw3aPscz+KUT3sYfEKYcnMVnSY9Qi4ToAWANNBOLBVop7U72AJzyJysv+R
         hFDDJ5c1D8nCw2bAqwX3LO7EiN4+k0cTUoYKsWUr10kVN3XNcpfCnOJ+g9u6NTYz4CBj
         qyuJFpF4Cuyvm1Y1dpZxC/OH2GOqs8gIMOYbU8qH25a72fukPtcWHw/LPyAXgt+3nETb
         /6420R/qwqymhrrNQpNYgwufaoRpQFw2HXGtxrIix2GJoyTm5+KoIglkqvyA1r76DX/n
         3vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgmGHq+wF/nfzia7H7lvFLfbILv7rJsZCdugVo5WIaQ=;
        b=KEwl9ds3futHXJCtB6mOrnBciECiEzL1JJfV59yISThFfpOTyvqULkEGGHio2Whe9J
         ngqBcQaPDxuGXqh3ESdnd0GwCWLsxwvWw/Ae2JNuKhFhZDfFKVVruhqeFD9sPK7v9tp/
         uCg+ikdLmCxQcgfGNrwBUP6oQYYkHO3z1zWduhYTRbRUBPvP08qNbEJ6KwzJv+b4IpN9
         sr6j2jtFlg6hkOuXuWkNPkU4JdjQJLKqpVEgxMrSaUWzeLtykDZFbxNmsHdpY8DQob2M
         430XIeaB60ndMJAXXQEUmByeUV+jw17T2WK/IK74h+80FPlduZ90WxbuBjmvphzF/Mht
         DUYg==
X-Gm-Message-State: AFqh2krRgk0HolTNQusPlmlXS31wm4x6QDi9m77KKf8exP53AUC3G7fU
	+PhuF3v3c2Bj4gkz4nvYB7YxiD/eYq8=
X-Google-Smtp-Source: AMrXdXvFC2b/WG9kEjTZm1HQHakHIgxX6A3R5/NVUOgN75NmOn4NLyqTQojI4TYuqMkCT6XGEm+8fA==
X-Received: by 2002:a05:6402:2a02:b0:470:44eb:9e58 with SMTP id ey2-20020a0564022a0200b0047044eb9e58mr66445495edb.30.1673471653661;
        Wed, 11 Jan 2023 13:14:13 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7325-0300-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7325:300::e63])
        by smtp.googlemail.com with ESMTPSA id l4-20020a056402344400b004822681a671sm6485079edc.37.2023.01.11.13.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 13:14:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Vyacheslav Bocharov <adeep@lexina.in>
Subject: [PATCH v2 4/6] arm64: dts: meson-gx: Fix Ethernet MAC address unit name
Date: Wed, 11 Jan 2023 22:13:48 +0100
Message-Id: <20230111211350.1461860-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_131415_975353_CD262D70 
X-CRM114-Status: GOOD (  12.15  )
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

Unit names should use hyphens instead of underscores to not cause
warnings.

Fixes: bfe59f92d306 ("ARM64: dts: amlogic: gxbb: Enable NVMEM")
Suggested-by: Vyacheslav Bocharov <adeep@lexina.in>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
changes from v1 -> v2:
- new patch

 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index e3c12e0be99d..f8b115cd6775 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -233,7 +233,7 @@ sn: sn@14 {
 			reg = <0x14 0x10>;
 		};
 
-		eth_mac: eth_mac@34 {
+		eth_mac: eth-mac@34 {
 			reg = <0x34 0x10>;
 		};
 
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
