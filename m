Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E28F0181D
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Mar 2026 10:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYy0jdENiQNckZtyRyq83Dn3hW/BvILqxvvfgNWZYJs=; b=y3P9L5EG2cUbSFkmQbHn4/IFQI
	mjNCwocksQQsM91ZKHp5/iGxDkscoKYgHE+UesoRFwteqEp5zz5dhmBcUKy4eJ5ZwTl1xNggmj5f3
	Vgu2Iz8DKipSGcDfq/SbRuGJYw6YFb8pJ5wISvx0iIr1ydrdYc1lhpvcBsjLT6/d+mHJIUVAKQTSa
	3+L+B8Lc0OrsMat+Yzw3s6DASPA/PBe/nlJwFHCtx1ZMyKZSSJD+3hGuVkyQZTgyckToVPE0qOxBR
	VsevWLbsDe0mcnwTlodKTfeub4k88h3Mwc3hWM76weY6JDrlA7bq/i0soNHecs1Pu/lafX1rKp7Q8
	CzB34WDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS97-00000003Q0V-20VU;
	Fri, 06 Mar 2026 10:11:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS94-00000003PzK-3f33
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Mar 2026 10:11:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4833115090dso92914805e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Mar 2026 02:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772791857; x=1773396657; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufjDysk6Eerr8tO0qTbtZ9z+W0GoRqYATTCMzifDeHs=;
        b=bN+0TMfPTnXqrYdllhXK/GYlWBtWY4E3SNSz7yiZuBjinjdtwpNYdSAO5Irp0/aldz
         lP3JJOFuTrZKv4xdVOadTUZ5qlMDf4vY34F+YoMj6I9Iu6f/SMe0vGicPTAwQGEYHjKQ
         Z+CFWaULutMdhB8FD6aqSN5YFX70U9v//SeJQNGO/cWhbCqSF5Ojmpm/kxOfkDw1m0zw
         4K+lNSuUqzy6jlq+Dq4uNg5Y1qwQ6WWP6wg+rb93pTN8TZqDYtrk3I20UUVun2igF1py
         DGw8Ka+Ou084uW6anLPpi+iz/xmHPKGImwsQtm2Bd9mP4/zR64XjzTHzRoDV9SjjbTyf
         WJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791857; x=1773396657;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufjDysk6Eerr8tO0qTbtZ9z+W0GoRqYATTCMzifDeHs=;
        b=pPIoq6IQ3Y8iGfGGqyPWWtbVf6NOTnZBXpS+d3TrH8DtaTl9FJEaYJauonwXFWWL4R
         8NWpqE6Dq1MB0ISO4QXpTKKolHVXIBGwjRoY5pXRduP0rcDphth63EZTcw3afqGP6slB
         GP2YQPgIcC6fI/9Uo4jAKXBYqGDG/bc3Vj4gWSGrAf27UiM5HdrzTEoj/XFub5IPbZG1
         3zxSuJZyHc39NCw1D2gHuljdjkV+WJMI7j0aWLQdDnNWqCKUmleyGx6P3zY2xNxsztKq
         akPW6x/h8hVwfgxQ+SInJt7/JRYnkZKEpcdD7kgPC/tfWRQSzMI5GF9ULdc4/8ieySOb
         c7dQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ff596T5xoW8CCkaKqNHO+F2jApyiya82DTZ4JJttjwzHJVBmwVRC2Z1oPlbOviWhEZItJnn0/Nan1vmE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy//++c8YPmVJQEKKspXfmh1lD2y0853cYn33MsGF18Hmqx7LIC
	xSPF8WsWs0jEXEr4ZBOEQlgNnWMRuoEru/XyNVcL39VsC79TFYNnhWIOpLGvvcRDdRY=
X-Gm-Gg: ATEYQzzA+KIQI2oS4fejyQntlDdR9lsNzePDLFYW52kXQhG7+/mkXS99L2ncAbI+mfi
	MRCdjrF5HA0v8bqnD3PpdDheuoKKpvNjI/JHYWtGNaTjnKxgnfwkajVphN4rOMbVlqTrBFFoFbT
	jfoALIiVpWrTq5Zd1D3p8JMLGBH8uDXuSdxc4Z0RN/MRFUywMrb/ZrVLhPFF1Y4bj1ymavh+sUW
	tNif4yeikirNQuyVMUq7mqQbhy0E2JtZWoqtRbgoFtsHlqiY80NkrKlUcXcnv+sn5Pp6/9c6AK6
	1RrLZkCBs/RoZA4ZTAVmrUSr1JIGFmwVZDtOKaMtdjDJrF4N0Xz1sxl9E2X/oDEitlLtgL0dtY+
	EXu9qR1mtWC6BOsbQi7lNBZUq4sKT1p5B29HFX7SjCLVYjqZ5956NuSOaa3e/IbM7atK6+J5G+F
	YTxoABGmWHMD2NIbHQJAFryly4IBuet70JJUaYu2eZEbQXuNQBcvaZ5j9/GiHBjdNV2EEZvnOnn
	k9P
X-Received: by 2002:a05:600c:5253:b0:483:456a:514b with SMTP id 5b1f17b1804b1-4852692f158mr23151645e9.12.1772791856930;
        Fri, 06 Mar 2026 02:10:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95? ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b75eesm20784925e9.14.2026.03.06.02.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:10:56 -0800 (PST)
Message-ID: <ae8c3d8d-93dd-4c96-a336-6bec73d2f194@linaro.org>
Date: Fri, 6 Mar 2026 11:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: amlogic: t7: khadas-vim4: fix board model
 name
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jbrunet@baylibre.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306030756.2421841-1-nick@khadas.com>
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
In-Reply-To: <20260306030756.2421841-1-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_021058_943901_56F8B3D6 
X-CRM114-Status: GOOD (  12.28  )
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

On 3/6/26 04:07, Nick Xie wrote:
> Update the model property to "Khadas VIM4" to match the official
> product branding and maintain consistency with other Khadas boards
> (e.g., VIM1, VIM2, VIM3) in the kernel tree.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index fffdab96b12eb..25b478e106451 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -8,7 +8,7 @@
>   #include "amlogic-t7.dtsi"
>   
>   / {
> -	model = "Khadas vim4";
> +	model = "Khadas VIM4";
>   	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
>   
>   	aliases {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
