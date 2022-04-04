Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30615C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 07:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywbVdkR96RoxYmKrMaX+4oaCgbCpUaMdAMOU26PKYLE=; b=P3nPVOU4igfpXZk4rMA0C2wh+Q
	ROsAelDrJr3A7JP+/Qik4M5TbzsB7NfYPLqE+r0WOpi2jT6D/Ea6L7lkjLnnO5VxaVAmyxYW+mXkd
	7sxi7RR1gUQWgnkF1ZrbdBV4XoYRZHEx7ap3vKNwFcRIrdk7NaIOSaVxXNOFUTk0LD5cs8229SAyi
	ce7D4B/m7s6Yxi/UpFhmnzBj8W9MML9t7aN9M8U17E1ZZBlEG2DAGfEvsNYWrFYSnEozuQP1aZfMH
	erbmd7Pfg0TBqRSYbUT+1nagEme1vMBBzEeBYooyV8tDDaT8S236ZoKT+DD7r2cWimDF3UMWN87uN
	8qDTeqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHU9-00Dgjf-IF; Mon, 04 Apr 2022 07:50:49 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHU3-00Dggx-IA
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 07:50:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id w4so13060500wrg.12
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Apr 2022 00:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=CVOw/LnzR+FU3Wl5ZYv0rtjB0R73JkKUrPjFPYHJa+k=;
 b=C3LFox7eE6dCp7eKT1/ySVqfeBAwlHmOr0wnCj4BjQtUusIomrrRsNuWhRlewdgW6g
 T7i0eyLqpTwupDf295JlqdxJqkVPEW/uixETapJQwfHB6ocEXYbA9CY6noSPlJihQfQV
 9WL1K+IGfG2/hc4IhNdLzqf7DLtz8r7Qfq5Gi0P+iaUcpmq/kHX4BwaDrIte4p3iQ3I3
 pdV2QqdEqmwrNR1bnJxN4et1gWG29konh4QssyGchU+l3/PXaDeAZ4SRsSsdk0wtWxuX
 au3dEGTNaTXQfoqNI6czKs6ZNwvhTE98j2NhLgHAPuD3BbFx7bhR1MLqC/o4VUa9PfYp
 /DOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CVOw/LnzR+FU3Wl5ZYv0rtjB0R73JkKUrPjFPYHJa+k=;
 b=wf1imWkzQiK8KpI52xsjq2CK9tS7KI4Dgs4PSNfysMeWpov+0+clSLeA3WWtBNTWNy
 Frj7Gs1ghRcflV96XOvqZHlDWWZB7SHCWa07LK8M1L3OBoWIpuXzkZyua+a6xQM4wwAx
 MjVFPqs/pbrW7sZrLqQHOkA5Wt9R4KgZ/ZV3wSj1JskYjZ4uIqc3rgu+8C0yQubqO2gn
 g4PyLmknbV2EqwrYxAIZujg1NNkaJ/ufszKoXYBlYDRsNLu1RMYTNcDWCTnedwBnx3Qx
 RwTlRecqYHstvCb/hmqE30Z7Y+KSTSwf1Dg3QnvILWRMLySCGHxe/KhXRgE7tDGM/acP
 IMBg==
X-Gm-Message-State: AOAM532M6IWvRMJSwLFkKEy8Pv0KfysbjWXRQrNaMaE5K+8u44ZvmxcG
 ykphzLI1XZ1a38PxoRp1WhdZyBcwO9VuR46l
X-Google-Smtp-Source: ABdhPJw6n7rlU6gSwNroZmpobyR6C2fXEEog4wsvWJs4pRqrcPYltbz1802lWVLzbcF/oLhax9QTow==
X-Received: by 2002:adf:e2cb:0:b0:203:7564:1076 with SMTP id
 d11-20020adfe2cb000000b0020375641076mr16279951wrj.199.1649058638174; 
 Mon, 04 Apr 2022 00:50:38 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1add:1b28:2457:eb46?
 ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a5d6da7000000b00203d9d1875bsm9526826wrs.73.2022.04.04.00.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 00:50:37 -0700 (PDT)
Message-ID: <ccc45d36-0c87-742c-4105-56820b058040@baylibre.com>
Date: Mon, 4 Apr 2022 09:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] arm64: dts: meson: remove CPU opps below 1GHz for
 SM1 boards
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220210100638.19130-1-christianshewitt@gmail.com>
 <20220210100638.19130-3-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220210100638.19130-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_005043_658527_5E4AEB40 
X-CRM114-Status: GOOD (  15.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/02/2022 11:06, Christian Hewitt wrote:
> Amlogic SM1 devices experience CPU stalls and random board wedges when
> the system idles and CPU cores clock down to lower opp points. Recent
> vendor kernels include a change to remove 100-250MHz and other distro
> sources also remove the 500/667MHz points. Unless all 100-667Mhz opps
> are removed or the CPU governor forced to performance stalls are still
> observed, so let's remove them to improve stability and uptime.
> 
> Fixes: 3d9e76483049 ("arm64: dts: meson-sm1-sei610: enable DVFS")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 20 --------------------
>   1 file changed, 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 3c07a89bfd27..80737731af3f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -95,26 +95,6 @@
>   		compatible = "operating-points-v2";
>   		opp-shared;
>   
> -		opp-100000000 {
> -			opp-hz = /bits/ 64 <100000000>;
> -			opp-microvolt = <730000>;
> -		};
> -
> -		opp-250000000 {
> -			opp-hz = /bits/ 64 <250000000>;
> -			opp-microvolt = <730000>;
> -		};
> -
> -		opp-500000000 {
> -			opp-hz = /bits/ 64 <500000000>;
> -			opp-microvolt = <730000>;
> -		};
> -
> -		opp-667000000 {
> -			opp-hz = /bits/ 64 <666666666>;
> -			opp-microvolt = <750000>;
> -		};
> -
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <770000>;

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
