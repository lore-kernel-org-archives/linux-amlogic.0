Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C073EC25B50
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uafsg5vBBuFtGiVdujb03GczNt0V8Hh+whclpN3hpkI=; b=Nv5Vxzc27Kvg5k
	Y9iGBUXi+MaPdLjs9nUCwxlc83wmq72yzweXnK10Beu7vo0tvycthp9anIZSwyOX6PoZ+vnCaSPMJ
	HJR/CHCgjVAGXyIPvwD8+70l8hjGwIRhudGFSK3vKh6tVxM9QDOp6PPK0GpUs1NpRhl+8AXdXfz0T
	sPqUYIfPcaH5mmJoMEwX6nFQC9CKeub/hoImaJwZ8vVqS+ZznYpiQ4uub1t3foEJpj8u+yktPz/VN
	P2s5ob99ipiKaIX0xgg+dfrHPQgUfyHpBjNG+dSL2fBugXkpRbNoJNQdy6E4STB9SPQAzbGeBii1T
	oCmdQ5ACsp2bhmfcszDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHlK-003WYU-5d; Tue, 24 Jan 2023 11:46:50 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGdR-0039BC-4a
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 10:34:38 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h12so9407439wrv.10
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHJKEjRilp8mRaPerWa7dPp1FIIz68emRLTHzv0tFUM=;
        b=b5+zw97Sn1PkTyvEauJJ+UdsuR60bmf+b5L7fqHqvt6faZ5KCSg7jSYKaQ4FINf0Nx
         WOnCvQrZMVY0d76qmiDX7JP0Pc3ds1XIKybT80oQXhE/GBC9bRDuqkcRHJcCOoLNdLYT
         B5FvkvPHYOrT9sh/XwXB8RusdFpVAy2Mim+BCLOv0TbZUO8CBYGwVuctLgHLbVw1wsCv
         QMUEdwTud5CI1lVfoisS+l1wqmzs4beKWi9S4YZIDbOmFrdhDl9oORoLPbiG6fAYCKoj
         OaygFRWErcjFBwfa+cSq0JGnBpsD71SSAXgtiT7RhlOq614Xqfo42TeJh03R/09oftyj
         g95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHJKEjRilp8mRaPerWa7dPp1FIIz68emRLTHzv0tFUM=;
        b=vDnEDTaHIEP9sn0L2MyD710AzJo+/0/GLjigTw81BIL1hZPswvoqe90D7GBol7mzMU
         2uDbEu4rFNGIxNQxaIHpmhw65ojeltLUo1BE6MhkXl6nwEO9vJx9HYOfRiLQl2WHAMlb
         eXA4RxkulP2cxaJgcEiIAYmPnroGuCrUxJISO6rkWTpFq9Lmq31L/5KaZH6snzQzHtfy
         Ufl6E+4cWlgO3g36BycfXSILUhzX4DplsNaku7ifUjNSBGMa4hzh4LwGEZufei9bcmLO
         4w7ejF2rBH2KOHNWZQEcv6PJ5T4+fIG+JiwhvwwEWCX5VUH6q0FMgI3f1rIMTYbgH1h6
         keRw==
X-Gm-Message-State: AFqh2koLY7TlNnYLYoPslA3vwW+oyK76AktDJ8Fi6yzOTN0kOWHk6XNy
	DCpmcSDJbTpnWOtFrELP/ldzCg==
X-Google-Smtp-Source: AMrXdXs9Pb86KDUrM01Wgt4mguTTlkCTA9jd1adGiors3M7CTsWqXaoHUlqNYWRYWH9ipqtduCMSAw==
X-Received: by 2002:a5d:5a8f:0:b0:2be:53cc:ca5c with SMTP id bp15-20020a5d5a8f000000b002be53ccca5cmr15746127wrb.15.1674556476593;
        Tue, 24 Jan 2023 02:34:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:35 +0100
Subject: [PATCH 14/14] arm64: dts: amlogic: meson-g12b-odroid-go-ultra: fix
 rk818 pmic properties
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-14-44351528957e@linaro.org>
References: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
In-Reply-To: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_023437_250189_CFE6BEE7 
X-CRM114-Status: GOOD (  10.30  )
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

Fixes:
pmic@1c: '#clock-cells' is a required property
pmic@1c: 'switch-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

The switch supply is described by vcc9-supply per bindings documentation.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index 1e40709610c5..c8e5a0a42b89 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -381,6 +381,7 @@ rk818: pmic@1c {
 		reg = <0x1c>;
 		interrupt-parent = <&gpio_intc>;
 		interrupts = <7 IRQ_TYPE_LEVEL_LOW>; /* GPIOAO_7 */
+		#clock-cells = <1>;
 
 		vcc1-supply = <&vdd_sys>;
 		vcc2-supply = <&vdd_sys>;
@@ -391,7 +392,6 @@ rk818: pmic@1c {
 		vcc8-supply = <&vcc_2v3>;
 		vcc9-supply = <&vddao_3v3>;
 		boost-supply = <&vdd_sys>;
-		switch-supply = <&vdd_sys>;
 
 		regulators {
 			vddcpu_a: DCDC_REG1 {

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
