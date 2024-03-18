Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D674BC54E5D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 08:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9fGs1oVUt7UD8GcunUlgcmf8zVp7J4cetVfHr2Mok0=; b=C+pDlwzxvjXhSyLnQ6HST8Kyz0
	qT+yo4Z7+xz6wl+cYJUVl8FqrmqjPUvLwMnAAJIt+c5dUa9Y/w/b851heWcu/CZNR5v53XNZQayPC
	vnglHJM3JdHpKz1aAJOMGeIrc5rm12P6mNH5asQM7a/ixHNDjdbQeZUfwVvx39w1ifk54ZcsF5yao
	j4MIoAAikwmfLJTaPjv0z0i6kckZLRMVHCNzwtvbtBZzyP1lS9FIY61oWg7tdemk0r9pK3qH8EW5m
	/1KvBv1uToIhPF0L8rdE4X0bWEQHYcI/uysZRY+frxONt5ElWNdGMMAHib9EGD9geZNmYfY3g+L9X
	7KP0qacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8g5-00000007o4C-0syG;
	Mon, 18 Mar 2024 08:49:05 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8fo-00000007nxC-2udh
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Mar 2024 08:48:51 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33ed4d8e9edso1540185f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2024 01:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710751724; x=1711356524; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEBdKE3NzvC0kwk+i/Y79ouKhcbA2X9Ja7XXif1QIhw=;
        b=VkEUrou6LEehgyIb1u2W3pQcoYb5GoD7J0/KX9dQM/6VvOCMi94mhrz1UClvqQMMIm
         bh14bPNkiHOi7BCL2+bY05gCj1VcEyunjeChZn5pc7gfJlyaDLoyI7wq/D9K4zJPE3aO
         BUIaGwEjUKLFUAkUW3V7UQEPKwVJxpClY+bqllUEwhlZayJ0lnAkWeUuqqK21TSCGsws
         jAOAD3egKCBz+5JQg7VmSRsO+EL+luwJq1nSdykv1k77ptGfXY81NShZ4I8rUU35unle
         yxk4Xn1vR31Mtgx5zDg0yUagWYhzEmM56ef/zzcyEPIN8lXGB+S1PMKaQDIXVE+Zg28p
         JEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710751724; x=1711356524;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eEBdKE3NzvC0kwk+i/Y79ouKhcbA2X9Ja7XXif1QIhw=;
        b=YrHCrG58z1Jsac/2lEFkfPJpbZ8RGnd+3IsBTEJnH/ojaCg7xfk2OxSfIv8Rg/5tpq
         of2/Q8iHF+N9zJi0Htqq33VzwREz0gKB9eyroBjDdKuzLsj7JRgk5P3jYEulJpPRv5qB
         8SCs+9r9ZNjGlAOmjJ/2tAhbk93ul8Wfi/s4/YefYvjJiNknWpA8luvvc5mx7PEAXwAz
         ltwqdbE4GJZ7Uyr7t4nVHIfOErbHMKWwr6iGwroaJ8Yav4/0Ua9/uMMiAEVAbucIaS6c
         tUinAiCh9AG+F1JB3oCGgAt+7dFmQ29cK3bMD+mSooedI+6kv6wNK4omjzrRVtXzBDgH
         IgXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnCeeQEbpQIZK7hCU+3LJcS3pv37Dywuj4MseBuvAqgI1uZt7iV8t5PlPBxABvzErgGpMVeSuf0Y051MA9oP8nTpHBZyMVORGZk7DXzjdXm0o=
X-Gm-Message-State: AOJu0YyQAweF9Rkc8uSWhMrTMZr2035P7qULRH5kUgxLgZINkDLKmmg1
	6esmKM558fmFVgGukvO+qLtS4xa9GKVpRxIiCStjG6qD9rP0+bGyIphGpY+9HMQ=
X-Google-Smtp-Source: AGHT+IGPS1yALqMQSZsyXitJFqsMi/lSZDfDkyDCACkvtq79oROfAjIoTHzVeWzm/24ykp/RQycofA==
X-Received: by 2002:adf:ff87:0:b0:33e:363b:a7dd with SMTP id j7-20020adfff87000000b0033e363ba7ddmr8559992wrr.20.1710751724424;
        Mon, 18 Mar 2024 01:48:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc? ([2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc])
        by smtp.gmail.com with ESMTPSA id y13-20020a056000108d00b0033d202abf01sm9236451wrw.28.2024.03.18.01.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 01:48:44 -0700 (PDT)
Message-ID: <7cf7abf8-9c38-4481-afc3-7a822f9ddb9f@linaro.org>
Date: Mon, 18 Mar 2024 09:48:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/3] ARM: board: meson: update efuse MAC reading code
Content-Language: en-US, fr
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20240316135430.826898-1-christianshewitt@gmail.com>
 <20240316135430.826898-3-christianshewitt@gmail.com>
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
In-Reply-To: <20240316135430.826898-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_014849_513743_FB7E9873 
X-CRM114-Status: GOOD (  21.16  )
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
> Current code used for reading the factory programmed MAC from efuse on
> p200 boards does not appear to work resulting in a random MAC being
> generated. Update the p200 board data reusing the function from the VIM3
> source.

I'm pretty sure this code works on the Odroid-C2, but hardkernel had a custom
way to store the mac address so perhaps you should move this code to an odroid-c2
board file first ?

Or try both methods ? if first method doesn't give a valid mac address
try the ASCII format.

Neil

> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   board/amlogic/p200/p200.c | 35 +++++++++++++++++++++--------------
>   1 file changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/board/amlogic/p200/p200.c b/board/amlogic/p200/p200.c
> index 7c432f9d281..fb07eefa532 100644
> --- a/board/amlogic/p200/p200.c
> +++ b/board/amlogic/p200/p200.c
> @@ -14,29 +14,36 @@
>   #include <asm/arch/eth.h>
>   #include <asm/arch/mem.h>
>   
> -#define EFUSE_SN_OFFSET		20
> -#define EFUSE_SN_SIZE		16
> -#define EFUSE_MAC_OFFSET	52
> -#define EFUSE_MAC_SIZE		6
> +#define EFUSE_MAC_OFFSET	0
> +#define EFUSE_MAC_SIZE		12
> +#define MAC_ADDR_LEN		6
>   
>   int misc_init_r(void)
>   {
> -	u8 mac_addr[EFUSE_MAC_SIZE];
> -	char serial[EFUSE_SN_SIZE];
> +	u8 mac_addr[MAC_ADDR_LEN];
> +	char efuse_mac_addr[EFUSE_MAC_SIZE], tmp[3];
>   	ssize_t len;
>   
>   	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
>   		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
> -					  mac_addr, EFUSE_MAC_SIZE);
> -		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
> +					  efuse_mac_addr, EFUSE_MAC_SIZE);
> +		if (len != EFUSE_MAC_SIZE)
> +			return 0;
> +
> +		/* MAC is stored in ASCII format, 1bytes = 2characters */
> +		for (int i = 0; i < 6; i++) {
> +			tmp[0] = efuse_mac_addr[i * 2];
> +			tmp[1] = efuse_mac_addr[i * 2 + 1];
> +			tmp[2] = '\0';
> +			mac_addr[i] = simple_strtoul(tmp, NULL, 16);
> +		}
> +
> +		if (is_valid_ethaddr(mac_addr))
>   			eth_env_set_enetaddr("ethaddr", mac_addr);
> -	}
> +		else
> +			meson_generate_serial_ethaddr();
>   
> -	if (!env_get("serial#")) {
> -		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
> -			EFUSE_SN_SIZE);
> -		if (len == EFUSE_SN_SIZE)
> -			env_set("serial#", serial);
> +		eth_env_get_enetaddr("ethaddr", mac_addr);
>   	}
>   
>   	return 0;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
