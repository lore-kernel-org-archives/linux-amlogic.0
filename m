Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B57BC25B67
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Oct 2023 14:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29YumLPvGh4XQcwLJnukEv61TDEq/1xIcnbO+2/lQ8c=; b=YBFQHoQ1L+DtEKFei51Pko2wUD
	+JjOxBtQLSE/1IsXXhUC0M5erAvfWyk0FmlW8v38aZ/plVo15Cf2QSs1RR/5vIFKfWoKetzv6U02g
	D96azcHNji6q83dnOA6Y5/xsaskT7SfZEkRV0E0cLhYAw8fephjyGMKkGMkEC8N2QmafKnm9/2TPr
	8RtQN44VFPKxJtMVOV92JxspF8/565tYC04cC4hRQPItjbwNsemc1G/ruAV9YRAXSmaqbOkd2L8N9
	EHsFASAfhCTJ6UzXj2gyAYJeV8y88VY3CLa2sSNK8rG+dHbXdo1TODLDV3Hum6cBL9BSFpNoYT4b3
	BPQcLB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1Yn-00Eim1-2C;
	Thu, 26 Oct 2023 14:42:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1Yk-00EikY-2A
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Oct 2023 14:42:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso6877215e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Oct 2023 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698331323; x=1698936123; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBTq3tUneTFtyngE2KsPOx/aCroyGP8+hR+mE0hQyN8=;
        b=k1fQ51K+BBupw4sIyXrr+ycBEnDiJvkh4y45wRhxlUVyuf+NvcJZbl698O0HVW31Rc
         +uJssyEN7z86XLXuYTbA7DdQuf3/rFnta2rUOrAO8es9jSMu94mO+nQfNBp1nxOCFlIo
         9ovSNOaX5FloA/voq044nhiNHLr3/+/NT83V7jKeUEJx1dh4w2ncwV6YwB4eqXpXalWU
         NJUKBci8Ag3hcxJM/hZkrp9VPmO70N+5UCbr1M9Q5XEMmLS/zpau4WfUkKzAhoN6wShZ
         EhlLiZIqt3FxF3DctCj9rwUQhDka1acAlHhCg3K1J72z111BXfeF4MlshKvNhGj0iyZX
         FuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698331323; x=1698936123;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HBTq3tUneTFtyngE2KsPOx/aCroyGP8+hR+mE0hQyN8=;
        b=IKo/LAHM4deno4D8WhpSEBBSuY6V6ag/Lu8svsQZGp6gzytkO/kh3Atb6UxKALLjE2
         dgG0q1hiLhyQ95VPsT3DLs6WbrFQniRmYivgtKT9qakwBky2LwYxzkqnEaT+PlnHCrYi
         VXWXff3B08DMehmXz8YL6luucdv3XpU0QlKESqsISk5amy8QEeZ9vlrJMERElZtm97hh
         WdGFB6IVq7UG2lV9iZab0xcBLOg1qSabR7jCCOcrwi0DmW/+KO2z4JJYuvyRSIxdo2gH
         wSrsPE01OKVU7x9jVhwimdSexCt+SHr/5GdB3Zq/IuyZ6PvF0eer+7sFajenZoh87FqO
         90ZQ==
X-Gm-Message-State: AOJu0YyHJbQhCqUcEUrxBbp/3Zx/Mty+pZIwtFKQD1tBoKmJU3rH+5ke
	A11euWIox5VlEOt9BPSJ1CBk5Q==
X-Google-Smtp-Source: AGHT+IHgpcFwHSm2zVcUODCW5JcshsHhtbkvJSp0EmQ1ldqTh2Z3SffwnMZ+PTTzMy37ZPdH+p1OfQ==
X-Received: by 2002:a05:600c:19d1:b0:405:7b92:453e with SMTP id u17-20020a05600c19d100b004057b92453emr15618178wmq.37.1698331323261;
        Thu, 26 Oct 2023 07:42:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f57f:eb08:d29b:8c9c? ([2a01:e0a:982:cbb0:f57f:eb08:d29b:8c9c])
        by smtp.gmail.com with ESMTPSA id bg9-20020a05600c3c8900b004063cd8105csm2790955wmb.22.2023.10.26.07.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 07:42:02 -0700 (PDT)
Message-ID: <7497e738-b9de-4dcb-90f8-06d6b1a86047@linaro.org>
Date: Thu, 26 Oct 2023 16:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] pmdomain: amlogic: Fix mask for the second NNA mem PD
 domain
Content-Language: en-US, fr
To: Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: linux-kernel@vger.kernel.org, Da Xue <da@libre.computer>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org
References: <20231016080205.41982-1-tomeu@tomeuvizoso.net>
 <20231016080205.41982-2-tomeu@tomeuvizoso.net>
 <CAPDyKFqEP50MBE0_t5tAfsrdx8EOy5MGQWqfX0a_8FA-3cJe8A@mail.gmail.com>
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
In-Reply-To: <CAPDyKFqEP50MBE0_t5tAfsrdx8EOy5MGQWqfX0a_8FA-3cJe8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_074206_708522_51AE0CD0 
X-CRM114-Status: GOOD (  15.36  )
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

Hi Ulf,

On 26/10/2023 16:36, Ulf Hansson wrote:
> On Mon, 16 Oct 2023 at 10:02, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
>>
>> Without this change, the NPU hangs when the 8th NN core is used.
>>
>> It matches what the out-of-tree driver does.
>>
>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> 
> The change looks good to me, but I have been awaiting an ack from some
> of the platform/soc maintainers before applying.
> 
> That said, it looks like we need a fixes/stable tag too. Is there a
> certain commit this fixes?

It looks good for me, you can add:

Fixes: 9a217b7e8953 ("soc: amlogic: meson-pwrc: Add NNA power domain for A311D")

and

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

> 
> Kind regards
> Uffe
> 
>> ---
>>   drivers/pmdomain/amlogic/meson-ee-pwrc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
>> index cfb796d40d9d..0dd71cd814c5 100644
>> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
>> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
>> @@ -228,7 +228,7 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>>
>>   static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
>>          { G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
>> -       { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(23, 0) },
>> +       { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
>>   };
>>
>>   #define VPU_PD(__name, __top_pd, __mem, __is_pwr_off, __resets, __clks)        \
>> --
>> 2.41.0
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
