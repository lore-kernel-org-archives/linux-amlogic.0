Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A0FCEACEF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Nov 2025 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLuycJnVbhxvTOBY3wMVbe62Cz4iRASdOp1QNHrTn+g=; b=pVU30msn5P5lwWK0zNESWQkU7k
	W7K83vCM/D6MuuDWzQ6ltPHuwZ775zmeRAXEjSnRlLFSQ6ZOZ8xncS759C3KIXe1O7IyYuwepYEbL
	jtB1EziA1KQI01DzyQk4BdszWQwKUfMnH4uafTr5IARnlw+5HJGzIqqNOY8MQBleGejhm/tcPP0VR
	WCv6q1KVovZwBY0eTt7MQRzDQ0ddDkFsnBDqCaZ9AC1L940ZS+QmxF5djgsXZhawT6KBvfWlvOsjg
	JEqkB0v0nH+pABdl96hxfrPhG3VsTUUeTY+OygJsnZrxTu56ayqpIG2tYF5Du7MHqwO7ZSOYf/vQ9
	zsO5e8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwKX-0000000FsBt-1Tno;
	Mon, 17 Nov 2025 10:19:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwKU-0000000FsAd-2rtt
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Nov 2025 10:19:28 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so12056285e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Nov 2025 02:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763374765; x=1763979565; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ufHH1DbWx28LxxSzUkyemZUrxXGaMbaGJk+v9vhV04=;
        b=sk1OCBLqFTl0zOE6Z6rykjJZzmXD9VzlMIZ+c02+qORbZdM/3INB2ZyCa0Yi/Th2lI
         gpEjNgvWuyzMUq+X8S/mJuPksa2Jqxf5Cnip60xMV7XPy3hknI7dNKMb+jaYdpJX8+Qi
         tUp/J73W/Wj56WMn+XIjl/XwIfayQm2/CUS1DZPMq4qAIi6rdVDRz/0i0mXfwWsN49I3
         4XMydAZhda7cpkUVAI8wRSN5ICZYeQ8Ci6w9oSV4uUQqHvu5ZfiXVa7w7w8vG9u5B36E
         nWVFQa75U6jvpIOnHdqcix6ZXnesdCDO804TXyp2Jn6snxp7uUetmjTSezgFjJsxSfC6
         dMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763374765; x=1763979565;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ufHH1DbWx28LxxSzUkyemZUrxXGaMbaGJk+v9vhV04=;
        b=v3M6dnndWQ1l2PbntzgW/1Ft27/D5wh5w+UzBq6MSGBQDr88+Ddbk+j5S5C289t8Mb
         fsccnh4AUNiDFGkJ1hYc4Mi1VHAg2OIBxFCf/8+fDSS1raqvCj0q/OOMHr6YL1pJ7JVT
         5S2+yL6MbL+25zEvl8GkEOFJ5rlc7iPnY3QQ4UKpKSPOMNxlUMFkj4d32mfS04FJiFoK
         KejZMI6a826MHvUkgJakEKoJA1+O3i/MmkFUasiQYHX155YQ0TjxGIkJu49Vfh6t7oAa
         /eQtQg4qfkmcLupD2gKzlzb2DEzSO8U3XdvHVx7qjluNv0p2mU7EcIDabp8vv+8kwkJl
         7eqg==
X-Forwarded-Encrypted: i=1; AJvYcCUDDn4lEhMhJv+EGdDOux0SdfADVOJAgEirXr7EHskNcFqstFto9gU2412bTcopr3YT/9Dsn/0bMslR0MvY@lists.infradead.org
X-Gm-Message-State: AOJu0YyuyzoGxK3BtSXNHss9sDomgLVMmzNxh/IdK5PfM2qPwTKFuOgW
	m0TT5FkEzG4ZJm5X2CjEN4LqQSGoTaIPeiSnyKTOAlY4C9qXNqjPvuer/vNgzAuSrZk=
X-Gm-Gg: ASbGncs1dx3FuksbilKGaeIe7ZI4c4etJffpbwfFrEeFX3UwZV0BhwmIb6+TpbU4c50
	zIbXWyFR5WaarETUalbTo5lrMOvnqMohb0umeyN0c50yP4lVw0fxLhoUELTlojSJXKVzJYs3R1n
	W13omFGhsvTNpeZpBV1KCZOckN3/O+d3SyGV/Fuynrc2sZ1hTxSxum5RYWQFrKQgixWFXOt5xsq
	SMDyYaUQY5mmyJINk/uyOUvX/ZimwuLWtwxYy/yw/VaRnbVhTC2EGFhEHQ7oGFKZbU5K3JYlAeL
	FTK8RjvCwhopVNIsI7uD3zR/OocGBHnwHUGtKnmMang4QFG+Ghh/4oHDxgk85pTnfQcrx62U4Xj
	tEIKHSlkFKGg/8U5jSmHobogqbuTMvkGFBhfRjxdvS/RPmzQg6Qjd/e80hJezSnJBEBaT0bMfi8
	sD3izpihKpGYEFe2rU606dolfM5Ee1ZkPXyK9WzevN7l+oECziFxJrz9kY7/OqGq4=
X-Google-Smtp-Source: AGHT+IFD/7Ms5qKA1NSF5rB52XXIf71igLr4Y8ieRfFKXp34t1o4f4rOZNN2lU09OjGHE+RX/5So/g==
X-Received: by 2002:a05:600c:4594:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-4778feba6c6mr110482505e9.35.1763374764616;
        Mon, 17 Nov 2025 02:19:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb54bbesm107384065e9.5.2025.11.17.02.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 02:19:23 -0800 (PST)
Message-ID: <592374f6-6fb3-47a0-a834-ba6702f4b2a6@linaro.org>
Date: Mon, 17 Nov 2025 11:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251117-soc-info-s6-s7-s7d-v1-0-6ab8aab03dce@amlogic.com>
 <20251117-soc-info-s6-s7-s7d-v1-2-6ab8aab03dce@amlogic.com>
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
In-Reply-To: <20251117-soc-info-s6-s7-s7d-v1-2-6ab8aab03dce@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_021926_765478_042FE1D4 
X-CRM114-Status: GOOD (  12.32  )
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

Hi,

On 11/17/25 11:17, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add new definition for Amlogi SoCs, include S6, S7, S7D.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-gx-socinfo.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
> index 7549f1644e5e..6fbb70c8922d 100644
> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
> @@ -45,7 +45,9 @@ static const struct meson_gx_soc_id {
>   	{ "S4", 0x37 },
>   	{ "A5", 0x3c },
>   	{ "C3", 0x3d },
> -	{ "A4", 0x40 },

Why did you drop A4 ?

> +	{ "S7", 0x46 },
> +	{ "S7D", 0x47 },
> +	{ "S6", 0x48 },
>   };
>   
>   static const struct meson_gx_package_id {
> @@ -86,6 +88,9 @@ static const struct meson_gx_package_id {
>   	{ "A311D2", 0x36, 0x1, 0xf },
>   	{ "A113X2", 0x3c, 0x1, 0xf },
>   	{ "A113L2", 0x40, 0x1, 0xf },
> +	{ "S805X3", 0x46, 0x3, 0xf },
> +	{ "S905X5M", 0x47, 0x1, 0xf },
> +	{ "S905X5", 0x48, 0x1, 0xf },
>   };
>   
>   static inline unsigned int socinfo_to_major(u32 socinfo)
> 

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
