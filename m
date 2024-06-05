Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4F3C25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhElxGoV8aAVjLls+MG1UYDp+rVQnl4QaUw2R3v5rqE=; b=x77RXZxWy4iI3k
	4MDtw6s7RnO2SdFUM6mwQ+rqVhaUQ1X3TLVHMAfoQyU6zIK/tx7MoWbu8KQXsp0dOV6ehMaHNISaZ
	DjRf6jpjF0UXx4R8naeMzPjT3gZhjye76z76cvZOsh065ykfWoX91NMGyKy0E9n1uVjo9FSyjgfjy
	G9Mct6wmM0Tn2Kd66URiUZntYoC0vC84Q1SLBfML9Zh6QL9Q0GFtkRlJynVypGIvw6cdt/siyDf7p
	IjaUw8Z4jsGrgLdWIghB8IeRZCCEauX3AiBtKW+QBpxq/aAjaqf6OV3tpUuMuq2e7noM2/7gik7W6
	PVj0TKx7uAM+qPGjQ5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpVx-00000005uaw-1Bgx;
	Wed, 05 Jun 2024 12:13:13 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpVt-00000005uXN-29zk;
	Wed, 05 Jun 2024 12:13:12 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D8ECE120004;
	Wed,  5 Jun 2024 15:12:55 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D8ECE120004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1717589575;
	bh=2z/5jcit4ED6/bQSchswwiQ4yyjb3x0SPW6la7FZmUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=j5HwE2dpDC/pSgVsdScU1ekDN807PhqvrNu1REDKtH+TW7clPibaT17Gun/hBAlDs
	 Ms8njuKLPRJT/oi70O7elwLn5sqGBgRrM4InJY5JddC/1wZf0ZIlLpoNP5poOF+wqU
	 04GnkPpYkoUp+0PkJgJ9A/vlYqeKgM2pK+qy5nPuZYSsMAghI4JQPU08Uqfgyya34o
	 +3uyK3HCXaXIQEQEaW0l2cN54GTo/BvDPWEmALJiaDdqDTw23LTOSJwHa2HvH835ac
	 mqugrFffhEICPsiajuaTuFB2/Ra7KA1xfGfRwYxKQjl0Xvks860w90TxAWXSlquyI9
	 Bd+snRZaT2IEA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jun 2024 15:12:55 +0300 (MSK)
Received: from [172.28.65.20] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 5 Jun 2024 15:12:55 +0300
Message-ID: <ce3c2772-8e91-4fd3-b52e-2a35d5759664@salutedevices.com>
Date: Wed, 5 Jun 2024 15:12:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error][DKIM error] [PATCH v7 1/2] pwm: meson: Add support
 for Amlogic S4 PWM
To: <kelvin.zhang@amlogic.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Junyi Zhao <junyi.zhao@amlogic.com>
References: <20240605-s4-pwm-v7-0-e822b271d7b0@amlogic.com>
 <20240605-s4-pwm-v7-1-e822b271d7b0@amlogic.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240605-s4-pwm-v7-1-e822b271d7b0@amlogic.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185739 [Jun 05 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/05 08:34:00 #25451662
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_051310_258355_1005C47C 
X-CRM114-Status: GOOD (  19.22  )
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

Hello Kelvin, Junyi

On 6/5/24 05:44, Kelvin Zhang via B4 Relay wrote:
> From: Junyi Zhao <junyi.zhao@amlogic.com>
> 
> Add support for Amlogic S4 PWM.
> 
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   drivers/pwm/pwm-meson.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index b2f97dfb01bb..4f01847525b2 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -460,6 +460,34 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
>   	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
>   }
>   
> +static void meson_pwm_s4_put_clk(void *data)
> +{
> +	struct clk *clk = data;
> +
> +	clk_put(clk);
> +}
> +
> +static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
> +{
> +	struct device *dev = pwmchip_parent(chip);
> +	struct device_node *np = dev->of_node;
> +	struct meson_pwm *meson = to_meson_pwm(chip);
> +	int i, ret;
> +
> +	for (i = 0; i < MESON_NUM_PWMS; i++) {
> +		meson->channels[i].clk = of_clk_get(np, i);
> +		if (IS_ERR(meson->channels[i].clk)) {
> +			ret = PTR_ERR(meson->channels[i].clk);
> +			dev_err_probe(dev, ret, "Failed to get clk\n");
> +			return ret;
> +		}
> +		devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
> +					 meson->channels[i].clk);

devm_add_action_or_reset() result should be checked

> +	}
> +
> +	return 0;
> +}

You can rewrite it a bit to always have a single allocation for devm node:

static void meson_pwm_s4_put_clk(void *data)
{
	struct meson_pwm *meson = data;
	int i;

	for (i = 0; i < MESON_NUM_PWMS; i++)
		clk_put(meson->channels[i].clk);
}

static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
{
	struct device *dev = pwmchip_parent(chip);
	struct device_node *np = dev->of_node;
	struct meson_pwm *meson = to_meson_pwm(chip);
	int i, ret;

	ret = devm_add_action(dev, meson_pwm_s4_put_clk, meson);
	if (ret)
		return ret;

	for (i = 0; i < MESON_NUM_PWMS; i++) {
		meson->channels[i].clk = of_clk_get(np, i);
		if (IS_ERR(meson->channels[i].clk)) {
			ret = PTR_ERR(meson->channels[i].clk);
			dev_err_probe(dev, ret, "Failed to get clk\n");
			return ret;
		}
	}

	return 0;
}


-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
