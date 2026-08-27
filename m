Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3375C61DB9
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2026 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdvPdENeEjGR9ZpsUYRzYH1olcT4FVcE6UStsUnHvOo=; b=pk59kSvilZx30A/2CPZV3QdwYD
	1a9pM1Hyfm9m5zFijb7DAfydYgtbAZ2H4iBOTlqU6vbSxnJSQNny/G774bqQ4ugMiq7utWfrrE+Nn
	4svXl6w/WzbZtRaDJaBJN1XhGSlIgx7SiG47Njd2cVq6inHBTRKmtG9x2vXgMlSu4YLgok10sBRBC
	CV10WRxmARh96UkOx+SU58e+7MuBza8MQ+PeIFcF+9EUrbM9pF6IESW4gZF4PnPKAas4b7ZQJkwtP
	c9Lzl1kerGzKuK3gcucYngHO9kjIRoFBT5dxLHcIFsjn/1Eix2LrTz0QtAZrfbZIZMuAEjezze15/
	nK2CFS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVpA-00000003gUi-2Wt7;
	Thu, 27 Aug 2026 08:51:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVp7-00000003gTM-3o5M
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Aug 2026 08:51:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4956869750eso12114835e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Aug 2026 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787820660; x=1788425460; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/ECa4tNd88XdLDSwFPQYikw5L3eXcClU7jpbYu21eM=;
        b=osw+Tkk/tsSneZngcrKtHXl+zI1JwrAxHBQLYTY3vfuFp+sZhffylR1RiRVmvyhmGx
         kyW7M+kZ18BDDZlVioFQzDY7iX1YRHFWA9zo3Kb+YA63bnn8oy1ieFEApefnHZLHbYTe
         CZyFV+vFFq/9RBnPDSA62xcTnK89RLCNEwgxViipK6QSPdokN2he/uYzzyvKANdDwP1v
         onEut55XuhJASIs9qAwFgNhleRR1Ny6QXNdumWSN16Fvm8v3d7VvUIZ273hzoY2wcdai
         wMMWOQ8tBjAfPkWTmb8aTDt/Oe4PIke8nWsnnK4If0a31K+g5ALj7ycuCE1wqfqUyi2q
         mJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820660; x=1788425460;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/ECa4tNd88XdLDSwFPQYikw5L3eXcClU7jpbYu21eM=;
        b=shBvsRy+lY/C8SuiZqZiwPeOAmSg2nTAB65hAYgEzEHVyfBi4dPfKmNmXPbcgt4ThF
         iCH77cscAvkOEMitJxqLU8VS+nifwpcJyQiOU84DOa/pMbXSkZz4hHFzEYNl7Wq8Ey7e
         chkkVjeb5gHHj9NuHL0hrYdOx3NhZcWUJ/KowY3Nd3g2oby3mV3Iu9ybMwne68t6NnTN
         uNBpEAwFHZFLDYzM0D0Xj2hbqnHv0hmRa4ylZKJjQC/nvJRUUP7rtfDSVDRAy1LgtPLm
         NsQB8f87LVhWhgZp9NYBgiZb/mO2rBJmfi0ut8uZabLdDRhlddTvQB6WPmO+itA5KwOe
         DnOA==
X-Forwarded-Encrypted: i=1; AHgh+Rqnu4IX9oeDmCsufUaTbkcNpPSOXZGlWrS08ecpm6AN3Zt3UpvYBgPNhZ67xyb6hXSyjphgnun5U2ZSkELQ@lists.infradead.org
X-Gm-Message-State: AFuF++niF873/XfFqgsaxexJ/gi7ns93dSo2+Jz3305eh1Ep8pWeCgb3
	SBZpPgv15CBcgd8v7DrWA1kecRppE7GYHc6WSThqnUdKjzzyXPqtlQDCaCze+PmTQyE=
X-Gm-Gg: AR+sD13yLsvFaVaJ8cA9OpNeAHtOaQorDlBK3oQCzEU5YxZ/ojhPBEK2ck3qzhAugTa
	5M5Dlg+cL8G0fcAUjA2YS6BKFzLlAihcwgsUxegmXm91V/ZN5xqCQaHRDpjnEckkHg6pBeS0RHo
	De+XPVFiEI3o+kAm+6RjA/smWk2qwp3X9j17lv/KJJbrc2L1EKU+Djr/yze6eHbukvK2ionLSDa
	GOpg/4dnefuTao6FwtSVg29cDbqPaeaMlh4PcfPGAyrtzo9LqPi1BcJnftFVIrQmgYVgaPus82x
	b6pEHSl9QGEztvF8F3qvfPkeq3reiQDsWvvflU+5iMTzv7FwsE+bDsKCp1Kygydliy+5WkO7XhI
	5HFzPHeaJriv5aMVP53QqqllUsftUgQFeX/qP7j6wByUQRcJKNXEpHOgYozKCv082vO22GrFO3q
	+itETZuDhJnACZEmL7a2PKqh2xARA4dEJ2hMlisX/FpaYJQfual/PnUU61ArDjrCzzAyfgkA==
X-Received: by 2002:a05:600c:a0d:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-499dc6e9b00mr154198865e9.3.1787820659765;
        Thu, 27 Aug 2026 01:50:59 -0700 (PDT)
Received: from [172.20.10.4] ([37.165.68.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4ddf5023sm30302265e9.13.2026.08.27.01.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:50:59 -0700 (PDT)
Message-ID: <57e0daca-485e-4672-abf4-a1f8e55777da@linaro.org>
Date: Thu, 27 Aug 2026 10:50:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260823115335.102219-1-tanure@linux.com>
 <20260823115335.102219-2-tanure@linux.com>
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
In-Reply-To: <20260823115335.102219-2-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_015101_987484_FA66FA29 
X-CRM114-Status: GOOD (  14.72  )
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

On 8/23/26 13:53, Lucas Tanure wrote:
> uart_a listed the 24MHz crystal for all three of its clocks because the
> T7 clock controller driver did not exist when these boards were added.
> 
> That leaves the real UART bus clock without a user, so the kernel
> turns it off when it disables unused clocks at the end of boot, and
> the board hangs.
> 
> Update the board DTS files to point uart_a's pclk to CLKID_SYS_UART_A
> instead of the dummy crystal clock.
> 
> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree")
> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> Assisted-by: Claude:claude-fable-5
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 +-
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> index cab2ee9ea0d3..ca7536f772ff 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> @@ -33,7 +33,7 @@ xtal: xtal-clk {
>   };
>   
>   &uart_a {
> -	clocks = <&xtal>, <&xtal>, <&xtal>;
> +	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
>   	clock-names = "xtal", "pclk", "baud";
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index c41525a34b72..75d81ad6830d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -266,6 +266,6 @@ &sd_emmc_c {
>   
>   &uart_a {
>   	status = "okay";
> -	clocks = <&xtal>, <&xtal>, <&xtal>;
> +	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
>   	clock-names = "xtal", "pclk", "baud";
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
