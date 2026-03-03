Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A2DE67A91
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Mar 2026 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uaYBJCRGc3hf5cZX5UH8dXoT8SuxI2t7R9D/J44JxI=; b=qt8XeYlxJbro2qpQGjTNe9FuZd
	UjdovIhVyXPjTywDU3qWZ4/kaZK5KZmIQioim9wK97aNCHwlOH2d4wehOELzfpBkLgKHU4nvOQriL
	CZnk4G11xXqqFj0qJi2XhyDx1rAvDRmiSX7wk6KAdV9UqCqa9JIXgL9JT8VtBDZX4YEcjiB1GJg9b
	0Zpjfewiv+CutV4DcgD1u/ZSTPe7Em1EeEsE3NG9MVTzn3KtMIDM38cM2TZwLWPEWgsW6iClKav/o
	if7B+L70mwPyKQ7JOW3XyASWscWBZV8MQ2ZCnY8iH1gM5ZHaYc3sACTMyvhIzfroceNMp3mLnkfEV
	rT8PyHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKui-0000000ElYx-2e4W;
	Tue, 03 Mar 2026 08:15:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKuf-0000000ElXH-1G6b
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Mar 2026 08:15:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-483a2338616so33241025e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Mar 2026 00:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772525727; x=1773130527; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=db+GRx+Q0XyvQJnHDE30itTeiVo7TcZ1LId1+iWopUE=;
        b=moEKO10MoUXWZQLbFJqY6tk5SZMYHbalGfPrXq/znYjXUKvej0/wGR9k7ORVcIveSe
         M2/2LbGUHCxdmjR3woTn31kCZLg58rGbqHGve08+n38169h3LekL4zsBKD9a06PzWV/D
         M0AbQ+hf3uI6MsGiwwiAiMP1lYafJ2ly8O+ZN7DWhyB+m4S9qZDSlZ7CTS4sI149wbI8
         BzgwP0nLkRO4VZEbEU159gUyYLlIOfJt5MCCawDYX5XxQDYm4+tpMOU4cfABk59QVb4D
         7tDAWprSt/AXr9P9/vBIb8LuTqFML88RPrJyRUJrfSflCbs0k5/vdOhVLTt2yVZxz3hy
         MOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525727; x=1773130527;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db+GRx+Q0XyvQJnHDE30itTeiVo7TcZ1LId1+iWopUE=;
        b=j+miJgSJu3rVByc0JI4FsAkTrjcyac+bcqCuk3/2YYhcRdSEAMi6lYN263R/Jy6s9e
         EeOCGbECaFNUxSw0N/G4uGtenfi6iVdFHcon2E8Ve8ZsuA1y0gG9YYyW5uIW42LFKteE
         Rz1zxh0wgGS/lc3973DBS15jn1cVRYxpucOCHRr/EB21nBPd6zaKkca5AcIdgOpAoeO4
         8FOmTP5gnr/JWfJO1GPULhee+bSztBdyqV9n/IZlLa973I9vw29Fd8XkDKG9MuvrKcGR
         gQRqFz7+Glc9BS8C3gmNNizsRHt0KTV22fVtdyznxazT3zfpgMSU+vEk4FQ68X90WCM5
         Kzkw==
X-Forwarded-Encrypted: i=1; AJvYcCVEeDs8y80lg5okuJWv/0S9mFTyXbyWGYWcs+aDEnoveN2wVGGf/I4w9MNz2nFq+/PH1mgqXsXMD2viZNE0@lists.infradead.org
X-Gm-Message-State: AOJu0YyDlSqg6eoVCKgxmKmURrqTIM9l4fTbYrajiSwq/QjipiSa+VVV
	Qo8EQOjF6dipqfu7i+8RX7CmZImnD2CiOpUoavd3EdBGAuttfhWwKW177eAMs/JNpSw=
X-Gm-Gg: ATEYQzy2+YihQugFLh3D0DTgsEVwJkr0AizKyi1TiCkqc6kPs5oJcDKB03KUVP1O/A/
	JZDQ/+Wd/jbmmu2p6ohrgQDgvC9FG5UHjL7ln8Vo2cxTKXCgfTcCiSBgN5+d1n3d1dxAdxY1X9C
	ZYURn+k5sOIfzTDXnsUFqK4ylHSUz6Wmz6DWoMKdSVY6J3nn2EEc45pcez+WxtWlM0tYTOWXpif
	ut0NNSUV4ziI60S3waF7WMqykJ7HfbLerb454TGM2GH07zzL7UJNxFd0jGYNEuquhrdqSrkmVPl
	31SAWBLtgDFNfDmvMBk7Qq3AX/K4j70XvKPaM9aSZPGSkER8ipQDhrnDSVc7QV3+CDXIESdnZPp
	KmI0CMt0VNUlrMwbr7t8vbut43Pgc3bxrqAWVtj7i5OrjTZPF7nZWvZVHaB/GLTWXxgOyc5fzT3
	PInjjRZ5uBYxGTiReVd6CqE1NFnEGONxc1K/HuBoolzLyn8A+Yeh36/oYixLOyGHcBbYR5IjpXA
	0vq
X-Received: by 2002:a05:600c:3108:b0:483:887:59b0 with SMTP id 5b1f17b1804b1-483c9c1cd2bmr287609705e9.35.1772525727199;
        Tue, 03 Mar 2026 00:15:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:e6ec:89fb:a99:3d23? ([2a01:e0a:106d:1080:e6ec:89fb:a99:3d23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd765604sm398884355e9.15.2026.03.03.00.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 00:15:26 -0800 (PST)
Message-ID: <8ee9c9b9-dabd-419f-9141-c5aafb9f9152@linaro.org>
Date: Tue, 3 Mar 2026 09:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add
 bluetooth node
To: Jun Yan <jerrysteve1101@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Cc: martin.blumenstingl@googlemail.com, jbrunet@baylibre.com,
 khilman@baylibre.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, yangxuan8282@gmail.com
References: <20260213073810.552341-1-jerrysteve1101@gmail.com>
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
In-Reply-To: <20260213073810.552341-1-jerrysteve1101@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_001529_390118_D2BB209D 
X-CRM114-Status: GOOD (  12.24  )
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

On 2/13/26 08:38, Jun Yan wrote:
> The Phicomm N1 uses a CY43455 (BCM43438) module with its Bluetooth
> interface connected to uart_A.
> 
> Add the required device tree node to enable proper functionality.
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>   .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts    | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
> index 393d3cb33b9e..dea3a60e8527 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
> @@ -30,6 +30,21 @@ &cvbs_vdac_port {
>   	status = "disabled";
>   };
>   
> +&uart_A {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		max-speed = <2000000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "lpo";
> +	};
> +};
> +
>   &usb {
>   	dr_mode = "host";
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
