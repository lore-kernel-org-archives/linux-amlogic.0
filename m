Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A402BC54E67
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3gp0BvWNvILVz9llgGQgiD4VeseJZJ27O9ohDp6SM0=; b=4fHNC+TlZV1cDr
	gyZVbweX48SPkxPJuX1TCBjWb7Hs2AOyRHUVeekWX646C1jMgWv9Xh8/ApucahiYI0bZNuogY9ZC2
	0NK+lAVlFjVCmGxZ1TUur4hDGw7R6Y+ny0CDXnaXj9u4UxbwMJGcA0/YNWjcoTNVl/fNNQ35D+a2o
	PAv284M0L6knfQushf7fbaCg2Y+8kOiwXMqHPE7ogK3CS3XBf3Bv3rR1S42/uTdhmh7rsnZivcKpq
	PEZWUEA8jmmNCUqoaEUMM/cX6Q+/bx5l4gYQzXLiad5OJcTien7K58DEx87qWazqa6+rBl78LPQz0
	pg5YUMkilIVgTDKGWWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rltMi-00000005jbk-1Elj;
	Sun, 17 Mar 2024 16:28:04 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rltMe-00000005jZb-1WWL;
	Sun, 17 Mar 2024 16:28:03 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 74482100006;
	Sun, 17 Mar 2024 19:27:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 74482100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710692877;
	bh=4qS7So0Sq9vro7xE2zLDXeUD46+3m6X+u8Tq5QOIzBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=tW0w0m6RJF1gAE8R44hsxulHFsWnRUpT4WgEYVKp1z2mHww8GdOgs2W7gkOyYeZrA
	 0doNe4sA+BxnMVi/5Zdk1modCoIZUj3NeT/bbbgCZPCpOEBHjHbfIr079ybI5Bma3y
	 gGHNhvIVgsk94SRBmJbiYquUXAW9zSPHnQSUwSKZpEPEYRESbpBGpco6KMbOk20/xR
	 4BNgal5O4neLf422l9A9Tf4nP++vFSjgunGVtQvOjE1EOw5Rog/YBc7126L7bf1ulE
	 1ZXf++qiKcaT2HXRPbzn9TjrMta/y8+rcd8VbGWdFkRow50TRXjmfBHBxr1dSGlUUC
	 E2RZul9be+Ozg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 17 Mar 2024 19:27:57 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 19:27:56 +0300
Message-ID: <c4c0e3a3-eaa8-42c6-bbd3-e5c6993dc63b@salutedevices.com>
Date: Sun, 17 Mar 2024 19:27:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/25] ASoC: meson: t9015: add support for A1 SoC family
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-13-jan.dakinevich@salutedevices.com>
 <5f8e8cd2-f9c4-4961-a85d-a0f3217294e6@sirena.org.uk>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <5f8e8cd2-f9c4-4961-a85d-a0f3217294e6@sirena.org.uk>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_092801_741653_0B551A33 
X-CRM114-Status: GOOD (  14.44  )
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



On 3/15/24 16:36, Mark Brown wrote:
> On Fri, Mar 15, 2024 at 02:21:48AM +0300, Jan Dakinevich wrote:
> 
>> +static const char * const a1_adc_mic_bias_level_txt[] = { "2.0V", "2.1V",
>> +	"2.3V", "2.5V", "2.8V" };
>> +static const unsigned int a1_adc_mic_bias_level_values[] = { 0, 1, 2, 3, 7 };
> 
> Why would this be varied at runtime rather than being something fixed
> when the system is designed?
> 
>> +static const char * const a1_adc_pga_txt[] = { "None", "Differential",
>> +	"Positive", "Negative" };
>> +static const unsigned int a1_adc_pga_right_values[] = { 0, PGAR_DIFF,
>> +	PGAR_POSITIVE, PGAR_NEGATIVE };
>> +static const unsigned int a1_adc_pga_left_values[] = { 0, PGAL_DIFF,
>> +	PGAL_POSITIVE, PGAL_NEGATIVE };
> 
> Similarly here.
> 

Both mic bias and ADC's input mode depends on schematics and should be
configurable. What is the better way to give access to these parameters?
Device tree?

>> +	SOC_SINGLE("ADC Mic Bias Switch", LINEIN_CFG, MICBIAS_EN, 1, 0),
>> +	SOC_ENUM("ADC Mic Bias Level", a1_adc_mic_bias_level),
> 
> Why would micbias be user controlled rather than a DAPM widget as
> normal?

Yes, I could use SND_SOC_DAPM_SUPPLY, but it supports only raw values,
and doesn't supports enums. Here, I want to use enum to restrict
possible values, because only these values mentioned in the
documentation that I have.

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
