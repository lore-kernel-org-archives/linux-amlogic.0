Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E68CC48BF6
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cT5/w1rQ/AbIuPDQwZgVpFrideQFWKQRs97y4Cw/kcw=; b=NZD/ghKuc7q+X6iUKhmFabQfjD
	OLlDttj0dmf1GpDUwA7fpUB4MGQ430cbzRGaJ78cfs9GE2jxYF5KT+vXajhODxA2A046nFFOipG7w
	7mqelvtCjH1ItzMQGeCvhLHmzjBJFp4r2pggshNIM3n7cgRTiSL0aqts52g8o2/7jh0dMYxOQ+C+C
	NPpNtfz9aIh7dq6DppNSWN2cMPgjkDcH6sK14Upjyc51TI/z/j0hcHjg7rSuA3ox08Ya54iLm8mIU
	qR9vMg5ZdKSv4CKHCa2hlHXx0IECbE8FzQx2hntvfrV3sRX238C0ILmmX7AbK52cX1jOBG1TN3mQb
	yYjGZ/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnFY-00000001CMU-1vFY;
	Wed, 21 Feb 2024 14:07:04 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnFV-00000001CLy-1J57
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Feb 2024 14:07:02 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-512b700c8ebso4247760e87.0
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Feb 2024 06:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708524420; x=1709129220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKWxl3OogXVVnFS17fBlVo+bIxHD2cqSz5ab8fWS80s=;
        b=OAKimb0+Aze6ofr+dOgDwJnmSF2iNQ/XP7kOl/PgYvTCRYU6HOOukKARYc8jNz8KAJ
         Cb5pql6GB0Qs765A4e5bLlSzt1iDRTlY3dyR6P5ZFMqawBA/5PihhVTIe/kKsLVFhXZL
         1YIuVd6GDXbiSRr/mGqvh5Ob9FwcRzupHo+S2pgbQWtvbGZezGcx7CiH1wOdiREN9vot
         IHGWpL1vQRXLrlSMFLwHNkjvaak9S0GI8joqLpBv0Djhj/DUu2jZ8LzLPFfjSxneAYYj
         8rHYItQlXRGopz0QkTbuxe1KzYoicoAlUZMQjfUiRZUz2s35Nqts1c0vHHqCnYzFxfAf
         FPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708524420; x=1709129220;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CKWxl3OogXVVnFS17fBlVo+bIxHD2cqSz5ab8fWS80s=;
        b=QhK2rDaCwTMs3PSfG+B4tKrax01G0Sa3yVpuyW7VHR1zYmVXgN122rygVjolRvHdFd
         DGHtQVC7Ne8DVu0IbbHnZNnrXH6cs9kWwGuDL/6Xv1A3Hfrdv8/5c6qiQUA8atcT7Ep5
         /HCurhqz6zXw14JntDbEHm+qJnaycMLqr380MGdl9JwQK+NcpFjD/Y4IuX9GgOQgLG5y
         VZB+NXw21lmuQywn3J2sJmpwcK2X+J5MDFjHDgRbBJ9Fye9U6ssbxv6Wqz5lUUWRGC9O
         34+9HkDmqsA/enCYRCaE/PRNzrlrNHFBPaSVTUO2SR4vfvltGkxKVw+SV1iyaut6xo+2
         aRsg==
X-Forwarded-Encrypted: i=1; AJvYcCUfXLSzFRTSAMYjscPV/quNxPQujk5kBPlpNrUEfiuDKjRAXZRYiID0P++KwUCI71Fl4mu/Pzr+0Gu5Ic5Zceye6KZ8d9LR4/2UL1UuVEmaXAs=
X-Gm-Message-State: AOJu0YwvEqHlSeKKEChnBT+M6Xus/Iy+HB1Wf5scnVou+Nor5uePUz37
	/OszhSPxqMZKh7GQe50hJfq+vjjR4ozNrCzs5yz+1yh0pP8mrCE1S0D7L/FlwrKBzHYvF8aaXyw
	RDCLojw==
X-Google-Smtp-Source: AGHT+IHlCycFUalK8spusNdvliYS8b0yE47wfcWtbkwDCcSipjuydmvvQfLjQ4AEGVa9UCMUi13c0g==
X-Received: by 2002:ac2:4c41:0:b0:512:b4cf:ae3 with SMTP id o1-20020ac24c41000000b00512b4cf0ae3mr7444785lfk.19.1708524419725;
        Wed, 21 Feb 2024 06:06:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:83fc:439c:6f36:ce5c? ([2a01:e0a:982:cbb0:83fc:439c:6f36:ce5c])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c230e00b0040fafd84095sm2612088wmo.41.2024.02.21.06.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 06:06:59 -0800 (PST)
Message-ID: <1f12586a-16d8-45e8-a974-75923f9a3bd1@linaro.org>
Date: Wed, 21 Feb 2024 15:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] fixup! arm64: dts: amlogic: add fbx8am DT overlays
Content-Language: en-US, fr
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Pierre-Hugues Husson <phhusson@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
References: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
 <79ba726d-d02c-44b9-b6f6-59b17ba9755c@freebox.fr>
 <54b4e810-754e-481a-bbc8-984f859b116d@linaro.org>
 <15fcafb2-4b4a-40a1-8ef5-ee3aef9b3b9d@freebox.fr>
 <95cafd69-de6d-497f-b3d6-b6d7a8a3b795@linaro.org>
 <e3e47a72-8a6c-475b-a248-95da5dae24ff@linaro.org>
 <814c9035-1fda-4cd3-ab3c-95b58e2ecb22@freebox.fr>
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
In-Reply-To: <814c9035-1fda-4cd3-ab3c-95b58e2ecb22@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_060701_406232_13C1C2ED 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

On 21/02/2024 14:48, Marc Gonzalez wrote:
> Drop compatible properties as requested.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso | 4 ----
>   2 files changed, 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
> index ed79809b15859..9591fdc31ee0e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
> @@ -7,10 +7,6 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/gpio/meson-g12a-gpio.h>
>   
> -/ {
> -	compatible = "freebox,fbx8am-brcm", "freebox,fbx8am", "amlogic,g12a";
> -};
> -
>   &uart_A {
>   	bluetooth {
>   		compatible = "brcm,bcm43438-bt";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
> index 5da88fb94fb98..55fff35b09ae7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
> @@ -7,10 +7,6 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/gpio/meson-g12a-gpio.h>
>   
> -/ {
> -	compatible = "freebox,fbx8am-realtek", "freebox,fbx8am", "amlogic,g12a";
> -};
> -
>   &uart_A {
>   	bluetooth {
>   		compatible = "realtek,rtl8822cs-bt";

Squashed on https://git.kernel.org/amlogic/c/13636d5502204e671398470962babbfb46bc2721
now is:
https://git.kernel.org/amlogic/c/d881d79f8c77d7f9935a8d9424a1dc4364787bf1

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
