Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FA56072689
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 15:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JbzuBuGm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=f8l/ygNJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G0lT//vV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=50cQ0adyU+S3q2XwctCe5/wiyurvh3d18dl/GO7ChOs=; b=JbzuBuGmyB60xWIxS5rt2T41LV
	ltlHhCmhfe3n3MT06n60duLvP3ZpDCK08qfudlSeJOAE/vp0b70+yqkhnYRpiGRI1kWo7TxvBERO5
	SG3LeLN+iQi0xicsglF4nT0RYkfmx3Oh363abg9MUSgFRzkTYvnYo8czQ3gKRq8KGWcjU+y9keCR8
	XMiT7Wom5XLkShJffPAJnyDUoBKNq6350BVRDSFtrtZAKp06kEi+tJ2PKiMkwyGzTS2PeyQyvPFgZ
	VD769PCcTk3EpyOOoavjEufa1zmCJI5hEKMpYoKQcoIRnV1TMjUqV4BooAG0PZdrbLZomnSsAqa4X
	MPPmgi2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzpO-00000009UcN-1wdW;
	Thu, 05 Nov 2026 15:56:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzny-00000009Tiy-2bDg
	for linux-amlogic@bombadil.infradead.org;
	Thu, 05 Nov 2026 15:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=4gd5YBbTx7pIL/t9UDrPjuhr3sbKtTJ/cLT8Cj4GQTI=; b=f8l/ygNJR7K3fiZYWkRkZXshzw
	+fyEx6k3KdHAP3iOdek2EzXxIDCmXWnKDKOvWRWnwRTfi4rRB1EFSSyyz38+X1CfkL4PQoPlvqCsj
	zUYpxQlo11gl38QsE6QnWth5dtWuR2+RmI1DLYFMkfamo3g2gbqmA2vitVmB2CG/taeHbG1BmgD3w
	NHesuirIPulqld6KuB9SCqaMDnYESsIdy3ulmHX1cSBlnwgfC2nr8KJDj+cgM/00O48CzcalFEaaU
	i/ZqyRlHWW2p2v+rg6U3Qj3gR1pLIeT3t63ktikK4daaE2OyqGeSHSF9URNGytFjq952eZssMN1AX
	31yW3ypg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOznv-00000003Cbz-0ymF
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 15:55:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso18591195e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793894101; x=1794498901; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gd5YBbTx7pIL/t9UDrPjuhr3sbKtTJ/cLT8Cj4GQTI=;
        b=G0lT//vVwkCVbRvXNuPhNzKd0oF4RWyuZeDd/v2L7C57hKUSp89gLxqyzkEktAGrNb
         n9BpErs256uC4iTvNGXxJAcKxoWQ+76+3ywH6l7qUyoJqQqitDuQd9Wfg/hRHjpYYQK1
         +YQ3NsjnhBV1tfoJJ9SIUZlzKGWlVquCQylXwCbKRjSQVIoXi5ooEzG2IeibFQ2rt5kl
         Ng93F2aeJx44DqR8eiSpPhcAkGI7q31HeieWGc4q6ncqsS2e1En6PZbSwd3BnuClc/3s
         gMZ/Nu0mz5oVNDOHpIH9K5p2/BVnrlFIqIBxb17rl7+oMLkXPn0s2ySBqoHSrE7GsIoi
         BDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894101; x=1794498901;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4gd5YBbTx7pIL/t9UDrPjuhr3sbKtTJ/cLT8Cj4GQTI=;
        b=hFUIzw7sTmLIOZTVNxLJ/QeIsmFDsAFf7Z4II9L0CIzHJt0FChq+/VISoPakbWxMHe
         X+pGUGI0I50vsovUvLwifpTB+QEnq9p2NT4Vo7QHUv4Z7TLZSxmPzIE7vzmQvPBoug0N
         uIZ1lDHIgYvodbCZklGp2wS+j1Vfg7UHfkFGYwOTGpFVWiTi8a/3h+hqBVFVDOTJj/c/
         WnmK+gdw5rnOxF16ubcSK/BQbwSTUvcfgEA+9O5KimxH0vVSCPLXG64nl5jbcHldRrRs
         L+FAdMEGqIh6+p3ze5Thvi2X4O6X9ap1U3TKtilxdGcyqz51pAjND64c0QmCDU8qqYCs
         i0dg==
X-Forwarded-Encrypted: i=1; AKwUvBzO1ghWaiL3w3TBS9oHAGTcKkYgHHyQANXuacWJWIgbzCmrBNEVDzKFNbly0E5mJyPqV0pKAuLejlgtw9Em@lists.infradead.org
X-Gm-Message-State: APuU4Z/3cIRA7g8fbAxOyJzwowJsHPVbRgPuXc+R1iwxLgIZBpDGOz0n
	39G5H42bAb4KU/rV0xQ9fFvJRsvg3v+50EeuTdDo1sET52EdNYNn1j92jPdSQyL/pv4=
X-Gm-Gg: AYBFou3/+Mt0gPdrOUM9v/35feUSvSmrjXol3V3+oOn0VYYUVbFABOxCtuanPZ8w09o
	z/LA0swPGhHT2wmK7mxPPVFfd840KAhFLrcslEKiCNQW7g0oXbJR9Rd+DCl/uJ81yzl+iCZeOmS
	JhsDyqrugHKubU2FStyXGmpjBf4LbvcQC7+QUqWGiAdwVVKzqFWbwpYtjSeiLWb5RbKKB/eXoH7
	PVPTahouD15ix3GKzBYOELSRWng7NMfNFCi2VXpv7ye/Y2zWN+3jA4KaKb40k6xsM8Lu8ZOTyEq
	k9ex26/Adruit802CGfRbw8kI6sbfZ9jYZB0CMskPYQVDYcqdW85CbT5nDyZYs2bDirhJlPHkom
	s+hqTIx9v0kSvvAME9pe9QRS17iagvMcyfGVpWwgKUOJAfdfOY7YoZdh4HyTVHM4vIAz20L80n1
	NYGP+ACNT7ZXa5y7jZr5MbowS/gkKqG8OdHRKPh4z4W2/XYsRgC0JWViogMZoFNtKgfWesjN173
	eC0r/KytZeEMIVmL4GV+PWvXP1UeFSff89bvH4IR6shEBp7Hh6BtCIhztEbnpIMY/FNIVnv825c
	fJyrCj00SAWg2vu77KsnwVzz39gK8PamBZ/JWGogVFhJsmN7On1JPqs7BwQKL2dT9cuL3f7dtGs
	P1dwRSOk=
X-Received: by 2002:a05:600c:6216:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4ac1737c533mr425955665e9.9.1793894101341;
        Thu, 05 Nov 2026 07:55:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9899:e54b:a2f2:3695? ([2a01:e0a:106d:1080:9899:e54b:a2f2:3695])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11994525f8f.45.2026.11.05.07.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:55:01 -0800 (PST)
Message-ID: <1463c55e-3bcc-4a30-89db-def43c05fe44@linaro.org>
Date: Thu, 5 Nov 2026 16:55:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash
 overlay
To: Jose Nieto <jnieto.alaber@gmail.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261103164730.160593-1-jnieto.alaber@gmail.com>
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
In-Reply-To: <20261103164730.160593-1-jnieto.alaber@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_155507_181789_B9C73B9A 
X-CRM114-Status: GOOD (  18.40  )
X-Spam-Score: -0.2 (/)
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

On 11/3/26 17:47, Jose Nieto wrote:
> The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
> shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
> 4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
> device.
> 
> The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
> nor_hold_wp_pins pinctrl group is intentionally not used.
> 
> Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
>   .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 24 +++++++++++++++++++
>   2 files changed, 26 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa55c..3714cbaaa03e 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
> @@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
>   # Overlays
>   meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
>   meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
> +meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
>   meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
>   meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> new file mode 100644
> index 000000000000..c70780b11b9b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>

This change comes directly from the U-Boot file arch/arm/dts/meson-khadas-vim3-u-boot.dtsi
so at least keep the Copyright and where the changes comes from.

Neil

> + *
> + * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
> + * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
> + * enable the SPI NOR controller, exposing the flash as an MTD device.
> + *
> + * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
> + * nor_hold_wp_pins pinctrl group is intentionally not used.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&sd_emmc_c {
> +	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
> +	bus-width = <4>;
> +};
> +
> +&spifc {
> +	status = "okay";
> +};
> +


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
