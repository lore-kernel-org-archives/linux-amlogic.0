Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B452FC25B74
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 18:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVuQqv0AezGKYRV5Sw2aEOS0HFtxHIYnjR2ejD8+c+Y=; b=AZq/ivpJ1ZD/KM
	CL/e1BCzyG1fmqf7nHdFowGnm+cQJHTizR267RzCmlFslD05XXpgBqFZyqAsyOA+I5nWiRN7BUcUP
	oD1yQgaXq6Hb4L28Ow0FeTKUoYdgdWxKiEmQD97qxLU/4xecH+iE12r/Yrmw7uTsyUa3Lf+vysfnC
	qH5LaPCLYLRiV1D/jP/ns/1KqplHpOjiELsEkvwLn0mt2t5CYMjVq8yOtUN9DeJumQSIyJYRppFaw
	DTUan2sx50zncF4L9sf+OnD30fNb22R+P/4rp+S1LwpqQwVd63Hrd2PwFjv8laFijxYm9fWzYRTGT
	Na9xA/SKfRKe0niG4/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9UZ7-00000000piM-2G0r;
	Tue, 21 May 2024 18:50:25 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9UZ3-00000000phf-21an;
	Tue, 21 May 2024 18:50:24 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2BB1F120005;
	Tue, 21 May 2024 21:50:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2BB1F120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1716317413;
	bh=layIMEI/pkFEQkS/PJJqywpWNGCjnNMloO+DcQbHo2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=twf+yDEYeGnc8V8rmhzGZNgtuCb1UG/9wxtYXD7uOUAfw8PWdYoIvnxNDrni9YUZF
	 pdhlqlgWSN6eAub5PMoPWf0CkTi682zSrm2bQ+7Qgr9MrbObX0iLFLuyCLueQ9Ugbg
	 9CAuInykDuKE50mG2TcWmCwYFRL3Nuzh9/TLt5Jw20e53jw0Uf6pIqu/0NMNCTj+pQ
	 //fUDTVaK9ycLN+YZwwGwPU5Dhl3HnMPC1HbzfUvEpDQTldPe8o9vK193kZ8/NOXc6
	 22ziJVXKTDc4ybFOgsz7ATDrkpILVsDSgFRc+EDbDlfxu0dReGzhVTLeoZbL0fCvZo
	 edxh+LI8gmvUw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 21 May 2024 21:50:12 +0300 (MSK)
Received: from [172.28.65.135] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 May 2024 21:50:12 +0300
Message-ID: <4fd9fe90-1da0-4b8c-8bc4-18b7a4dc38ab@salutedevices.com>
Date: Tue, 21 May 2024 21:50:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error][DKIM error] [PATCH v5 1/2] pwm: meson: Add support
 for Amlogic S4 PWM
To: <kelvin.zhang@amlogic.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Junyi Zhao <junyi.zhao@amlogic.com>,
	"kernel@salutedevices.com" <kernel@salutedevices.com>
References: <20240521-s4-pwm-v5-0-0c91f5fa32cd@amlogic.com>
 <20240521-s4-pwm-v5-1-0c91f5fa32cd@amlogic.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240521-s4-pwm-v5-1-0c91f5fa32cd@amlogic.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185399 [May 21 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_uf_ne_domains}, {Tracking_dating_text_input_url}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;www.kernel.org:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/05/21 16:20:00
X-KSMG-LinksScanning: Clean, bases: 2024/05/21 17:40:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/21 08:41:00 #25230763
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_115022_258246_A80B4B13 
X-CRM114-Status: GOOD (  23.65  )
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

On 5/21/24 11:31, Kelvin Zhang via B4 Relay wrote:
> From: Junyi Zhao <junyi.zhao@amlogic.com>
> 
> This patch adds support for Amlogic S4 PWM.

Please take a look at 
https://www.kernel.org/doc/html/v6.9/process/submitting-patches.html#describe-your-changes

It should be something like
Add support for Amlogic S4 PWM.


> 
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   drivers/pwm/pwm-meson.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index b2f97dfb01bb..9fea28a51921 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -460,6 +460,51 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
>   	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
>   }
>   
> +static void meson_pwm_s4_put_clk(void *data)
> +{
> +	int i;
> +	struct meson_pwm *meson;
> +	struct meson_pwm_channel *channel;
> +
> +	meson = (struct meson_pwm *)data;
You can initialize meson variable along with declaration; type casting 
is not needed

> +	for (i = 0; i < MESON_NUM_PWMS; i++) {
> +		channel = &meson->channels[i];
> +		clk_put(channel->clk);
> +	}
you can save 3 lines just by using clk_put(meson->channels[i].clk);

> +}
> +
> +static int meson_pwm_init_channels_meson_s4(struct pwm_chip *chip)
> +{
> +	int i, ret;
> +	struct device *dev = pwmchip_parent(chip);
> +	struct device_node *np = dev->of_node;
> +	struct meson_pwm *meson = to_meson_pwm(chip);
> +	struct meson_pwm_channel *channel;
> +
> +	for (i = 0; i < MESON_NUM_PWMS; i++) {
> +		channel = &meson->channels[i];
> +		channel->clk = of_clk_get(np, i);
> +		if (IS_ERR(channel->clk)) {
> +			ret = PTR_ERR(channel->clk);
> +			dev_err_probe(dev, ret, "Failed to get clk\n");
> +			goto err;
> +		}
> +	}
> +	ret = devm_add_action_or_reset(dev, meson_pwm_s4_put_clk, meson);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +
> +err:
> +	while (--i >= 0) {
> +		channel = &meson->channels[i];
> +		clk_put(channel->clk);
> +	}
> +
> +	return ret;
> +}
> +
>   static const struct meson_pwm_data pwm_meson8b_data = {
>   	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> @@ -498,6 +543,10 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
>   	.channels_init = meson_pwm_init_channels_meson8b_v2,
>   };
>   
> +static const struct meson_pwm_data pwm_meson_s4_data = {
> +	.channels_init = meson_pwm_init_channels_meson_s4,
> +};
> +
according to already existing soc-specific named vars and functions
new names should be
static const struct meson_pwm_data pwm_s4_data
and
static int meson_pwm_init_channels_s4(struct pwm_chip *chip)

>   static const struct of_device_id meson_pwm_matches[] = {
>   	{
>   		.compatible = "amlogic,meson8-pwm-v2",
> @@ -536,6 +585,10 @@ static const struct of_device_id meson_pwm_matches[] = {
>   		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
>   		.data = &pwm_g12a_ao_cd_data
>   	},
> +	{
> +		.compatible = "amlogic,meson-s4-pwm",
> +		.data = &pwm_meson_s4_data
> +	},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, meson_pwm_matches);
> 

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
