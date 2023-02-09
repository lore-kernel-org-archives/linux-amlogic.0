Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F151C636D3
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 20:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeZBMW/Q2tqHyisfIqBBG35DEFgoFnPkKRzLzLE4MWk=; b=4a9ZqJrXraGv38
	0eeZ4inU6zgBit/QgkZkZEn5/RBb4jZ6/NeQ0lGGY62dMGEgIUzrCnBqAUeb7WsnYIrtbL6iSSYiz
	eHkwqQbF0txm/6SH/sLk/Q1qi9B9/lc+10w9oyjZ1EEJW/SnAinzIvJf6Sf4T02I7y01jTGEC7idS
	fFc50RjpnDVDqqiruwJ+eyYZEG8RK+7i0wmXLTTuCCfxU86W7T3NvO11+aqgwCBmPK5ZzBhywlQml
	lkACMsrFSTZWzaokN+OPFpD9srdSp/Jwh32XgnbyT3AQDW6V2YKAL1M/3aJl3SxOl3hyZa5POa8Zi
	Qa2lKKk3P6AIhAcFIg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDHH-003852-TR; Thu, 09 Feb 2023 20:12:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDH1-0037wv-NF; Thu, 09 Feb 2023 20:12:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so4755148wmb.2;
        Thu, 09 Feb 2023 12:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HX5+bsUoRcit21y2lZwuj3iAM0iGpU6sJ2wwTNOKg8k=;
        b=h8HQDOVhqCkZnNSCHwOdR5X+BsckmXM1D8mWvh5+dzp8Owq3bQgMHun4k1EHSs4IUg
         V9nUBri8JIYHOg8wf1Ab9iGA3hv8zDPrIezYs2OHYVS5m597I22IOcl1N7/391nBsufC
         L00na/rE8PutELxD/CkX3wgCfUM2cvCFahdjgCBIu30kTlfQTtchFV2rfiovtbIH+p8x
         oilT3wjfB4EN1AOX9V0zo2wcIm5Ajfry8H3GsWV4Y3ruAI47VQv4BYM1FoLN/EVbvQMe
         kZ9cW+znnz1OKJfa9HQDx6w8wCm32iMn4hdTFIRYui0LQqRpLPvQacJbDMZr4kvpxDx0
         3wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HX5+bsUoRcit21y2lZwuj3iAM0iGpU6sJ2wwTNOKg8k=;
        b=lR4TW4ojNyTFR0lofSIK0WLIXO1I6sDiXMSOItbu9HDSUgcPnGFsa+q0sobEUpYvZe
         0SSBckJh0wC6NrX5Uf1qVPEGx+rIp9Zqpetn8PqhowqnXPwAgyTGMTgoJkYKTZ2bD5gB
         n6uMWqmcrdgVckZxzm6s5S6HFcvCjC3a1UOhN1WET2ZZ6WHS8vzYQy03Llzvmv0hXz8i
         bI4R1fctBMID9Pnwg99cEme1ij7F1zYZlagDUkx7Kve1iG/C+81AR/zU8zMMtjUoJh5G
         0tjhNbje3etRfm1ds0jLQWpp7VTmytI0ht4GkYgNOlnEyF+qN9Gk+H/PflrYAAOxjcKQ
         78ug==
X-Gm-Message-State: AO0yUKWrdw6+52oQZJsuo8hQxQ76UOIz7WCgvVlEMXDINYaqOGN0l/Sd
	tSl8VMa+cosOXT1SJqxx5Ww=
X-Google-Smtp-Source: AK7set9Qf/KKD6IPbprjTnoDTiu7VisN5LhPrRzFk/J5OaSlofn7lmmuY+VABs2zUXD77fd2S/u0NA==
X-Received: by 2002:a05:600c:3c9c:b0:3dc:d5b:5f6a with SMTP id bg28-20020a05600c3c9c00b003dc0d5b5f6amr11254251wmb.30.1675973519896;
        Thu, 09 Feb 2023 12:11:59 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4df:e300:c146:1250:ead2:43ad? (dynamic-2a01-0c23-c4df-e300-c146-1250-ead2-43ad.c23.pool.telefonica.de. [2a01:c23:c4df:e300:c146:1250:ead2:43ad])
        by smtp.googlemail.com with ESMTPSA id s12-20020adfdb0c000000b002c3ec1fbc0bsm1945149wri.94.2023.02.09.12.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 12:11:59 -0800 (PST)
Message-ID: <76e042e0-a610-5ed5-209f-c4d7f879df44@gmail.com>
Date: Thu, 9 Feb 2023 21:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH 3/3] arm64: dts: meson-gx: Make mmc host controller interrupts
 level-sensitive
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Nan Li <nan.li@amlogic.com>,
 Vyacheslav Bocharov <adeep@lexina.in>
References: <8a99341b-8546-8f90-c9a5-087d927cac48@gmail.com>
In-Reply-To: <8a99341b-8546-8f90-c9a5-087d927cac48@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_121203_795502_60ED7EEB 
X-CRM114-Status: GOOD (  10.26  )
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

The usage of edge-triggered interrupts lead to lost interrupts under load,
see [0]. This was confirmed to be fixed by using level-triggered
interrupts.
The report was about SDIO. However, as the host controller is the same
for SD and MMC, apply the change to all mmc controller instances.

[0] https://www.spinics.net/lists/linux-mmc/msg73991.html

Fixes: ef8d2ffedf18 ("ARM64: dts: meson-gxbb: add MMC support")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index e3c12e0be..5eed15035 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -603,21 +603,21 @@ apb: apb@d0000000 {
 			sd_emmc_a: mmc@70000 {
 				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
 				reg = <0x0 0x70000 0x0 0x800>;
-				interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			sd_emmc_b: mmc@72000 {
 				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
 				reg = <0x0 0x72000 0x0 0x800>;
-				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			sd_emmc_c: mmc@74000 {
 				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
 				reg = <0x0 0x74000 0x0 0x800>;
-				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 		};
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
