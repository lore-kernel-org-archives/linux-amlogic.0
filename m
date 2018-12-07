Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44E2C64EB1
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 08:41:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8645520838
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 08:41:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jY+JLjxg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mMs9+45A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8645520838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zkUyIr721XAltOz//nzIAae3u8Pqcw+LOPZCXMBHqnA=; b=jY+JLjxgY9826fJkKNXDPq/qPg
	DBYHkIxzujv0rbsf4x03rsbjnhWS0fIFrsTOvbpegqlKqImhrCim5U9uF91/ef85EQZQosR2TtwTs
	DpyP60YU73oB6W/LHDdyI6+6XPZGMnk8DvxTm6dvmQJHdm8ZgrY5ZmLm11ykgE5h1SIiXkdP5WfcS
	53Dyw5Nzqr0mObkLuO6dKSfbwPUfJ7FrT+LMu7p8Fkjec+baNE3N1Hi6Fpb564NJhD1/52h3LNOve
	alLYc9mOAFJnv65ZeFQrc3pJ14HJ54uL6f763qbyN1tVdow/nWP3z5RfX18TzmKCHlzui3e8a257i
	wEKXW8lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVBgv-0005P1-NA; Fri, 07 Dec 2018 08:40:57 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVBgF-0003Kd-N7
 for linux-amlogic@lists.infradead.org; Fri, 07 Dec 2018 08:40:23 +0000
Received: by mail-wm1-x343.google.com with SMTP id y1so3477709wmi.3
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Dec 2018 00:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TPQHdBZdqxfjwMMLcXURxqRXelhVUP6MJXohOvJS8Z4=;
 b=mMs9+45A/9vAxNPYGjI7fWM9SmWCeGBtxG2rnQk4gtSD1zMDHAN4YaScgrLoFE+Dh8
 iRKuvr8F/arCNQm4TzTN++lVEFXqiCQ11yxOd5RmuVIAQqPXwhhCcJ4noxQ4CrNG5OuB
 yXFIpEKdVTBoTzJKySO2sgNf7g6k1YQ+xRX9/4aiL3pxFTJ98pCM+3Zfp51/oqVUMhKy
 LbUjSKhHNvFwvGN8GmMEqjYRHofd7dPxZzeikOAyKJEDUl4UY7ID6Rb7yzEuijys/rXn
 DTQS1vC/zPG6J4xmpyLAt9M+VVId4B0IYuzsl/RfKynOSFrKdwBPtZpmxaTdEMp5hBOy
 gJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TPQHdBZdqxfjwMMLcXURxqRXelhVUP6MJXohOvJS8Z4=;
 b=eUInPc8tPFEayeR8i0PpQENdIxy+teSmdlW3eUSge6KiQnOjC0JeNzjWcHfGjvMzTR
 6ev28z/z6BPjcaouTGQWBWHmrhJvKgD2elLisVSzf4On8qPLU/twfNIv4+VOUHsxuFjB
 RGmXUr5xl4qLLLTKk6zXgaZjybHnFFfw4tEplPw5C8tURmZo9zKopu8q/htMrJLtTssv
 ybuLpOp/3rSVVU4r3NsryPJk5S38sQS0u37s+ZJfdVxDBrLhZLgleRYrjl05hTOLFzco
 3KX44326yHMqxOrfU9DD/ETzD5wQqQ0NeZWQOLu18Pqja9dllqbT0fgSYHFhmRKiCU20
 Le5Q==
X-Gm-Message-State: AA+aEWZiA9PnZDEyjmd/RCONTMbEWo1v7sSBHqh8/NH7j9R8ImZrmuV5
 scvp/5tF6xzE5UyjIRt8Nv3iOZ1aHmTHhg==
X-Google-Smtp-Source: AFSGD/UCOL2RWeno1YRISU2b6KaMSgUKvGh/LpHUW/2SeWmoFPYcwfMgpbjhxMmk1EKiXVN88ZPdhw==
X-Received: by 2002:a1c:1112:: with SMTP id 18mr1512906wmr.30.1544172002674;
 Fri, 07 Dec 2018 00:40:02 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k7sm3611082wrl.51.2018.12.07.00.40.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 00:40:02 -0800 (PST)
Subject: Re: [PATCH] pinctrl: meson: axg: Fix GPIO pin offsets
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <ccaione@baylibre.com>, 
 jbrunet@baylibre.com, u-boot@lists.denx.de,
 linux-amlogic@lists.infradead.org
References: <20181206080811.30320-1-ccaione@baylibre.com>
 <7hpnudyl2l.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwE0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAcLAXwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8g
Organization: Baylibre
Message-ID: <82a60995-6d82-5121-649d-b1d03d480fe3@baylibre.com>
Date: Fri, 7 Dec 2018 09:40:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <7hpnudyl2l.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_004016_422389_CD528BF0 
X-CRM114-Status: GOOD (  16.92  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hi,

On 07/12/2018 06:14, Kevin Hilman wrote:
> Carlo Caione <ccaione@baylibre.com> writes:
> 
>> The pin number (first and last) in the bank definition is missing the
>> pin base offset shifting. This is causing a miscalculation when
>> retrieving the register and pin offsets in the GPIO driver causing the
>> 'gpio' command to drive the wrong pins / GPIOs in the second GPIO chip
>> (the AO bank is driven correctly because the shifting is already 0).
>>
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> 
> This looks like it could use a Fixes: tag for stable.

Ah ah, it's an uboot patch ;-)

Anyway, Applied, thanks for the patch Carlo !

Neil

PS: You should add [PATCH u-boot] on the subject line like I do so kevin can filter them out

> 
> Kevin
> 
>> ---
>>  drivers/pinctrl/meson/pinctrl-meson-axg.c | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
>> index a54fbce910..3bbbe817b4 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
>> @@ -14,7 +14,7 @@
>>  
>>  #include "pinctrl-meson-axg.h"
>>  
>> -#define EE_OFF	14
>> +#define EE_OFF	15
>>  
>>  /* emmc */
>>  static const unsigned int emmc_nand_d0_pins[] = {BOOT_0};
>> @@ -893,17 +893,17 @@ static struct meson_pmx_func meson_axg_aobus_functions[] = {
>>  };
>>  
>>  static struct meson_bank meson_axg_periphs_banks[] = {
>> -	/*   name    first      last      pullen  pull    dir     out     in  */
>> -	BANK("Z",    GPIOZ_0,	GPIOZ_10, 3,  0,  3,  0,  9,  0,  10, 0,  11, 0),
>> -	BANK("BOOT", BOOT_0,	BOOT_14,  4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
>> -	BANK("A",    GPIOA_0,	GPIOA_20, 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
>> -	BANK("X",    GPIOX_0,	GPIOX_22, 2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
>> -	BANK("Y",    GPIOY_0,	GPIOY_15, 1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
>> +	/*   name    first                      last                    pullen  pull    dir     out     in  */
>> +	BANK("Z",    PIN(GPIOZ_0, EE_OFF),	PIN(GPIOZ_10, EE_OFF), 3,  0,  3,  0,  9,  0,  10, 0,  11, 0),
>> +	BANK("BOOT", PIN(BOOT_0, EE_OFF),	PIN(BOOT_14, EE_OFF),  4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
>> +	BANK("A",    PIN(GPIOA_0, EE_OFF),	PIN(GPIOA_20, EE_OFF), 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
>> +	BANK("X",    PIN(GPIOX_0, EE_OFF),	PIN(GPIOX_22, EE_OFF), 2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
>> +	BANK("Y",    PIN(GPIOY_0, EE_OFF),	PIN(GPIOY_15, EE_OFF), 1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
>>  };
>>  
>>  static struct meson_bank meson_axg_aobus_banks[] = {
>> -	/*   name    first      last       pullen  pull    dir     out     in  */
>> -	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0,  16,  0, 0,  0,  0,  0, 16,  1,  0),
>> +	/*   name    first              last              pullen  pull    dir     out     in  */
>> +	BANK("AO",   PIN(GPIOAO_0, 0),  PIN(GPIOAO_13, 0), 0,  16,  0, 0,  0,  0,  0, 16,  1,  0),
>>  };
>>  
>>  static struct meson_pmx_bank meson_axg_periphs_pmx_banks[] = {
>> @@ -931,11 +931,11 @@ static struct meson_axg_pmx_data meson_axg_aobus_pmx_banks_data = {
>>  
>>  struct meson_pinctrl_data meson_axg_periphs_pinctrl_data = {
>>  	.name		= "periphs-banks",
>> -	.pin_base	= 11,
>> +	.pin_base	= 15,
>>  	.groups		= meson_axg_periphs_groups,
>>  	.funcs		= meson_axg_periphs_functions,
>>  	.banks		= meson_axg_periphs_banks,
>> -	.num_pins	= 100,
>> +	.num_pins	= 86,
>>  	.num_groups	= ARRAY_SIZE(meson_axg_periphs_groups),
>>  	.num_funcs	= ARRAY_SIZE(meson_axg_periphs_functions),
>>  	.num_banks	= ARRAY_SIZE(meson_axg_periphs_banks),
>> -- 
>> 2.19.1
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
