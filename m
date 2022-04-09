Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C91AC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Apr 2022 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nQSOxxOykmMpAB+oF/lT+j0aN9IWfP03JC2p66ooHw=; b=tT9Wwk8jE+WQkF
	ROOCNz775MvijT/16FZvjelhPhkFUVhJ+D96JzWkMpFECr2nCNF1axNnUpcXkLkYhlcbrWtsC/ERq
	o6nvaI6rRR4LqQTfWRtOJ29mBDsJs0x51hJji/ESdmjhW0RP9QkA3X7cO1g/0Me9qukTbhNhlWIF2
	+W4tQgQvwbOvM4XEzjK5ZaLxOQSEuOA+yOQjO1XP26rlJSnw5XxSvhFnhgZF0Sx93mD0rrM/A0t2p
	dYgoz09d4I85wJBCPWlKsQbGqmj72KgJzZG8hVg2eQsi1tljhoSnACxGUbBKGzLQfkexEkLNp3dAe
	wSh3iGq2hekWno+wUlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndBEA-003EsT-6k; Sat, 09 Apr 2022 13:34:10 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndBDv-003Enx-B0
 for linux-amlogic@lists.infradead.org; Sat, 09 Apr 2022 13:34:00 +0000
Received: by mail-ej1-x62b.google.com with SMTP id p15so22326541ejc.7
 for <linux-amlogic@lists.infradead.org>; Sat, 09 Apr 2022 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LO7mTJuUjnyguTxwzU4yCMRsr4W3KT8BOY3t4LlaHc0=;
 b=NSPuRoYHtyOw+PcsMZMVtuInfF33reqEX80RTlsMYF96wzkfEaIKPTkf0zDLCojnUm
 7GdAM9ck8RvQnAE0+woC+0Cz0hKM9k7ConH5cc8CM3A80Q22AF30cnY5tVI5IrRhfRiq
 fUs2YJsfoDOLl23ee7Kfwr0FQg7iHJDavcGzo6omSFqqR7QkLBp6xvW024IMq4mk8XcH
 aI+dI62HLCe60/HRWGhTBdhYz6pdh05BA5qgDsK/MG0ybk9Vjkb5p0YHoofix6xORs7e
 TQjQGp1ld64FVyUXf1RkiYaMnO4jpnKDkq/gesw7lqgg3jkxwTzzbP8gH8cCxOWqkIK3
 2lCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LO7mTJuUjnyguTxwzU4yCMRsr4W3KT8BOY3t4LlaHc0=;
 b=5hmWndsFR3tP9DFwOhapnJ3iy83MfirguPEzO7EPV6nNG4o0SPlInmhgF5P9JPA9FA
 Bh1qD3FpaOKX/zFdsrSxTB29hGTSuQjhnJ9ND8UwrKvjn4aY3C/+1ECPcB8VzkbXPpxT
 V4KI4oKOs3R1CPjY13HVO92mviClWQOIbOil0cRdsDW6pNz0T0oLBEKyuITGa57SxRfH
 aFrH13K4a6Ad1On9BlJC+Bowl5ug1dFc5WfU4/gtiQD06H0q8tlv0YV9VT3GXCqMNv+6
 3HHVP3KDf4xfkX7iCihkSfGSZGzQcIkGNDf0WQoiGYZVB+JWJIV1Tx1NHm+gtiA/m4pZ
 cTmg==
X-Gm-Message-State: AOAM5315HBU5Vg9h7Vz74gGI3OSAKCwKdoJJodsm5ByaU6miX1UeH6iJ
 iNl83tMghbWMK3FV6RA1NeIlZCKlptmtcgSr
X-Google-Smtp-Source: ABdhPJw7Y7cYYHPAiiiP0NIjLn5Hmp6+EKk8JZn75hkyokX3E/0ElhCjWMr9REwrEdqcx3UfkRN70w==
X-Received: by 2002:a17:906:d204:b0:6d6:df17:835e with SMTP id
 w4-20020a170906d20400b006d6df17835emr22437048ejz.20.1649511231518; 
 Sat, 09 Apr 2022 06:33:51 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 q22-20020a170906771600b006cf8a37ebf5sm9774514ejm.103.2022.04.09.06.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 06:33:51 -0700 (PDT)
Message-ID: <3b527700-444e-1f6e-fee1-5cd6ed2ef7f9@linaro.org>
Date: Sat, 9 Apr 2022 15:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
 <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
 <YlBXSVyj88CqjGj4@smile.fi.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YlBXSVyj88CqjGj4@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_063355_405156_3CFAD9F1 
X-CRM114-Status: GOOD (  16.81  )
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

On 08/04/2022 17:39, Andy Shevchenko wrote:
> On Fri, Apr 08, 2022 at 05:22:21PM +0200, Krzysztof Kozlowski wrote:
>> On 01/04/2022 12:35, Andy Shevchenko wrote:
>>> Switch the code to use for_each_gpiochip_node() helper.
> 
> (...)
> 
>>>  /*
>>>   * Iterate over all driver pin banks to find one matching the name of node,
>>>   * skipping optional "-gpio" node suffix. When found, assign node to the bank.
>>>   */
>>> -static void samsung_banks_of_node_get(struct device *dev,
>>> -				      struct samsung_pinctrl_drv_data *d,
>>> -				      struct device_node *node)
>>> +static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_drv_data *d)
>>
>> This is worth simplification anyway, so please split it to separate patch.
> 
> Not sure what to do and why it worth an additional churn.

Makes this change smaller so it's easier to review.

> 
>>>  {
>>>  	const char *suffix = "-gpio-bank";
>>>  	struct samsung_pin_bank *bank;
>>> -	struct device_node *child;
>>> +	struct fwnode_handle *child;
>>>  	/* Pin bank names are up to 4 characters */
>>>  	char node_name[20];
>>>  	unsigned int i;
>>> @@ -1038,17 +1037,17 @@ static void samsung_banks_of_node_get(struct device *dev,
>>>  			continue;
>>>  		}
>>>  
>>> -		for_each_child_of_node(node, child) {
>>> -			if (!of_find_property(child, "gpio-controller", NULL))
>>> -				continue;
>>
>> This does not look equivalent. There are nodes without this property.
> 
> Not sure I understand why not. The macro checks for the property and
> iterates over nodes that have this property.
> 
> Can you elaborate, please?

Eh, my bad, it is equivalent.

> 
>>> -			if (of_node_name_eq(child, node_name))
>>> +		for_each_gpiochip_node(dev, child) {
>>> +			struct device_node *np = to_of_node(child);
>>> +
>>> +			if (of_node_name_eq(np, node_name))
>>>  				break;
>>> -			else if (of_node_name_eq(child, bank->name))
>>> +			if (of_node_name_eq(np, bank->name))
>>>  				break;
>>>  		}
>>
>> This patch has to wait till someone provides you a tested-by. I might do
>> it around next week.
> 
> Fine with me, I will drop it from my repo for now.


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
