Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66A3F0181D
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Mar 2026 10:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5FfZqTrmvtNplgpsQzHO/OYjXf2UobjA7WfeZslhpU=; b=b/p2UvYHhBt3CAo9QB0r8mxA6B
	Wpplqvy9d/ckD8uQOlI4Qr298o0t43/Oxa1xOYV/izlVmVQyHE+2NP4hK/CHLfo0/LIhojMYmgWfe
	OPSz7lRzlmcxa2BxVO6pJ22x3OHgxHGKRI24c39aEIjVdjpluLkV8SYRZVzdvL6LcHIRxeaCpmsC6
	tGOMXHn0G/Ceti6osrFV6/0i6CzK0s1Rns7diMomJ4Be/sK0PcgOIQWa8+VQDVEyvhBRkz7GbrVAq
	wYkpIG2p4GQkp1Z2WsaT6AD3K+QRXjAgnYOltDoUcZ8/TXk/zkZxHMP+poZNY+BMUUx1xy1wc4TQC
	b/Rr2snw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySAS-00000003QM9-19Uo;
	Fri, 06 Mar 2026 10:12:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySAP-00000003QLK-3DQh
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Mar 2026 10:12:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so5710166f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Mar 2026 02:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772791940; x=1773396740; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv4dJ/4VMXcAmevXlUG/734DLVWUrC6bvT8eqbpexP4=;
        b=uLAT0JzVZwZK8P8HbyYFdPQ27CLJbRKsXBzPOu32iEPvuN08GO4OdjCoEOpkLy2EMr
         w7WuXBuKTEBOnLlIuFMy5XphwHW3544MnVMatHMsrYOdrtWECsG517kRx11DKO8BrP3C
         DCi8ZtzSayALz5ytVX6xGZQ49HV3J/XWn93G5MQG4nk2HJD//wDCFZoaGO6IBd2OTHSh
         RIgGIyIxmARIcYwJJ91Qd2vfhPL4hQXWjKZ29c44k+FHgX6Mhn7i+/DuIVWhhU231sm9
         RizHsEx3+51AXWiZ+hCNV1aEmdhknIdskAQ48UgvIFLQKNwN5AXwrXm+YMv3dF+88B0+
         shqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791940; x=1773396740;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv4dJ/4VMXcAmevXlUG/734DLVWUrC6bvT8eqbpexP4=;
        b=lkZZXXz/DjW9nnuYEsFlL+pEoN2wOs9ZgeBSvpIWzpYvCedr6TZr1KnjwQkEh2zvLn
         zrTt8124hPdGQ7PmKhx1TAgzgwT6llXap9zLgaipKkr6Y6PsgoD057ctiVQ1xYgw3b05
         fPEydF9K/o46Mkd/KneUaWzd3bEkT/xBPkIy0Wd4+frKaAInkgsGhUMnA5rVAxaehR2H
         9UTo/x0m1n1E94bCq8zIn6mHETNRYV4y5J9Y/KyuO+SZiazbI0ehErEE5Vog4OeBT3fJ
         5A0KbFHbkPbmmRDwunDdQvx23gUo98xr7i4+fgYcAy4f8mmQoMH4UKV7Vjze8hJuLAVC
         mXJA==
X-Forwarded-Encrypted: i=1; AJvYcCW4+l3btoBeqIfH4M5wSr5rQxxT36OWEpxmESmGJBatBCBbRFme+3MjuE6OMjNwpKTIO4WhgnlfRhPguu0U@lists.infradead.org
X-Gm-Message-State: AOJu0Ywll9GWZ4cmqLXbDftgyzfpWMPsCZasogpRHl33cWxTMkrbrmTA
	Aj304XDVS7A9A0gpbUcBCHkFxk3Gkon62o+UlgvJS3WzOosXEuYqWZ4XjnNyWvEJr9k=
X-Gm-Gg: ATEYQzy8UEgsLktcb1w8m4SeTiZqQm+zThw4F1V6JRFMRoViVKgysWMvEWu7HuVOHCu
	XkHJTtA2fVySVEyjIXgXw5mf7k8DG8qXASE1Txm/9g5Md0metdrC8bOnozKzQmL3N1exHd7TClY
	bm+Ey01rvaBKjIYFSVEo8xI8620ZltjWJiVTIluU/33/IVtV9dgib+QEcoilWdcE8rt9iKtDM++
	f0ScPwI30PPFp00gIvSzsOxuiZEkdBqm2DWAJDR7FJhMoSArQcXnIYkcmLOLBKYWRDVhiQW7A+P
	L3fI0jh0uySUEZbD4B+W4B0+bQzqSg95xl8FHwI3zAqPp2uFG+yTHX0FwWxb3OxnJvsxrdEKbs3
	Rqz1ayyGYhmR5hNd5poaGFGsorzzQvrmdVNypA4knBugUm0Co8wc5/aWkOaFflVGWuH+pzDckuf
	Ppl+k1XxAqdlLi7gXF2ZMr4ve8pW/FE5mNKQmJKLxLM2Qkoo/EaYTtt6CbbJ5MwTm8urN/YidNl
	5EY
X-Received: by 2002:a05:6000:1acf:b0:439:d752:8bf9 with SMTP id ffacd0b85a97d-439da8a0219mr2636932f8f.58.1772791939641;
        Fri, 06 Mar 2026 02:12:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95? ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm2529820f8f.6.2026.03.06.02.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:12:19 -0800 (PST)
Message-ID: <6b4ea910-1a73-421e-8a38-8827a506b937@linaro.org>
Date: Fri, 6 Mar 2026 11:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/7] arm64: dts: amlogic: s6: Drop CPU masks from GICv3
 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <f9c6eddebebcd2e128edd2dbc51706e23589f9e8.1772643434.git.geert+renesas@glider.be>
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
In-Reply-To: <f9c6eddebebcd2e128edd2dbc51706e23589f9e8.1772643434.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_021221_861495_EDA67EBF 
X-CRM114-Status: GOOD (  11.20  )
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

On 3/4/26 18:10, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> While at it, replace the magic number for IRQ_TYPE_LEVEL_HIGH by its
> symbolic definition.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> index 8ef6319390331fcf..ab3acef2b147e62c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> @@ -53,10 +53,10 @@ pwrc: power-controller {
>   
>   	timer {
>   		compatible = "arm,armv8-timer";
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   
>   	psci {
> @@ -84,7 +84,7 @@ gic: interrupt-controller@ff200000 {
>   			interrupt-controller;
>   			reg = <0x0 0xff200000 0 0x10000>,
>   			      <0x0 0xff240000 0 0x80000>;
> -			interrupts = <GIC_PPI 9 0xf04>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
>   		apb: bus@fe000000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
