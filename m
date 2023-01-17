Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E96C3DA78
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Jan 2023 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exYqxiDp52LVk35cNPI6CW3VmKB1e3MXT3R9eCRf2FI=; b=Mo8LiyCJidPjjT
	valCAz3so0+bnaqv2i3lGPo0DMVuv3cIL7/g3IMErSnxSsoWgHWAfFjauqJNidCULzjIjzjQj+m6T
	T1r91YZBnFDoPEarhZ7QvhnoEfJHmHw0lZDRRojbiMLiZ2Sg5cobpAnESLhuGnW7Kl/YXVfTNIscM
	JR4Di4WtZG6fgccaTKBGjGyE7D04jMC3CoNvq1qbWuxTuilGh8IAmRNxiEni4DNn7qLlOLkAaDs2n
	0yBbFl0X4/Mcze0d8Ut6TInPxMbGcoxP0sdGhXGbFg4dkObPl3OqBhy0FR2mIOLGbiYu4gIDWcDgn
	b0nT8Qyjcr/YmiMyQYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHnJQ-00Eg19-6M; Tue, 17 Jan 2023 14:51:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHnJF-00EfyV-1P; Tue, 17 Jan 2023 14:51:34 +0000
Received: by mail-ej1-x62a.google.com with SMTP id az20so56828786ejc.1;
        Tue, 17 Jan 2023 06:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5dLy407+vBKmqg0S67+GUaT0O6M/EsU3XgvMkQjPQU=;
        b=QYxu3ZSjOY/CDZtPkzuNn5q370CND8HE700/5kencxE9zic2FI1wYRZlGGpBsbsLEU
         gfobr4bEHpZNWYECYrkPeRRsN9s1c5lORo3XE9mDrbvrGOAemqq1/e5x2DebefisujSZ
         XHveQQ9GjVcoLWELp33YgMXsUPozQjO2+Huf9Tdzlw3FhAyIhbOFDP/YobbZhpdGEL2u
         fjYnIeR/yemq/8azTqFgtdNFonNUDGVRmArttnPjACl8B7c5CgFhTQBWmFIR1T74N2JT
         ggwoGv35F8fpy/2gk3qWaV1/b4ygK2XHvA3HVNNunCewAVtlvHgHctF+/G38p+XkshJv
         B5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5dLy407+vBKmqg0S67+GUaT0O6M/EsU3XgvMkQjPQU=;
        b=wmCPpjOeT2lcjWt2p2atFPyNDV72RVykQcnwWLoywU3bWVfdrKjk0vzXhgNZ7yIW0F
         igyfIKD2oSTBBmKYwEeO/mQkEShh0WnoICJdb0N/UIe7ffm8XTwTmQxJWyk7zNgKfW4p
         SKoFZ0hBi3LrEup+ELVwwDtIp6YbKcNlYxPE4RRs/mt7JH2b40Y+2Gj5QQsGfA97UNye
         qVGK02T7SuHGYzrnQ/JfL37SkHArjQlTMFMXObKkdOtaivKxzrzUJha1SBNSzbgCLnz+
         X3z7cjSYsX4Z1cVYR0f5k3O/QwxUltxAmP/rFIR0aS/yycCgT5uumfGEWZcT15T7krWr
         D+wg==
X-Gm-Message-State: AFqh2kq7KfUfX8kdsMsG5BP7FX7iSqPlrT5r0H8fRuXwiVOBPjkOFZ1j
	vDKrkouuu7crc1NouQD2PWA=
X-Google-Smtp-Source: AMrXdXsteKFfcuU8ekKbYW6rkuOdcnAX7Jr+Ngn2mOHPrTqB6iiGMRgB3rEQuDh/OPjQHBEi0IuxaA==
X-Received: by 2002:a17:906:1b4a:b0:84d:4e4e:2c7b with SMTP id p10-20020a1709061b4a00b0084d4e4e2c7bmr16587158ejg.30.1673967086569;
        Tue, 17 Jan 2023 06:51:26 -0800 (PST)
Received: from ?IPV6:2a01:c22:7346:8100:dcf9:ba16:7d23:185e? (dynamic-2a01-0c22-7346-8100-dcf9-ba16-7d23-185e.c22.pool.telefonica.de. [2a01:c22:7346:8100:dcf9:ba16:7d23:185e])
        by smtp.googlemail.com with ESMTPSA id 17-20020a170906059100b007c16f120aacsm13174653ejn.121.2023.01.17.06.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 06:51:26 -0800 (PST)
Message-ID: <1f841ad8-d2f9-cf39-da65-5c90fddb3cee@gmail.com>
Date: Tue, 17 Jan 2023 15:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch> <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
 <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
 <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
 <699f6ee109b3a72b2b377f42a78705f47d4a77b9.camel@redhat.com>
 <Y8ai6+oaaP0KwkAY@lunn.ch>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more G12A-internal
 PHY versions
In-Reply-To: <Y8ai6+oaaP0KwkAY@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_065133_111755_EB357A06 
X-CRM114-Status: GOOD (  24.24  )
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

On 17.01.2023 14:30, Andrew Lunn wrote:
>>> The PHY compatible string in DT is the following in all cases:
>>> compatible = "ethernet-phy-id0180.3301"
> 
> This form of compatible has two purposes.
> 
> 1) You cannot read the PHY ID register during MDIO bus enumeration,
> generally because you need to turn on GPIOs, clocks, regulators etc,
> which the MDIO/PHY core does not know how to do.
> 
> 2) The PHY has bad values in its ID registers, typically because the
> manufactures messed up.
> 
> If you have a compatible like this, the ID registers are totally
> ignored by Linux, and the ID is used to find the driver and tell the
> driver exactly which of the multiple devices it supports it should
> assume the device is.
> 
> So you should use this from of compatible with care. You can easily
> end up thinking you have a different PHY to what you actually have,
> which could then result in wrong erratas being applied etc, or even
> the wrong driver being used.
> 

Right. I checked and this compatible was added with
280c17df8fbf ("arm64: dts: meson: g12a: add mdio multiplexer").

compatible = "ethernet-phy-id0180.3301", "ethernet-phy-ieee802.3-c22";

The commit message doesn't explain why overriding the PHY ID
is needed. Maybe Jerome as author can shed some light on it.

At least on my system it's not needed (after setting the PHY ID
in the PHY driver to the actual value).

Would be interesting to know whether PHY is still detected
and driver loaded with this patch on g12 systems.
If the genphy driver should be used then the actual PHY ID
would be interesting (look for attribute phy_id in sysfs).

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 585dd70f6..8af48aff0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1695,8 +1695,7 @@ int_mdio: mdio@1 {
 					#size-cells = <0>;
 
 					internal_ephy: ethernet_phy@8 {
-						compatible = "ethernet-phy-id0180.3301",
-							     "ethernet-phy-ieee802.3-c22";
+						compatible = "ethernet-phy-ieee802.3-c22";
 						interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 						reg = <8>;
 						max-speed = <100>;
diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index c49062ad7..0fd76d49a 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -262,7 +262,7 @@ static struct phy_driver meson_gxl_phy[] = {
 		.suspend        = genphy_suspend,
 		.resume         = genphy_resume,
 	}, {
-		PHY_ID_MATCH_EXACT(0x01803301),
+		PHY_ID_MATCH_EXACT(0x01803300),
 		.name		= "Meson G12A Internal PHY",
 		/* PHY_BASIC_FEATURES */
 		.flags		= PHY_IS_INTERNAL,
-- 
2.39.0

>     Andrew


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
