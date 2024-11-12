Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4C5D42B85
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4eYheesPFQ7+KlyGOeBCOpIl2wOgvmGa5vhkJr0vR0=; b=F/NsYqpqQa8e911PikVNd5QTfr
	RxJWuZElVmHhTJ0/c1ofFs7Rs1IZ1cHfNGLQygkHgYVThWYwf665x8N6FGqUd6ryxF2qrOzsXVWOV
	qTMooLJmZYR2RxCGIVNYoJVCPQUh/Q4Ghzzz5xnV4iiYfkg48vX0Mj7fKNktN7t2DIx0GkFPX/+Rn
	j3SPTYPmiKbOD88WP/BBencrYovFFBm0NCm2peTr+GBnZg8I0PFBRGuSBYL3Cf4aZE65HH9yJwM+9
	imxbROCKMb4PkRv3OjkxokRAMCPNaeKPitSPXAfvFgHHZMXmXgtHg7kSEDXpiCLJF1tTunwiAfsQF
	bc5WdRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsRl-00000003sdk-35Ul;
	Tue, 12 Nov 2024 15:04:49 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsRi-00000003sdC-3Yv4
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Nov 2024 15:04:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37d518f9abcso4196128f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Nov 2024 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731423885; x=1732028685; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+YJuljH8so7LFNlPr2qSzI8opzLdE/u+hjqBQxVqzQ=;
        b=o3V/oi/MUeHILjqyqJfdkkCqtDf7GId1/rMFja7/upKTrdIOEUc6cdydLCOB+rFFQ5
         rqC/O3VtbI3DQ/r14m+GyHoJ8XANsFpIeVO+pZebApufeB6k91hCs/B5B7UNds+qlC4l
         n61qh5buUsh0aTKjjP9RB8hz6M1y/ufCCw043uG36XptR9oE10Ki5c7JbFyvZPPLpM1G
         iK9olK4ozFXsCcqhjr76kyY9267TeNVYzczhKlsvNpZ5K4LaOELcQiEEnJauMvm350Zl
         YiyoFdv6DfHpuZnu6+oFtVYzNSqANJSIIWrLb/4ymVIguHHrGrEftrZlmjsLii5DyfzE
         Ui+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731423885; x=1732028685;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h+YJuljH8so7LFNlPr2qSzI8opzLdE/u+hjqBQxVqzQ=;
        b=A9GdlwsC2uhOzpWe7sKEGZsqBOsgp/WN33m8nqFRzoi0x6q6DwOOjUm7H/SIEOGvkr
         2kiDR0jXnn9rgEz3N6GShUcjOMajFzgqvKPo3SCfOSQnK/cMyfFrbpNythDgncacKOu3
         l+3Tbc4I005lM30d2ePTdUQgBPuTtW6Lr44M9y1YlaPMMuRr8OimaZ46dpGObeLZB128
         +FYdijHO2b3W1htqreFEpUYP/pJU25fxI4gdHZLbgRGhSIs10DTlWHU65iN4V3E7e+K4
         aNiWszB+0OteBhAwjbIB8hU60uGTCTwA3WVPmD7katX/sm0FlSRzB4o2jgb3akKnhJ8v
         is+Q==
X-Gm-Message-State: AOJu0YwYhKU4KHy6nOqge1BbrReDd1JYxXbH8G3Rws6Sj4fSHPWHSTZg
	GTP8IyuAvs2iR0R5IF/jRaqu5SD6OooUc5U69i837iD2DEqHmrCe3cJUpvqub2g=
X-Google-Smtp-Source: AGHT+IGUdcfPX17gUS2CUFCdlqiq3IQ6Q+rwCNxluMYjetF5UrhuIO2tqr7mZtScD18rSXRQBpJadQ==
X-Received: by 2002:a05:6000:2d12:b0:382:4d7:2b4e with SMTP id ffacd0b85a97d-38204d72c42mr3745124f8f.59.1731423884965;
        Tue, 12 Nov 2024 07:04:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda04111sm15524843f8f.92.2024.11.12.07.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 07:04:44 -0800 (PST)
Message-ID: <590c326e-cc61-4341-8544-e50616acc7a2@linaro.org>
Date: Tue, 12 Nov 2024 16:04:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] rtc: amlogic-a4: drop error messages
To: alexandre.belloni@bootlin.com, Yiting Deng <yiting.deng@amlogic.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241112143652.3445648-1-alexandre.belloni@bootlin.com>
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
In-Reply-To: <20241112143652.3445648-1-alexandre.belloni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_070446_929422_FB3A2A52 
X-CRM114-Status: GOOD (  14.37  )
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

On 12/11/2024 15:36, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Drop error message because there is a high probability they will never be
> seen and the final user action is clear, the time has to be set again.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>   drivers/rtc/rtc-amlogic-a4.c | 20 +++++---------------
>   1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
> index 9423dce4193d..4960790c4b24 100644
> --- a/drivers/rtc/rtc-amlogic-a4.c
> +++ b/drivers/rtc/rtc-amlogic-a4.c
> @@ -102,10 +102,8 @@ static int aml_rtc_read_time(struct device *dev, struct rtc_time *tm)
>   	u32 time_sec;
>   
>   	/* if RTC disabled, read time failed */
> -	if (!rtc->rtc_enabled) {
> -		dev_err(dev, "RTC disabled, read time failed\n");
> +	if (!rtc->rtc_enabled)
>   		return -EINVAL;
> -	}
>   
>   	regmap_read(rtc->map, RTC_REAL_TIME, &time_sec);
>   	if (rtc->config->gray_stored)
> @@ -145,10 +143,8 @@ static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>   	time64_t alarm_sec;
>   
>   	/* if RTC disabled, set alarm failed */
> -	if (!rtc->rtc_enabled) {
> -		dev_err(dev, "RTC disabled, set alarm failed\n");
> +	if (!rtc->rtc_enabled)
>   		return -EINVAL;
> -	}
>   
>   	regmap_update_bits(rtc->map, RTC_CTRL,
>   			   RTC_ALRM0_EN, RTC_ALRM0_EN);
> @@ -174,10 +170,8 @@ static int aml_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>   	int alarm_mask;
>   
>   	/* if RTC disabled, read alarm failed */
> -	if (!rtc->rtc_enabled) {
> -		dev_err(dev, "RTC disabled, read alarm failed\n");
> +	if (!rtc->rtc_enabled)
>   		return -EINVAL;
> -	}
>   
>   	regmap_read(rtc->map, RTC_ALARM0_REG, &alarm_sec);
>   	if (rtc->config->gray_stored)
> @@ -201,10 +195,8 @@ static int aml_rtc_read_offset(struct device *dev, long *offset)
>   	int sign, match_counter, enable;
>   
>   	/* if RTC disabled, read offset failed */
> -	if (!rtc->rtc_enabled) {
> -		dev_err(dev, "RTC disabled, read offset failed\n");
> +	if (!rtc->rtc_enabled)
>   		return -EINVAL;
> -	}
>   
>   	regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
>   	enable = FIELD_GET(RTC_ADJ_VALID, reg_val);
> @@ -231,10 +223,8 @@ static int aml_rtc_set_offset(struct device *dev, long offset)
>   	u32 reg_val;
>   
>   	/* if RTC disabled, set offset failed */
> -	if (!rtc->rtc_enabled) {
> -		dev_err(dev, "RTC disabled, set offset failed\n");
> +	if (!rtc->rtc_enabled)
>   		return -EINVAL;
> -	}
>   
>   	if (offset) {
>   		enable = 1;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
