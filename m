Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF59CDB47E
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Oct 2023 11:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyTwCbtFx+avo7SJ7OuMZ3E5FTFawbh0KK8rxlaTdB8=; b=1sWRXBy1qyWe99Cb0JH1GuCRr7
	s1qFsT9IxHrU0XT3YcFHTcBXoANrQXH43RWNy+yoV6lYYfkJfOvn3sp6ojvOiBp33a5WYUv5BdnSp
	kPfRttqFobLkERhtOd+AbAQyQn2lHHKS4nTUrAhvdKenf5f4wWBZz+t24sqA/LwL1rU3sNK0ExZZ5
	VeCUs7RqE7yZwwIN8ibycXT3VlymW43v1S1oSHSGyw6EVjGJ+oFjLBSwqjFLFys/pQERSJuo+O/PQ
	QP5jKSxwZHz61/7HdSNL7th5mAJOltzbRIjqazb0Ql0AVfgXLjxbpG+NBuQGNrtPy05NORcQz5Xch
	IUyyfqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquHb-000uXI-0D;
	Thu, 12 Oct 2023 11:55:15 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qquHW-000uUt-2s
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Oct 2023 11:55:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-307d20548adso777148f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Oct 2023 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697111708; x=1697716508; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EEh0DtjuniCuNrVtcwCXYohORKDMpqfS7tvWNnQQLg=;
        b=JWjB5LUvCIL8U1gWgRhD/LuV7a1tPR1B3Awcx1leXvuC+xSzUyjC7jvsFuA8GMdHRw
         xzXXf3GQFvByPANkW7UDnaCfZXLiGU8R3ZZZPufDad7RFxNQdMpWTP/bYo2wtzJGwQbh
         EEutbhXvlaXD5NSqvdNH4i4JBslaTpgWGqdXB+yLsAO0Ne7rWkPvzkqSdaDEX1gl55Ns
         0ZBKxJ0e9V5MNkH06oir841gJWpHoh7FJZvBvkHNGFM/S88iTqm5OaNS+2PIfxTrm6Yq
         sV6vICtUtI+frW/Xd/L6WZr+1pdurIzey/cp6Gly307ymbUeeNUhwpIisa7e6gIRTX+Q
         9hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697111708; x=1697716508;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7EEh0DtjuniCuNrVtcwCXYohORKDMpqfS7tvWNnQQLg=;
        b=EvgUkWCIh2fS6d4u1/KxzOlV6+/QIGxwXSjgmNfKtj5dVbDh8/M/Mu2Llh/KhSPL71
         qT3l/EFLN9myLHLaurek8NuYHJf6bitA0oG/18rOn3y/VWtcN1/RLfAJfXWUT2m9iSoi
         F2qyicvNMfy0L9nFPalGme1qwZuMovLMjLbR8Nlinpq2VZXKkbIpHBNnhzhohYA3mD3Q
         ODjvhi40c253E6EL4dHBAUtDZZflmUQIS7puyOJ2CeofamsNk77m5+AeNBlzzCbF5QIm
         N56D+11WCplSTYxdPjr3BnDSrob+rEAkZtpDSpjUfMKWOca1rtJASTAkcQHPUQgDbrXb
         zfEQ==
X-Gm-Message-State: AOJu0Yw2I3RMlIXlR88Zwy3TjciVEI4NvEosSGNmMvM0LU3o1XAVieBJ
	WSIeKq4wO/nN7QR4vFSkdXRlJQ==
X-Google-Smtp-Source: AGHT+IF/cZdSXKP3hqC6P1rzTaQWACKheA9PXy21cLGdHXi25qE0+eEDjLjzcczKxWWqYi5oeRhu9g==
X-Received: by 2002:a5d:5a06:0:b0:32d:23b7:49af with SMTP id bq6-20020a5d5a06000000b0032d23b749afmr8409393wrb.36.1697111708198;
        Thu, 12 Oct 2023 04:55:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:d423:df8b:7f17:7909? ([2a01:e0a:982:cbb0:d423:df8b:7f17:7909])
        by smtp.gmail.com with ESMTPSA id p5-20020a1c7405000000b004064e3b94afsm21802128wmc.4.2023.10.12.04.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 04:55:07 -0700 (PDT)
Message-ID: <10a892e7-18fe-4267-aa5d-c77f5da9a3c8@linaro.org>
Date: Thu, 12 Oct 2023 13:55:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] perf/amlogic: add missing MODULE_DEVICE_TABLE
Content-Language: en-US, fr
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Jiucheng Xu <jiucheng.xu@amlogic.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <CGME20231012103551eucas1p2422c1c7ace26714addeaadde8b645d4b@eucas1p2.samsung.com>
 <20231012103543.3381326-1-m.szyprowski@samsung.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20231012103543.3381326-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_045510_942112_B76C036F 
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

On 12/10/2023 12:35, Marek Szyprowski wrote:
> Add missing MODULE_DEVICE_TABLE macro to let this driver to be
> automatically loaded as module.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/perf/amlogic/meson_g12_ddr_pmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/perf/amlogic/meson_g12_ddr_pmu.c b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
> index 8b643888d503..15d52ab3276a 100644
> --- a/drivers/perf/amlogic/meson_g12_ddr_pmu.c
> +++ b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
> @@ -377,6 +377,7 @@ static const struct of_device_id meson_ddr_pmu_dt_match[] = {
>   	},
>   	{}
>   };
> +MODULE_DEVICE_TABLE(of, meson_ddr_pmu_dt_match);
>   
>   static struct platform_driver g12_ddr_pmu_driver = {
>   	.probe = g12_ddr_pmu_probe,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
