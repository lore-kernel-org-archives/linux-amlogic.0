Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E299DC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Nov 2023 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYAPDrnsmnfnoT/hIM2bSshcutuPc8OPi4fnmKw0PVM=; b=d3jyZybtlUoScQoFzFocPAlZUz
	kL9WlG3HsR3dd1fHw39Z4L/ZqT0slcBJYH9QM9S4PHuyisfPJ6eFFm8FrMgRL1hXLINMefl31V3zL
	Y6FQvOZqLDYIP5KcVu8ro1J4R29EdixA3Sof1SfIQ5umWtiQoqY4kDP295ul5j8f0vKmTAvVwij+7
	e+bObw/ls0yl7M3lAGYEWwl0r4QbHd4XSSiTwNwwTyefsAIWrzDr4ZfUpZKAcYHNMUIpi9JTTSM2e
	Uf2lrLWmKtVWnyLBEuF9nTHETgohyKBPAiBy109JDVi9m35XvbBhI0n0U6+xLhlJpjKzxjxfhrO3l
	VbCUOHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvsk-00G9ez-2t;
	Mon, 06 Nov 2023 09:26:54 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvsh-00G9dc-1W
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Nov 2023 09:26:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40850b244beso32770835e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Nov 2023 01:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699262808; x=1699867608; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNMrL//ufF3IVIJkNoygI3qKns7bPW7N2J4mliKhUow=;
        b=HEKWICZ/swN1gqaqQVtoko+kXm/kQ3ZPMtpVk1VU6ywEJ7hv7+uPZ7yrYBUAlxy7UM
         /9Hr7XXATP1qdPVAip0AshQo1VNIXnRZ+HWcdm/Iaz66HFfz42EwaSnDNPxtdF4kLqWW
         ustLwEBlKtJCeK90ZtCnhipBYUgePKC0lQzaAc1mapzE2O4zCBbstAGTTldFiB8rQq1J
         C2zpStjyYAoOaxAxYx58qM1aFDPuY9GgtQH4/g3PMQdkfm+ea4EcjYW9ejQR3YSTv/9G
         TNndlcDAVuLmBLc93e5twnWOCZAxBW9w9BW5l1kEj/VE5ElDe1JyG8jTjjEodY7H6Bxf
         y8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699262808; x=1699867608;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NNMrL//ufF3IVIJkNoygI3qKns7bPW7N2J4mliKhUow=;
        b=lop1Fq5fjXjFjlUIaDQqDulUa+Lwo/geZbWO48bdR0QVyB2bueViCuX3xgmmCBc8O8
         BkkzpPWYzogBY4SH5iRLWtd08CYx+pWgCZFiJ8yR1XTqEpchvNlzKZAjy6kFc6XNDCss
         Az/oNR/e9H6hEYwEnHbkRpMwDIt/sQINXRm0AKoh/Tysmrsg1rHnphL6VyOmHSulOl9Z
         1C2svVt8YcPJ6cFHTKoxHU+Iu9ktNsyM01U0U5a9QgAmpCF9UmYK6jdcsIJ3a3fp7SEz
         0fXkGtdfdHMXns8TO8o0QEStTs9S8YsmvcnJS1Vg2m4Q1eQmWMYG83+PWeUWQxtYqSf2
         qtTw==
X-Gm-Message-State: AOJu0Yzm6w+RxwUYGkdwAZgmyy+xHncmHwU1uJDBLt6LRWZDY5BuEDCO
	pWENytwxtNaq4KE9tl9RY6xMWw==
X-Google-Smtp-Source: AGHT+IFB5D/MB+A9Df6YvuC5v141ODVPI7Hcwf+eULv+lIgNOuMUDA4MMWb9MgKsjXqWN4qL8ChVgw==
X-Received: by 2002:a05:600c:46d1:b0:405:3a3d:6f53 with SMTP id q17-20020a05600c46d100b004053a3d6f53mr23317637wmo.3.1699262807625;
        Mon, 06 Nov 2023 01:26:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7a54:34e:8001:fb7d? ([2a01:e0a:982:cbb0:7a54:34e:8001:fb7d])
        by smtp.gmail.com with ESMTPSA id je3-20020a05600c1f8300b004083bc9ac90sm11609349wmb.24.2023.11.06.01.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 01:26:47 -0800 (PST)
Message-ID: <569e39a0-b91c-46f1-b55d-c9324d66339b@linaro.org>
Date: Mon, 6 Nov 2023 10:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND] arm64: dts: VIM3: Set the rates of the clocks for
 the NPU
Content-Language: en-US, fr
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org
Cc: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>
References: <20231106092202.11127-1-tomeu@tomeuvizoso.net>
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
In-Reply-To: <20231106092202.11127-1-tomeu@tomeuvizoso.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_012651_510756_B5A18966 
X-CRM114-Status: GOOD (  10.66  )
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

On 06/11/2023 10:22, Tomeu Vizoso wrote:
> Otherwise they are left at 24MHz and the NPU runs very slowly.
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index ff68b911b729..9d5eab6595d0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -2502,6 +2502,9 @@ npu: npu@ff100000 {
>   		clocks = <&clkc CLKID_NNA_CORE_CLK>,
>   			 <&clkc CLKID_NNA_AXI_CLK>;
>   		clock-names = "core", "bus";
> +		assigned-clocks = <&clkc CLKID_NNA_CORE_CLK>,
> +				  <&clkc CLKID_NNA_AXI_CLK>;
> +		assigned-clock-rates = <800000000>, <800000000>;
>   		resets = <&reset RESET_NNA>;
>   		status = "disabled";
>   	};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
