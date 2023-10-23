Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF1EC25B45
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Oct 2023 20:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gl+5xvAtOsSA/s55oKXeA2T4RszvScncMYbOIRz5hLQ=; b=slsrAylM714hUsi9hK/Xczdxjk
	jHKUJ5J7k8FtgqtU8D92sUd7RJzt8w+LebIAEGo6sM5VtvbkpLbUOe41zzg6terG+3sYh2kh0Yc9E
	+RB/skK7YuLhY2QnVy5nJx4a9ohF4loLQ5ETlu9Pcy+Y8THFxnsvnprWhgerfVRAgcp3t893I4/QC
	2gaPVPTcA3uW4C38cbxwI3jmBdEZUIK0Nc6YCX8/9ab3+u0+L73OUtG0QncDSC7eRUYvLENR3cS8o
	vPiU1EAyn2XiEIAPR1gFWokiHOyux7ECPjoWX9rnM7V1dmmyFlzVolOsUcnJEGNnvMKdoEi396B/S
	v6fTFbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv1D4-008Dsi-1X;
	Mon, 23 Oct 2023 20:07:34 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv1D0-008Dro-14;
	Mon, 23 Oct 2023 20:07:32 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D5EB6120014;
	Mon, 23 Oct 2023 23:07:24 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D5EB6120014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1698091644;
	bh=6nprZO3dzKZSeMwqmtQlXFQ3CBnQLenNbiuNbUHf8kU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=tkrlIrhp/4WgQfs8TbMCH/7ZNqvAq47LWAm85Ym2H5td7RCq64AH2Ige5Kxl7Cuv2
	 f0PYoVvzkryj2McKPii14GPp8+tTnax5CX8gmvmkZ2Hu7XX+GXi+kT2Oql403afsyh
	 BwxrtPMierl8ZjlHyp4ypiJGV5oOTyCEmFfMqYBSOCpoJao3IRo+y7fLwTvlc5ISzS
	 zXAITWdhebzq2rMbZBQIxf/m9cCrFyzjyBOUlYaah4KZ/YJ8OLl/PXEiIzA0YpLLqY
	 KnicpAlJD8tsrGSoU0Ns0af5+Ozj+53KkJlsHYAeLxnbbDMBSKrKyrjGYF6cOrxcQE
	 tmLoSPVyT5dhA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 23 Oct 2023 23:07:24 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Mon, 23 Oct 2023 23:07:24 +0300
Message-ID: <10dcc778-f165-407e-b765-760d277d5e35@salutedevices.com>
Date: Mon, 23 Oct 2023 23:07:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 RESEND] pwm: meson: add pwm support for S4
Content-Language: en-US
To: JunYi Zhao <junyi.zhao@amlogic.com>, <thierry.reding@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linux-pwm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20231016052457.1191838-1-junyi.zhao@amlogic.com>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20231016052457.1191838-1-junyi.zhao@amlogic.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180818 [Oct 23 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 542 542 3d23828e213bab96daa5e52f9cef518f74e40214, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/10/23 18:09:00 #22267281
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_130730_725541_52BFE239 
X-CRM114-Status: GOOD (  18.80  )
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

Hello JunYi Zhao

On 10/16/23 08:24, JunYi Zhao wrote:
> From: "junyi.zhao" <junyi.zhao@amlogic.com>
> 
> Support PWM for S4 soc.
> Now the PWM clock input is done in independent CLKCTRL registers.
> And no more in the PWM registers.
> PWM needs to obtain an external clock source.
> 
> Signed-off-by: junyi.zhao <junyi.zhao@amlogic.com>
> ---
> V2 -> V3:
> Rebase and Review the latest upstream code again.
> After reconstruction, stick to the previous code as much as possible.
>   drivers/pwm/pwm-meson.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 25519cddc2a9..fe9fd75747c4 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -99,6 +99,7 @@ struct meson_pwm_channel {
>   struct meson_pwm_data {
>   	const char * const *parent_names;
>   	unsigned int num_parents;
> +	unsigned int extern_clk;
may be bool extern_clk;
>   };
>   
>   struct meson_pwm {
> @@ -396,6 +397,10 @@ static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
>   	.num_parents = ARRAY_SIZE(pwm_g12a_ao_cd_parent_names),
>   };
>   
> +static const struct meson_pwm_data pwm_s4_data = {
> +	.extern_clk = true,
> +};
> +
>   static const struct of_device_id meson_pwm_matches[] = {
>   	{
>   		.compatible = "amlogic,meson8b-pwm",
> @@ -429,6 +434,10 @@ static const struct of_device_id meson_pwm_matches[] = {
>   		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
>   		.data = &pwm_g12a_ao_cd_data
>   	},
> +	{
> +		.compatible = "amlogic,s4-pwm",
> +		.data = &pwm_s4_data,
> +	},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, meson_pwm_matches);
> @@ -451,6 +460,16 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
>   		struct clk_parent_data div_parent = {}, gate_parent = {};
>   		struct clk_init_data init = {};
>   
> +		if (meson->data->extern_clk) {
> +			snprintf(name, sizeof(name), "clkin%u", i);
> +			channel->clk = devm_clk_get(dev, name);
> +			if (IS_ERR(channel->clk)) {
> +				dev_err(meson->chip.dev, "can't get device clock\n");
> +				return PTR_ERR(channel->clk);
> +			}
> +			continue;
> +		}
> +
>   		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
>   
>   		init.name = name;
> 
> base-commit: 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
