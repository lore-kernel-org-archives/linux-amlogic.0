Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D96BCD37B6
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZaFPoJpyMFXEYOvevnBosXH6x2fOC2IxDUk1uih3to=; b=oVWyljmml1n1LTF+BZWExm2dzn
	lyB8VDgXZEvfS0L4x/szSimN/fdSKy+MFJ2Qexb/AcKtdt7YqSsUN+I4+fFxcCgSAv9ruJr0aLZHd
	6KpiIC9tVdP3IHXvganyoTvTOSDU/Kt5GBTtvd0P2zHsRGxagjCXcDTE+D35P4CLodby/1Cb5r3hg
	BmBcTc/aU7rR1vYlL8vGnna+Jc/h7UsoKr+jHKdkDzMa4h/9hdDUOMWgooGNcpRAVMEnn0MxCWVpe
	TThOTwl4MkHMgMQVsNKS8b24EucP66PQ0S/0p3zNHnQVXK15SeWq11+vVM65o7wOH7+SwJA9BKkLp
	6ngVSfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4yc-00000001k3P-1iEg;
	Wed, 13 May 2026 08:29:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4yX-00000001k1q-333R
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 08:29:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43d75312379so4881127f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 01:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778660992; x=1779265792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7BvI9blkmbUziA0Ny+qCXTqAehIoVPCQb4tVX7iVuo=;
        b=rCoJw2d5H5v0+i6uMtZkYw0T+AYX7c95CuywTtSQR6LOol9qc+q3rJe4j0RHoQDv7S
         xSoNLbblVJr0eepAvyi/DFLcokQOq1scL77Rtb7T4zdZkYpc5mapMRP7HAp4KtxQG6nq
         2ImMzXaEIWaHEH6wrPe5qTrZbu00VmGAO1aRkSN1rBJdRpi0y5fbxVzg3f/wFJbY9T/N
         zHiQhsXtTTdi+zJk990vKUyMSTZ0YGUwc2uTvGKuh1t0x1q6MVxEBdSXsa/xwOJ/+MQV
         bWesnIHKzpxGBJKPz84dEF5iiN8L2QI0UHRk54PNEJ+VpCPL95gRnCQFyooSRSpKxxb/
         U2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778660992; x=1779265792;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7BvI9blkmbUziA0Ny+qCXTqAehIoVPCQb4tVX7iVuo=;
        b=puaTXp6Yjmtq3aN24Bv5gns7CvRq692al2w1M66qDpNfXIhZEhjIlXVOCxmuIXrG3P
         8lHgI3SfOKmIUCVBFLMKOLtaikHNBOgLWkQ8YrAOiDVkzSl40yj9lBJytKANIon9vmNF
         fgFjV2KCyOo4fyrU6Yd/sH4bXo2p5neT4Z0AlK2tIdA+IJ5rBAH9Rf6CR87ljxIPQWWV
         cc0z+Zla1QbTtPIDLyYz3ptVbwd7ucXzkPP60ppEUkeX66v3rFJVSMbLhxZwN7FPEg+0
         +z10pV/m7wL/uj6mE7C2dyUqFwuevPJAM3DrqYETj9PW8uLBdFmebqBBx6qQHBkzx6w8
         SfLw==
X-Forwarded-Encrypted: i=1; AFNElJ8A+2OeHKzLGLlVZl4nLWybAwSxvrdh9kemPHz9REwXj5Nb5PaGeLHYtHtHBCvKSrGguGxlnzKR27xk7TP1@lists.infradead.org
X-Gm-Message-State: AOJu0YxauDu8YuQNYZwePSNMDceE2YV+I7+ksbykOS26u3iZKv7nt15/
	1tp94cVBL1zAyHaWw2ZbYigQOO7Dk8xCjImnaq83bUbn+jSQ1ZPO4R+p8cPKKZ6cAaQ=
X-Gm-Gg: Acq92OEr4EXAjhVira9tPBBsTLDkAOAL2S4c5VjI+sbKaaoPuBqwR4gDuPsNOkQthja
	qAfaU3wVkcgx97P4CaOfax8KEuCkuB4w8vyxI0+N5xa11Z/LkUhl6D/Vm31mjPWpk4+oEhQZCk+
	27sghH5OP5vvBef1A1QoGtVraZxZx66t6wUnktwBPaasUO3aRNyIASP7jSvE8ndCl/gZNo1p38i
	nDzC0/Bt0gIsr3pkdNpOBwZt6q/PqSEk67kJgIm5ju/nlAJsDS56nesyce8cgOneJuNNLnQy1X/
	xdFn5m8GMeseumHOBi90Z5rxBfJv0eGXqu7geulW9DF/3SjtZw7ePGtjChXsXocs+pQFXi3i9D6
	nMdJNhd8xBFH6mqgg63fVJor6PVLCoPUiw2zS5Tp2oki9PX3y/qTzRNAy6NxEk7dnCV2WZCfc4b
	81QbDz07JO/GeWDNI2iN+qFxtafdXhA4K7xYd2cyj6oOG5o/Ye/thEI25DmDCgVWvMEkm8Takjk
	h0D
X-Received: by 2002:a05:6000:2b0b:b0:43f:e571:184d with SMTP id ffacd0b85a97d-45ac3c6071amr7111931f8f.28.1778660991662;
        Wed, 13 May 2026 01:29:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45c7f27762csm3558455f8f.31.2026.05.13.01.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 01:29:51 -0700 (PDT)
Message-ID: <890de4b9-5481-44ab-adfd-0c58d9ae8239@linaro.org>
Date: Wed, 13 May 2026 10:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] Khadas VIM4 PWM status LED support
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
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
In-Reply-To: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_012953_800820_CC04EC31 
X-CRM114-Status: GOOD (  13.87  )
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

On 5/12/26 19:47, Ronald Claveau via B4 Relay wrote:
> This series adds support for the PWM-driven status LED on the Khadas
> VIM4 board (Amlogic T7).
> 
> The VIM4 exposes a heartbeat LED wired to the PWM_AO_C output, routed
> through pin group pwm_ao_c_d. Before wiring it up in the board DTS,
> the SoC pinmux definitions had to be corrected: the original
> pwm_ao_c node was conflating two distinct pin groups (pwm_ao_c_d and
> pwm_ao_c_e) into a single ambiguous entry.
> 
> Patch 1 fixes the pwm_ao_c pinmux entries in the T7 DTSI by splitting
> them into two properly named nodes. Neither alternate is in use yet,
> so there is no functional impact on existing boards.
> 
> Patch 2 enables the pwm_ao_cd controller on the VIM4 and adds a
> pwm-leds node with a heartbeat trigger. The xtal-clk node is also
> moved to restore alphabetical ordering among root node children.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Ronald Claveau (2):
>        arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux definitions
>        arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED
> 
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 30 +++++++++++++++++-----
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 12 +++++++--
>   2 files changed, 33 insertions(+), 9 deletions(-)
> ---
> base-commit: 31f32e8cdf59291e467250dfc57d1a8c718f63d2
> change-id: 20260512-add-kvim4-sysled-8cc159524561
> 
> Best regards,

Squashed patch 1 on ee6e05a49b93 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
