Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207A2C3ABDD
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 May 2025 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnXAqZwdVSw7wMqby6fJYN4VRrtkVSDqu6loJjgDj1E=; b=fdaal8s+6pFgfA/kCsI0U84ybX
	CUn0mGsEXTzUB4zYJhh4rMCsKXMPR4NkgOiv2PSEOeazHuL2VLUhlPkXSSynDXPpk5X/zac8tdZS0
	REc5YmwueFQYbUztaxDfH4YVw8G8MIuWFQAt7vOFAm2wAPA5USDTjnD0gyrB0di4xeBsksejfkHQv
	vudszBwgR6t0sQzQJYv8fCdhfVo0pOX/ZR1S0zTcjIaqpWnM/x8DxI8C2WzfiCm/OTgj9enU9k8dm
	cLs3h2B/rn7JM8FcX2/yL3d3DYuAnLVffMzb9WvsM1UC5SfLynaFG5Z5UaY7HC0LA07Gbgi56G9Q4
	nKOk8h7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMB4-0000000CsSU-4Blm;
	Tue, 20 May 2025 12:34:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHM9D-0000000CsDX-17vl
	for linux-amlogic@lists.infradead.org;
	Tue, 20 May 2025 12:32:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a3683d8314so2560046f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 20 May 2025 05:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747744361; x=1748349161; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQ/iGDifZoJFpYpccOafvVqXyLvyOSbrLk1nfUTcRGE=;
        b=a2VC+QGFzXAs2mYLTgPQ2/wIY4J03h73g/IEu0daTc0AuJYfJ1S/j0WtWxLBiOTrb3
         ohuuwcgHIvdsuPLDKVWqCdVc5V8s7v9K4eG2segH6R2DsVW3bxo+sYTTvL9pYDendWz7
         ex5kcdMmTWLwUbt81Wx7PI+7VSG6CptUYU0VFpBdbbT7Kf4suskO/4BO/vAC2pMAX6gO
         XR1PTAEZ3ws2eDFOgbd4hnBr+hsq5uTzjYjFxvxqHnRFAYtSrLbxodmH/zyxKkNdLAPU
         r2aI6wIzyvjvNohamXTSASWCSfbkG5dMuab+4Nqp992eSPLaEsFVYHg/1+PWLcgCSNPI
         I4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747744361; x=1748349161;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lQ/iGDifZoJFpYpccOafvVqXyLvyOSbrLk1nfUTcRGE=;
        b=K5bSbtuzmBCV8X0fG+DKL8wqXL4agXEnXjNUEK6LzkjOKa4YNNkUeB31frhmIytFAZ
         eCZan7kSRDTLg5AIYGSYWQnV2zeZvfVSE4GU4H5aO5JZnopjJcVtkJfX0IbK+t0knSOp
         we6ZelWi/wxL0yMdcQI69vA1BJ38OZ7fBsmpDiBaERvOImIXk/WjpMMisaxWXq14UVnS
         EyNQCECd/w1cBwyoW+hBO32i1XcneegUpGh3m8V1btMwsXYDb2n/zlWIAZyQvC1cEXJ0
         JngWTRCecB2c5+Uk+CMYfs6GXSKGvNPxdVLc+zXqw8CZCQ6DR/ECjA071PMh954VpZy+
         PwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6rKrafpy9QDvCpMZpqewvMXWiOM9iMhui1YnEh28GsUnZBdClhByc0Fy5rRRTnqgJDDEICGUDo659UvOe@lists.infradead.org
X-Gm-Message-State: AOJu0YzxSY+kR3O/tNgZWCaOkEqqVL3OzexaW3Fbuc79bSyeK6HLHjdc
	bauWPZ5JGZyFSBn2uPgvDE3m+O0jWqkJZHR5yIxn9UNlTa/qMhX2ZqA/0Y5Hse6/RTc=
X-Gm-Gg: ASbGncstaj6YUhTSq9zddRPyK8CMqIbabVNG3NmI0xFNE+rnGTQ3aJIWPk6F5rpb7UF
	IRT5g+J07kglthLoM3pMd62LnMlkDWuCpKJ2NLgIlISvhqQAz+J7kIL2emDBEl545B02VBbutkh
	fYs62G8QXCRktNMrvveU8nLjKBs4FVrtJKZwOV9Flv61XqqR3QKQIuzlxCXeUftSid0/Rm6XZ5V
	ipEDbcKwUMGDWUj20SBLuwVWHxa7e+CWxvUdvemgJTI7ncXmzHR/2HVrg004q+CSIWzqqZNKkQK
	n2K2i3cg0pWr1GnLu+YH3GITeIDAHrSevzbonE1MkkXI1e8ecOcydioYN8OVQhlM5rRYekQYbSH
	kP6uLWtYkuk3Yj3XrZDPNvY/mS22F
X-Google-Smtp-Source: AGHT+IF9JgnEXOZZrtY+Ie0ZOfbkRyYBtLxvkI5PbUcfuC510953elD1+wY7Qfb0abQ602fLh29f7w==
X-Received: by 2002:a05:6000:2509:b0:3a3:7bbc:d957 with SMTP id ffacd0b85a97d-3a37bbcdaa6mr1647245f8f.33.1747744361519;
        Tue, 20 May 2025 05:32:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a04csm16065014f8f.23.2025.05.20.05.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 05:32:40 -0700 (PDT)
Message-ID: <872b7da3-b771-4df3-9b1a-21ca48c36045@linaro.org>
Date: Tue, 20 May 2025 14:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1] arm64: dts: amlogic: Update USB hub power and reset
 properties
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Cc: Wayne Schroeder <raz@chewies.net>
References: <20250520091842.7504-1-linux.amoon@gmail.com>
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
In-Reply-To: <20250520091842.7504-1-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_053243_317865_6BDBFD1D 
X-CRM114-Status: GOOD (  14.66  )
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

On 20/05/2025 11:18, Anand Moon wrote:
> Add missing reset-gpios property to the USB 2.0 hub node to
> ensure proper reset handling. Also update the vdd-supply for
> both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
> for consistent power management.
> 
> Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 3bca8023638d..ad959f8bc1ac 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -42,7 +42,8 @@ hub_2_0: hub@1 {
>   			compatible = "usb5e3,610";
>   			reg = <1>;
>   			peer-hub = <&hub_3_0>;
> -			vdd-supply = <&usb_pwr_en>;
> +			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> +			vdd-supply = <&hub_5v>;
>   		};
>   
>   		/* 3.0 hub on port 4 */
> @@ -51,7 +52,7 @@ hub_3_0: hub@2 {
>   			reg = <2>;
>   			peer-hub = <&hub_2_0>;
>   			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> -			vdd-supply = <&vcc_5v>;
> +			vdd-supply = <&hub_5v>;

In this case, also remove the &usb2_phy1 phy-supply since now it's managed by the hub reset control.

Neil

>   		};
>   	};
>   
> 
> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
