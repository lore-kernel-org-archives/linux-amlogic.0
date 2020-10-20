Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2721C433E7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 13:12:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1969522265
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 13:12:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Yw19x5x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="P84m/P6Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1969522265
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DrbOWgTUyhFoHWdIZTy8Kvie70Lsf5OzrMcxPEWvKgI=; b=1Yw19x5xFvxUzphSXcZpnlSD9
	hG2qPPFBWkfG83MYMPHC4/YOMvJN51SmP1fXzShpm65kwfXFGBynHqZ6Xt+KsoF8KNnajAj9Iv6ky
	g93PmvPdWZsSGg4kiuTsQaypZMgXW+MHmIL/xaDa9APB8Qzy+WvitMUkSkxLX2hH3gD0gnh5X1r/I
	lcNBNQAQ1uvdMa8SBouHncYxe5F644ysAPGKMwnQbtv+nWu6Ly/WjpyXF8aA//oxKx+neqWi9Qi5z
	ciZ4RfJdV/X/eiuaWpxtYO4Z3GksAvwNbOMm7tmVF1yjVxrc70lRZqWSnAg0M78jb84nBoB5mii4o
	ej5M+7vjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUrRa-0000Mu-SP; Tue, 20 Oct 2020 13:12:50 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUrRY-0000Lo-55
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 13:12:49 +0000
Received: by mail-wm1-x342.google.com with SMTP id z22so1158491wmi.0
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 06:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6QGtUT5pKCXlcaUGePzDcFENyJMU8dFZvbygcAE8W+Y=;
 b=P84m/P6ZFjlCJscybhA9LvUvEcZS0iVMkSOETtTB2pveXH3kDiMPvzen3CLOHkyt+L
 GDeAbVVquevVOsehpxzFa29MpQVr/s+yv+lE88xZEW6iM++xed5vRAC/sabDulnqOyFs
 wtC1YYao9nKBNdIz7IQ/wi+iuO8qxmsdRyGLaoFrQATR5H4mRIfQ//T/i5UpLR2SzPl7
 dnZqCLgdyO4jIscjZ7uhpavrkAnaM5qQg0AtNYqgyKQrLHOBAR8erMusfX3Uqw3dxID5
 XKlXYiJ791ydOWhw3VQ/ZH/QTROSeSU0dSIa8DoicZFL3dvQyVQvAlaGjar1c3QSKHaj
 bQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6QGtUT5pKCXlcaUGePzDcFENyJMU8dFZvbygcAE8W+Y=;
 b=cS+xoES/pplUyj2P7WupuiAKZHSOL2XiVt8d8YkHA/xOSTdjYKWfD04a7UqoPpxa7G
 M3xJ1MH5Zelo96BVpBTvVzlap7CwEB1muvzcyAv/zwj4lHw4tDCO9fTM4HmTcuq/6x6B
 Ys9QGNHPDMfgJoB3gcBaqzPsVyueImZL2FMGOUv3VplrZNYup5Lcnx9cP2fenEsvtPK3
 Pk8ztwFPb1dCkZzV7ODV8xHjEclswiYXxDK9gK8+CrWcbnDSwVyBBnPhARbjAxVWEtJ0
 EG7OVq5uiwUu9gBIWyypYmyX1gM8JKYb4R0xh6nAdrZ/xQY9XP9PBAUQRFzhfOO+2bn1
 9MWw==
X-Gm-Message-State: AOAM533G/jILrNpvbCmHJFpSMofCZ8DejGk7lQVC9rz0Gcs92lAwbQ1m
 GnidlKPykstjMKPB4LxHp1w8rw==
X-Google-Smtp-Source: ABdhPJy4oy+/1QSFY06SZ2UFsPcYtbK/Lf8IyBfUlsVzP9SfNF+CxPtvNEFlRcO2mwAs5ghJGI79QA==
X-Received: by 2002:a7b:ce14:: with SMTP id m20mr2828662wmc.20.1603199565716; 
 Tue, 20 Oct 2020 06:12:45 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:218e:7be8:b4e2:8030?
 ([2a01:e35:2ec0:82b0:218e:7be8:b4e2:8030])
 by smtp.gmail.com with ESMTPSA id i33sm3175868wri.79.2020.10.20.06.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 06:12:44 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: amlogic: add missing ethernet reset ID
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
References: <20201020120141.298240-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <68ee4022-df9b-c36e-b828-bc93d6507473@baylibre.com>
Date: Tue, 20 Oct 2020 15:12:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020120141.298240-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_091248_208140_8F42A43D 
X-CRM114-Status: GOOD (  16.93  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Anand Moon <linux.amoon@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 20/10/2020 14:01, Jerome Brunet wrote:
> From: Anand Moon <linux.amoon@gmail.com>
> 
> Add reset external reset of the ethernet mac controller
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 ++
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 +++
>  3 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index fae48efae83e..724ee179b316 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -227,6 +227,8 @@ ethmac: ethernet@ff3f0000 {
>  				      "timing-adjustment";
>  			rx-fifo-depth = <4096>;
>  			tx-fifo-depth = <2048>;
> +			resets = <&reset RESET_ETHERNET>;
> +			reset-names = "stmmaceth";
>  			status = "disabled";
>  		};
>  
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index c95ebe615176..8514fe6a275a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -224,6 +224,8 @@ ethmac: ethernet@ff3f0000 {
>  				      "timing-adjustment";
>  			rx-fifo-depth = <4096>;
>  			tx-fifo-depth = <2048>;
> +			resets = <&reset RESET_ETHERNET>;
> +			reset-names = "stmmaceth";
>  			status = "disabled";
>  
>  			mdio0: mdio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 0edd137151f8..726b91d3a905 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/power/meson-gxbb-power.h>
> +#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  / {
> @@ -575,6 +576,8 @@ ethmac: ethernet@c9410000 {
>  			interrupt-names = "macirq";
>  			rx-fifo-depth = <4096>;
>  			tx-fifo-depth = <2048>;
> +			resets = <&reset RESET_ETHERNET>;
> +			reset-names = "stmmaceth";
>  			power-domains = <&pwrc PWRC_GXBB_ETHERNET_MEM_ID>;
>  			status = "disabled";
>  		};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
