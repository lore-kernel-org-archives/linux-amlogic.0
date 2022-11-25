Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D462CC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 23:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2srqMdUYE5gEYdHr2ru5/IlLgDkmJ8WRNOLOg1UGMn0=; b=07pt14aXP1lTls
	8UlUSt7/wIuy3LYb1w6FmFwKov1ngMw+XUMJ746AbQ1KsirhKq9YI70qphsVd85mDMDrfo328yttq
	WYj5gmHQ2TGBarTWpdnhl6Re0WS2pvUwBbQftngHrWq3Ju/L4jA7zSQIW9tfBpP1ABVXHmBmy0/Kk
	nUWTOzVmoT5h+wTF58SGd+gyou+5KI8TTb9EJFRjKdwKvwEK7KQYX0s2vpU5GcSsYGMOAr0JNBgv7
	Yk9D3sOYQYySZ8Bp8/rHwhUIXKOrvQV7gheA8c9egvgk9Lja06XJih4BolHq2V0zHhr0FPvgz3zfL
	HPaK5+bzymOxF9rVhWXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhko-002fIr-5y; Fri, 25 Nov 2022 23:05:06 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhkl-002fGf-GH; Fri, 25 Nov 2022 23:05:04 +0000
Received: by mail-ed1-x534.google.com with SMTP id f7so8126175edc.6;
        Fri, 25 Nov 2022 15:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SrTRFSS/x4t6+IVdYOMgEeoJ308qI/cUd08WWdG+ebA=;
        b=bsrCkPS7FyV3HCb4+fg+Qg08H/NUS8Fj7Q0hEixpV+cYoGxhfTbZ8MZCtDdquHpioj
         we7k2tDT7sUow8SX8+UDZ3BHUFOI2RqHFQER+e+NeFQ7wccSpwcvvtvzPTJheDUsRp3l
         kSzCi2BFiNnjAAGyybdy6ZhCqP4bLeVfsUg2gfqhE9thjPwwCClGF414PEF3gaaaOVHr
         0DkloM4FXRV7XHh0SMZjYop6Pn2STK64kgXjzEmke6lDts3uSTDombG7A9RTYcDPDX40
         eFXLCiPrRIZIBHqWlmOvSAPeWTSMrwi/LaZVmnRmTiuAv9Zcxy7+P57twERnlgdvGpNN
         ls4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrTRFSS/x4t6+IVdYOMgEeoJ308qI/cUd08WWdG+ebA=;
        b=SoCTIDaoaCwQ9RZueTBT8XU+VpxJlz6cxqrvDar++ja5Cx3+ySCK5qEwoW7nHeKPbM
         FffDDDuq+KrkNJ6Ilvx7SYnqrvOxNj/bd44zlmaKhOC4JhlPTcBMZLpCClUvnORHCwGE
         aa9yurlrZFQHZ7F14miBr8vqkUIEOkaAeTAF32GbBOqJfL1a2mLbRm1L/aagzzj6M0Se
         k6FVIS8G3ZLzp0PHCVD16R0SEM55hYOg5es+IJmRqO9ICTh7nZna+Edfw2I0e+RUgXTb
         nvUPotx+IHr8wilObAyadjImr8pDZjUJVGplXm1FQnklDcBjJ+bmSr55WGaolyGImnXv
         f6Uw==
X-Gm-Message-State: ANoB5pnkLw5St0Tg+yGZlbkrtyrluVaYzEXyz2lwwsSIEY5eEIu4tNaN
	rFpX0Wt7SaPlu/PH+n0a4lV9pDfENWOlJ2dWNgsPLjCmFz8=
X-Google-Smtp-Source: AA0mqf7oYYnOUvxYJelBH+ZCQeIchQJlARoJQwAnQuoPWecqswsfj8HILcbdy2jSsZv7bqLG10yyurKQ2U9QeGAVcvw=
X-Received: by 2002:a05:6402:2404:b0:467:67e1:ca61 with SMTP id
 t4-20020a056402240400b0046767e1ca61mr4120477eda.27.1669417499790; Fri, 25 Nov
 2022 15:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-3-3f025599b968@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-3-3f025599b968@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 26 Nov 2022 00:04:48 +0100
Message-ID: <CAFBinCANM=AOw1bbGCheFy20mqQ1ym_maK0C1sYpjceoNH-dNQ@mail.gmail.com>
Subject: Re: [PATCH 03/12] dt-bindings: nvmem: convert amlogic-meson-mx-efuse.txt
 to dt-schema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Alessandro Zummo <a.zummo@towertech.it>, 
	Eric Dumazet <edumazet@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Paolo Abeni <pabeni@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_150503_585703_92802754 
X-CRM114-Status: GOOD (  11.26  )
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

Hi Neil,

thanks for your work on this!

On Fri, Nov 18, 2022 at 3:33 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
[...]
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        sn: sn@14 {
> +            reg = <0x14 0x10>;
> +        };
> +
> +        eth_mac: mac@34 {
> +            reg = <0x34 0x10>;
> +        };
> +
> +        bid: bid@46 {
> +            reg = <0x46 0x30>;
> +        };
I assume you took these examples from the newer, GX eFuse?
Unfortunately on boards with these older SoCs the serial number and
MAC address are often not stored in the eFuse.
This is just an example, so I won't be sad if we keep them. To avoid
confusion I suggest switching to different examples:
  ethernet_mac_address: mac@1b4 {
    reg = <0x1b4 0x6>;
  };
  temperature_calib: calib@1f4 {
     reg = <0x1f4 0x4>;
  };

What do you think?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
