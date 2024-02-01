Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CCAC48292
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Feb 2024 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okQwa/dUblgB1Ge1WzPhSFUnfb8R0RV9XvKjLEPNnrc=; b=I866SYvdLbahq84/CvFK6VF2S3
	odjtebTvLPyUolwyaI9HbwObfVQtuN3r6drjEj4btJyTZxTxqsTM6q0Ro+uixM2MOvyTKw4245xFC
	72ofnt9D4XqFXicrgrOGVe4iBYsDlocPN+HEgfnFwXhhEBAwBOJHPWAXY95IUpukr9A4z1cbwagp6
	P8bIm66t3S6gEVYCndxFB8hQGCKzoBXBp5g/9cjX85W0aA5pbR46BYyfL/6XKt2dIFHKY8hTalB2J
	MbyYovy2Wmy7yI9+3ZmIlNHtM1NvckP8+0gFCmqZSWdk0XYlekQ4i3DOLXODQmsYVjaQigfWcPUJH
	SkkUCJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZ4W-00000008Sn6-1LK7;
	Thu, 01 Feb 2024 15:33:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZ4T-00000008SkP-0vJZ
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Feb 2024 15:33:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40fb94d42e4so8419815e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Feb 2024 07:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706801622; x=1707406422; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JvUgMZwIx8AlhnaVTXbQPpAdyh9AsLq7PFqw0M+A1Y=;
        b=yEz3z9Mu0cprPAaG89n61pj9nTR8KERwseycT0qEnpp/643JXmb4Ij9F30uuiireXS
         Lc2IPC9wbtEfDaM1B0Jb0Hts5sxThm0uQJQynBkBChnODhkcwROJR5pRhSStONA8N2pe
         37LNmRX8Pdtzclt6CZVNuaTowzHzctvhIQcj5/zNaYkeUqWzl711puTkI1gXTktXVDzr
         uPoe0z/Wc7L23tH4bC5Tla+byFTUL82zPszWhkFcXgdxu0GbRdju+X6J7nXcO9afACTK
         oIXoB0nSlPK/3T0K3Nw5I08KwTa4AGcEO+zzpChqGLihhyC+kF85ooZ3AycnTjMm9JJa
         dUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706801622; x=1707406422;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8JvUgMZwIx8AlhnaVTXbQPpAdyh9AsLq7PFqw0M+A1Y=;
        b=vcVqgowJXL7fBGctBlGVtZ3bq+s4+6hmRhzxFs/5jura56eGr47SSkCrGR11U2efga
         QYDfIWm4aT0ZigVNC4uIHgGe1zJS/GkhO0yt05/2V4TThV3V1Js0bHNXJWWHqe8QAsew
         tqivROYqzay+EQ8bd35AjtsASBZv9tjhatca9leIBc3nXv7V/7UvOjlK8OajYBDz38yW
         zRDTqoSrYIIir/DYXaFsq5LRnIkiKZl9GqeoynGeW2sG9HUWvM48NcRVmlxrjJ88tEqE
         Zcy4mVBZzec+v4+1m0YKy/9ZNh3uu0blqFr2zvgAsGF18iMPBaRNqhhSjjNm73oWJUlC
         bSRA==
X-Gm-Message-State: AOJu0Yyz8S28wYVnjNM6Cte/b91VUGY1emzclCBl4L0y+TmcXSXv6Ml5
	+ieMNhYS3pBLJNMBfBkVKuACpclyML5FNeFG9bXCpMUAr1ZY+VY8tJjihL2s/iY=
X-Google-Smtp-Source: AGHT+IHzUyIRxjBu59ajjbN7g7HX4KvseTgNopVMelHW9Es0s0xOIIlIOyXC64waCkakwdFmf0jC+w==
X-Received: by 2002:a05:600c:4687:b0:40e:b260:eaad with SMTP id p7-20020a05600c468700b0040eb260eaadmr1917738wmo.28.1706801617860;
        Thu, 01 Feb 2024 07:33:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUVp5ep8WiMiLeUreqx9aOamhdD6u0e0seqSCX/0b8/XzkZuwBlNkABnrUha8Mg2kTfFrj5pHL61vaJiJR5PdnfUfH/mnA4ywjjB61Kp8EZxut9yBJcYVUONPX07RECwPoxtMKYo6v+nU9TH5oiNVMvIsuGc8O5w98jXxG45CZx06VNTm3eD8t2b+Ovj7CIIruGmaVl0vk7QsDBetJjYn7jaUQf/c0ZuIsyif6cwwX1ZHfikyBnF3fwslRrvzAcYJcE+GKIYk9+ZIgIGXdt4y5j6QGEJsh/lhi+8cfU/B6PMeU2AI8OZRIF/Li72UUjYcZDih4w4QVnaOgLT+W79jND9E11vL0uYfTBjQwYBIaOaGCkrLuT95KxwKiZhb4Sb1wVIeuRtKqys4UtRdUoKoigkdOI3n9Uzxp1BbXQmP7ek/2wWMhNC+LuSENuOjgA18iYfhG7zzfzmP7ZMnJULdsZAw==
Received: from ?IPV6:2a01:e0a:982:cbb0:59a1:12a0:fa7a:30f8? ([2a01:e0a:982:cbb0:59a1:12a0:fa7a:30f8])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c1d1200b0040e89ade84bsm4833613wms.4.2024.02.01.07.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 07:33:37 -0800 (PST)
Message-ID: <7bcfa06b-f426-4575-9359-e97e4af52465@linaro.org>
Date: Thu, 1 Feb 2024 16:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1] arch: arm64: dts: meson: a1: add assigned-clocks for
 usb node
To: Alexey Romanov <avromanov@salutedevices.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@salutedevices.com, Dmitry Rokosov <ddrokosov@salutedevices.com>
References: <20240124130623.3471236-1-avromanov@salutedevices.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240124130623.3471236-1-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_073345_278551_894641C6 
X-CRM114-Status: GOOD (  11.66  )
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

On 24/01/2024 14:06, Alexey Romanov wrote:
> To ensure proper functionality of USB, it is necessary to use
> the rate of 64000000 for CLKID_USB_BUS. For instance, adb may
> not function correctly without this setting. This information
> has been derived from the vendor SDK.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index cf150f568335..b9fd69112535 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -668,6 +668,8 @@ usb: usb@fe004400 {
>   				 <&clkc_periphs CLKID_USB_BUS>,
>   				 <&clkc_periphs CLKID_USB_CTRL_IN>;
>   			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_ctrl";
> +			assigned-clocks = <&clkc_periphs CLKID_USB_BUS>;
> +			assigned-clock-rates = <64000000>;
>   			resets = <&reset RESET_USBCTRL>;
>   			reset-name = "usb_ctrl";
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
