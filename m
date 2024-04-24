Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C48C4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJBtRE6ByaHw23UsF+mWWvtLES3pW6FYGitRhaFTUZ4=; b=lgev4b77JrtX/t
	ZOC3ZipSG1oPJu9jXG5y8fDa7f3Ts3begaWMo8L/xXmeU/iXq+qVterZIdNt7BCJBksKTy08gn3CZ
	Vn6cZVNJSGNgnrEwJlrbigbDo9Y+X/yGKxUzDBPihdWxQeSSz58jmcNNUzaXHOYMhGsMbsfVMP88g
	lPXb9XaVvSb3BbtXdS1ErmPgKkNMeilKlFBoe+wA2WtGFLMwFyFxX4TYQu238JzQ1YMfIUYYfY4BN
	3E3dKBJpSl95r7c1mCOU/4rCm9oQ0d9uto3qkj6cil6nNACD8mNZdJQxfsr5ZUZZ46XqQjiq6FX7W
	4uUCVpzyMs0Choj13wsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdCH-00000004OOY-2bGu;
	Wed, 24 Apr 2024 14:02:05 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdCB-00000004ONP-2Bq9;
	Wed, 24 Apr 2024 14:02:04 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 95438100015;
	Wed, 24 Apr 2024 17:01:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 95438100015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713967316;
	bh=c0tvRHNhIPOucYy+SUb1D0ewQT21Q1vf1NUKNTm0+Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=ORTp6RQJpfHoKfWS4IxbQjlL6v/yBLTH2wwIldOZBXzwgNTR0cohcMojPjZxlBU9j
	 tqGTmZLw7ygcFeavKzBiyVgjx+7oX8ElqcFRZMmCeE5nxK8nLPyeMcdR3KuP13NmEb
	 up9zumtVEUAt57SkD2LAqaFRaRomMKwuBOTsp2x5yhExkiX+UbkrTh+NONSOEKwss5
	 RqyNGAVYAqZKbxrZRhbAh6w9HhAAQQi6uyLc08lU16vwGTHy0ZSIMLBKjmCmAcJY74
	 sANlGwou2AGNLspTivxIOViDMQfvJrVGtJG/eZKCAz1ZfV2lJdzIlqXRNJinxUX+1y
	 w+rDbEP/D2VLw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 24 Apr 2024 17:01:56 +0300 (MSK)
Received: from [172.28.226.27] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 24 Apr 2024 17:01:56 +0300
Message-ID: <712f0acd-4741-4e69-a12d-6fe659333b42@salutedevices.com>
Date: Wed, 24 Apr 2024 17:01:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] pwm: meson: Add support for Amlogic S4 PWM
To: Jerome Brunet <jbrunet@baylibre.com>, <kelvin.zhang@amlogic.com>
CC: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Junyi Zhao
	<junyi.zhao@amlogic.com>
References: <20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com>
 <20240424-s4-pwm-v4-1-ee22effd40d0@amlogic.com>
 <1jil07f3ps.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <1jil07f3ps.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184899 [Apr 24 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/24 08:29:00 #24954596
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_070159_997688_263C9714 
X-CRM114-Status: GOOD (  23.43  )
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

Hello Jerome

On 4/24/24 13:32, Jerome Brunet wrote:
> 
> On Wed 24 Apr 2024 at 18:28, Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org> wrote:
> 
>> From: Junyi Zhao <junyi.zhao@amlogic.com>
>>
>> This patch adds support for Amlogic S4 PWM.
>>
>> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
>> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
>> ---
>>   drivers/pwm/pwm-meson.c | 37 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
>> index ea96c5973488..6abc823745e4 100644
>> --- a/drivers/pwm/pwm-meson.c
>> +++ b/drivers/pwm/pwm-meson.c
>> @@ -462,6 +462,35 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
>>   	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
>>   }
>>   
>> +static int meson_pwm_init_channels_meson_s4(struct pwm_chip *chip)
>> +{
>> +	int i, ret;
>> +	struct device *dev = pwmchip_parent(chip);
>> +	struct device_node *np = dev->of_node;
>> +	struct meson_pwm *meson = to_meson_pwm(chip);
>> +	struct meson_pwm_channel *channel;
>> +
>> +	for (i = 0; i < MESON_NUM_PWMS; i++) {
>> +		channel = &meson->channels[i];
>> +		channel->clk = of_clk_get(np, i);
>> +		if (IS_ERR(channel->clk)) {
>> +			ret = PTR_ERR(channel->clk);
>> +			dev_err_probe(dev, ret, "Failed to get clk\n");
>> +			goto err;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +err:
>> +	while (--i >= 0) {
>> +		channel = &meson->channels[i];
>> +		clk_put(channel->clk);
> 
> Fine on error but leaks on module unload.
> 
> Same as George,
> 
> Add the devm variant of of_clk_get() if you must.
> Use devm_add_action_or_reset() otherwise
> 
> Could please synchronize this series with George and deal with all the
> supported SoCs ? a1, s4, t7, c3 ...

If the chipmaker eagers to support s4 himself we're ok :)
But since I sent my patch first I think it'd be fair if this
single patch have my tag:
Co-Developed-by: George Stark <gnstark@salutedevices.com>

I'll help to review the patch too.

Jerome could we split support for all mentioned socs into different series?
e.g.
1. Junyi finishes the driver's base patch and s4 dtsi patch
2. I send a1 dt-bindings and a1 dtsi patches
3. Someone later sends t7/c3 dt-bindings + dtsi

The reason is to apply what we have on hand now due to meson-pwm is 
under heavy development more than a year already.

> 
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static const struct meson_pwm_data pwm_meson8b_data = {
>>   	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
>>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
>> @@ -500,6 +529,10 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
>>   	.channels_init = meson_pwm_init_channels_meson8b_v2,
>>   };
>>   
>> +static const struct meson_pwm_data pwm_meson_s4_data = {
>> +	.channels_init = meson_pwm_init_channels_meson_s4,
>> +};
>> +
>>   static const struct of_device_id meson_pwm_matches[] = {
>>   	{
>>   		.compatible = "amlogic,meson8-pwm-v2",
>> @@ -538,6 +571,10 @@ static const struct of_device_id meson_pwm_matches[] = {
>>   		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
>>   		.data = &pwm_g12a_ao_cd_data
>>   	},
>> +	{
>> +		.compatible = "amlogic,meson-s4-pwm",
>> +		.data = &pwm_meson_s4_data
>> +	},
>>   	{},
>>   };
>>   MODULE_DEVICE_TABLE(of, meson_pwm_matches);
> 
> 

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
