Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C869C79FB9
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 07:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AG/ZmMa1+zz7/haIoxPdC/eBB5c50zEA85l6A8rUNZc=; b=uCewJnwhSgzNsXYFLh9KsELGaU
	wCe3lK7KkIvP99bIod/qvFD+W2pv0HM7vQZ+dKwjjvatNX3XGrnHL6AArRUTxrh1yknXefj3I10n1
	JVcCO+6MSgnZ6rHI5v1n0CgYXgWuhq1OYTGROf9I+u+F3XOvxll84k3lv3cqfjTtwodUFzMN/Saar
	lO5rRjLqg2feQVaeb5fgwtG757ipQQcCfhPZzpk9UfPGQ7JREkVq0DJ1c+hlaUt+X7NL4ClpbfAZ0
	+MZzQkWyV9XN7E2D6lLjC8xsBixd4wp4O2kySKo2BIyA9Fis/760KezF2cPWDslALuyr3E7HqFMg7
	fL9OyR5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yyn-0000000DbIc-1G7Y;
	Thu, 10 Sep 2026 07:13:53 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yyk-0000000DbGW-0TSN
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 07:13:51 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso66337055e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Sep 2026 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789024428; x=1789629228; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9vc3vyc7s51kw3mexUDG6KTzAQ8qZ7SaFb2GyTr25M=;
        b=SV/JsOfGfyE+XdJ0Bwq5PUNRK+8uEnl4T33b+PE0oKgLBtv3GM4WJeONKe8VpAevUX
         Botz6nAornFqqoPSPmK/sQ49ExUq4fQWVMtE9NVjcwfivfuMaClZE645xJ2hiykWPHMd
         5PY/F6nxtfEO4cYBTKABk0XbDXJK2ePx2zcTOZl72fuCyNFLEZOo7WR8U2PDNBuHikzI
         oVf81+oKtCx2Pet220Ok8yEcZX3mvZyr5iSLoOowAd9iPWKNhkaWcCE9798eEIqeLFc4
         jTu8OFDJWQ8P82ZOzbOjyMusdn0lcqQCFrMWq4mIjdg/g8Y6vQF/CbdhWI01jdz9AYYg
         UW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024428; x=1789629228;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9vc3vyc7s51kw3mexUDG6KTzAQ8qZ7SaFb2GyTr25M=;
        b=JoMyjg5rMC4TOnCtsrzAoOlJg1Z0bBXVMTZs9PC+icxJFfmbuNuvCE3RgPUQZH8RrT
         Yua70SnRNTHhSqOdkN8WU7oEPZaHZYguFXrFyByX794ak6Q56t6Bmz31jME8/dNNwIUV
         zxE6TNezrnMI6aMIV2I4P2GUc2ndw93uT9UFTQ7GVTOpQqvYG3Wk1MlK/rONQEehbVDG
         7tsYAWIB+DE3+g9Dpi2XQUe2FhwvSu10jJkXUF9Cxi5cGnwfzy2CRhWp6opstDW0u9ai
         WwW7O5bY5aomb6Hy4yAj6EDlftOlbGNeo+BN3FlTbjo7BsDsWy/bSTOjTxkIf47fa3dK
         bVNg==
X-Forwarded-Encrypted: i=1; AKwUvBznKdwyFGirv14ToLsu/nQcyKXNeDSFXrIcZPnTruu+gfmDA2Tle0pLTAKn08wH4pvlYVDcDK6pdDsi//HR@lists.infradead.org
X-Gm-Message-State: AFuF++l7iu7WERg12KW1jLTFKulVDIyjvSrvgeyFa5Smk526igPyCDMj
	wcMe3Rcmf+oBP38EJUoeB46vVFgUvAgPKnOr4NF6mN7mGLJePIoBNos9EztqQZxeKd8=
X-Gm-Gg: AYBFou2RhYu+1QhztoSiL/BqNFClcGkG+rjvTQbLmMNHprqFBbjw4UmHSrNPJqTbgWf
	bZ1WD10lcEtfH3iNPQxhBBKb5smByB2vssTWBttkeBxe3DQ42vKScHz0Q54fq9d3jfppYcD/g2c
	l3X3sim8rvs0WR6QaRXk7V4GYVHiodGT5oVWpNWWlnlXhnxRxD6j6dZP2gdRDpAXh2s1+YiHRWK
	DGHll8Kyv1fk5wrz/oK59dsc0CpSqcIwvgOVGcMeQ2kpvwYlRRLcQQ3B7Ybz9lM1HTmwSDHUzM3
	FgC9NvyN3eeskcR2EdsWfg5dcBr8Xqi8oDDJ72U/tCeW+JMjEBt/zxtpy2WZI8V7S15zjzDSvBW
	gOT41q4p7OsnqxQ7E6UECJBGdYEPqW7A0ullA6WN2UqAl034OpxIKuKkUlzF5ILLdwudD1hByDG
	36Y4ESPYigbIhkqUVfab+BkKQfrg7xCz55NjzU9rtQA+U6FVNwtYF/afCXf/opqzX+zxqyvx3+E
	D55Ci7st19Ce5E9+aZv/P1+p0k+9C0doA7iBWsdx+Ue9ER+/tmWbmLm4Fq0AKQ6mw==
X-Received: by 2002:a05:600c:37c8:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49cf826c4e2mr379662315e9.16.1789024427828;
        Thu, 10 Sep 2026 00:13:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm51612002f8f.4.2026.09.10.00.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:13:47 -0700 (PDT)
Message-ID: <d2e31f11-24ab-4d2e-8f49-d625e1aec930@linaro.org>
Date: Thu, 10 Sep 2026 09:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as
 critical
To: Lucas Tanure <tanure@linux.com>, Ulf Hansson <ulfh@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-5-tanure@linux.com>
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
In-Reply-To: <20260905153234.133217-5-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_001350_176965_764226BA 
X-CRM114-Status: GOOD (  20.29  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 9/5/26 17:32, Lucas Tanure wrote:
> sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> identifiable consumers - the three MMC controllers - so marking it
> critical was the wrong tool: the clock should be referenced from the
> consumer nodes and claimed by the mmc driver instead.
> 
> Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> have no single identifiable consumer.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
> This patch depends on the MMC controllers actually referencing the clock:
> the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> clock must land before this patch, otherwise the boot hangs and memory
> corruption this clock caused are reintroduced.
> 
>   drivers/clk/meson/t7-peripherals.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
> index 55d09e78593b..2f429ea86796 100644
> --- a/drivers/clk/meson/t7-peripherals.c
> +++ b/drivers/clk/meson/t7-peripherals.c
> @@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
>   static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
>   static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
>   static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
> +static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
> +static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>   /*
> - * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
> - * used for DMA between the peripherals and the DRAM. After the clocks are
> - * disabled, a device that starts a transfer cannot complete it.
> + * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
> + * the peripherals and the DRAM. After the clocks are disabled, a device that
> + * starts a transfer cannot complete it.
>    */
> -static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
> -static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>   static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
>   static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
>   static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
