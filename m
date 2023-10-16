Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF5DCDB465
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Oct 2023 22:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lyppqyxcBtcPAUX+rBCz7fHtnummBgPwGkGjUQyMI8=; b=DM7urmEkC41wkJ
	hyX0Yj2O2RRK7E9pIj+7zJzWB1SQXTDpDEm295k9nNPA+tCwp91esp6S8PGiDpWQWznNzHFr48BWV
	RR8MT/ic0xB8RaTMnFttmluux/C5EBFG6Fb2NDrXRbi1pDTubc6bYxicV+FyW0KcXFvx//konqZJO
	QyHQlxGhMoyFqwuogv7Z+j1aZLlnS+QiXXXsd7hGMDsMXbBTk1VQVmuCVxjzFIDY28JOz9o8b2a3C
	dHg5//hHKprVK49VjX10oTvUN+q5X/toVn4jig0IYTOgyC4RplTI3fbsUnYPyN4phseoewRRvATiz
	ueoeMVLUuLqRFcyDskrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsWE9-00Ajbo-1c;
	Mon, 16 Oct 2023 22:38:21 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsWE6-00AjaH-1d;
	Mon, 16 Oct 2023 22:38:20 +0000
Date: Mon, 16 Oct 2023 22:37:49 +0000
From: Yixun Lan <dlan@gentoo.org>
To: JunYi Zhao <junyi.zhao@amlogic.com>
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 RESEND] pwm: meson: add pwm support for S4
Message-ID: <20231016223749.GA7647@ofsar>
References: <20231016052457.1191838-1-junyi.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231016052457.1191838-1-junyi.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_153818_572412_90EB1B0D 
X-CRM114-Status: GOOD (  19.66  )
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

Hi JunYi

On 13:24 Mon 16 Oct     , JunYi Zhao wrote:
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
>  drivers/pwm/pwm-meson.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 25519cddc2a9..fe9fd75747c4 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -99,6 +99,7 @@ struct meson_pwm_channel {
>  struct meson_pwm_data {
>  	const char * const *parent_names;
>  	unsigned int num_parents;
> +	unsigned int extern_clk;
>  };
>  
>  struct meson_pwm {
> @@ -396,6 +397,10 @@ static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
>  	.num_parents = ARRAY_SIZE(pwm_g12a_ao_cd_parent_names),
>  };
>  
> +static const struct meson_pwm_data pwm_s4_data = {
> +	.extern_clk = true,
> +};
> +
>  static const struct of_device_id meson_pwm_matches[] = {
>  	{
>  		.compatible = "amlogic,meson8b-pwm",
> @@ -429,6 +434,10 @@ static const struct of_device_id meson_pwm_matches[] = {
>  		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
>  		.data = &pwm_g12a_ao_cd_data
>  	},
> +	{
> +		.compatible = "amlogic,s4-pwm",
> +		.data = &pwm_s4_data,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, meson_pwm_matches);
> @@ -451,6 +460,16 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
>  		struct clk_parent_data div_parent = {}, gate_parent = {};
>  		struct clk_init_data init = {};
>  
> +		if (meson->data->extern_clk) {
> +			snprintf(name, sizeof(name), "clkin%u", i);
> +			channel->clk = devm_clk_get(dev, name);
use devm_clk_get_optional() which would save you from introducing
the 'extern_clk' variable

> +			if (IS_ERR(channel->clk)) {
> +				dev_err(meson->chip.dev, "can't get device clock\n");
> +				return PTR_ERR(channel->clk);
> +			}
> +			continue;
> +		}
> +
>  		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
>  
>  		init.name = name;
> 
> base-commit: 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
> -- 
> 2.41.0
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
