Return-Path: <SRS0=Tm47=LF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9F0C4743D
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jun 2021 06:52:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 095B361364
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jun 2021 06:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 095B361364
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1gknC/cfJphbmNhSrL4IB1YRBZ+qH8LQbv3OsEYC1OU=; b=wgtAVuojzyETNhio5Q7P8U6GJ1
	BhqeuUoFFGYbRn2N4CRHX8u0MVeNU0Uy443oJI2kdi22mVmQ8JmSbDxW6wtLB2Sll3qRRkXXP9GyE
	MEyEZEji7bhqsWMZ0zrdIGAD3x9SizDPAjtBuyTX5QPB8eroYaxURxqVtylJ0arX7M/KpGYJjZ7ZJ
	tq43ngxZWbelQe3xppx/Z+Cwj01t+qcroBJEnt3Iorgqm2Uxy4sGMuUUxbZdrgmEoNWwzjahH0DUP
	44YNJaPQ5n1pasvhkG6TYIVb8b1cEizPPhatIs4J20jHkIEKb38ctOmpTioAuoOVXIU/3FAbMjoXC
	gAvA9lNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrb1o-003zr2-Ke; Fri, 11 Jun 2021 06:52:28 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrav5-003wke-Pj
 for linux-amlogic@lists.infradead.org; Fri, 11 Jun 2021 06:45:33 +0000
Received: by mail-wr1-f45.google.com with SMTP id z8so4784855wrp.12
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jun 2021 23:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V8J2kKIIJJlnoKpbtxKXrz0z3Hf0aPtOx1h/2JVQKfc=;
 b=wIWadz0YAXxE4jt1Cq9N94gLHlr+IJo9KxploLqVh6GY+ZP26gDtPZLiJMyqz1aYeu
 wl514c/iCoj7/APxBwKqZEIMEkV/3hxogrleIZJ+ijA/eiTjDk+vG4gLBz4MbPmkrv2+
 IYiTxVQIpKZn0//ZXkX40wOIVLaNWF+PBBSgkHOh1iz07RuFf6KULqamJL80b7ngtS1G
 9XTDDzjWaTpU+wrBLbRmry/n3LhEjJNJrzmIMJh4LhNmneniPOyw9Rt5TpMnGjAl3j3q
 jwygHWV2EV49zidr/KUFYM+ciYBACURp2FgMXzy9Xx74wmLT5B2CtK2cnhKL3jA3qe9V
 DM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=V8J2kKIIJJlnoKpbtxKXrz0z3Hf0aPtOx1h/2JVQKfc=;
 b=KtV1Liwf6J39mIp1vYUqo8yIz7ITr5TcJohmjV1RVQhBjQqqtEr98Em/gLnu6X4sW8
 Ks8W7YCzBONhCn5QflJwsVzCsnmNwgIuU5wtjTyAuvIOEcRtCZ9JIIhrTbYk/lc6b1PD
 Wm6r7D6EtJ/O6fNrHQSbDZreRMbSnTs/78OpcfrHQDbUOFMhqpVhnfBJYp+bhP5uKCxK
 bG0kxbKJUGEswST6AHjXPbclwAX0Db06BMdpQ/xa9Avhot13XC95mhxz+MvpnIrYxgJs
 /KiwLkeIJsmWcE9ckxiAG7l8kp34clbeBYsGjuoVORjHr46uCxEz2DgxtV93QzYk44ty
 fRQA==
X-Gm-Message-State: AOAM532I7S0jPCaOHWhr+CP67Xxi/wxhWyoGLYbmnB1E7DiSH6fxUe4A
 pds2EH1NW1fmd5bai3ifqoiyyQ==
X-Google-Smtp-Source: ABdhPJz1fQOM85JtTzpNkp/XZ79x6XkfY/t/ntDUPMR9DCwvEkAq9sNhdGEi57Jj+/zPb+vzYlgNyA==
X-Received: by 2002:a5d:6382:: with SMTP id p2mr2283590wru.338.1623393868296; 
 Thu, 10 Jun 2021 23:44:28 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:bfd6:8f6:b84c:734f?
 ([2a01:e0a:90c:e290:bfd6:8f6:b84c:734f])
 by smtp.gmail.com with ESMTPSA id j131sm12193829wma.40.2021.06.10.23.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 23:44:27 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: vim3: reduce cpu thermal fan trigger
 temperature
To: xieqinick@gmail.com, robh+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com, artem@khadas.com
References: <20210609012849.797576-1-xieqinick@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <11da3ae4-91d4-1e51-c652-e4ad518f13bd@baylibre.com>
Date: Fri, 11 Jun 2021 08:44:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609012849.797576-1-xieqinick@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_234531_883708_D12D10A6 
X-CRM114-Status: GOOD (  18.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Nick,

On 09/06/2021 03:28, xieqinick@gmail.com wrote:
> From: Nick Xie <nick@khadas.com>
> 
> Reduce the MCU FAN trigger temperature from
> 80 degree centigrade to 50 degree centigrade.

Can you add some more rationale to this change ?

> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> index 66d67524b031..a9c34fee91f4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> @@ -256,7 +256,7 @@ &cecb_AO {
>  &cpu_thermal {
>  	trips {
>  		cpu_active: cpu-active {
> -			temperature = <80000>; /* millicelsius */
> +			temperature = <50000>; /* millicelsius */
>  			hysteresis = <2000>; /* millicelsius */
>  			type = "active";
>  		};
> 

With that:
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
