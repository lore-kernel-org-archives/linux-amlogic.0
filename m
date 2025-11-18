Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC71CCED247
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Nov 2025 07:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9QZI7WaQZ8XbslhWF0SS2OSpQoWCUNtKp4pkHWrBtA=; b=eLuPjllpVf6HtBcnIs4LC8Q80/
	j0uCOaZ1JubIgZ0zAzbKGoaQNVtrlCwBytDJkcQFHvPDWCxooAPfd2RaCpHQUkpiCIIzEMjrsvy4D
	CWnYl6zJEKJuhBqNPN0HVPk9s/wMHleVb00cIr0BTbSREr+gCtVGVYkTtl9TqrOqP6UFGFzKrSITu
	RvN63S4wkFmOt/U5kxa1PUufDhJQmhtStlHMY0Gi3vYaowXtBLHpgB7nx+G94l9AEQxqu9Tk+DR6H
	nFrS3OSskxSpatdIafP0d8xasBjAjc8m04kmNE+SGVOETQl4N5C1F5iGpyYrcB3YarUbgLfGvGzdJ
	MKA0ny1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGc3-000000000pz-3G3t;
	Tue, 18 Nov 2025 07:58:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGbx-000000000la-25UJ
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Nov 2025 07:58:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47118259fd8so38168365e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Nov 2025 23:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763452728; x=1764057528; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9ObVqClbbnCEqz8bXzqabp6JeM6PWWAaw5dtxMVdvI=;
        b=P3DJgR2wY2KjqVQp2NQlZsk03kkDcQQzUZ50tM6GXwGC6X1uAAWiUJRB//ywroEqgq
         IIKnkslNP2UD0o782JhOQoaVOv505ut1Gg2PiKhceGiX82cSe3pJ2wN6MaYv13wUMlPv
         XOZLVEj3AUZv2jbrVc9Z4yYVQGX7FkXSeWdH5RZID+BMHYZ+xgyNnbSk5bhpNbBzUARx
         ty21tXtSONHw6Tpn93CtxQWabpqQrR9ZjD4WFbUbItR4zBgdNGmllHoQTY13jF9zDlOT
         jchuM3EucKgjAxhTH2GtNriKXcfp6+dKQ0rfRNmdcElGl5GwBRliUFVRlSyDVkLG/h2U
         +FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452728; x=1764057528;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9ObVqClbbnCEqz8bXzqabp6JeM6PWWAaw5dtxMVdvI=;
        b=iN6epZhr/4WiTLHCpjh6EOh3rE2ib5cUOf+xhmf6o5dJwiQL9VPgqd2+3CyjG7UuSR
         RMzXWOcIK0TOoMULPQ7WHTx3fpuRVZe+1GZY8+y/sNbpLuMnMdSSFxfiObu9TXePlAd2
         hhWdkEFpvA6uReSd9RjQwuMVkw61TZphcoCcYCV5NPITLAmIL4Uc3vRIzPGGWEX+vfIz
         lvPvzfYM7teQ/OFmTzY3tDGY/NnzD6sMPhR+zlH/iTYZrj3GjSq9Iqz+iU0gRxv+3k9n
         EgOPl/qxaQbRHBrUNM6GoiEu1B66CQVYXh2DV4NiuGnIj1mylrkMCRhvW+hyWbZmEyuf
         qAmg==
X-Forwarded-Encrypted: i=1; AJvYcCXwZbxOWFFKFLYu+yFDIObsAs9pBF8w9piWS0a668AtUmtOMjUo4mqGDuDL9sORXYz+82+bG2bE6qHML0PA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfj+hWLsDWFdh8QJVppdh9oVMhs07cLTpwC/L/d+b+Y7sTgkhJ
	tMwkvBJZU0IB0VjBRoBpd8rpDalmtgePDoelTzucncbWi/J45oOeYvkXcVZJ70PsPcU=
X-Gm-Gg: ASbGncvPBKqWqjYOMeFk9/nnet/UIrBxC5vjfqv8lByEYJyrAok1/AeBRZEBMWiYQMS
	7Yb7370vCuIw/TlPFohfpege88hGex2SsGkoiWXSqxkXuQxx8ye1puYfHXHnlwRfmLvZoGGnyXD
	JeJFSGUP2dreBvHlPq+edeCkj6Iy68/BLEXfX5QjbODPFfiWOhibtWVq5lgRIcwjCweWcxk96zh
	1aQFUQIfIpWWw5hG+D47TdnSY1oWvh2QfqstHgI8GpZHwciyb+eRAzdhxUuFEuZu93AEnNU5Ujq
	Q44w2ECFzG9jvQHNt2rHpKGTBB5Se/YWqW3qB8ufPKGwJUxifRsPP+AF+pCheN8nDF6gA/8/YKM
	1M9O3jeXjkrgH2AOmvX3Om1jSUvBhX3NPgSZ2x1n2WmBWjE6FlaH13mzt9T/j5nd53S2/PULYsm
	M8rtlzo92hqcwddtXhN9t5GVFDKPtNN9as3ohLW7ZvosJcYJ/F8jlxwEVyIFwP984JPKlokw4Fq
	A==
X-Google-Smtp-Source: AGHT+IFAoNF3BK7VDc+szlg2LKY/XNpdmDDVaz3nmDf3hZz+gWKkGx6bQOoyTh5ZVxqOTyI2e1zvXg==
X-Received: by 2002:a05:600c:1d19:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-4778fea835dmr132265535e9.23.1763452727698;
        Mon, 17 Nov 2025 23:58:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787daab3fsm377307365e9.0.2025.11.17.23.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 23:58:47 -0800 (PST)
Message-ID: <04efc6dd-f3e0-44b5-a043-dab423dec232@linaro.org>
Date: Tue, 18 Nov 2025 08:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: amlogic: s7d: add ao secure node
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
 <20251118-soc-info-s6-s7-s7d-v2-5-38e2b31a88d1@amlogic.com>
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
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-5-38e2b31a88d1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_235852_206413_6BF4B10C 
X-CRM114-Status: GOOD (  12.16  )
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

On 11/18/25 06:59, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add node for board info registers, which allows getting SoC family and
> board revision.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> index f1c2e91ec6c5..e60167af0390 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> @@ -194,6 +194,14 @@ gpiocc: gpio@300 {
>   					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
>   				};
>   			};
> +
> +			ao-secure@10220 {
> +				compatible = "amlogic,s7d-ao-secure",
> +					     "amlogic,meson-gx-ao-secure",
> +					     "syscon";
> +				reg = <0x0 0x10220 0x0 0x140>;
> +				amlogic,has-chip-id;
> +			};
>   		};
>   	};
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
