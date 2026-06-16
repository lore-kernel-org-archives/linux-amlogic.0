Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1AACD98DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2026 07:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvvmzv/APJVIms1retnMdWQpyWke5XrtdpwSWm+J6q4=; b=PFSQ8UMuYYQe8rLPMY1+kd5JGe
	aene59HN6Dnu1b6kwKlT33RRCQJ0xqNC1DSo7X0sKH/bHwBMRs1eU8ETxADAV6dDFCeWzDfE7fZep
	IR8O12iGEMM8P6LirEHV6Q5uEaSb8GrPx3NTKcWHkUgdkVowNgctEyKuteFUiIqnFxz+zbfi3bm29
	xah28gI04DLhoqTHQp4Zdp+oi9wEf6bPIXiYxMnSV8b4VL7Gq8iNZFbfc/UYuNaJePkgFMYEBLFo5
	nu2O+nSky2FR6qLaB9LHmU2M4sGD6HoVlH9bMGlEs2Dk5TliPQCxR9hP+4DrXSLP7ZPMtvHQJAlBx
	aN0K4BJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZNww-0000000FLq8-2zox;
	Tue, 16 Jun 2026 07:11:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZNwt-0000000FLow-2t2y
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Jun 2026 07:11:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-46019edc13dso1921822f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Jun 2026 00:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781593862; x=1782198662; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpWtGQUMO6w+AqepPhMZrIYR/+GHp+ISWGwYizWvLWs=;
        b=jH6FJQ8LRwssaemFByrrn14ILbvp5Mdzbx0GNa0Qy6fgVRrDBC/6o7/LOGcBAjaMYJ
         6Hb2BDCoHjGyXSkJdMkFrkJ/EILbW7iBeWUt1RAiN0gE1k6/t5eD0R7JbsJUpg1gAo2B
         p0Tb+b3RIRtORoarZOCEHNxjsThiJPegmydxZx+wPGmelmWHBDDnRDdBnJBvL15fO6Nc
         +XNsyQsBX2CkJRvtnrXhK66CIFHs3sTEMmLAx946ASmT7PQWUP0QRaqmAse285BoYpR8
         CBUfaTkjXk89YRIHf5xLp6bHyNJ2SKdVuHuq84It96nKM0Im70JIyHqpq2DqrlffAnFb
         /Xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781593862; x=1782198662;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpWtGQUMO6w+AqepPhMZrIYR/+GHp+ISWGwYizWvLWs=;
        b=fGSQKvL6jXQ85oCehDNvs/hYHWjGqenoGxgPSbHAQva/SDbtD5TE+qHWBfHXmU0RGr
         d7FmHSz2Y+tryrHT9RqW7sHmYCHjQyOa6Bj5zfwns6iiwj3Hm0Cu8SYjBjNr0i5TlCFy
         tyFA5BAD6kLsUp5MZ/C4p/wJy8VZekbtvlvTA+hYQcTTXG7MnLd1SvlJz9q0hbRPQlBQ
         Ze824T79LnkZWJ296IyqGu/hoKwP6Bf0OBIa0YCD2J27A4ULd6AS+itHWcbJPiLVoaRl
         IsdBK7IR8II8L0Z0Wyf8hG8YF2uAxZMGAQO77IyjhsxUHAm9aIbjQXRE+ZmP/TtRWCg4
         mRzA==
X-Forwarded-Encrypted: i=1; AFNElJ+5SjP3rJ9A1u753I0t9+o4CMO9mqhqqqofL/qlPPXMDg2UHa7l1cDSBPQUeY64AKa0gF6HduaLlx94GvZ1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9MpxZYGNOyEroopL6zdIfaamqmsY4pKO2dHqddc1rss4N7toW
	BYbayFXRmZYtvUrtroPbXc+MHVxA3BwBI7pdctcQN+dg1Ba6ggxs7KDYbXFgeg3WYoc=
X-Gm-Gg: Acq92OH4zEtLGTCSMW1wpAvQxPULOCO7eX5sbqYCiXt/sP0sn8jJLul+OJNh4Y6Ccrv
	ncW2Oyj9O0srrJOBS3+BHOLGnkzqi9zuq7KDe4kpukorjwPiXelf9DcOHSmuznJJSOfMEee6Wsx
	jKsbC7AKDC+UKOvHGxuZ69vQkLWWm0DGMXUXst9ZmOevFcFjShKz1upJW2ofnu6m/RWn+lomhl4
	lQk8RyIWsRZX/EALZlADh0eUyX2frLHwUang+yEKe4imia4sKETdJyNnG/Qrn7MbP4/NQXcs+L3
	+pTwXlWnInbAZjzuHKo1mUwdSgdx1s9lqL4YALq0uxll14WBDu1lgpo1r9Kg6Wv4qrhD2H+lHjp
	GTn9o60rnd3Aw0gXTkrQoUVogE1cYJ1VMd6ajUkdRDWPtY1+OEILWzVXGAnS2bu0weNxWD6Uapb
	ckt7VM85DdM4Ys5FVfori6bHkEcfpD2w==
X-Received: by 2002:a5d:5d01:0:b0:45e:ec18:f20a with SMTP id ffacd0b85a97d-4606dbeff08mr26112789f8f.32.1781593861537;
        Tue, 16 Jun 2026 00:11:01 -0700 (PDT)
Received: from [10.3.4.22] ([212.133.41.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c4240sm38392203f8f.27.2026.06.16.00.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 00:11:01 -0700 (PDT)
Message-ID: <870a2721-5fad-42fc-b8f7-40a87d5a277e@linaro.org>
Date: Tue, 16 Jun 2026 09:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] PCI: dwc: meson: Fix reset GPIO initial state
To: linux-kernel-dev@aliel.fr, Yue Wang <yue.wang@Amlogic.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Remi Pommarel <repk@triplefau.lt>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260616-fix-meson-pcie-reset-gpio-v1-1-fca404b4c8be@aliel.fr>
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
In-Reply-To: <20260616-fix-meson-pcie-reset-gpio-v1-1-fca404b4c8be@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_001103_777826_2B38F0B3 
X-CRM114-Status: GOOD (  17.12  )
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

On 6/16/26 09:07, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Commit 4d3186a525b3 ("PCI: amlogic: Fix reset assertion via gpio
> descriptor") inverted the reset assertion logic to use proper gpio
> descriptor semantics, and moved the polarity configuration to the
> device tree as GPIO_ACTIVE_LOW. However, the initial GPIO state
> "GPIOD_OUT_LOW" was not updated accordingly.
> 
> Change GPIOD_OUT_LOW to GPIOD_OUT_HIGH to get the right behaviour.
> 
> With GPIOD_OUT_LOW:
> 
>      ahci 0000:01:00.0: enabling device (0000 -> 0002)
>      ahci 0000:01:00.0: SSS flag set, parallel bus scan disabled
>      ahci 0000:01:00.0: Controller reset failed (0xffffffff)
>      ahci 0000:01:00.0: probe with driver ahci failed with error -5
> 
> With this fix:
> 
>      ahci 0000:01:00.0: enabling device (0000 -> 0002)
>      ahci 0000:01:00.0: AHCI vers 0001.0300, 32 command slots, 6 Gbps,
>                         SATA mode
>      ahci 0000:01:00.0: 1/1 ports implemented (port mask 0x1)
>      ahci 0000:01:00.0: flags: 64bit ncq led clo only pio ccc
> 
> Fixes: 4d3186a525b3 ("PCI: amlogic: Fix reset assertion via gpio descriptor")
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/pci/controller/dwc/pci-meson.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 0694084f612b7..15ed59b8764fb 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -400,7 +400,7 @@ static int meson_pcie_probe(struct platform_device *pdev)
>   		return PTR_ERR(mp->phy);
>   	}
>   
> -	mp->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	mp->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>   	if (IS_ERR(mp->reset_gpio)) {
>   		dev_err(dev, "get reset gpio failed\n");
>   		return PTR_ERR(mp->reset_gpio);
> 
> ---
> base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
> change-id: 20260616-fix-meson-pcie-reset-gpio-2b9e188668c5
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
