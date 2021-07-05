Return-Path: <SRS0=nO3E=L5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BF3C07E99
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 11:26:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A4F61279
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 11:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77A4F61279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujjGJHI3KsaHmS8g4zJ8KeDOzTmEoG30lXNmDutiO5w=; b=CPf0RqcHwoXyQW
	hjt0RJYGIx61fYViSYCkbDK80m9D4Qj3b/n9wvIM3MhAYln9ckKLIw6Ze4dT2PTa1mChiycXg/ypx
	P4418LVnspVRGFS0Tbf6xj4fzi/MfG0BKMiYF3vD/iXJILVkwBLv4jToWwl1yXTJ9gXqP0YJIbWqa
	dUvuC5BZX2RmiOOcB1ZkjgceFpu8lYYKw+jHdA1dI1j5TZTLwj0aoRNSgNaJZoAXOmtbARJ5CERWc
	a+iH7gKBCLUEcZFLwfa6B9wRcnWy3oakmfBXDVsfEdfQ2Mp3e88/gNhbrSRgr10fzJeFzK3Yyxa67
	wMTPR21lr/RYc7ql6k2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Mk2-008lHf-Ey; Mon, 05 Jul 2021 11:26:22 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Mj9-008ku4-V4; Mon, 05 Jul 2021 11:25:29 +0000
Received: by mail-pg1-x529.google.com with SMTP id 62so9913148pgf.1;
 Mon, 05 Jul 2021 04:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iDZbinYJBWKM1QjowJRvhAhj+rc1HIs8nrrDeByCIeY=;
 b=VuxWpwsbKgYAKFhuGVNLXs7je8SG9X6q1H6wbk8lp4t/qrILYO5kdHg2ICNpJ2APeh
 2MJVw8RCI0JOGGa2XCpckN+6DqukkPjq9xoeS+dhWRnUE8k7jDOk0X7OkRGe3UyanIT3
 muEqU6QJy3GnccAEOK8WAlHelNBUJLibdMJcEn2SnGkrbS8ofFAG1F1hQY7UZK+xeDZY
 0daz8WqxPW0RHyBUOOZxHkZxvuT6ze++UIS6LxDq1n2cxaP36IjLjds87/uX7LJAM6Zw
 pPEdOSrqt35VYFY6iplmAXsbphx2KFa+gnNyxaOP0s3CJrXv3lwHXnB7wAJwl3dxLjID
 8z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iDZbinYJBWKM1QjowJRvhAhj+rc1HIs8nrrDeByCIeY=;
 b=PtwfBLq6ixnLc1MRjTDrOZQoINDqsE1q+/sYQ0KTefVN3OS87rC4oajy8FgQbDmnvI
 I510O5xFsfx59F5MwBUyAc3e4lnA0O4MwwmZ5ZUBKpeISHczvAllg9oC8lv7LcapP2ef
 fTu48U+NJC69nJkNMB6P7IFKABhg5EpexM7emTLOGJYMszsjm4I9K0qPDFsCpkhQAlST
 k4L303nkyF3MlcLOoPKDXW61+BZOSJ9tqSIWZngxHwi/w5r9ldbUzCxH3dbh6eHlYIWg
 94VcUx1If6oco7fyB17Q+owp3yauYS8MPRU4YqwySnrzWdtQFEtSrR1Qu+zoyeXuuUVp
 NY6A==
X-Gm-Message-State: AOAM533dZZUU0+C1FmEuHQn/By2xim0xrvVP1gWtTYosN285XvIXzBTq
 EyvuVs/BbK5WNXqeGpacsrxYWtoyrB4=
X-Google-Smtp-Source: ABdhPJwwtQ8dB2Fr98yk4I1qmSxeeG1/V2KPB7XAz9bCOD8IjFSkA/KsL2Fcd9dPnqTiNv15KycztA==
X-Received: by 2002:a63:5156:: with SMTP id r22mr15594368pgl.264.1625484326680; 
 Mon, 05 Jul 2021 04:25:26 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id gi20sm20976959pjb.20.2021.07.05.04.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 04:25:26 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org
Subject: [PATCHv2 2/3] ARM: dts: meson8b: mxq: Fix the pwm regulator supply
 properties
Date: Mon,  5 Jul 2021 11:23:54 +0000
Message-Id: <20210705112358.3554-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705112358.3554-1-linux.amoon@gmail.com>
References: <20210705112358.3554-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_042528_033066_BD720C26 
X-CRM114-Status: GOOD (  12.18  )
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

After enabling CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
Changes help link VCCK and VDDEE pwm regulator to 5V regulator supply
instead of dummy regulator.
Add missing pwm-supply for regulator-vcck regulator node.

[    7.117140] pwm-regulator regulator-vcck: Looking up pwm-supply from device tree
[    7.117153] pwm-regulator regulator-vcck: Looking up pwm-supply property in node /regulator-vcck failed
[    7.117184] VCCK: supplied by regulator-dummy
[    7.117194] regulator-dummy: could not add device link regulator.8: -ENOENT
[    7.117266] VCCK: 860 <--> 1140 mV at 986 mV, enabled
[    7.118498] VDDEE: will resolve supply early: pwm
[    7.118515] pwm-regulator regulator-vddee: Looking up pwm-supply from device tree
[    7.118526] pwm-regulator regulator-vddee: Looking up pwm-supply property in node /regulator-vddee failed
[    7.118553] VDDEE: supplied by regulator-dummy
[    7.118563] regulator-dummy: could not add device link regulator.9: -ENOENT

Fixes: dee51cd0d2e8 ("ARM: dts: meson8b: mxq: add the VDDEE regulator")
Fixes: d94f60e3dfa0 ("ARM: dts: meson8b: mxq: improve support for the TRONFY MXQ S805")

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V1 - New patch in this series
---
 arch/arm/boot/dts/meson8b-mxq.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8b-mxq.dts b/arch/arm/boot/dts/meson8b-mxq.dts
index f3937d55472d..7adedd3258c3 100644
--- a/arch/arm/boot/dts/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/meson8b-mxq.dts
@@ -34,6 +34,8 @@ vcck: regulator-vcck {
 		regulator-min-microvolt = <860000>;
 		regulator-max-microvolt = <1140000>;
 
+		pwm-supply = <&vcc_5v>;
+
 		pwms = <&pwm_cd 0 1148 0>;
 		pwm-dutycycle-range = <100 0>;
 
@@ -79,7 +81,7 @@ vddee: regulator-vddee {
 		regulator-min-microvolt = <860000>;
 		regulator-max-microvolt = <1140000>;
 
-		vin-supply = <&vcc_5v>;
+		pwm-supply = <&vcc_5v>;
 
 		pwms = <&pwm_cd 1 1148 0>;
 		pwm-dutycycle-range = <100 0>;
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
