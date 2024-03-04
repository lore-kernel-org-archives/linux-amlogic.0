Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB62C48BF6
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2024 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXUO17SS/sW4XuRWIkrSYeLW/qCgONVhBs9wRjDYcKE=; b=eNoHjkb8LVYKMV
	74HegR+MVpylf/nOpynSMAHt6vSkGWPGzM7XVWg0NwDKwrE2394X0v1/HR+GpkeX+4hZLXBLLb2Ex
	iSQdwAPSZvYlaMvHTD4oJMYmv5w3MOgjW3WvD8BzFkTGOsbNTwvtyYHhsIdeLGxr1YUfwnsIq6VyV
	qnziF+RA5Wt+N/T8tilYHMZARS+O9fqxCl8v84mXk5xDTqqbgAaoHW1rrDKg38nOt59n+82t6Lktl
	CIgYA8pc9aiQrLMO7h+MNsX96TNl69T4sOnBUcsi66SBnErp5pkX24xzFu6Ul4NW0ypaPQrFzjBbu
	zTKaRetegeWZY2BjTUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8hk-00000009EjX-2peC;
	Mon, 04 Mar 2024 13:50:08 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8he-00000009EZv-0jZO;
	Mon, 04 Mar 2024 13:50:06 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D4D3810000A;
	Mon,  4 Mar 2024 16:49:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D4D3810000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1709560186;
	bh=pwwpRwyfONwWk//y+tBtyGsJGgbXPSMvyR6jl6OmDgI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=Vq9e9s+AuV3T+kHpKUXL7fwvjVXrQvM8PiWG6SUPXWPPNRgwFPdbeNYk90w8mi9h+
	 Juol9IeA7kOFdpR9iSu0TGl+NL0YrwbJAnI1t5ro0kt4CfqMHLeqtE9yaw4CX0w4li
	 9bNCgZ3PjtaBqPo5L19tiK2tmrrl7VgO7gbaZI0DYEzijYtBWcGiKItGrIwzhZd4p7
	 yjkT8Q/ovtweJV8I+do01U4dcqprsYtrZ0p/Zq0TBHJoeLKUbnb99Uw4KTX4bw//2b
	 g/jyPFrlKEqypPcPOBOv4CUkMi2a+lXG7xqweEdIAT7XbY9hYyM6p3vqXwuiaNqKFf
	 tTpYVxZr+2sZw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  4 Mar 2024 16:49:46 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 4 Mar 2024 16:49:46 +0300
Received: from p-i-exch-sc-m01.sberdevices.ru ([fe80::6d41:e8f1:b95e:ba1]) by
 p-i-exch-sc-m01.sberdevices.ru ([fe80::6d41:e8f1:b95e:ba1%7]) with mapi id
 15.02.1118.040; Mon, 4 Mar 2024 16:49:46 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "khilman@baylibre.com"
	<khilman@baylibre.com>, "martin.blumenstingl@googlemail.com"
	<martin.blumenstingl@googlemail.com>, "vadim.fedorenko@linux.dev"
	<vadim.fedorenko@linux.dev>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v5 03/21] drivers: crypto: meson: make CLK controller
 optional
Thread-Topic: [PATCH v5 03/21] drivers: crypto: meson: make CLK controller
 optional
Thread-Index: AQHaa9yRWJ/V2yQniEGD1LRIiVhVdrEizjUAgASdYgA=
Date: Mon, 4 Mar 2024 13:49:46 +0000
Message-ID: <20240304134923.hk5xp5rs3itgw3pk@cab-wsm-0029881.sigma.sbrf.ru>
References: <20240301132936.621238-1-avromanov@salutedevices.com>
 <20240301132936.621238-4-avromanov@salutedevices.com>
 <1jwmqmrmva.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jwmqmrmva.fsf@starbuckisacylon.baylibre.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <4B84D65356BE894DBF25ACCD733B0601@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_055003_165724_44146894 
X-CRM114-Status: GOOD (  27.60  )
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

Hello Jerome,

On Fri, Mar 01, 2024 at 04:21:20PM +0100, Jerome Brunet wrote:
> 
> On Fri 01 Mar 2024 at 16:29, Alexey Romanov <avromanov@salutedevices.com> wrote:
> 
> > Amlogic crypto IP doesn't take a clock input on some
> > SoCs: AXG / A1 / S4 / G12. So make it optional.
> >
> 
> I commented this patch on v2 and the comment keep on being un-addressed.
> 
> The SoC either:
> * has a clock that is required for the IP to work
> * Or does not
> 
> It is not something you are free to provide or not.
> 
> For the record, I find very hard believe that some SoC would have clock,
> and other would not, for the same HW.
> 
> Isn't it more likely that the clock just happens to be left enabled by
> the bootloader on some SoC and it conviently allows to ignore it ?


S905X and newer SoC's uses DMA engine for crypto HW and they
don't required clock input to work. Clock input is needed for
blkmv engine.

Therefore, I'm not sure that it is needed for GXL too (and the second
interrupt line). I tested it on vim1 board witouht them and everything
works correctly.

> 
> > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > ---
> >  drivers/crypto/amlogic/amlogic-gxl-core.c | 14 +++-----------
> >  1 file changed, 3 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> > index e9e733ed98e0..a3a69a59f476 100644
> > --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> > +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> > @@ -269,16 +269,11 @@ static int meson_crypto_probe(struct platform_device *pdev)
> >  		dev_err(&pdev->dev, "Cannot request MMIO err=%d\n", err);
> >  		return err;
> >  	}
> > -	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
> > +
> > +	mc->busclk = devm_clk_get_optional_enabled(&pdev->dev, "blkmv");
> >  	if (IS_ERR(mc->busclk)) {
> >  		err = PTR_ERR(mc->busclk);
> > -		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
> > -		return err;
> > -	}
> > -
> > -	err = clk_prepare_enable(mc->busclk);
> > -	if (err != 0) {
> > -		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
> > +		dev_err(&pdev->dev, "Cannot get and enable core clock err=%d\n", err);
> >  		return err;
> >  	}
> >  
> > @@ -306,7 +301,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
> >  	meson_unregister_algs(mc);
> >  error_flow:
> >  	meson_free_chanlist(mc, mc->flow_cnt - 1);
> > -	clk_disable_unprepare(mc->busclk);
> >  	return err;
> >  }
> >  
> > @@ -321,8 +315,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
> >  	meson_unregister_algs(mc);
> >  
> >  	meson_free_chanlist(mc, mc->flow_cnt - 1);
> > -
> > -	clk_disable_unprepare(mc->busclk);
> >  }
> >  
> >  static const struct meson_pdata meson_gxl_pdata = {
> 
> 
> -- 
> Jerome

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
