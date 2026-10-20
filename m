Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694FD606A31D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2026 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zyc1jJgx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C+P2pkEj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CN3VwA45TmeLwI9QSmFScVJLwO/+wCkXXJMsY+AiKQE=; b=Zyc1jJgxq7mRkoxBn2RltGvRDm
	sle42yD7p1Zidcd02DC/Are6UVPbZ9NvWIa1RrdU5iE26SbCzVnPElb89ya4OUrGng96PGFcVYUO3
	khh9Zatnjjnrhs9U65Xpb8kiECk/+ZFpsCbfu5TFUTYk+ekVsfK0sL9C/L5I5zh4E5es1/Tz8B393
	cT0D6oUCKMFLwu7CDKCiL4yOQBHTj5+Ij180xyD87X6O33fJQXtKBv4ahHG/vzMb78BvokMmE9oml
	4lpOr3+pUl3qcdjqaNG8QANwpq1RG+24j+IN7rK7UL/XkdMSjYY5/GQy90IoKZu5JXFtUYI5mQfKK
	i8ZRGqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Mu-00000009Cne-1HoC;
	Tue, 20 Oct 2026 08:38:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Mr-00000009CmP-3LqV
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Oct 2026 08:38:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a01933b584so20977715e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2026 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792485523; x=1793090323; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hogL549jM3ExbqUca/Ckmvahf2uy1aT58g4/4SYGND4=;
        b=C+P2pkEju97hNogJnVFbwOO/hFTKN09SBUMs1IMYDmlOYamJoRBxm2ElCBuCetVsnQ
         N2MBCpb8/KUVp1E0j7MlzkqxaGH0HGg6iSVeYlHXSn+TbDTDE/KwBhNUvYkrx9+x67lJ
         hy+yawjcVKGo6ICoSWg84LeomY/Sqk53Q4FKVXIn1I740WS7wFAkqWNpOrNpkxbPJFwY
         2ORBxGyJAeZkGDD3uu/LsdJTViq8m/beYGQZLbPJi+JTCukrkPrZxcZ7tGIYwjboQ3kL
         M4y1iJBrpv0r6WXQIXgERADDZ8I1pPwanIIg9xTOLSVwv/5iPbv2Z2GrpZdYkXzDQWyw
         fxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485523; x=1793090323;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hogL549jM3ExbqUca/Ckmvahf2uy1aT58g4/4SYGND4=;
        b=MD19yESewbBA7L+PXNU407i4iqjFHSNxh6T9lW8MqAqzplzUYbq4+E+7gGv4HLlpI9
         4IRw/5Oa1Dk/JSDdVi9g+d0raUGY3LfoBdrQ0iPE7n434DhmCf0MLxg6DacNhUCJwwaZ
         EafoJ3EFH/+ac1Z4mx9AWlxEtaAUQa7ySqD+ie7iYj1pyfsEjWHVm/EnKD9G6n/HlYyO
         XY4wO1hfYPlvIvY0OBpl1fd0Ic6TPA/jv9io/xkma5oGQaAVUVhPE55a7b2+3VjrEAXL
         rptkdfgtU1eBn2Unztm6L9o2zC/1wXAvSkaZ9fxHcdCn/Gq10g4CKW5oyaVu4oj6Dd0M
         tv5w==
X-Forwarded-Encrypted: i=1; AKwUvBzOlr4wSwgtnbprEHI4qJZFuG/WNi3MekW0RMZ7OwA4JqvQXsaTfel9Kw9zoZT8w0uKQybjdq2vT8cvKVDR@lists.infradead.org
X-Gm-Message-State: AFq9FYKCdjYxyPS9VUf6zeSLdPsMmklUWTSXiAkxfJ3jck9ugV8nZdh2
	H3Gny+Y90vKXOPTld5DSEeh47zPW70l+/1zjNDLGfSYcoF0MfVG6tswx/WR6EwavoBg=
X-Gm-Gg: AYBFou0Ishp1EMFqYgkb9PJfuCvX6B3Ri/4ZmpZxRbkItmwTecjxzp3huIJbKYLieTN
	TsamPE+o/YI0xnMZG6893SvhGe8HEoDCfWUCSPAy0FM5X0o4U6SMi9ZZatgqsYIhICdZojHTc4U
	eyffkR/VhLkpOZEXGklGQVi+k88a1sdf5wA3TXdX7tyC2X8q1TsEuQgvCxP6CW9xLFbi2WLd/tP
	2W7CbIwxkaa9wSQLR1fVAdlwcQKjCfoqnqai4cR0gtfra8+9b622DOSODFws4cU+aUHzNFgRCTu
	FrxcmhUGr7xyPOMElzrhflkSWdMjQmuuYZUReMa0Ih+y/oaqvHuE0mf53+xb3zo+rOHhurWydyY
	uEbSxN84fgM7VJDEUcaAOW5rKMgZUF0BxBU30I5fc9tyT2ZEawXVbV5M4b593wwYIy1do9KkZgH
	B4Bu1vT1A886lHgKpDFudM/IaJhkmEpcxQ0nDVwoSqH/XCkt08Wr3T6T2z8f2db23V52n84pLZT
	bAd2BU6/ccYL+wuIKUbsFilVdWYShipM6f+L8FV0GrLo3bFBNR9Yw==
X-Received: by 2002:a05:600c:46cf:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a1f8cb7ecemr12546735e9.24.1792485522235;
        Tue, 20 Oct 2026 01:38:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e3a1:1a65:a394:be54? ([2a01:e0a:106d:1080:e3a1:1a65:a394:be54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df370381sm163461605e9.1.2026.10.20.01.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:38:41 -0700 (PDT)
Message-ID: <7ccd519c-9c45-4a3c-a0d4-2a082c4c0306@linaro.org>
Date: Tue, 20 Oct 2026 10:38:41 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: wire the RTC
 alarm interrupt
To: iav@iav.lv, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv>
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
In-Reply-To: <20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_013845_889813_4C6E0B86 
X-CRM114-Status: GOOD (  17.59  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/19/26 23:52, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The PCF8563 on the OLED/RTC add-on board drives its interrupt output
> to GPIOX_5, pin 4 of the P1 header, but the rtc node does not describe
> it. The alarm interrupt is therefore never delivered and cannot wake
> the board.
> 
> Describe the line as a level-low interrupt of the GPIO interrupt
> controller.
> 
> Tested on ODROID-HC4: the alarm interrupt fires and wakes the board
> from s2idle.
> 
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> This needs commit 5831f5fef100 ("rtc: pcf8563: pass the driver data to
> the alarm interrupt handler") in the rtc tree: without it the first
> alarm oopses. Waking from s2idle also needs commit 5b6e2a46b80d
> ("irqchip/meson-gpio: Allow the GPIO interrupts to wake the system")
> in tip irq/drivers.
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 5f15c2299509..25a8a60e152c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -105,6 +105,8 @@ rtc: rtc@51 {
>   		status = "okay";
>   		compatible = "nxp,pcf8563";
>   		reg = <0x51>;
> +		interrupt-parent = <&gpio_intc>;
> +		interrupts = <IRQID_GPIOX_5 IRQ_TYPE_LEVEL_LOW>;
>   		wakeup-source;
>   	};
>   };
> 
> ---
> base-commit: b44e2be772f866985cafdf90355285069ea68495
> change-id: 20261020-hc4-rtc-alarm-irq-b2b8c68d54f5
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
