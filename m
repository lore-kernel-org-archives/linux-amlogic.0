Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AFCC369B2
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Apr 2025 10:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNof+TPace+lzXZMRmxs21tu19nESehX/qmFJ2gIdIE=; b=CcFnTMH2lQlyTl0Z1bNxdtNfvV
	Hz8kMF0SO3+mlEMWhrH3S3rrX/jI4Qe+mLVWc+7XR790JE8X99T6j+RNSDreFzpEhXmT1WawRenNc
	e2hrI20j+q+VF6/ju5YQwV9VKmoyCQS47eb2Kl6IHAgRe7BNaKlN2VkNRj+k6wrzrGrl70k6iFvYv
	tH5G4wgCSTIhJhyRvM70xrW9Yi49LdfaeDBlk3w1vUReCf50xzHrxL+U8jsHmfIMa6dPqWDkhAKEv
	Y07ADdOg1jRfwaSw107kPiPjJyTwx+bJy7rryRNMCIWAUJSgRzm0H6VdU4RmY2oEtR2MP45GoDW35
	VcpYctrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HGr-00000001ac1-3yyb;
	Mon, 14 Apr 2025 10:42:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gxb-00000001V2y-1aVT
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Apr 2025 10:22:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so19038765e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 14 Apr 2025 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744626157; x=1745230957; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ncb7iE4IeU3zq0y7h4GUyT6X0SHC2wVqTzFRUQ7FKXs=;
        b=EHFq8MfKglfhQ2pIJz8ia38m9slJphUkM3Bj3kduWlYW4FcvkTBOYXzQz+yP+SjcKp
         aNoBOubrbsDV2f4Xdme9v49PoIh8NGFFI782ERN9kGxp76muRTxbfmoIDOnhpeMzSsoE
         ULVKJgwZ+WzxeT/bXh+43f+Rdcj1cr24iOg4jhLDQDUuGgYtxGj5VyCC0CWXsgr4i2HA
         kGmAb6DFRo+OvvyiSIAcFkaEbVdgm1tKINNktJ4ltiNCno7saXnWAVVUcTCVAC4vItqy
         Ap/+fW3LgAT7VQgqhjIX2ytOWJweBDoqayfaljsZV9SMEoibvQjIbNdQAh7flTYUdlFn
         90jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626157; x=1745230957;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ncb7iE4IeU3zq0y7h4GUyT6X0SHC2wVqTzFRUQ7FKXs=;
        b=tqZ1+OT5cfxYgBLW5IlBRvbwn3ufKeGoPVKX2soj3WU3oNNgRi4TUmSjiv8kL+bgUg
         hmkn6yRy2BsHiccnb5khUMJoWFeWlgqH1QGGiWsf3ZNnDRLc16jFjFSOEqHVXtIIW/t0
         tsGgv8062A4YdaJDLwCv9kvaQV/vmI+gbDxgubdK7ZXTVh9wsuIOXJKbl5t6swG31QZm
         v88HI8l8z4M2XRp5HbnIupULMt+4fEZ2YSE1R26WdA0T//yrqpIkDeL1JVc43Bm9hqPG
         Rthf890YgAJc2P/JnwrQaD8D6sTTVphyzqJCrjr3Kn54J7kAfSe8zDTwbD8nEgRCDdGP
         yxHg==
X-Forwarded-Encrypted: i=1; AJvYcCVCtdL/ErI9JjTVzxwrpbVynGkjuOEvoLud5anAW+XhjP0/JOSKQzLKMuaeZxOq4q47OKaQJ2v1NJYYz4Bp@lists.infradead.org
X-Gm-Message-State: AOJu0YwsLJFbgUR781qeZm++rfcNfBdmw5Yci5sCg5CRxzYbV3Es2er+
	BIIGOhIZpMJYYuTGyOa23/1NuPXA4LLZ8dv7mguy5CdEFZCTKb1jVJesgK/onlc=
X-Gm-Gg: ASbGncsMUlw50722gEhXDHrB9pdszhdB8WM6/YdgX22p0qXW5LqPupCoTq5CTFHhgcQ
	h2ix23tBuRxomzjrmMBsn1aKqGwEt/4Asl36TxgVbgCVGmmUiA0Id3F5MEQy9er1s5TxvlHysjk
	75gyk6w081oVO/JR1d8f2jSUFen2EBt+UpwFXG9DerTiEsbgTzen8QpA/Xp5q/2LHMaGM/0GkqO
	89okln0qDyrbKY9TUg7at7kBz6nu2IKtL2NtmzlaZFFWI76eBUmmAZN+QHT52Kpu4L8XBt7ufaI
	r3MfSbAyqzxuMs+xBx/GZ45fJaepEBTRg2gLv+KQiCGlNCoMxc+Pg3S+GfgG1yeTYoqtQmBREYz
	+sCWpUCU0I2Xd/uIxIg==
X-Google-Smtp-Source: AGHT+IF0cQm7QJPDKLZYNfA24Nhm+uBnvLvXcohFpubR3I6TIYW257bhrujMNaGcKOrBacSwBaeyEQ==
X-Received: by 2002:a05:6000:1a8e:b0:39c:12ce:67e with SMTP id ffacd0b85a97d-39eaaebe9b2mr9002901f8f.41.1744626157591;
        Mon, 14 Apr 2025 03:22:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075a65dsm179752655e9.31.2025.04.14.03.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:22:37 -0700 (PDT)
Message-ID: <5f8b7452-86e2-4fe8-b5a1-068b72856739@linaro.org>
Date: Mon, 14 Apr 2025 12:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: amlogic: S4: Add clk-measure
 controller node
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-7-65077690053a@amlogic.com>
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
In-Reply-To: <20250414-clk-measure-v2-7-65077690053a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_032239_418636_F8E2BF6E 
X-CRM114-Status: GOOD (  10.79  )
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

On 14/04/2025 12:12, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Add the clk-measure controller node for S4 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 957577d986c0..9d99ed2994df 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -629,6 +629,11 @@ internal_ephy: ethernet-phy@8 {
>   				};
>   			};
>   
> +			clk_msr: clock-measure@48000 {
> +				compatible = "amlogic,s4-clk-measure";
> +				reg = <0x0 0x48000 0x0 0x1c>;
> +			};
> +
>   			spicc0: spi@50000 {
>   				compatible = "amlogic,meson-g12a-spicc";
>   				reg = <0x0 0x50000 0x0 0x44>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
