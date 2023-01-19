Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17305C00A5A
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 11:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3qkSXLbJT2HBzpau4JlacO1J6pRMjNrWD7WAYkIQOM=; b=lRFLm3Y4WqTdWG
	tAEmVXEViz9b5Buzr28y6xrbnkqkLYf8IDcJv2aVrT/b2OktBqjzBV/JSY59FQswrT8J42O3DWIvY
	w8I+URm/GNL4cKuXHvHH/1z6XuOuLhQXYejCnEy5I/ZbWWtaO5aZVqmAGjYQyfxMoPShmokKqlTQZ
	s5yh/F+qq2T04Tarks+VyPDjgzAQEUuiD806KPF39EnhtFojiefRyLwusuhuF6FusGF3RpXYlj7ix
	Z9h8XnLkMgSN5RjDXuBvWwPON2T010qUX/St+A1Ck+50vAab/fQDQpyboOD+bcUDrMU7C2Q0QzI+f
	h7VtX+Cs2yvBj22ns4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pISpd-004YKA-KG; Thu, 19 Jan 2023 11:11:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pISpZ-004YJC-L1
	for linux-amlogic@lists.infradead.org; Thu, 19 Jan 2023 11:11:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so3339834wmb.0
        for <linux-amlogic@lists.infradead.org>; Thu, 19 Jan 2023 03:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=H1DHSYmKlnbvlId2ArSd5HfoZBbatA4dYyTE/SLPQPM=;
        b=LerjjIhkW4lzTCAjS2rrm+CVF2nmhr5Wd8fG2N1D9RjM6WttZDzQ+z4FJutV2R1WO1
         Cv3plnsyu8NYVg7k8FLvMszQRs6Rcu8Mmz5GDWb7sZgRJ6lTbFHjvyN0dzZF69smKweA
         bRrOarwCkzqtN3/QTwZ1xS1wukuckZbei343TEOecl+0CSI33kBog2R+xsK26r6mrlzj
         y34co7UX3a279t4NcansMs0PLANKghluUFcHD9XDuHywS1EceBxoEg4m7OU1vKqg91OW
         w2sWTICaLKctybSb0eiiN0gJiUa0Ed6+YHIRzVG3/7KD6vvy4x1ZYL8vXbKOhCwkN0KX
         K1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1DHSYmKlnbvlId2ArSd5HfoZBbatA4dYyTE/SLPQPM=;
        b=oQyYsqXuw/YLcWzyPBEzKl6kSUcnqxltYYop2FtU2yXxacNyVAofDm9B6jsLeEjPSw
         tzJ9/Z+N40TFnlGbT3cSkOqdWiqiqmmc+JKSm49IRNOojaPnwyOHhcvxMe8ppjOyOG3E
         dVvzveix5d9dHJhleBjoA+Y/lBit3iTs6kAvIMvxtzSff5OgfuzZ2POpy0A+euKx1FHs
         UTsA8mRwHso2CrNp8w0N+XukkUdwvQEAiLnDzdmL7LaO1OBR9lEwOeqcNXWnM3sOmywN
         p3vlKI+mD56FZ3ogT5W0sH7wJHJHXzohWrRr6+xr0A4e5CNK/pq0YNdBaPpmAwYDuQLW
         BMzw==
X-Gm-Message-State: AFqh2kosp2e7+wQLTr/OWFTCtKka8T8UW3leDAGjBFAUYAMP8xOn+aVr
	E9V7KvIJ2lFf7amj438arn5X6Q==
X-Google-Smtp-Source: AMrXdXt1zQpCw8WZi7Lxm6C8UaUKMMnt+X0n9fU4drQQnlkAQ/TXFuYihRAggoNtPa5rO9XKkb4loA==
X-Received: by 2002:a7b:cbcb:0:b0:3db:2ad:e330 with SMTP id n11-20020a7bcbcb000000b003db02ade330mr9828136wmi.5.1674126697544;
        Thu, 19 Jan 2023 03:11:37 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o15-20020a5d684f000000b002bddac15b3dsm17722757wrw.33.2023.01.19.03.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 03:11:36 -0800 (PST)
References: <20230116091637.272923-1-jbrunet@baylibre.com>
 <20230116091637.272923-3-jbrunet@baylibre.com> <Y8dhUwIMb4tTeqWN@lunn.ch>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Da Xue <da@lessconfused.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: mdio: add amlogic gxl mdio mux support
Date: Thu, 19 Jan 2023 11:55:29 +0100
In-reply-to: <Y8dhUwIMb4tTeqWN@lunn.ch>
Message-ID: <1jmt6eye1m.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_031141_900175_4FFA6AC4 
X-CRM114-Status: GOOD (  19.54  )
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


On Wed 18 Jan 2023 at 04:02, Andrew Lunn <andrew@lunn.ch> wrote:

>> +static int gxl_enable_internal_mdio(struct gxl_mdio_mux *priv)
>> +{
>> +	u32 val;
>> +
>> + 	/* Setup the internal phy */
>> +	val = (REG3_ENH |
>> +	       FIELD_PREP(REG3_CFGMODE, 0x7) |
>> +	       REG3_AUTOMDIX |
>> +	       FIELD_PREP(REG3_PHYADDR, 8) |
>> +	       REG3_LEDPOL |
>> +	       REG3_PHYMDI |
>> +	       REG3_CLKINEN |
>> +	       REG3_PHYIP);
>> +
>> +	writel_relaxed(REG4_PWRUPRSTSIG, priv->regs + ETH_REG4);
>> +	writel_relaxed(val, priv->regs + ETH_REG3);
>> +	mdelay(10);
>
> Probably the second _relaxed() should not be. You want it guaranteed
> to be written out before you do the mdelay().

Good point, I'll have a look

>
>> +
>> +	/* Set the internal phy id */
>> +	writel_relaxed(FIELD_PREP(REG2_PHYID, 0x110181),
>> +		       priv->regs + ETH_REG2);
>
> So how does this play with what Heiner has been reporting recently?

What Heiner reported recently is related to the g12 family, not the gxl
which this driver address.

That being said, the g12 does things in a similar way - the glue
is just a bit different:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/mdio/mdio-mux-meson-g12a.c?h=v6.2-rc4#n165

> What is the reset default? Who determined this value?

It's the problem, the reset value is 0. That is why GXL does work with the
internal PHY if the bootloader has not initialized it before the kernel
comes up ... and there is no guarantee that it will.

The phy id value is arbitrary, same as the address. They match what AML
is using internally.

They have been kept to avoid making a mess if a vendor bootloader is
used with the mainline kernel, I guess.

I suppose any value could be used here, as long as it matches the value
in the PHY driver:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/meson-gxl.c?h=v6.2-rc4#n253

>
>> +	/* Enable the internal phy */
>> +	val |= REG3_PHYEN;
>> +	writel_relaxed(val, priv->regs + ETH_REG3);
>> +	writel_relaxed(0, priv->regs + ETH_REG4);
>> +
>> +	/* The phy needs a bit of time to come up */
>> +	mdelay(10);
>
> What do you mean by 'come up'? Not link up i assume. But maybe it will
> not respond to MDIO requests?

Yes this MDIO multiplexer is also the glue that provides power and
clocks to the internal PHY. Once the internal PHY is selected, it needs
a bit a of time before it is usuable. 

>
>     Andrew


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
