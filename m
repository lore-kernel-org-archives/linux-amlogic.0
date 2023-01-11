Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B89C63797
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 21:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prYxoLVkDDr7iL4Z2paSA18CAyLwxF8aPZ+FvfrG4/g=; b=ApXLpiyTdbkmLM
	tDto+ziEJiF2ZlsxvtgKaN2Mb/JJEtkyI6OuTptMNjQi6OZhBPav/WOsdKzBK10prja92POhXOUcn
	qnP4KZ0hiYYcm1L5vKuLFLGRXIxg9QXcU5X8JB49KTo+6wliObHgT/pkhV+oxKId5PFa5IA4tq7or
	9U4X6/eOez7Hpxi/WhIfZkJcWTYVr/c5XKUUeZ3sEPMQdZa0XXAs45FBcYYlkGBVJ7FzEoiky2Rus
	XOt+oxqmK8UTzat4MoOjP58NVdlN4G9rjMtC/XGTwEMeDoCRToJRw/Xg+h4FjYZ6Mzu2KPEL37hBa
	WqvefRT+Sf5LmtwhQjTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQp-00Cw6i-65; Wed, 11 Jan 2023 21:14:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQK-00CvrW-Vb; Wed, 11 Jan 2023 21:14:18 +0000
Received: by mail-ed1-x533.google.com with SMTP id 18so24218274edw.7;
        Wed, 11 Jan 2023 13:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3ffgqh6sqzCFOnSQzAbx/Vng8jdSqSKDyu1AqPh4tw=;
        b=OzWMFZTWvoaLsPg3PGx/APgihyI84avP7Eyt4gAuuRnm7L6xBhtZjoCZOrIUmySrVd
         rEKcxcjymDhYrhg3dhbLUeQiJjI5zWd6J7IN7MWp+biSEb+sJ3plomb9UwxJvnrUwv4L
         Eo/lKTrGazVt/3n0X2Gq1txGODo/IVrf063NfpG2QHOYOIQWmei5WABbD5JTAEpIrtvP
         rBG42wAtzH5KFpbFDQCyvZyzru738mWVV/dPaLsbRi7U6Ij6TfymAz6kxWd5C0dlOUxo
         P2XxPaMy7ks0yxC1ufBztibGGf/jS7B4Sn+xux2CCASqX/lIvNn9TZ0d8bYqTXRstvoU
         cF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3ffgqh6sqzCFOnSQzAbx/Vng8jdSqSKDyu1AqPh4tw=;
        b=JsFbidZe6ctJFbVmgWOakzt8soN10I2owSYvd8Zi2NcEmvVcFtYoWZ1DXFgwQoR7jx
         NZ18mLQ5GuCiX2Y3+YkYJvoHcx5uo0EDn9GDeET2GM1K0tSBzXMfUn/wNx4gWfpDZigH
         739toElyVweeDnwoD9bfeVIYO4UxFFrwSZC6Wtm66UKHuKesmz02e4SmnWiOINCSRQjV
         byXdDUgI7aMXt6AoM6MHGJ+8lWFXrbgrZ0lyR9KuMG+5OxVvSCYwN/b6BvK8ilxtWQB4
         x9cfToqAYPCCCtFDuUyDatwy95jGZVjhftYI0/4e9rIrBSMT61zbNBi3Eov8w539q+0l
         hfcA==
X-Gm-Message-State: AFqh2kpvVzA5lyY/Zh3LkmRtVk9SrGZ/kiijwthfCXbtnqxlfmKgsEPt
	kEh66F8gfEZIEREzdRRxPVO1/L4Hy3U=
X-Google-Smtp-Source: AMrXdXtTWEfU2lAtIwS819Tw/jmj+Jzz2ngqgL1nRGsmz0XMhLEC9/1Gwbvxjq4qbRTKWCSK34AZQg==
X-Received: by 2002:a05:6402:501f:b0:46c:a763:5889 with SMTP id p31-20020a056402501f00b0046ca7635889mr85705323eda.25.1673471654804;
        Wed, 11 Jan 2023 13:14:14 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7325-0300-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7325:300::e63])
        by smtp.googlemail.com with ESMTPSA id l4-20020a056402344400b004822681a671sm6485079edc.37.2023.01.11.13.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 13:14:14 -0800 (PST)
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
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 5/6] arm64: dts: meson-g12a: Fix internal Ethernet PHY unit name
Date: Wed, 11 Jan 2023 22:13:49 +0100
Message-Id: <20230111211350.1461860-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_131417_033703_51922257 
X-CRM114-Status: GOOD (  12.20  )
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

Documentation/devicetree/bindings/net/ethernet-phy.yaml defines that the
node name for Ethernet PHYs should match the following pattern:
  ^ethernet-phy(@[a-f0-9]+)?$

Replace the underscore with a hyphen to adhere to this binding.

Fixes: 280c17df8fbf ("arm64: dts: meson: g12a: add mdio multiplexer")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
changes from v1 -> v2:
- new patch

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 9dbd50820b1c..c95cf3afc666 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1694,7 +1694,7 @@ int_mdio: mdio@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					internal_ephy: ethernet_phy@8 {
+					internal_ephy: ethernet-phy@8 {
 						compatible = "ethernet-phy-id0180.3301",
 							     "ethernet-phy-ieee802.3-c22";
 						interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
