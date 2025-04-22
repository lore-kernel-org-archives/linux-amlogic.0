Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD20CC369D7
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Apr 2025 15:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsS4A5XbF2vfel/5QDJpjIhpf9fPOzYhK9A0YsVAdQ8=; b=Y9QRW1Kts4+MYujXtpl++ME+FZ
	I/jcyensgX9/+oae5aH+24P6ZL8lcl59hN3e5wPGWBuFqracxTAtNTUvvTmGp6ebAdd7UhY75cwYo
	xmGcxRhLYlmmOIKnhhHiUzdwzvNLc+v/WQV8IBVSbgVamMGkEb8USOZILP9nU7CxZZ/08qb5Xf03K
	cYr0qofDxBiXRjaltDQUT4PnYcT2TiqnSEYXrF0N+k9tCZGSqkX0X0WWZVi8rueP7v9FsAeokG5+M
	xD9l8ErkuigyHmvQokUgF/yNgnrquqUGgTTJzHrArrBWcxQkXGAyhHV3YDkVXp2T4CdNQDZgq3bEs
	TKe5OwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fnn-00000007mBH-0hPn;
	Tue, 22 Apr 2025 15:44:51 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EYT-00000007Tq0-2adx
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Apr 2025 14:24:58 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3576062f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Apr 2025 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745331896; x=1745936696; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Jdsjo/xqjalOgmmmiDVixlLCvZSDipVTEuGlq4N+fo=;
        b=YaYTsCrVFuyckhf3PRZP6prgbVma/QHVK6SZ/EcyXsDisKvSUiIHS2QK30tfJOr+U+
         DtSsWKxLhPs3waWfaQ1Pn7LLikYDBDLPzYcEsqspqSL4os0H7KVrXHXxVeaJDf/kjOA0
         GJ86XJpkVg000vqkiN2RWyCdFwvOQ+p5heAGhtQa1UqFhVrTcjkUk4IX+v5Pa/oDBiHV
         8MbJZOYiHjyzt6awjZRLCrzGi8tnJgQdUrjCJV1kPzduDMrQ6Y63YjyNldFjrpWHuB2k
         kbJA8JbME9pa5/JZtzNIXbRdNGoZvjoqPZ4XW2oRgQhdBE3Nf3+Vbr24sf2J4Q2gNCFX
         3iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331896; x=1745936696;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Jdsjo/xqjalOgmmmiDVixlLCvZSDipVTEuGlq4N+fo=;
        b=IqG/AJRoiGFfaNCqRgoULBF4bB9O0KH9oqtgswbwlH3Du63Kt3wvh5tYZQW+vHgVX4
         FFvcdNMhM76LuLuibKV0py1vlf4yZCyVIpG+hDO0T9fzp+YNAcWshxLXz9uBY+XuJ1MV
         4EIIUCDXwI+3XJwdS9tvnsU88Vrd6lOgyDmWBlcCEbZ7DRn6RvFIHctyJhhtQg7GrYPN
         3JUNxe1ZqN1y9h6AArczS1fFyHI8oD+TJbzIbcDMygXaKIiyruJWcPt5Z/ir4UjIQKOU
         +uAqg7VPyc887NJOu+kmi2M/6gNlLtGQ7doWbnLcoXdwIhGk9d/LAP1DRhhXEKvs6GQ0
         g87A==
X-Forwarded-Encrypted: i=1; AJvYcCW3uZSssXizHgHwTK7JlvJwr8WWs88ePk8B6u91W9YsMkITMaKeuZm/T2ANw4CIFTwZa4WMZNSbUW9k++G5@lists.infradead.org
X-Gm-Message-State: AOJu0YwiTTV8s0NxNEqJaCU0WPcA0BXgG6KCruRJRrotUG4sVJHi6RE9
	zHY77OsZTc9U/hiRoaGiiXqTyIV9xIWHLboKr3dr62OmNL9RXHHzhpjSG/wJpFQ=
X-Gm-Gg: ASbGncvEFfK94QHVsViZkib22Bzp7iQi5tU/81Ww4aIUs17zCUJVm2nf8lz4og5H63e
	qJIDU1XRosNK+5VXBQ0hnrGNNLghwSpPtALSB1BhwblwXv9M8p4j98yG0MJ7MIsLRJqOCWOai6l
	KrnMVZG/crhd3ugwmNOTcX7LminBO2jhfESyCbivyrnq8PlKzZOR6aZSlqW+7z6LgjVQ3DcghJw
	s6lQppmkQDc/+K8gc98ouCSWIMTD26M6Te2G9DqwMxUIYjvY/qpTpIWZ6tohIFqGVHIxDgeMnOW
	Yg+FAPrPd89k2BaC5XrYszHGc954nBgs/hMRXwWLy8dWi3rhRW2ZX7Hu8/5bYwmu7k63rkfKc0a
	opcQdn94sFVUdXiM08A==
X-Google-Smtp-Source: AGHT+IEMq6D90tumtgiQfuL2iL5ojy1eqb4ZpCOQZ/eL/OvCUSv21+5Nv4KHfhG+kRfhKAADVI9aCQ==
X-Received: by 2002:a05:6000:4201:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39efba5f80amr12032095f8f.28.1745331895992;
        Tue, 22 Apr 2025 07:24:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6e05d6sm181482765e9.40.2025.04.22.07.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 07:24:55 -0700 (PDT)
Message-ID: <71a6cd6a-cb2b-4628-b558-01c2172a94f9@linaro.org>
Date: Tue, 22 Apr 2025 16:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/7] Baisc devicetree support for Amlogic S6 S7 and S7D
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
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
In-Reply-To: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_072457_650346_A6AA06CC 
X-CRM114-Status: GOOD (  11.25  )
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

On 17/03/2025 08:16, Xianwei Zhao via B4 Relay wrote:
> Amlogic S6 S7 and S7D are application processors designed for
> hybrid OTT/IP Set Top Box and high-end media box applications.
> 
> Add the new S6 SoC/board device tree bindings.
> Add the new S7 SoC/board device tree bindings.
> Add the new S7D SoC/board device tree bindings.
> 
> Add basic support for the S6 based Amlogic BL209 board, which describes
> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
> booting up into the serial console.
> 
> Add basic support for the S7 based Amlogic BP201 board, which describes
> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
> booting up into the serial console.
> 
> Add basic support for the S7D based Amlogic BM202 board, which describes
> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
> booting up into the serial console.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Xianwei Zhao (7):
>        dt-bindings: arm: amlogic: add S6 support
>        dt-bindings: arm: amlogic: add S7 support
>        dt-bindings: arm: amlogic: add S7D support
>        dt-bindings: serial: amlogic,meson-uart: Add compatible string for S6/S7/S7D
>        arm64: dts: add support for S6 based Amlogic BL209
>        arm64: dts: add support for S7 based Amlogic BP201
>        arm64: dts: add support for S7D based Amlogic BM202
> 
>   Documentation/devicetree/bindings/arm/amlogic.yaml | 18 ++++
>   .../bindings/serial/amlogic,meson-uart.yaml        |  3 +
>   arch/arm64/boot/dts/amlogic/Makefile               |  3 +
>   .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   | 42 +++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 97 +++++++++++++++++++++
>   .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   | 41 +++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 99 ++++++++++++++++++++++
>   .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts | 41 +++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 99 ++++++++++++++++++++++
>   9 files changed, 443 insertions(+)
> ---
> base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
> change-id: 20250221-s6-s7-basic-f300c30877e6
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
