Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C25C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zd7jLmyX8eol6DUR369Ysdlud1974tl4/L+bkNu+sMQ=; b=Vyif3Toq/UoD5M
	mWyj8POAYs+eZ5lhFsWiJXwAzkEoreJK9c/0uyjthkm9cLuMpsb2uilV7PVBdW/M4Jj3f6mFMSIYq
	gxe/VMqcWOoFoxoa+iHL+LXR/asiwGwUK1dw0RVQpPELNFDWV+mnlpGLqPYJeESTuj4FhRlensmTk
	BrrMoFuWVBzBjA0T1SPTcJP5hlkF8Op3cHbWiy/+IJCWKZOXm5xKjozL0sq3uBjhlnjv3xQzkvYEa
	caeVWl05oT9uY4Or/5V3f4mkwJtserOB8OxbICF4GJbcJPVlstIxRO8yY8R1Ee3Km4Z0mw4UI88hZ
	lxrdpHOOMxNgFcYF32xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoN4-009haW-C6; Fri, 20 Jan 2023 10:11:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoBS-009c0h-Qt
	for linux-amlogic@lists.infradead.org; Fri, 20 Jan 2023 09:59:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so3265921wmq.0
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Jan 2023 01:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=CalUi7H0NnAhfJuzuJclWVRrTyNCQfv1cY6vQf3KRAE=;
        b=TqLZRzqIKBjLYcJvM8Vh5p3p+sMzlxty5cDJSAJOcA0JBxFFchd2x/j0LqmISTC65m
         kIaJv5v6DmaMfxZQMXFXjJu1cTsSPEFiYhCA7zJ+6T1n1BB9FBNZZxxQ+jJ1tSah5mpj
         fh4iuIt3a9t8s2zzPEB3FqwcvUDn5CnGcxVBNSjVqhyytq2Ewnx78auvZQfFHZvtnIo6
         whhfKQIDou/G0X3vUqHhvEWSSYoJukW7X3aWuI/K6b26Jh73QWFFXIElOTqVDotWQM3I
         kDycQVn+L3K16iVtNyP4nk4X9mx1pFiYlQlsJXgUcinmuSQwK+2zU1IzST19gjNGNNhR
         97pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CalUi7H0NnAhfJuzuJclWVRrTyNCQfv1cY6vQf3KRAE=;
        b=F863LuL+vvc/GNnD2Kej4fD8lt4u+cK6Na01StPk1GZZx4HtEBC6rDjN+nxByBOznQ
         muCXu62Mj6Ybs1tD0BxM25f+Wk3KWr1YeFFCqZildzll3fMJA3VxCKhu8/uZnLWQUd+1
         apd7ZQuQ38kMGXp3BmLf8S5lpEgn4XoJFm1eXI2OnReqS8RKiqafvq8284eDIm+19PFS
         tWaUbA7b6CLOFEye/p1Rg/z3Xkz0DBQNARHVd83LAacmqIV6/wPhs4CZ2+P+W6Ve7Za7
         wt+x8mTm9GYI0zQTZQx/OGsaUP+2fcmqGC2jEcrTp+ZchKR32WtdfTVB7jnETnYenUPV
         3leg==
X-Gm-Message-State: AFqh2koGPa2ToBrNHSxIRW4GVsyalDCx30r5GbIRebvPNe2K9d67W10S
	4nIJMYS+7WbHWewsEakaMh7VQg==
X-Google-Smtp-Source: AMrXdXu5d19sUSVtHg3LvUHdmh7YBTwLS0YM3EeMCGdrpU3aWKVP3DSZayV+RS09XeylMzkLYsl79Q==
X-Received: by 2002:a05:600c:687:b0:3d9:73fb:8aaa with SMTP id a7-20020a05600c068700b003d973fb8aaamr13598753wmn.8.1674208780241;
        Fri, 20 Jan 2023 01:59:40 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003daf6e3bc2fsm10482172wmq.1.2023.01.20.01.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:59:39 -0800 (PST)
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch>
 <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
 <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
 <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
 <699f6ee109b3a72b2b377f42a78705f47d4a77b9.camel@redhat.com>
 <Y8ai6+oaaP0KwkAY@lunn.ch>
 <1f841ad8-d2f9-cf39-da65-5c90fddb3cee@gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Russell King - ARM Linux
 <linux@armlinux.org.uk>, David Miller <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more
 G12A-internal PHY versions
Date: Fri, 20 Jan 2023 10:55:29 +0100
In-reply-to: <1f841ad8-d2f9-cf39-da65-5c90fddb3cee@gmail.com>
Message-ID: <1jsfg5wmpi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_015942_993140_F98FDCED 
X-CRM114-Status: GOOD (  27.46  )
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


On Tue 17 Jan 2023 at 15:51, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> On 17.01.2023 14:30, Andrew Lunn wrote:
>>>> The PHY compatible string in DT is the following in all cases:
>>>> compatible = "ethernet-phy-id0180.3301"
>> 
>> This form of compatible has two purposes.
>> 
>> 1) You cannot read the PHY ID register during MDIO bus enumeration,
>> generally because you need to turn on GPIOs, clocks, regulators etc,
>> which the MDIO/PHY core does not know how to do.
>> 
>> 2) The PHY has bad values in its ID registers, typically because the
>> manufactures messed up.
>> 
>> If you have a compatible like this, the ID registers are totally
>> ignored by Linux, and the ID is used to find the driver and tell the
>> driver exactly which of the multiple devices it supports it should
>> assume the device is.
>> 
>> So you should use this from of compatible with care. You can easily
>> end up thinking you have a different PHY to what you actually have,
>> which could then result in wrong erratas being applied etc, or even
>> the wrong driver being used.
>> 
>
> Right. I checked and this compatible was added with
> 280c17df8fbf ("arm64: dts: meson: g12a: add mdio multiplexer").
>
> compatible = "ethernet-phy-id0180.3301", "ethernet-phy-ieee802.3-c22";
>
> The commit message doesn't explain why overriding the PHY ID
> is needed. Maybe Jerome as author can shed some light on it.

Guilty ... I'm afraid git a far better memory than I do.

There is no reason for this compatible. It works without it (as
explained on other threads)

It was a mistake to add it in the first place. Probably a stupid
copy/paste. It can (and should) be removed.

>
> At least on my system it's not needed (after setting the PHY ID
> in the PHY driver to the actual value).
>
> Would be interesting to know whether PHY is still detected
> and driver loaded with this patch on g12 systems.
> If the genphy driver should be used then the actual PHY ID
> would be interesting (look for attribute phy_id in sysfs).
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 585dd70f6..8af48aff0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1695,8 +1695,7 @@ int_mdio: mdio@1 {
>  					#size-cells = <0>;
>  
>  					internal_ephy: ethernet_phy@8 {
> -						compatible = "ethernet-phy-id0180.3301",
> -							     "ethernet-phy-ieee802.3-c22";
> +						compatible = "ethernet-phy-ieee802.3-c22";
>  						interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
>  						reg = <8>;
>  						max-speed = <100>;
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index c49062ad7..0fd76d49a 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -262,7 +262,7 @@ static struct phy_driver meson_gxl_phy[] = {
>  		.suspend        = genphy_suspend,
>  		.resume         = genphy_resume,
>  	}, {
> -		PHY_ID_MATCH_EXACT(0x01803301),
> +		PHY_ID_MATCH_EXACT(0x01803300),
>  		.name		= "Meson G12A Internal PHY",
>  		/* PHY_BASIC_FEATURES */
>  		.flags		= PHY_IS_INTERNAL,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
