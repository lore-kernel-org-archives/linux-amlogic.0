Return-Path: <SRS0=wai9=PN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE73CC433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Oct 2021 08:20:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BADC60720
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Oct 2021 08:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BADC60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bGkpsfBvNclkL+AwJDGrxm0kc9/6nogrUvEWfd9hV+4=; b=xaUdkQwt2h6bDw6m2Fv8PVi9uu
	/Buftr7RxjQeJbQ8FrnIC/KZSqLa7eOYReSHYkKOqMJF0zZ6rwpaA212yl659dMf+99O4+mcvLPBJ
	ODoP28RjlvUWCy/g2XLWAzaNWEXxXUBrcbz32NDC5nShF5f19LL+1D1tsKACZyD2qvN6FlJjnA9Lp
	7F+An969YKlDvI3ZpfRLl+OU1DYjHv5mAQ0I1QJGdA6G4WoeWLydeob9w+dXP2Y5D9ZhDyiYi1z8L
	8auHhdSVYKkddJNyXWs+NFImRyrnQbu86Sh+HgC5n6qFaQbblqmEzHi+2eGcEYPDzKH9GSCu86F4b
	ZoUpqacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mevD3-00Fljr-Vj; Mon, 25 Oct 2021 08:19:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mevD0-00Flhk-AK
 for linux-amlogic@lists.infradead.org; Mon, 25 Oct 2021 08:19:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id g141so9837475wmg.4
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Oct 2021 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nqdTAd2AAFjUR4/hpb+Hh1HQbpzrMWpG+y0bpTyBHe8=;
 b=0Cqi+hPbwmyD1uI7h/XlBWasSMJzIJA2qUTP7fF5bkIeGXmrTjAISUxahve+FUTKVZ
 0bD091S+Q6o/+ccNucB5aASYR0ZEuEzxumSKMlY6/5unRGz6eV4raUfWFhSGtZiVCEEp
 D9maoN0WKOYAimUURKBKokqbBjl1ZgftPT+WvvT+yfmbXX7RQM8Wnqr4EkoNvoraxK6u
 X9WG+jqPrpcSJrWqrrEs3dZcfOHjTuR97eM8XZg0EKQRu3AnIOD3Rudko6j28ZqiXUPr
 vDkLJWqrv62ECFjIoMtgFJW5H6+Q6LnGBN9hjK+DQRegNvqXl165s0/rqWIOT0dhrgGh
 qbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nqdTAd2AAFjUR4/hpb+Hh1HQbpzrMWpG+y0bpTyBHe8=;
 b=QBmQDI4nGdfNZcjzESTSHwP1nkYfDZ4t1Y+NZlqlovu8cBlw4ITC80Jms8d1sRNrkr
 0EihB4199QiBs/HFOnLgPBcSUv4gtBQ5rii31xRhekrHOsKbfT48OT6WCT2+3b2VR3Uz
 kUDB6Vx232JFAcex0F7yTk/Z5p8SCaSRvbc+oL9mXc0A3FrVwpH45RGDdojWiZO74ELp
 xEcM0TCy15i5fuIbmWcv3kFv0E1fYI4a8v2WoBoyzZCoqLmdOt60sFCaMaNQ5QyZfAKL
 hGEDsGZwAZIoLrd6qR9BWsYyfJF9QeGbxtVyQ51lDICaVuGlW+inPa+PIpu1TjpQR+fv
 /rrw==
X-Gm-Message-State: AOAM531ysJ8KO4eoq2WFlV/0/FJF3MygdPQpIQtgxqqvkJupMMpvMFro
 lbjL3VKOPfYZaN7G3g57K4aRXw==
X-Google-Smtp-Source: ABdhPJwNGa9asu7Z1567HMswCkhmdmuQt831fpZVjam/iHs5lXL5iOHzHOKOePjV5DjCEgETDXqGwg==
X-Received: by 2002:a1c:7208:: with SMTP id n8mr9906308wmc.130.1635149991460; 
 Mon, 25 Oct 2021 01:19:51 -0700 (PDT)
Received: from [172.20.10.7] ([37.166.214.228])
 by smtp.gmail.com with ESMTPSA id o1sm6803044wru.91.2021.10.25.01.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 01:19:50 -0700 (PDT)
Subject: Re: [PATCH 3/4] arm64: dts: amlogic: meson-g12: Fix GPU operating
 point table node name
To: Alexander Stein <alexander.stein@mailbox.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20211023214856.30097-1-alexander.stein@mailbox.org>
 <20211023214856.30097-3-alexander.stein@mailbox.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <fdacca3e-a35f-ac88-8a57-1fa5bb049e68@baylibre.com>
Date: Mon, 25 Oct 2021 10:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214856.30097-3-alexander.stein@mailbox.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_011954_438608_A0AAC0D8 
X-CRM114-Status: GOOD (  20.24  )
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

On 23/10/2021 23:48, Alexander Stein wrote:
> Starting with commit 94274f20f6bf ("dt-bindings: opp: Convert to DT
> schema") the opp node name has a mandatory pattern. This change
> fixes the dtbs_check warning:
> gpu-opp-table: $nodename:0: 'gpu-opp-table' does not match
> '^opp-table(-[a-z0-9]+)?$'
> Put the 'gpu' part at the end to match the pattern.
> 
> Fixes: 916a0edc43f0 ("arm64: dts: amlogic: meson-g12: add the Mali OPP table and use DVFS")
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> Same as with patch 2/4 about the 'Fixes' tag: At the time when
> gpu-opp-table was added there was no schema present. So there was no bug at
> the time of writing. I'm ok either way.
> 
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index ff987e7ccff2..517519e6e87f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -58,7 +58,7 @@ efuse: efuse {
>  		secure-monitor = <&sm>;
>  	};
>  
> -	gpu_opp_table: gpu-opp-table {
> +	gpu_opp_table: opp-table-gpu {
>  		compatible = "operating-points-v2";
>  
>  		opp-124999998 {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
