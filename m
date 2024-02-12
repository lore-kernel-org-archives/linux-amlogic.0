Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B25C4829C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEmGfa6L9ggY6cA/dwoVdBG0iT5nPvs5/g/gzuk2xLs=; b=XjNY8u/OB3pkwgGncFCLaQ/3g9
	rZP40eJDBNxD6hFkSG9arujMJrCF+Di69imiX5OVoKNbmKI5TryE2x4CHGAMEND4PF7p7IeFGiFTG
	ILOYWfPU6CPs6KT3qn1QXl2r1KIVl0FJPVUrG8iB6uKCuN7IKfcA2/rJpurGMcIbVTaIEDVWZ40ES
	mdsLWoFTIO5BlSjz0zpBWpDpFXPM8uqPNV8WwSGgeoufluKZdsHnOcJpJOjGTEQZLNJ56/mUwf9A5
	57auuG+Y7Jg5M/vujHcTcBBi27oO40qvwEQH/MQLUN9dbleFGB/1wynWmvQMHEtAQo77EBfp1u+SG
	Fs5Dyf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZjU-00000006KEn-2GvH;
	Mon, 12 Feb 2024 17:04:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZjR-00000006KCW-2joy
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:04:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40f02b8d176so28509715e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757475; x=1708362275; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCiCJbR2fFWNQTiu09VOn5xEOdbx6D5LzB/153ytI5k=;
        b=i/nZPvBT6FpLg5beKS9EFu2pQzXqc9h5N7NwZuxdEzPRA47zWU2luV52EpE21IhoXm
         xmesIgdk+6BUDb8oJykNxuKD1mYfSKwAGmcvl6NDJl+4Wb4w3YdAzKF/V9t7jke/HB8N
         Uu3YLpq5whgbEGnskSgQtltBuDiJKRGqEOw+DIKihRskvDgJ48M5dfmnOlu1QhjCf/Oa
         fuKwd6OARbBI5t5nswq8RbAaWAUKIqCRSTW3V3Iqw8Kjkox0S6jUBWhcKJ39+Zdzp4wY
         nm1SePh6lggse4xWvJFAUBGRaOup+Ux6Wn11KPVxit4DTBZ8krEtOxjQBPwHCJnBc7l8
         lh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757475; x=1708362275;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TCiCJbR2fFWNQTiu09VOn5xEOdbx6D5LzB/153ytI5k=;
        b=TkPgtoXGF90f5ke2LoTwapZvxeFlPNtnWz/CugMFm/QcVvo1sH36mwUKyN7gGJ1Elj
         vzR/C2NVfwdyJZE3+sXN7Hz6y054v4sHjdea2BMKTswuQ6tDmxvZ5FkwhHiWMoAGSiEl
         WeW5tAPDS8T/YJUltUTD9bQKpUz5pu3jIT7ukbBBJsfSUMC5rsXER7htY2EIsxAhw4ML
         nLmh94w9K5HS99v7GzWVF4WpnSfXxEl/NoXrgWWGd37sEvjltdnnhqh8V+0sfh2c7Zzg
         Tl/tyYiNFermtNljhjUobPmrr/fDIHE3tJdGJGTSodx/3fki/WPZ/YHAMZ4cWVGjfbIw
         ZNgg==
X-Gm-Message-State: AOJu0YxP0+IWzCDXVMMxwAM0rOMoGfdpblwVzzrb+LBU5vVpaLfI20PX
	r+HyQ4pbimgGZQ59ZCKI3KB2zbHHuQep/VRsgQX3n8bcqkXZfnwGL21TEjYXBLg=
X-Google-Smtp-Source: AGHT+IEVj9r0GB8WBsSsyY8MRB81zPzdWeVZbh5tR7F7nE64MMR9Fg9HfefBpCGR2loSH1mGvnencw==
X-Received: by 2002:a05:600c:3b87:b0:410:cbc5:b4ab with SMTP id n7-20020a05600c3b8700b00410cbc5b4abmr3235043wms.19.1707757475631;
        Mon, 12 Feb 2024 09:04:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVU/mVoQDf/+OEwVJt47fBfZs+lRKKggI9zd8lVuXp2Jj4XdIj0ouvrIspQhkhmS4WblFRFFI4tnAdJqMX8Si5KvWw3N0SBwHiMhbuD2iVPcgEfa3l4MOJXXbbhN+heYNjDIKa8OtzTbx2zjEqQ+yAJD1uX7XO0ZCD493UBebjd3HYqF7uoBZxE5XbKK+MgLNMzMr59mKaYTwNfH8dnKUgUfG9C8iFBPpg04cVeUlxXUTzA4gdxOCzBDgZPFcmsTW8ETGAzRbOjKLyAMxmR/BgEXteAH5M6s9189eCuzAjWnR/xwYxsizO/zUjVm1EN1ufpdoamLZ0R/qk2QT4/Lov0gwgoskEB5QXR6ft1+/Ns3c4DdSefe85GykiqK0TtChHz8QawODnehYMhzKZq6YDzbqb6FEef6R5RSZf9TIpqWlogK4L6VHqvN99ArKAe28XjRa8HbnE5dZVsQtf6/2B9J3RroX53XGGefvkHBIYjMUiSxfl7zjfKLOaByznVSgHhIMz8bv1XfmNBG0hMAQVivc427fMlgzhBT+4PiafT4z9FPWkJo3Z6M9FtkVlp8Wf24CIdKFXwrM5Axo9nsgevC1RJrH68dWjL
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b00410e6a6403esm2462229wmq.34.2024.02.12.09.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:04:34 -0800 (PST)
Message-ID: <847b368f-3f71-4391-85f0-e00eca24a922@linaro.org>
Date: Mon, 12 Feb 2024 18:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 17/20] arch: arm64: dts: meson: a1: add crypto node
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <20240212135108.549755-18-avromanov@salutedevices.com>
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
In-Reply-To: <20240212135108.549755-18-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_090437_761566_A53E953A 
X-CRM114-Status: GOOD (  12.34  )
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

On 12/02/2024 14:51, Alexey Romanov wrote:
> This patch adds a crypto node declaration. With the
> Amlogic crypto driver we can use HW implementation
> of SHA1/224/256 and AES algo.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index b9fd69112535..6d11e38ca3c0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -653,6 +653,13 @@ sd_emmc: sd@10000 {
>   				power-domains = <&pwrc PWRC_SD_EMMC_ID>;
>   				status = "disabled";
>   			};
> +
> +			crypto: crypto@6000 {
> +				compatible = "amlogic,a1-crypto", "amlogic,g12a-crypto";
> +				reg = <0x0 0x6000 0x0 0x48>;
> +				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
> +				power-domains = <&pwrc PWRC_DMA_ID>;
> +			};
>   		};
>   
>   		usb: usb@fe004400 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
