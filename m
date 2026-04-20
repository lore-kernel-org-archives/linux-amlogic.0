Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6BEF557EA
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 08:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAT8xQ6KpicS/AHvjLVqSWO5UPO5H3ZxjG0tCcFkZAM=; b=YLtdCAWZ9S1N2q2EXbPKCVy7aI
	4I4dQfj70Y8gqaBO0u54gYlN0oawOVUokHFdYdVUATgGKGIqMsSQKFQd8sgwTSBSTI27pPJ6L/pYQ
	zq/cL6lTgiu4swnjEhw4X6QNINXJ2ERMqYAvyBSi4zQDG0E6YSnX6xBhlLE+WINaZgEPKMlOEafHv
	CViV71tmrT9FxCO+G9OCU/7BfVb9gvAYal0dxvWlpw2+md6baCKK/o1wPvWkQTBJ1M+BxUuZt+1bs
	r1iFS+1OoqlEi5i1gj0ExzDGakz9B7WIXGu2dSdO01tyG2TsCtP6KjiEGRxJelmCyFIxZd+0xSO5B
	oBWAjuOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkKF-00000006dFa-2CPb;
	Mon, 20 Apr 2026 08:49:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkKD-00000006dEd-3QzN
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 08:49:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so23818285e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 01:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776674988; x=1777279788; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xWoalrTQMKN5PXGb0VNUHZOdQdHP7hElqPdul47lc4=;
        b=YE2Do5h+Yb2ZrR5MNkng1QNI/jrRUcohadB+5PoZTxqFVZD7NzsDnqyigJD1jj4B4a
         Bk7z3aPCUfhLohvdW8Pxnu6oXzqMcgL4oScm+gqh/ZcsEleHJ/X3i1ZYNLqf1xTY3wO2
         1E5hGQoBu4W1st5aWEFC6iDhPrFRnarUemyKL+onRH/E8OM4KmD+D0fgDXrFAHEdGUzT
         cRKEcR+ugaEToH0SevlKykllhof2rhC5P00h76UBfIL+X0zrA9XgqnrCA8oEev6QmDxm
         gePJ6TJW+siV9SYpvfLJw4auolRRGiRuLLBApShYs136GAHDcwVp/ogpChJ/0ImZqWos
         yZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674988; x=1777279788;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xWoalrTQMKN5PXGb0VNUHZOdQdHP7hElqPdul47lc4=;
        b=nYJUIbjuaUNvmIdqwYLbYA8AOKoQhMmeZ25eQTjqIesKL/YlibGWuBJH53qBF0vJt9
         VANaxpbveNvzoDOIbVLsx6U31MbsA+3UWFGnAZB9UEc4itGEneOJyQvFPCt7WOPFvGKf
         P3iwONL9pZ8hUN0l1OO+4cIiPRQ4nPWAmSeXp7zDITLsvc5BzF+/R9U8przwbYhXe1O9
         c+yTgussVEUAiMK2YxwHYwUN3Izl7DJIaNa1fPiJ9GfU1zUiMGLvplpQj80MSSdMd8Ud
         sfkxWkpY6dUlyI9OsvLxy+4z9pcs/WCYMpvUmfPdJll12/Fq0Ac/jvEE6skYLVRAY3RN
         wS9w==
X-Gm-Message-State: AOJu0Yyy5+Kimr5EAEYTVBdPuTA04qqTklS1V2WcKBVbhSc1tPLDYTek
	u5ocLK5mbQLB9O/u/LTeub0N9rLA1/Wl//B21FU/uOmmfkfu0td9PCR6dYoY2lDyK3gdh4eLjd8
	o08dzZ7E=
X-Gm-Gg: AeBDieukvR/MldxwDmxCvBGfSZQL3yU0n/WQX9DeON2JP/FP+UgMv+5CyP6Vr4xHohs
	lrauDJsIR3XOY1YA9pko0jIcQO0/NaIF4wqY9K6KU0JYXz4sb/tcn6sF+2OGQB2RQOW821Fw0iK
	0oLY0Jhh4rGc/JP9r8Ftx42N6Qygr9cUckgdO9vALhH/63dEW1YEW4MZ5vjm6Hr5+R/bX4TZyiG
	ouhJf7hgtqU5DvIUiNuf6STZJQY0YJnQPnEC8yWZyHr46Pi3Q5PkR8EM0F77TZ4/tY9p0virzHH
	Jxeyd7J6A2Ax1axCOxWzE0YMQMaJQEDwLQFYhIhShRQ7kAGVIlC8nehap4J9CYaOsFoPpQUmnkj
	3lGKxXh0r8Qiq7hrpWwb0eu5wisVIQc2KmJ7/4HRyyub5CIobYq3vjCV6fof26CuU2tD+aKQyUO
	2V4V1qEXs9bPzIQ9MsmtEaKaQuZhrZzSo+LSGDQ5wvHlU8ocLZzDktGeHk15Fks0U5elp8AgYcL
	hn2t9gZ6HGgQsvACA==
X-Received: by 2002:a05:600c:1907:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-489201cdf13mr19096455e9.12.1776674987751;
        Mon, 20 Apr 2026 01:49:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489fec8f7cbsm14545985e9.11.2026.04.20.01.49.47
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:49:47 -0700 (PDT)
Message-ID: <3232398a-f3dc-4552-8555-2b812e1c4f0a@linaro.org>
Date: Mon, 20 Apr 2026 10:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: meson: a1: Add clk measure support
To: linux-amlogic@lists.infradead.org
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-3-02b6314427e6@amlogic.com>
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
In-Reply-To: <20260415-clkmsr_a1_t7-v2-3-02b6314427e6@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_014949_916997_F620C277 
X-CRM114-Status: GOOD (  11.01  )
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

On 4/15/26 10:33, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the clock measure device to the A1 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index 348411411f3d..6f6a6145cba1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -576,6 +576,11 @@ saradc: adc@2c00 {
>   				status = "disabled";
>   			};
>   
> +			clock-measurer@3400 {
> +				compatible = "amlogic,a1-clk-measure";
> +				reg = <0x0 0x3400 0x0 0x1c>;
> +			};
> +
>   			i2c1: i2c@5c00 {
>   				compatible = "amlogic,meson-axg-i2c";
>   				status = "disabled";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
