Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359DCC54E5D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJ3kr5V8be9U2hFRGkGc1AwJTpFLhqA0xev6nNvAbX4=; b=04j9uh/D2WZmxG+fF4v5I95F1K
	Wzhx/55o+JWl6RBjh64xWavXATKOeCwTRlfU1fAD6kNq5hinBSKounk5Ctp2ZqNTfb+qofeTujnTE
	Bwh40EHfiLjYyeworxgj0q4EpNOZO4T+g72g53s1f/IntYrW0OcYCmqTuqB71DWHoRJp/u12JV0HZ
	D3cMwLfxhfga+w6vrYaWwjPztjaRtl0viHVuaiXJeMcPViSD10hRXpfG+KkdHrjlR3AFlwYa/cR6z
	BLgNpRFbDtZDiHjPbAanPnZQyHT+H+axZ+aGzRorCCItCnN7CohFIXMrYUjZg9+1WGnTokRZHCSj2
	mqZf0JmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8h5-00000007oWf-1Sjv;
	Mon, 18 Mar 2024 08:50:07 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8h1-00000007oUW-1erT
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Mar 2024 08:50:04 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3417a3151c4so273593f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2024 01:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710751800; x=1711356600; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEmbO0hfg4t6Va4sobnHhk3Do5ZSP52QFaOChTFVAnk=;
        b=VVx4EVsyG+4hdrYChbCSx8Y7k/F6ycsnMxw8eWyQkCflnBp4jPq9O6pvTRpLTprG5C
         Dqk300WAcbUNj0eg9Qo1X2Bu32pUjcLGPQElE8ngSKdY6LJvSJkNNQ4nSCEWuwh8nXyS
         B5d7DNsSrV1EJcbjN4DfC0sLm0UVJqSvNDShEWwxYV/HruaXdU0g3Hg+rdLRHTq/aBv9
         t7aagho5WDOtHxEesj8lQmh3WvyRS+xdz3rna95EWV218LHyc76lFhazE8OCSIwBk4Bd
         1yQOjTqv6rTZlqWuamvnXI6tVMQe6oXtHgd5V3xb+rnrZWxmClWAm37a78i1SpPZkAjV
         fIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710751800; x=1711356600;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PEmbO0hfg4t6Va4sobnHhk3Do5ZSP52QFaOChTFVAnk=;
        b=m9/Ojiiy4lHLlh9KjoYrJHFsTPh/ZLA8kdOLv5oA2HdTJqYWiKqfktEsnLF5jxF7IE
         WNtqDnfCWxVZPnt2S/sc+tiRWwfrsrq3z15OebwjvpiNTIUAtLCn1O7d/gcuJjMsS9q9
         y+u3j4Eivz3CEbHQ+zPlB4vYTHW5jUbQh6lW9KTthRTDvJ2YpyQZqPXp4zJktG4Wsi3C
         Fsj3iZeoGZXykvyQWAPv4oOfWBwdA8eu7V4xiXzoRK1YN58cGF/EzEhRqZLJv/nd2j1r
         5Oy9PptTDjlJstETSNfYsIk9Fd4eyoWQL3oGYTp5LrWdYGzuRg/yo9pWAIboSfvKn47E
         6/wg==
X-Forwarded-Encrypted: i=1; AJvYcCXugbq3i9jCu7CJH9lBsEaHVwT+ontCcQmIdLdGSB+MA0LBMx3gUKxsyLCzW0V2fRe5qFNx6fIb18TMVVUNZRM6sJWCTd76ip0STaAF9yvkp48=
X-Gm-Message-State: AOJu0YxFpN18SlFhqYZahi4zku6PIXVftIo+XyNiGLXhaEWJ4VEzPDO8
	2mNUBD0RH5ttL66EiaFQA6xgnzmgn8MSNf+e5VpeyY5/cQCUQEGPm7OVeC4YB+8=
X-Google-Smtp-Source: AGHT+IHQEN87wPE/3GAp0yBZNmyZ4J2FeHIoRE4dfSDBJWMxRyCBVtACSHp5HBbW/wRzNgp+flvXrA==
X-Received: by 2002:a05:6000:e43:b0:33e:8171:3f0f with SMTP id dy3-20020a0560000e4300b0033e81713f0fmr4255865wrb.70.1710751800375;
        Mon, 18 Mar 2024 01:50:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc? ([2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc])
        by smtp.gmail.com with ESMTPSA id y13-20020a056000108d00b0033d202abf01sm9236451wrw.28.2024.03.18.01.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 01:50:00 -0700 (PDT)
Message-ID: <86162fbc-856a-4e95-92ec-be6647f71d7c@linaro.org>
Date: Mon, 18 Mar 2024 09:50:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] configs: amlogic: set board family to avoid random
 MAC on WeTek Hub/Play2
Content-Language: en-US, fr
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20240316135430.826898-1-christianshewitt@gmail.com>
 <20240316135430.826898-4-christianshewitt@gmail.com>
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
In-Reply-To: <20240316135430.826898-4-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_015003_484570_CA4275C8 
X-CRM114-Status: GOOD (  11.19  )
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

Hi,

On 16/03/2024 14:54, Christian Hewitt wrote:
> Add CONFIG_SYS_BOARD="p200" to the Hub/Play2 board configs to ensure the
> factory programmed MAC is correctly read from efuse.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   configs/wetek-hub_defconfig   | 1 +
>   configs/wetek-play2_defconfig | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/configs/wetek-hub_defconfig b/configs/wetek-hub_defconfig
> index fd92b041e73..413bbfe9ab7 100644
> --- a/configs/wetek-hub_defconfig
> +++ b/configs/wetek-hub_defconfig
> @@ -1,5 +1,6 @@
>   CONFIG_ARM=y
>   CONFIG_ARCH_MESON=y
> +CONFIG_SYS_BOARD="p200"
>   CONFIG_TEXT_BASE=0x01000000
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
> diff --git a/configs/wetek-play2_defconfig b/configs/wetek-play2_defconfig
> index b887419a6ba..dd98929444c 100644
> --- a/configs/wetek-play2_defconfig
> +++ b/configs/wetek-play2_defconfig
> @@ -1,5 +1,6 @@
>   CONFIG_ARM=y
>   CONFIG_ARCH_MESON=y
> +CONFIG_SYS_BOARD="p200"
>   CONFIG_TEXT_BASE=0x01000000
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y


CONFIG_SYS_BOARD="p200" is already the default value for MESON_GXBB, see arch/arm/mach-meson/Kconfig

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
