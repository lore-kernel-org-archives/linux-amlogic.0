Return-Path: <SRS0=kT+d=VT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A34C76188
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jul 2019 07:24:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57126222F9
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jul 2019 07:24:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G5GBgQdT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jvdeZrYg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57126222F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3Z9iwSKTj+xG51rTmFmpVsOy8+n4LV5TrFbJae3yII=; b=G5GBgQdTaWWOrZ
	zWxBYq9IGEnJ7gJ22t57/fYw2ZH9tVSeglzvXudROSF5Bc8NS9y+7QDQeEZ2aWSFgHpL6c5s/+uSk
	Kv0g+9wh5JlEVkp8FuCkageGm+HeR6pcUPn8rgcCkxwjO+yVlQSXlzLDnJTWBXXEKT7zv94nCexI+
	O/lec1xwKNWCTzlx3/EqtGVsXooXM22udPePWBLtVxd5edtaHLxNcHU1moFNni4xpbMnRyJctG7uK
	Z6KO2s8aR9c2xwBbEwTJfeHnunnemGPtrqb2qUJOc/Ud258mAMByxVp+4Qjn7zrOm0w+crwX2mBqq
	mWIj/y5qtUkXtV9UWNDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpSgm-0000Bh-9U; Mon, 22 Jul 2019 07:24:52 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpSgc-0008JS-DQ
 for linux-amlogic@lists.infradead.org; Mon, 22 Jul 2019 07:24:44 +0000
Received: by mail-wr1-x442.google.com with SMTP id y4so38226698wrm.2
 for <linux-amlogic@lists.infradead.org>; Mon, 22 Jul 2019 00:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nMZuGRlFlzcSdiPzxn9pcJK7OKF/B9+5hxqTtDkpex4=;
 b=jvdeZrYgWfQYjD7mgMexxIDNqyWl9vlazPnOKYJlFV24qFucJHTUox3bXzsOjNut9h
 Ctjfliat5ir2wg8qG4qx51W2HAWzkVfoZIWr5ZncSVmTx4cXCPh5c41cOa8uV8DPteqz
 ovV+YE3TXcp/HiNyMKDPMG1HjJCqaa4KoUBZF1uM5q9DHCtPuxW5SayhL91E5Z7iwHBt
 d+DW9jqsJgOUF04Xmna2qCS74Gbyyn3TnQE/33o+yeJGxKi2eCIiAKX0vvsRFx0/ZRqI
 NERk4XCPwuN/Y5FM5Zrphu9L/dUu7HwX3GLabAKSHQ6KADJRURq5pkg8bO2pVnFMGSzk
 uQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nMZuGRlFlzcSdiPzxn9pcJK7OKF/B9+5hxqTtDkpex4=;
 b=Cpjy6lLgsaITxCgp6NrRsQedJMl/DuGNcRUm61WT0CtXqVDFb1vS3iSxZTAxE9kdyp
 4R6P2IbX1ievFC6WIb70Xdiqpwah/Rrur4nQAr3oQLlf1rUEhVGc0ns+UsfdPh085NLQ
 S4cHJP47ppdQY9Bvsl6yJ2I4m7+RBuV652Snkmvuvx7oJXIzO42wzuKWGxrQCG9Q215v
 7hzQHvK9qZ/8IlmwyBl4L/Z3Vh8R4sAImKkDsZU5yEiUpMFOC2o2oXpjmMJVw+rxV/vf
 +s3XXxZdhVsXVa769XZVaI9pR+JP5z8WV+NPh6RbVmGXv6KDkOwzkxtgMpspb7Hq9/V5
 mdYA==
X-Gm-Message-State: APjAAAUhcRKw96/mnUGMunPTc0QJSZ5L5E+Lj3e6u44cdHBLZQF388ex
 cX4UJHMZ0Qx3ROniQLQz+mUqgQ==
X-Google-Smtp-Source: APXvYqweDWCkPhHcv8tR8LkasgDl0cUp0lPScQVM9RCOWUJ8BiXysiZH96jrtkTEUfP7KhdtScY64g==
X-Received: by 2002:a5d:4484:: with SMTP id j4mr73024105wrq.143.1563780280765; 
 Mon, 22 Jul 2019 00:24:40 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 l9sm33341617wmh.36.2019.07.22.00.24.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 00:24:40 -0700 (PDT)
Subject: Re: [PATCH 2/2] clk: meson: axg-audio: add g12a reset support
To: Jerome Brunet <jbrunet@baylibre.com>
References: <20190703122614.3579-1-jbrunet@baylibre.com>
 <20190703122614.3579-3-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <87b55e1e-7738-5fb7-405b-f1418d258dbd@baylibre.com>
Date: Mon, 22 Jul 2019 09:24:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703122614.3579-3-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_002442_571679_F87B589F 
X-CRM114-Status: GOOD (  20.72  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 03/07/2019 14:26, Jerome Brunet wrote:
> On the g12a, the register space dedicated to the audio clock also
> provides some resets. Let the clock controller register a reset
> provider as well for this SoC family.
> 
> the axg SoC family does not appear to provide this feature.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/axg-audio.c | 107 +++++++++++++++++++++++++++++++++-
>  drivers/clk/meson/axg-audio.h |   1 +
>  2 files changed, 106 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 8028ff6f6610..ce163bd03aad 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> +#include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  
>  #include "axg-audio.h"
> @@ -916,6 +917,84 @@ static int axg_register_clk_hw_inputs(struct device *dev,
>  	return 0;
>  }
>  
> +struct axg_audio_reset_data {
> +	struct reset_controller_dev rstc;
> +	struct regmap *map;
> +	unsigned int offset;
> +};
> +
> +static void axg_audio_reset_reg_and_bit(struct axg_audio_reset_data *rst,
> +					unsigned long id,
> +					unsigned int *reg,
> +					unsigned int *bit)
> +{
> +	unsigned int stride = regmap_get_reg_stride(rst->map);
> +
> +	*reg = (id / (stride * BITS_PER_BYTE)) * stride;
> +	*reg += rst->offset;
> +	*bit = id % (stride * BITS_PER_BYTE);
> +}
> +
> +static int axg_audio_reset_update(struct reset_controller_dev *rcdev,
> +				unsigned long id, bool assert)
> +{
> +	struct axg_audio_reset_data *rst =
> +		container_of(rcdev, struct axg_audio_reset_data, rstc);
> +	unsigned int offset, bit;
> +
> +	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
> +
> +	regmap_update_bits(rst->map, offset, BIT(bit),
> +			assert ? BIT(bit) : 0);
> +
> +	return 0;
> +}
> +
> +static int axg_audio_reset_status(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	struct axg_audio_reset_data *rst =
> +		container_of(rcdev, struct axg_audio_reset_data, rstc);
> +	unsigned int val, offset, bit;
> +
> +	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
> +
> +	regmap_read(rst->map, offset, &val);
> +
> +	return !!(val & BIT(bit));
> +}
> +
> +static int axg_audio_reset_assert(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	return axg_audio_reset_update(rcdev, id, true);
> +}
> +
> +static int axg_audio_reset_deassert(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	return axg_audio_reset_update(rcdev, id, false);
> +}
> +
> +static int axg_audio_reset_toggle(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	int ret;
> +
> +	ret = axg_audio_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	return axg_audio_reset_deassert(rcdev, id);
> +}
> +
> +static const struct reset_control_ops axg_audio_rstc_ops = {
> +	.assert = axg_audio_reset_assert,
> +	.deassert = axg_audio_reset_deassert,
> +	.reset = axg_audio_reset_toggle,
> +	.status = axg_audio_reset_status,
> +};
> +
>  static const struct regmap_config axg_audio_regmap_cfg = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
> @@ -925,12 +1004,15 @@ static const struct regmap_config axg_audio_regmap_cfg = {
>  
>  struct audioclk_data {
>  	struct clk_hw_onecell_data *hw_onecell_data;
> +	unsigned int reset_offset;
> +	unsigned int reset_num;
>  };
>  
>  static int axg_audio_clkc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	const struct audioclk_data *data;
> +	struct axg_audio_reset_data *rst;
>  	struct regmap *map;
>  	struct resource *res;
>  	void __iomem *regs;
> @@ -1005,8 +1087,27 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> -					   data->hw_onecell_data);
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					data->hw_onecell_data);
> +	if (ret)
> +		return ret;
> +
> +	/* Stop here if there is no reset */
> +	if (!data->reset_num)
> +		return 0;
> +
> +	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> +	if (!rst)
> +		return -ENOMEM;
> +
> +	rst->map = map;
> +	rst->offset = data->reset_offset;
> +	rst->rstc.nr_resets = data->reset_num;
> +	rst->rstc.ops = &axg_audio_rstc_ops;
> +	rst->rstc.of_node = dev->of_node;
> +	rst->rstc.owner = THIS_MODULE;
> +
> +	return ret = devm_reset_controller_register(dev, &rst->rstc);
>  }
>  
>  static const struct audioclk_data axg_audioclk_data = {
> @@ -1015,6 +1116,8 @@ static const struct audioclk_data axg_audioclk_data = {
>  
>  static const struct audioclk_data g12a_audioclk_data = {
>  	.hw_onecell_data = &g12a_audio_hw_onecell_data,
> +	.reset_offset = AUDIO_SW_RESET,
> +	.reset_num = 26,
>  };
>  
>  static const struct of_device_id clkc_match_table[] = {
> diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
> index 5d972d55d6c7..c00e28b2e1a9 100644
> --- a/drivers/clk/meson/axg-audio.h
> +++ b/drivers/clk/meson/axg-audio.h
> @@ -22,6 +22,7 @@
>  #define AUDIO_MCLK_F_CTRL	0x018
>  #define AUDIO_MST_PAD_CTRL0	0x01c
>  #define AUDIO_MST_PAD_CTRL1	0x020
> +#define AUDIO_SW_RESET		0x024
>  #define AUDIO_MST_A_SCLK_CTRL0	0x040
>  #define AUDIO_MST_A_SCLK_CTRL1	0x044
>  #define AUDIO_MST_B_SCLK_CTRL0	0x048
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
