Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57322CD1283
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 14:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdgWBN+oygD2f/CP8FeksHeA23SXx79bQK26/wPPdIg=; b=eldzoVO8rYTnJcwul/xy8dyCao
	B3rTZQ5AudnqEDQt1+/Mg8k4sTsEXk1NQaDJ/A9QtH8inCQGbSUKlRm60OdrINl9OctwCIyHi065g
	gsON02itCLmIbKnYvuAYFUdNg39HbK7DhW0GiGVRfIX289qucqQ9zzuYjwMDBV3q304OSkt9NDknd
	WTPL2wcO7MlT4C2kzhqL9ADjcs8M4ya9TbRilOMULzTMhrEFVUvAe9cC6KoqsknURru23GODw+ifG
	Yq9FqHo5j7jCYl5brnSJOXHT608I5fTL6+uIahoKZx4H1o5tQdPOf9Xc87AuMKXv3Xcvc4hetHXVn
	UXOCs/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqQz-0000000EFFS-3Ykg;
	Thu, 28 Mar 2024 14:08:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqQw-0000000EFBu-1s78
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Mar 2024 14:08:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33ddd1624beso655145f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Mar 2024 07:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711634924; x=1712239724; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YqEn6nGpQ+ZQnytWZdjBha5P7xeBVM99EE9tBd3Qr0=;
        b=Xf4ben0BnL0yMGQKv5zN4VxLyI4yfwgJ4zkqy6L+GiUXAvKO21Qnjji6km0I1IbF7z
         lyBJhdoOGvBvjWRpczqvKP/yiUOxMDXMJB0QQHf38+TQw9sL6E8hHzBMAX3/3tD8lnad
         P294uHIJfwYRtYm8AK5u6ypjmLYIgMXHM/3zLNVLsAn0XY3q2zznuIgHkiSCAEn6ZnkI
         ZMcvMl9mq/ZWmHUDfzvcVYE09iN7Z+ZrhGESm9L450JZcGw6pcY3vMvohF6JvhwLPGVH
         DamyUWpQ7zEHenuVzm+MpBaloiu2F+fgzCwSvHewrewu16mT35TGYpsf/8zgjGdPCmTn
         ZdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711634924; x=1712239724;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3YqEn6nGpQ+ZQnytWZdjBha5P7xeBVM99EE9tBd3Qr0=;
        b=vPVGB+fTYk7HI3JQrFlRQKGvKSvdNQi8NP5VDCf47h2twzrrMgWq/ZzqEAPuU+jMeq
         IIlIpzb9wOoGc/nbDjjLBcmXO/TjpwDPwg0vx4wVKE/me2yPN4cYPUIeP8MAJwq88W79
         chrpfHaoX8baIDmrbCHy7U47aKYLjLNMdjclxS2q/mTaE5dFLNgWhgYkNMl61hn+rTSn
         6DiJDs9COGnGqKVse1i/2VbPxKXoEZfhOLaQrb4FWCpvCdJNcUBu6yFXIYDAO4QP/Jkv
         XqoJL4vANzJ223CRyf6dy21rzT7PGwDY6vKLNre0AKgztQAP0ua5q4733q2PFEpax/kl
         wmkw==
X-Forwarded-Encrypted: i=1; AJvYcCWG61QlXZB0oNaE9wTO6hCIHblf9eZ4OCINfsXeQ4C+muXji7+jqf0yQFlO+hsLOlv72CN4Yuzs1Xq/7Cl55MJqkZQOJDdLsxJ2qkg7X92xCqs=
X-Gm-Message-State: AOJu0YwQOSn8nwy2axMnXwGSSyyG4BGn4VrLUHm5ijgNA2MCVWIn5QnA
	gXmPmxL4pDjZHM6YJjLi+tUSGATMpiW9scxo/oXiAGAIGLXsN4NODMH4k1pYoLo=
X-Google-Smtp-Source: AGHT+IEC/GG3oRm4e7tBnbj5LOOMmvI8qJFpOtXQq9ZDhffYLQtVrVE6USAKpfkizGiK660to9vDdA==
X-Received: by 2002:a5d:44cf:0:b0:33e:c68d:d536 with SMTP id z15-20020a5d44cf000000b0033ec68dd536mr1904760wrr.15.1711634923800;
        Thu, 28 Mar 2024 07:08:43 -0700 (PDT)
Received: from [192.168.7.190] (82-64-249-211.subs.proxad.net. [82.64.249.211])
        by smtp.gmail.com with ESMTPSA id du9-20020a0560000d4900b00341bdd87fcasm1824861wrb.103.2024.03.28.07.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 07:08:43 -0700 (PDT)
Message-ID: <b893fe72-d315-4069-9e57-17e797121639@linaro.org>
Date: Thu, 28 Mar 2024 15:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/3] arm64: dts: amlogic: a1: add cooling-cells for
 DVFS feature
To: Dmitry Rokosov <ddrokosov@salutedevices.com>, jbrunet@baylibre.com,
 mturquette@baylibre.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, glaroque@baylibre.com,
 rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Cc: kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240328134459.18446-1-ddrokosov@salutedevices.com>
 <20240328134459.18446-2-ddrokosov@salutedevices.com>
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
In-Reply-To: <20240328134459.18446-2-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_070846_543578_6899CC7E 
X-CRM114-Status: GOOD (  11.99  )
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

On 28/03/2024 14:44, Dmitry Rokosov wrote:
> It's used for CPU with DVFS feature to specify minimum and maximum
> cooling state used in the reference.
> Without these values DVFS will not work and dtbs_check will raise the
> error.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index fbee986421f1..f65d4a77ee52 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -32,6 +32,7 @@ cpu0: cpu@0 {
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
>   			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -40,6 +41,7 @@ cpu1: cpu@1 {
>   			reg = <0x0 0x1>;
>   			enable-method = "psci";
>   			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		l2: l2-cache0 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
