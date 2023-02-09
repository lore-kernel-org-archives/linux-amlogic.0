Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F71FC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 20:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7+SbDwBsupdmh5PmiGxPq9IoLsnpS9H4O5gMy6K2wQ=; b=LYA8Qe1zAKZNqf
	q81xPp0fAZp13AcpF/DzGZ8g8It5MvKU+/HJXd2DXiHDB0LyVAZGZy3Oar/n24uNz3FowsfqoM9h3
	jEcjsxGLAOg97Z47ZVPjnBAcOGoejLL7OYyI6KkerHfzpuPiFLFDq+hvrU8qqpr7KE34Pa+nYL7g+
	XtgtbggMTDGPejpU0KUKPrT7N6chZOqcgFWyZ/RvT/GGyy05epBiYSObmjSKTe7agSO71ySjMbYeB
	S0y9lNc7vLMmewOnzjnH987hwCZqD4I7jQg1ImO8CmmqhIloFgEYYeG+dqH3GmMHLtnGHnu/4/qMx
	68TcR1TkbQuO32ehvcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDGz-0037xF-8v; Thu, 09 Feb 2023 20:12:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDGw-0037vn-7b; Thu, 09 Feb 2023 20:11:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id a2so3003032wrd.6;
        Thu, 09 Feb 2023 12:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQ2vzzQ49PiAzAUtqfKXOTv4Bn/iALuLqhQt8Dw+H+8=;
        b=LZoGs1aCACHxNf0fvLH+dPpNH0pGqczz4f07b/RNjwNA3H39ye8MHmEMTeWZNVjgOU
         rbFMhh98IbdcaJKcQWuh3e9gt+hHUMhSwUUQnDp4ymu38Dp8nVb4M3GdZP5svdqzJ+aq
         OM43rSPKazSjmrmkhOsrXwq3kzl2PazfCdfxJHJDVw+1qx1HvRfTuLtNhDhsoOK48sHi
         K/mk0mxFzBJW8nROCn4i456zpIxQjywTbe/Kc+n0zjmUx43LApxtPZzG+ygAAz7odypP
         HNz7b0vOr/3MHNBdstOu/o2oZlT1EFsYgRzi+BUYpiy9eEE0993TXzAnlum8QUkNk3Uy
         rDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQ2vzzQ49PiAzAUtqfKXOTv4Bn/iALuLqhQt8Dw+H+8=;
        b=0oLpFu4W1Q+QNVjNNB49s1W8j+HwObJPxDfo2VSINcGIbxAmqrUNqMYTZBCz86I//n
         ji0bZElNBu8TTSgyUt4RJ7stNLLBXznLg228DBbs+5YZ4lWMLlPWlyPjhKul0MVT+OHi
         PzY49fyGn/sA6IGkUC61jCzio5sR4kxACxthzJkpsWJwKzAAIYav7N4LY/H+yD9qF4/S
         XYj96DxUTxu72tX1wlxEme9ZL+r9YlzLc5lRi7TBlmNst4a/4whCm1S26MnNpORw4XUz
         vlaZuSI1ptqrtCR17OQuR1VeuHTqx731b5Pdq5e24yrQL4NOYXTN4mlNupIOYqbIPaVR
         J6EA==
X-Gm-Message-State: AO0yUKUXV27TeQXTApmDWfaBPPRir+OPJsl34V7AzRY4ejiS1wNqfDPU
	FeJnSO5nWk/RyaPUM7s/hclz1EhBbHA=
X-Google-Smtp-Source: AK7set9R36Q3v9v0+TmM/jJmc53c7enzP/EvABeSHUNoQGGzaw/LPuE2Pf/r1Pl9Q43x1s7i3q2ToQ==
X-Received: by 2002:adf:f042:0:b0:2bf:d72b:d039 with SMTP id t2-20020adff042000000b002bfd72bd039mr13526761wro.10.1675973516761;
        Thu, 09 Feb 2023 12:11:56 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4df:e300:c146:1250:ead2:43ad? (dynamic-2a01-0c23-c4df-e300-c146-1250-ead2-43ad.c23.pool.telefonica.de. [2a01:c23:c4df:e300:c146:1250:ead2:43ad])
        by smtp.googlemail.com with ESMTPSA id m3-20020adfe0c3000000b002c4084d3472sm1923682wri.58.2023.02.09.12.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 12:11:56 -0800 (PST)
Message-ID: <c00655d3-02f8-6f5f-4239-ca2412420cad@gmail.com>
Date: Thu, 9 Feb 2023 21:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH 1/3] arm64: dts: meson-axg: Make mmc host controller
 interrupts level-sensitive
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
X-CRM114-CacheID: sfid-20230209_121158_324760_ACAD0BE3 
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

The usage of edge-triggered interrupts lead to lost interrupts under load,
see [0]. This was confirmed to be fixed by using level-triggered
interrupts.
The report was about SDIO. However, as the host controller is the same
for SD and MMC, apply the change to all mmc controller instances.

[0] https://www.spinics.net/lists/linux-mmc/msg73991.html

Fixes: 221cf34bac54 ("ARM64: dts: meson-axg: enable the eMMC controller")
Reported-by: Peter Suti <peter.suti@streamunlimited.com>
Tested-by: Vyacheslav Bocharov <adeep@lexina.in>
Tested-by: Peter Suti <peter.suti@streamunlimited.com>
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 1648e67af..417523dc4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1886,7 +1886,7 @@ apb: bus@ffe00000 {
 			sd_emmc_b: sd@5000 {
 				compatible = "amlogic,meson-axg-mmc";
 				reg = <0x0 0x5000 0x0 0x800>;
-				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 				clocks = <&clkc CLKID_SD_EMMC_B>,
 					<&clkc CLKID_SD_EMMC_B_CLK0>,
@@ -1898,7 +1898,7 @@ sd_emmc_b: sd@5000 {
 			sd_emmc_c: mmc@7000 {
 				compatible = "amlogic,meson-axg-mmc";
 				reg = <0x0 0x7000 0x0 0x800>;
-				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 				clocks = <&clkc CLKID_SD_EMMC_C>,
 					<&clkc CLKID_SD_EMMC_C_CLK0>,
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
