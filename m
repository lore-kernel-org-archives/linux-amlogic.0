Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78462606A31A
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2026 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g77oD0bn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IK5Q+ySv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Ii3VEoDcxkvl938VoYI8WKV+y9UdNHS7QCmIm4Hv/0=; b=g77oD0bngVMpv2fv5S60L1YQm2
	e1+gGwE2pAaZp07XUXpmhTiKjP9i2a6iVcYDHdfhZvtenYsTWgcWPJLnmNGT1wat1a1r3A9E8lGu9
	7aCQ/cJWEFiSAILzw6Ti99ORXj40xeL7czuhpAhEirfoFxdkJiR/ZWV4DfndReT6GrtA1hU0COwkG
	+SnpEheqlHrArMXCnNDlfVOl/XWmICRSZI3vUQ+UCLiXVQkOQAtE3jm8RQ92dd7i8TvCFCLIOWB1J
	D9QT/t5YCik3E/vh+5V8Ls4+m6dX2ftp/7F1ZMUFpWVybhP+GOyjXcbfu/IpJvaLmnMrssmE53MMF
	f8+X1lsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRHS-00000002wmH-1K87;
	Mon, 23 Nov 2026 10:28:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRHN-00000002wko-0r0V
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Nov 2026 10:28:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1899353f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2026 02:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795429687; x=1796034487; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSV9ZwQQbuEr7tABo+53Rdjj4FxBuFl09OY95TNBjKs=;
        b=IK5Q+ySvvdq9Fd56tyhug1NVOnrnlmLFe4r5b7OUdG00tZcxU1ueVEW0T5NbaRd6QC
         rE9HbE+JtR6e5S+yRUzbXeAoM/RJ7L4/zQNv9aIS6W9RwGFHIuWKcsEYMmdToD7RY3EZ
         a/P+6IO3SevCsRZjreR6LNqDL6o8umuSVIzkKvTG9URGvdMbKY/1syaczoDICTNKk/33
         ooRJN5J9E8p+/7zjxLS2UNgnpRf4TWfHddrIuNQ8/XzIrvuiKMCtWRCfutGuOe7kOMZq
         PFXWaXUBbjxgB2cgJWkFkaZ+Vgnfy/3O8+R+Bzm1Ogd6soj8jgpH0JXsSiSwe4a67t0N
         HI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429687; x=1796034487;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSV9ZwQQbuEr7tABo+53Rdjj4FxBuFl09OY95TNBjKs=;
        b=an2/JyEin0kTRR7v6Y5CxNRRBc1dztfONIZzlI8oSWXcsBVQVbjh5qvQ+edjAscjdu
         BvzrR5BMlDSNIX+kA22WskMY1H//pp3p5wif2BkB2PcdqhnvZJhcbpGaIGAOWTF6ULuV
         9HSxEDnXcE/AKlrZ6xfmTRLCnc6jMauoDsJ9MDcIDFwV2ddCYbFDoSePOnlvx3Ex8fUq
         cHH5bWzb9sQ+dOjxE6uZJH0G+OxDsc7pdlHiD5Xg+okSAQb4dQEWVHQ9JWKl6WUG9LdM
         hcKKAzKIDYv/QNFFSZaHhfUv1+BaZwE+KGNUSA0nK7CDi2thXWJX15T35Ajl2GRoei2j
         qFbQ==
X-Forwarded-Encrypted: i=1; AL+hErF1NE2EkdoKiASGDWa1M37CYHUHMKm5MlaVILDKkw/+1W8ZBgcg1N9TdCpL6NvhMXIgU3wSGsZ6jp8aW1pH@lists.infradead.org
X-Gm-Message-State: APuU4Z9BJJCxb1OPBRDYjkeOOzUbAvXuKVoKFNtry3PQMRTJXB6mFy6G
	6X9IIIzC0zPwn8mR0KOaGFsfjWBN5WRTCjulk3IqSz5VeVEtUHa7FvicMbeB4vEfses=
X-Gm-Gg: AZFdTZfPp0+ZzehRom1k70C78ipDMXnDl313uyOWjgLVbEUQEd9FhY7TfscNFXOciQK
	iT5Eav85bKotyuyxRUXbh24fEjX06c6ADZ/VRyLv8aY5oe10SzQL45Hksc+gCOAtJZOqlalq3VO
	aE8dVSYkUHmDsKwBsc2Q/XNXBKTth5ftDtq4C3zFT1Jbrn+Gcq6oEM5Ff/PRxyR18QcvqhlGkt2
	JBPT2M3jvFSqxs4KpShbtuoOY2zV1IjJDDGTffcjYZCA31dZhZUHPBFpw+qECkBd2rrncArxdIh
	YHN3QrjVqaUz3gtGQdS47U/kLRGlV/YvONEaJZOzqvU4yLBuUrHb/FLqf/tCdurFbEUteXJjAQ5
	UHYQ3y5BETlUNMvl1VSyBpty7aiG7UY9MNfpTC62YBSsDBLneYNJP//aiIQ/Kg6gZPMLHOinH00
	sI+4/VmU61F/r4KIKmF7X2L+efjJ0ULueZqgK9T4lwSg+LFhyjOsXMsvlQ8+1asN0PZ3bj8OcYK
	IPMbJQD2nemy/S/EF28xTHDUrNLK1FTzB+GRmznfdzM3if+ks9XNwryo3S3pS8HDZdnlo483Px1
	xfqPRY5EEI7Nw0+KpLntAeSXsW1tv64uexbhVGt+IYPyle9tLENLdkMOs1djZAXNR+5vKx77mWo
	vR3gryF/f
X-Received: by 2002:a05:6000:29ce:b0:4aa:6e52:23a9 with SMTP id ffacd0b85a97d-4abb0e46a60mr14731002f8f.15.1795429687181;
        Mon, 23 Nov 2026 02:28:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:121b:474b:8d1f:a239? ([2a01:e0a:106d:1080:121b:474b:8d1f:a239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm21617870f8f.44.2026.11.23.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:28:06 -0800 (PST)
Message-ID: <5f61fd6f-309f-4e8c-9df1-3c532a79cd4c@linaro.org>
Date: Mon, 23 Nov 2026 11:28:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND] arm64: dts: amlogic: a4: fix pinctrl node
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-fix-a4-pinctl-node-v1-1-c92b931a1766@amlogic.com>
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
In-Reply-To: <20261123-fix-a4-pinctl-node-v1-1-c92b931a1766@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_022809_281654_E2F4290D 
X-CRM114-Status: GOOD (  11.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/23/26 09:24, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Fix incorrect pinctrl device reference when adding GPIO to pinctrl device.
> 
> Fixes: e9bb91734871 ("arm64: dts: amlogic: a4: add pinctrl node")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Fix A4 pinctrl node.
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index fce45933fa28..6587e3578f8d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -218,7 +218,7 @@ gpioao: gpio@4 {
>   			reg-names = "gpio", "mux";
>   			gpio-controller;
>   			#gpio-cells = <2>;
> -			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
> +			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
>   		};
>   
>   		test_n: gpio@44 {
> @@ -226,7 +226,7 @@ test_n: gpio@44 {
>   			reg-names = "gpio";
>   			gpio-controller;
>   			#gpio-cells = <2>;
> -			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
> +			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
>   		};
>   	};
>   
> 
> ---
> base-commit: e3194dfb772304a1b7ca3bcfccacefec3468b7bf
> change-id: 20260128-fix-a4-pinctl-node-6d7f9c29b32a
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
