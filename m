Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583CBC4829E
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GticQ5qtBrJalaFgufMWWbxIsVCM1L84N9kbTfDEBhw=; b=PccSBeHWqwVsqwSs/aQNAIPtbG
	a4QcVrgXQ6oMxns/trGb2Exvw3tXhZ3/EgtCz5FVAmv34m5yd75Swd88JfaLfjO1vg6zx9bXNnS9z
	vd1Rt6ubMuMuJCU2oUbaySlzTZfiVK8tp0muDWjC+UTzlybg32d20qgZE4JCElRSgAua/Nz5vzK7k
	QK/cwpL0Mr3/VLxVV8QvvNrU4z1AB23tE1bfebUQkJ2GdVzjaDDpLLGvE0MTrEFNrEllMMM9Ucehh
	GOTREjpaV6LDnddIvqtfKY9v/RW+/9yhEdYQk9RRSKMYTOAT8sJ/2dJd4yJF3OdA83NK0u82mXzDL
	Vvn1L2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZjk-00000006KQs-1s4S;
	Mon, 12 Feb 2024 17:04:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZjd-00000006KJi-12Pq
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:04:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-41166710058so4385675e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757487; x=1708362287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EboZSoorMU/aGDveGWka+nBx5MaeKWpS3zEhsrSo8Ao=;
        b=l6/YKD86HF2CnWBdlBQ3qOHp+lx9JlxKn/lbJjEuxGHyASr4Q6jYfjBUF+Yr7qMblh
         zJzJ/rEApw0BKnLPYyyajd2IJo6O0Ok6ptkVzbmMlV5Ul4iSelQEWqF4bwUoyE773g9e
         DXhecKvQBbJz2KQOTEo/uMkolmg/fyNebz6wQIr00mGoRhvKaw+hMmHSG7EHKMLavex0
         F01ybn4cjYLH4LP041u/reIg1wCG/qGW43vYxonGl/nmV7v3n/MVYkGm4mCg1cOUQs+f
         KvopO2ixeUzzYDZbDnlojA836nUwulcYEinrZo+tzdazJGNcEip+InlOIGDZwObSkqZe
         G9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757487; x=1708362287;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EboZSoorMU/aGDveGWka+nBx5MaeKWpS3zEhsrSo8Ao=;
        b=SB9O7mDcYM9gzY1yFgEHFOKFpCpDLLmd/ZuX/HAP9KlomZ6h/+YNPz79L6Wy8+EGkd
         tHdpf1Iw0oduCrixc6X1YclwzG3RmUSS4n0EaObNpru6P8mhrNeXDoKNdWnISF/IsEx+
         CGHqfVvqC0QEAkXsNkk4BdOdw8r4kSOj9qmAfVaSPOYI2MFE/INrAcCB72Zr9qmeHgc6
         TFE3Y7Ou3J+D/Z6i6no0TmmMmZYri8lz14zv3xfMVe3TE2Rc+FkNW1S6K664EdE3Mxe8
         vgnzPj3X+d0uCdTBi+pSzPGZI9iA5sWx11TCa7sUOwOpEYq+/amPhgIbftu+iN45xiKs
         5Xbw==
X-Forwarded-Encrypted: i=1; AJvYcCXSkGnCi5UKZ1eTZpShli+nbd4ZMQrW8nsiWREQpnCblEAD5nhPCHWnMPn8oTxkSlVeqDhDsI9Gpp1F5Vc3rdFQNUOZNgWRmyShij4TJEW1zzk=
X-Gm-Message-State: AOJu0Yw1xWniFCRpDghTC/E+RFt6/CRVwdv8b/YbJduYo6SU6LSyNeP4
	FKPC8QV2UXv5ttWLwgynlX8SnP8FowUl3hX6ZPDN7qht5M875USQfslIERXb910=
X-Google-Smtp-Source: AGHT+IE1a9ilnA+p6OlC353V/A7IFuTkLJbhEXAuhv3rhLJOebkyMrkuRFyECOrY2dEMvZ8Y75Ujyg==
X-Received: by 2002:a05:600c:3d87:b0:410:ed9f:7acb with SMTP id bi7-20020a05600c3d8700b00410ed9f7acbmr1347709wmb.40.1707757487283;
        Mon, 12 Feb 2024 09:04:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXqtMKH20PfQi2t3C/eK3iPaMATY5ZstZzR5CwVKZFPpKrSC2Bj/b5SwIqmbzMMnrcsPp4yk4eJHn3l/zwjOkeyem3WCsin52VkDQCQ/Nx0YNMzioSSU6dxmIO/GrmQ0zCh9Wpq3JWB/1SjPHxSVcNaau/7r1BhOoBALSdzblusHMF2zYhwg7q2BngK4nZosCFoc50NBJNQbucCUR8XfQo2sbh7/DQCuIX16BQmU9RwJy9c1HbqtpI5LTqc2N7uRoMm/erRwTJzbl8QAuwZRRrAb3IwYeSUmuYlWyHqBD4YEE6ipUC7P4qz2uhYubXqQ0BXsVBg9Ru1rzdEL/81RvnT8EggYMTNjEmMQux6ZlP5COluu6OIRqbZTbZzjr4Hg2OvsTGMEEUUeqQB/lAbl6AFCX/BkxwtXqpY3DkoYoK4W1aB3/XhhX69YDx18SVDNKkeTu7dmYCGFd5mMpI9itiFfmrn4xBngSXWEi2Ln3UYFxW54orB4dPHDqohGcXhX4ePFinZ/n0tTvRhgJfC/+7Gy2RC1zZlbkK4WLYCyyLH4iM6PwSrAnPamArPKIKZSXZpRSep65iqD+yOBjVC7FpEo/xd+KgbaQX
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b00410e6a6403esm2462229wmq.34.2024.02.12.09.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:04:46 -0800 (PST)
Message-ID: <1d19de25-362b-4983-98ee-c1aa6d2c5cc0@linaro.org>
Date: Mon, 12 Feb 2024 18:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 19/20] arch: arm64: dts: meson: g12: add crypto node
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
 <20240212135108.549755-20-avromanov@salutedevices.com>
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
In-Reply-To: <20240212135108.549755-20-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_090449_447276_DF0F5FD3 
X-CRM114-Status: GOOD (  12.06  )
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
> This patch adds a crypto node declaration for Amlogic G12-series.
> With the Amlogic crypto driver we can use HW implementation
> of SHA1/224/256 and AES algo.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index ff68b911b729..f6d7047a579c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1709,6 +1709,12 @@ internal_ephy: ethernet-phy@8 {
>   					};
>   				};
>   			};
> +
> +			crypto: crypto@3e000 {
> +				compatible = "amlogic,g12a-crypto";
> +				reg = <0x0 0x3e000 0x0 0x48>;
> +				interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
> +			};
>   		};
>   
>   		aobus: bus@ff800000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
