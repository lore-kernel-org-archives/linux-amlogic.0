Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4103C30653
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 10:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LO1cmkWfP9Ilk3c35fXJXYTbd5MrB0VK/OFdOpvjOTI=; b=IC+lzwuhmiFCj/za1m+MLKlyI1
	AtPoRs76GyKdDDhFgVd+C4m+vB1e7FLUZ2zG08vvG1VWk8Skapz3BUc4xMWb9B7oDkIwdwFlP7o4e
	nZ+BpqXIT6U/bLwjTKVJh7ax77bnrbGDBpEB6PoBnI4tf+ECud/o1KfDO5PxhR/5Mq6JTT8pb+CEV
	gKDGu51+4ott4djFt7ph/HFnkFF8KM3dYo6+jenO7/ExBuD4oiBQQzdYPBEIqwIl/vZpm+nn3Udsb
	svlYL+ETEOBkqnEQgw0BeCN33omQNv5FtLg1tDt+XfcmJNE70bRiTKIK9fqK1i/bsFl04cJlciQn1
	tzOkBU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxds-00000009thn-2LgC;
	Wed, 03 Jul 2024 10:55:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxdY-00000009tWg-0MrR
	for linux-amlogic@lists.infradead.org;
	Wed, 03 Jul 2024 10:54:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4256788e13bso38127845e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Jul 2024 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720004094; x=1720608894; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2qm0K3jIFzcKInhy4SvJXxy1XVZ9MwLxLzY8rfv6AI=;
        b=d43eoiGi7+H1rC+OweaxyF4HRi4pFwR9HQoTcim3hr9KMMzHzaf60oN67fhoWvctOB
         uEijbr2eMruwQ7uchC1XeWbfQ6IEF6pndfMuDN6Wdy0FMXVi7P+6IlKG3DDFOOeRTGtV
         3rdJ3+WEDp4fyooBfa3EbFPT0fnsc42tq+3Z412s0PmX38S46w14CCof3mfuNymEhGgu
         lKnR62vzXKaB4R4oN3o3sO0D5C4l81mjECLpsLDDM6QVlw9AuzXQOlu6IR4/4dCXVysP
         fSC0QbT3OpibZsUn/PX7wSoidF7ET7iFCEy8Fh2e+4rjU9Im4HCEIYjALoKbyHCC4dFF
         ATYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004094; x=1720608894;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q2qm0K3jIFzcKInhy4SvJXxy1XVZ9MwLxLzY8rfv6AI=;
        b=NzwsAm2vWcqwN+74HBnw1hDQib1Cxw44tBk/Zv4Za8McGcVP3NvyLNDugnQlnuyQtE
         ij+bjDfOsRufyDhYTPoS1UNuOXzBrdFjptaFfIHNqgZoVD/0eyfNuciYNcqJ0RoYvRzx
         VQHtYXBpwPZA2uei9GtlT0/y8u1MJdgiiKKE4T91nIg3Bi/VoV7Nc2uXzujJevVvs9LV
         Mj33hHYaeZfI2XhoBA87EJoCVhkbJR9IOfWUkSM1Wc0fNLJw9XaPcuIyyKOUyf4HQJ1v
         fnQfaNSv4+GASCcpGekNwYOGuMCkZXWYwW8BwF3m4tPhZtN4ydcFfwyWhKcnY4jIaAVr
         oYuA==
X-Gm-Message-State: AOJu0Yy+yREIli97JMAENpxT4Fcvuf5VN1D0wm55/1VvScURKRg1lmqF
	CKjynylI5hrir6Ja5efAsYvDW9RL83t0XM4OAbp1x3EhWGOWEiu8uXuZlfApepU=
X-Google-Smtp-Source: AGHT+IFxj8jlEQLBpSqKhooeLWCX1htSQQ5imS6gMVsLRfICOATTre1xSXqKt543E2h6n9McHYRATQ==
X-Received: by 2002:a5d:4529:0:b0:362:1b7e:8e66 with SMTP id ffacd0b85a97d-36775730f03mr6861561f8f.71.1720004094166;
        Wed, 03 Jul 2024 03:54:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71? ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fbbfesm15660302f8f.66.2024.07.03.03.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:54:53 -0700 (PDT)
Message-ID: <40c995a4-ca34-47a8-b8d7-587c781527c1@linaro.org>
Date: Wed, 3 Jul 2024 12:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 05/10] clk: meson: s4: peripherals: Constify struct
 regmap_config
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-5-7d15a0671d6f@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240703-clk-const-regmap-v1-5-7d15a0671d6f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_035456_146960_FCB71298 
X-CRM114-Status: GOOD (  13.03  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 03/07/2024 11:50, Javier Carrasco wrote:
> `clkc_regmap_config` is not modified and can be declared as const to
>   move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/clk/meson/s4-peripherals.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 130c50554290..ba1d531fce4f 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3747,7 +3747,7 @@ static struct clk_regmap *const s4_periphs_clk_regmaps[] = {
>   	&s4_adc_extclk_in_gate,
>   };
>   
> -static struct regmap_config clkc_regmap_config = {
> +static const struct regmap_config clkc_regmap_config = {
>   	.reg_bits       = 32,
>   	.val_bits       = 32,
>   	.reg_stride     = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
