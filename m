Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9041CE8D6B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Nov 2025 09:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGdbxerJFQrugjDcMULgJHu2/gY5xqRhIhiQqphHWIw=; b=SFCGdFMbWwXoNTsPhTbGbZLLmh
	CZo+5VIX5BXSC/UutyP1CVAjRhEwmZdxGX8ztFVz3YeBRJWI3B87ezb7QooJ64GHuNFburmyTlt4n
	BhhIYRrVB9lc0FA5k/DX8zTg1WVdY+48/n8BkiUoCDuvqHO5+fL2YLwCWHsT2aXIyV6E+sIb0IGEu
	ZVG8xWjwoA4DVTZo68PdOxcyZOcjUFkfRXgshAiP2at+bjzmhbiu4AQ4SKO+viaKyv1QQ7i+99EmN
	8KoG4Gaq3uWOZpCH/K6Lm3XYPwxyMbUOUj1srb8pqISwfXL1k02Gih3mfSkLYrCK4AUlIx8b3OiXT
	iILLlVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvGf-0000000FlSM-0dBr;
	Mon, 17 Nov 2025 09:11:25 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvGb-0000000FlPi-3uja
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Nov 2025 09:11:24 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-429c7869704so3066211f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Nov 2025 01:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763370680; x=1763975480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJvTLRnRDoEqGBIlnWGGjXDEKSpyeQX8qHCstc1K250=;
        b=NS+AkmXYDEd9SL5hboa2LU2zKOlyYmhi2Hk2TeN2bCtBgBugFX/kzyzLXT9hXSU3ih
         7hiq4qhTDQ2fU5CYvVtPeB+194Pw8e2Ehd3Y/FWSsDT0ZT6xRRwNNqHUQfyLNu8PLEds
         KcIKzJ1OfX18vIgg97qdC77mTFDRAHhCXoOCegZDY5xmqUgwPKp0aUweeTV1A/YNQPSM
         zGFqUisJhX5S3GNtH9u79fqPLKRsGefx87bFE2mqJQn92jFUgPZR6w3eyFoVqUWO69qk
         t0tgUpL+Z/WF39q7ooVQ+Qnm4Iv9+BC1NoA0sUAvB95iOdgHlxuynMHD2wNFwquipiEc
         dn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370680; x=1763975480;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJvTLRnRDoEqGBIlnWGGjXDEKSpyeQX8qHCstc1K250=;
        b=FszUNEFA7+zoE/8N5QFyVDE+yWzbn8Vkdt2OGmnfZXCfh+ldJvU0ecBteyXoG3MH4a
         egLl/TnY49q92lOPNQcR309agsneG3qJlPbLPvMEHba3Y4Ylk49bpJA7IXQgUQvdk1Wf
         SHmVdj3PVnMIrulcq3wSBJmAFLUJr1c2u0fSqxz2EujGsTuqBFnBDqBo/hXMj7e5Dx8i
         Z9V0fQfP+g4tge6HPKmtA1zHOi3I/+W+rXVSI3b8+8QLM8VOVZK1kezX/T5QZvl+kTYT
         Z2X1e/VvXlQ6isRl6BUDJ/s9Emg6V1V8gKCh2Ow863DOGaoADweU0hKTdq04fiW+WSbv
         5Isw==
X-Forwarded-Encrypted: i=1; AJvYcCWU4bCw8UcXDd5o2I0quVI7WNVAxs21Cy+wh5/lZeUEEdgmULJwmFCztU3ipwm+Pw3kypm8xAY+tIWn4QeR@lists.infradead.org
X-Gm-Message-State: AOJu0YyOiRss9Tb5dOZyTkhbi3NtzZEMMijMBxXhty0qD12rHjvL2IFO
	wt6zl+9x3tFagEgb1iRH5bsRtaXNIb3s3nj22Sx3W+CG9etw0q/ksNe5T2Fh9f2CdCk=
X-Gm-Gg: ASbGncvLmb0UcQ11RYZBxX1Mv7AYkAS5BUHKLgeR2W3SXsIE+F0dTfuuI1IcjrBxQmE
	bMxH0jHjbwxq3cKjOFk4hEn72ct8quqAWKnjJmdQ2zLdKEoPsmcEwdZ7yPMEe49q3appFwZAbxN
	mqmeePdblcsW1zZX36nTvZzEgjcKC1k3eaDKRBKZDGUGcVBTD8DDYZ2GFGYFuC1J+z2sBRTsRV+
	BPPQW4ydEWY8i/U1GRKcHmj5SvLPJ8aPuY/Yfp+OsWFl7CZz7LneJylXhYkjd1dwvIJAYGAnO6v
	fI36qwlkGR9vcWHG9UDffjruwl6DgZA1l/v6vCeeRy/vX8BMj12qDJai7m2fpl/mkGpvm4/AT5M
	xZnpNH22MF2shoC/pUubc0PfOJt4geizcWCJyZhGUKdlazL5HdnfG8pG7iH67KBl6aHDAf0AZkG
	dn8F+OSy9dCNADaMOC1hYHxzdqCTRRYtgCyfx9G+6fJpzvD3eR8wYo
X-Google-Smtp-Source: AGHT+IFc3Tyo5Ai1EPE18jNuD1mi3IzLZtTNX0BmhIv38Tygj+IiqVox+H1udGbQDhtv8YRZXbtA7Q==
X-Received: by 2002:a05:6000:2a0a:b0:42c:a449:d6ab with SMTP id ffacd0b85a97d-42ca449d9b4mr993180f8f.30.1763370679961;
        Mon, 17 Nov 2025 01:11:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206aasm25374870f8f.40.2025.11.17.01.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:11:19 -0800 (PST)
Message-ID: <614d29e5-b662-43fb-98c0-e3dd0efbe25b@linaro.org>
Date: Mon, 17 Nov 2025 10:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 6/7] mmc: meson-mx-sdio: Fix indentation in
 meson_mx_mmc_irq_thread()
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
 <20251108231253.1641927-7-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20251108231253.1641927-7-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_011121_994643_8FF77649 
X-CRM114-Status: GOOD (  11.57  )
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

On 11/9/25 00:12, Martin Blumenstingl wrote:
> Keep the second line with arguments for dma_unmap_sg() aligned.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mmc/host/meson-mx-sdio.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index 052bcf8f32df..e8b63dc45dd8 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -436,8 +436,7 @@ static irqreturn_t meson_mx_mmc_irq_thread(int irq, void *irq_data)
>   
>   	if (cmd->data) {
>   		dma_unmap_sg(mmc_dev(host->mmc), cmd->data->sg,
> -				cmd->data->sg_len,
> -				mmc_get_dma_dir(cmd->data));
> +			     cmd->data->sg_len, mmc_get_dma_dir(cmd->data));
>   
>   		cmd->data->bytes_xfered = cmd->data->blksz * cmd->data->blocks;
>   	}

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
