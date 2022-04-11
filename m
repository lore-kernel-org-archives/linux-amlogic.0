Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE72C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FwtuTa2GNbD6wZv+nr/bvLRwmiVzaKcTKbqvWvMQ9Yg=; b=VrvDOBZvTD/mFt
	KMoAGPS+6s055IyXpr1rhphhZmoRqTDTXNr20mJLaiBrOR/uBmG+RFrQRguqGA6quw0EB/xrkitOM
	mFc0GHVCvuKlk2lQOz7NBDxkuajqugHfZvgBIIw7+b0lBmwZKo/tyBjO760LBLlVmAYItqF+cY0FL
	ElTCDUuzGT8FToZhsXXqfleBf5vzlP3qtJmSc7NGfm0kx9z9MrwtgtYR12estwcueAL2gRV3aOlOp
	Z/wvqiJZynWrKWBXTfbV/z5BWp8c/cHNg0qG62xvdfHrGIgN60rliTyVA2fJUN5OVG1/z4wZLddcR
	xYvTbo1cjVpC8zMlR8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndvHk-009QkH-S6; Mon, 11 Apr 2022 14:44:56 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndvHi-009Qjb-8p
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 14:44:55 +0000
Received: by mail-qt1-x833.google.com with SMTP id t7so16316024qta.10
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prism19-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1UnSeorzrHp2ShcLAoDvVpITCICkDvr9NW1j4ZfpG8o=;
 b=7v/UEtR1eSUjf3DjrG6u5oSFQ6lybW47MzaZKUelNTbLzOG1QvyInnxaSFl5rtC0CN
 l6IhVaQowoZCAU10b9xsSe++yByur/nfWa2svgVxpuSOmtnlhWeBsxeTIN5+eHYLRADV
 W5g1ztwzDF2fpR9ZSVvc6dAEw4Eg6QnaglPJlXLy54l8tKQ/mnIJi63ntzATYsP5W1kX
 uPPEg9LdDHn+pPK0CobPaiosNuw/HsD67UlYcabR3d4d3e8Q5HtKLh8seKU/T2uYPViW
 M8arc0GGwOL8I3syiQdJIpbu1fcNO1DsGU2vvjaTogVUuX6/hFOfmhK/YCqZ68IOTZcH
 idjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1UnSeorzrHp2ShcLAoDvVpITCICkDvr9NW1j4ZfpG8o=;
 b=cPqH+g6xD8kObc9ypTkElTjk5AO7z1DnB3FMfWbPol2lgjvYR/DbCba+xryODbxwZ0
 x3lf/A/b5fMyNoWyv0+CsLsmgO1JD7LI7FgAslrN2FmMQPgzLLFpS5y0OOHFIvREAmen
 OW/lQ2hEq5AfOsLmvbjsddqxo7+NX10VcS5QYzR9AtagUW3HgML58X1FjP111xm4nk4/
 3Xq9u5fSi6utuT0PVXBuVfRRawDT1YuhayUvqgs/gUbm+n1F6xiD4EnnHsGpYsRO/m2K
 X+sov8rjNzJCQBqstw/CDV7n5WCMZA+Yfe0USqPqWcqix1nHbLpicLVZ4YuUIvFXVjd8
 bfow==
X-Gm-Message-State: AOAM530cnhaBguOkKarCIOM/sFapgpRYzPlr0lH4xDpmQFS3BQTrjsxg
 wVNsHKopBjzLDgwmEwcUSKijBQ==
X-Google-Smtp-Source: ABdhPJx5N2Qv5BYEoOuxQsD/w2C/JE0G/XNbIZuMEzcNJoIliG30Af7PXQCTDUltVgUxF5mB8376mA==
X-Received: by 2002:ac8:5906:0:b0:2e1:c1ef:2085 with SMTP id
 6-20020ac85906000000b002e1c1ef2085mr25952476qty.170.1649688293019; 
 Mon, 11 Apr 2022 07:44:53 -0700 (PDT)
Received: from RADIUM.localdomain
 (bras-base-mtrlpq2718w-grc-02-76-67-205-66.dsl.bell.ca. [76.67.205.66])
 by smtp.googlemail.com with ESMTPSA id
 i65-20020a379f44000000b0069a0d9eed43sm8158749qke.33.2022.04.11.07.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 07:44:52 -0700 (PDT)
From: Guillaume Giraudon <ggiraudon@prism19.com>
To: kernel-dev@prism19.com
Cc: ggiraudon@prism19.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin
 labeling for CON1
Date: Mon, 11 Apr 2022 10:44:28 -0400
Message-Id: <20220411144427.874-1-ggiraudon@prism19.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_074454_344648_7E8ED83F 
X-CRM114-Status: GOOD (  10.09  )
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

The labels for lines 61 through 84 on the periphs-banks were offset by 2.
2 lines are missing in the BOOT GPIO lines (contains 14, should be 16)
Added 2 empty entries in BOOT to realigned the rest of GPIO labels
to match the Banana Pi M5 schematics.

(Thanks to Neil Armstrong for the heads up on the position of the missing pins)

Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")

Signed-off-by: Guillaume Giraudon <ggiraudon@prism19.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index 5751c48620ed..84489525c75f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -437,6 +437,7 @@
 		"",
 		"eMMC_RST#", /* BOOT_12 */
 		"eMMC_DS", /* BOOT_13 */
+		"","",
 		/* GPIOC */
 		"SD_D0_B", /* GPIOC_0 */
 		"SD_D1_B", /* GPIOC_1 */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
