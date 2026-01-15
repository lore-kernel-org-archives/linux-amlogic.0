Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B35BD44C41
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jan 2026 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjOqcyAy44qy4clRUwp8A5ws2ik+/NYy0mlzTKffV54=; b=fC5n6Jihzb438rdr6GYuzDEj/B
	BwFCo9BtvuKSiGeeh6a3D59vzY2qg/4hi4E+MtBWogHsRcrrcShUXN4tHAti+iRdeUnQq3MYf3UP1
	41/WHqu0FMPXfOjYoecamSYTORn6dGHrdS4XjPyWj+izkTmA0GcuHG0+1IwUJnhuLJbgc4dO5lNS1
	VLY8eKZnZ0EDp6gcykWry1bKd3NeSqmrLS6byj/GOqevvQfKqDIPwmelQnpT4S8v6bu1U6CaXddI4
	iQeAAzsyTCV4Tn5v4E590IQE7Aob3D06rwP8rPgwj6JxfHeqqZDwouOCgTQ4T0w+XFirIb01Z9ZN7
	Z0pl3hlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMxT-0000000CNK2-0Y53;
	Thu, 15 Jan 2026 13:00:15 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMxM-0000000CNIi-2HY5
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Jan 2026 13:00:13 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so7665865e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 15 Jan 2026 05:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768482007; x=1769086807; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fqfrZsJuS2h40JtZKPA7gA8RgFa7H/SeAdYuKnitso=;
        b=BQeRAaFIP8pQRW9ZK0EK+DVnexqm/MMGxFYI/uWPJkKqMBAlS6ddFzuE0zCnh7/++N
         ImNqYGr+DHDGHRmaTfzHEw3DyXFSLtsqi5FUm5bdQAc/KsmVpPgIsCb6bTPSPLmi5dFz
         LgPWZcyxqAl8DGxgipP0GJvQ0G++pnBgbJApLIkv8qyubIUtq+27VwBls3E8s65OSCA7
         /5k/sBOQO1UGB/pL+btdGu0yvmGlj2WKwEERav89/Nc88geKQKNWIPUoiKcbrpEd18PD
         b56w3iqo5yuySVbBRoPHDyYu3xohWaY4bhK/kxOmEoAYuy8Xu4aBLVid2Nd3fynY7lRt
         gEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768482007; x=1769086807;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fqfrZsJuS2h40JtZKPA7gA8RgFa7H/SeAdYuKnitso=;
        b=qUbdugN6nPJXJdFCJRvok3sKhiUMmi19ni6LmUXzKhQ5HoOcgepWBhmQqJhyto51YC
         nisNppxgcDMCSinKvzT5un0u+3n0jObHtF2iTwlwB8EJywROoplZ47sYevU00mBpipKB
         6jRIvD+pQWV7OcndnmCXaoW5ReZRYeePEZa1qHt3AV5LEhG67N/y5lEPf6GcQMz3qUgd
         tQoZy7+kWAlp0OWa+hrawvgh9nHT2VA4djrZoxPxa5Be9zsXc7TrawLEiFNWRXpfePqQ
         cXhZmOSSW6us7fZK/08VoXWVimIBgsNb/+CyLfLlt3kFdM9YrB4OXlKP+iECAO3X12ms
         U9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXDgWfKhq8AG2XkG60R884l87OgYEVZzy03bRdHZOQAMMbAqW5xvt6gdo70TLZs0BiLloUc3DFxaGYP0pVm@lists.infradead.org
X-Gm-Message-State: AOJu0YzIQPvbZbrvGXp44eBKxRImOfpbqJ3+vWE59bAuUp7ipYspK5Hh
	cHQHKZrmw1VacjH1nIW/9K/2Vj4t/Slzdm5A2TpmvDm2Ni7/8ee4lAumxcE3ckQfqRs=
X-Gm-Gg: AY/fxX4TYOpPOekrTBqFqGV0uWttWoqTn1x6e+ORH683fg1r/tGW0OfzOyeX7/70w0b
	N9c7Wmgrd5T3sUmA6Byf7tUqqJ4NkvnmPJZhb5R8cjRUj+0Daawd/JbZE8nvgXjN7pYIgOze03Q
	wVBtRFT5yxWcbjHVyXfkySwZD8XeI32YXFL4hVZ9k2LRl3KG4+cppg3rXEfWJtxOV9oaWBlVjDD
	OhZYVuZH0ZoM44avVxtZ3iwMnNVX7beOs4Xlo3K2/Vn0qnUPd9XGnREx6DzqxvXRjTQ+bI00heA
	uMVTdTWIEyjezvbIrC++yPsD6sB+IUZpMuofdqPGRGBBG8Xj/tNBFURqJSHJAvTCbWc66CbgOPN
	qjjcjvTWOkVa+fVNG6sxjrIGLPf3qGXQZVm2Fbvh2Kupa4mSiiqLoTO8qgiaoZRDm9qiIbe0KwR
	7TY+3CCbLjNUHcA5wIys6W/fQVdnLiH9f0CvsAwF3xOf5FAKREIRETfjpPIFhw5c5Hl1nQfb6Fx
	w==
X-Received: by 2002:a05:600c:4e92:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-47ee483f86emr63957345e9.30.1768482006562;
        Thu, 15 Jan 2026 05:00:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee0b34bc1sm44745085e9.0.2026.01.15.05.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:00:05 -0800 (PST)
Message-ID: <aeaee3b5-5f08-4abe-b646-a45ab79a35ab@linaro.org>
Date: Thu, 15 Jan 2026 14:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add the type-c controller on
 Radxa Zero 2
To: ricardo@pardini.net, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
 <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-2-8b5cdf328fde@pardini.net>
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
In-Reply-To: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-2-8b5cdf328fde@pardini.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_050009_244841_F165171D 
X-CRM114-Status: GOOD (  15.12  )
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

Hi,

On 1/14/26 23:48, Ricardo Pardini via B4 Relay wrote:
> From: Ricardo Pardini <ricardo@pardini.net>
> 
> The Radxa Zero2 has an FUSB302 controller on i2c3 at address 0x22 and
> INT# wired to GPIOA-13.
> 
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---
>   .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    | 32 ++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> index a37776d22b09e..125b064a15c1e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> @@ -364,12 +364,44 @@ hdmi_tx_tmds_out: endpoint {
>   	};
>   };
>   
> +/* Also exposed on the 40-pin header: SDA pin 3, SCL pin 5 */
> +&i2c3 {
> +	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	fusb302@22 {
> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +
> +		pinctrl-0 = <&fusb302_irq_pins>;
> +		pinctrl-names = "default";
> +		interrupt-parent = <&gpio_intc>;
> +		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;

OK it seems I did read too fast, this should be 74 !

S922X Datasheet (same as A311D for this)

Table 6-32 GPIO Interrupt Sources

---------------------------------------------
| Input Mux Location	|	Description |
---------------------------------------------
| [76:61]		|	gpioA[15:0] |
---------------------------------------------

So gpioA13 ==> 74

> +
> +		vbus-supply = <&ao_5v>;
> +
> +		status = "okay";

And I get:

   DTC [C] arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb
arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: fusb302@22 (fcs,fusb302): 'connector' is a required property
         from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#

Please add a minimal connector, like:

+               connector {
+                       compatible = "usb-c-connector";
+                       label = "USB-C";
+                       data-role = "host";
+                       power-role = "source";
+                       source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
+               };

I'll drop this change from my tree.

And you may also add support for the superspeed mux to switch the USB3 polarity.

I have a prototype at https://gitlab.com/superna9999/linux/-/tree/topic/amlogic/radxa-zero2/fusb302?ref_type=heads


Neil


> +	};
> +};
> +
>   &ir {
>   	status = "disabled";
>   	pinctrl-0 = <&remote_input_ao_pins>;
>   	pinctrl-names = "default";
>   };
>   
> +&periphs_pinctrl {
> +	fusb302_irq_pins: fusb302-irq {
> +		mux {
> +			groups = "GPIOA_13";
> +			function = "gpio_periphs";
> +			bias-pull-up;
> +			output-disable;
> +		};
> +	};
> +};
> +
>   &pwm_ab {
>   	pinctrl-0 = <&pwm_a_e_pins>;
>   	pinctrl-names = "default";
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
