Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F8DC00140
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 10:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgV5NHCQbjE8Zeiw0mtehke/pje5PYe6EJVKVUvIlb0=; b=qdfjKYOTdhdI1gYRfSNRJ4d03W
	eO1DnNSzs1DNLBIMqMJTivLZFZwBM9+mZQW5QjMS+6w5TBSh5wK8pEbzCucBK2MdeNfy86WygW0qj
	I8gnJwYRLwF7uzpKLwVhv8AJiosR01w/zIQxTcGHTArpuDrhzS6eDNGzU4eEAGR0BkvaWNGjkaviO
	cdRbYuBSZKHh1GJ0/jfmXEOOax0XS8oxWOksY/oPXQd4JP6gaS9PoHXj/a5viKtY8wXAXaM4cgG3w
	/lqn5fO99LQ8sn/q7FQBDWKRzt4uY2QiJ1Q2VecybeZbNNB016TzB96SNRv6Kb4c5x+M93/rRVO3Q
	E2sseelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKzah-00CoKO-QV; Mon, 08 Aug 2022 10:02:31 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKzaX-00CoFx-4d; Mon, 08 Aug 2022 10:02:22 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 8 Aug 2022
 18:02:18 +0800
Message-ID: <39736082-b9a1-4916-c0c3-c633c93c8741@amlogic.com>
Date: Mon, 8 Aug 2022 18:02:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 5/6] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-6-yu.tu@amlogic.com>
 <60f30470-ca14-1e12-3ed2-7b34c7a93f8a@linaro.org>
 <759c681e-ec03-4230-b34e-0b2ee67ac870@amlogic.com>
 <fe04e8ab-f8de-2c03-17e8-8960e5b460af@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <fe04e8ab-f8de-2c03-17e8-8960e5b460af@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_030221_204166_79FE74F3 
X-CRM114-Status: UNSURE (   5.21  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2022/8/8 14:17, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 05/08/2022 11:36, Yu Tu wrote:
>>>> @@ -100,6 +102,30 @@ clkc_pll: pll-clock-controller@8000 {
>>>>    				#clock-cells = <1>;
>>>>    			};
>>>>    
>>>> +			clkc_periphs: periphs-clock-controller {
>>>
>>> Node names should be generic, so "clock-controller"
>>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>>>
>>> You miss here unit address. Test your DTS with dtbs check and with
>>> regular compile with W=1.
>> I will change to clkc_periphs: clock-controller@0 {.
>> Is that okay?
> 
> I cut the context, so if "0" was the value in reg, then it is OK.
Ok, I got it.I will change in next version.
> Best regards,
> Krzysztof
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
