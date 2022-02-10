Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE498C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/KzAdKfnzKgVqS1GPpqvUg5EEUaXnNlctTqeHjqYuQ=; b=y4jJWtwNkCp2NXCXKMmClf6k7E
	9uhUVT5hmdn39zQGp6bugdFQbaGTFor+JSuObj3VTb5gy9ET2sBb5q06p3GGaxD1m3thVNpPe18L2
	tSITcyCNT7WfVKQN8BAcbkUo/GyhpFqAxw5ZSQubGxTtkMzo99jwXoasG5597c96LI8pVP/8t0QGe
	j/mPkg/uqYAp+4bZ6R9hibTbXlNcgghz4ErRwkJJVygOfKRcVUGZU02U0MPxUI1RAoCYnPdLT2Me8
	BY6ky3dgWOijjBormeYjzfhn7BJ1ULoqsDBh5peIhdOh6VIjWZ62g1HKwa5D9DvYfYiEwVAflzf8/
	m19Rr9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI5qi-003Inb-Db; Thu, 10 Feb 2022 09:34:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI5qO-003If8-Az
 for linux-amlogic@lists.infradead.org; Thu, 10 Feb 2022 09:34:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id f17so8477184wrx.1
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Feb 2022 01:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=vxX/8zifzyFYTCAPgNpbL+1rDLu/Md5JII8F66Zcgtc=;
 b=3teWvtZsSrrrJESfa7vF84YVSNgwtbUY1wIxqDcxH7iwMzjyUo7p53oOAmoVaoU16Z
 PNYf0YZYqECGJy9F+jVXYcFQUXw4TQHFfMmGiW7tNlJDLpsmdH3jB6zD7sJmfbhd83P6
 drQlHE49cvvnBsEV1WSg6/Icx1q/hJGe5tdBMw4rCVW9kNaendOZHVDH0gmcHNXuYJPu
 qYfG/tB6X9LQt/hZMzQ+fvWIe2x5MKtPwuRZX6sMAF955nWKFbYPXo4oDIyuEXUYZjwj
 +8MoWdFO915oyshOm66cayioydZbsisHdtBm2//hBtdV/nAprEYGD0PeOQytScSehht9
 7Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vxX/8zifzyFYTCAPgNpbL+1rDLu/Md5JII8F66Zcgtc=;
 b=YhlLoeNywWFDQNZ5jkrE7mmdT+qao8EWXNuoEugZiOfFZta/yCtnZKUE5gPsNUeD86
 btfzlV0bsyY8WUdCRx6a7ZLg2YGosTjZ6zOPI//zd02NXaF+fhquVfwG+dpJ4j272wP/
 K4E8J1eEjwozYoKh1K0AFpWpSWivLrAMT6nawfdDRZ8Wrh2tJ43ucxree90wkOHlYtp5
 ewZ/0Z+KnVzNEGQtKxKQYfYvnjSARs4EXW7L2EMYvK25JBZmyWlR6vhmnUZkeMCuH6RG
 PEDRCe57fYYpC9qRn/DsLbGQv/lLmqwwgouhnpLgjVSSEpZ/7Uwx4/+lDdQR8RQXKr0x
 W4Pw==
X-Gm-Message-State: AOAM531Du91TqHRgBIeX6kE5eUTRt7le1uYBhmT0GZ6yK7WRHQCwENJX
 AaBkU81tjLIuKLPNTnCi64UHKw==
X-Google-Smtp-Source: ABdhPJwYmf/xTj+0L3TetNb2WBvO7oJeJgkuCVLbksq3xzAoCbJ6xmnGlCzlqQsuDz7mn0tMnK3fMg==
X-Received: by 2002:a05:6000:16cc:: with SMTP id
 h12mr5547466wrf.408.1644485666342; 
 Thu, 10 Feb 2022 01:34:26 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:76d9:bf0e:e516:58a9?
 ([2001:861:44c0:66c0:76d9:bf0e:e516:58a9])
 by smtp.gmail.com with ESMTPSA id a15sm7522310wri.22.2022.02.10.01.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 01:34:25 -0800 (PST)
Message-ID: <98acfb7c-59bc-e437-899f-4f1eda0fea0b@baylibre.com>
Date: Thu, 10 Feb 2022 10:34:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: meson: remove CPU opps below 1GHz for G12B/SM1
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220209135535.29547-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220209135535.29547-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_013428_485773_EAE76895 
X-CRM114-Status: GOOD (  20.92  )
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

On 09/02/2022 14:55, Christian Hewitt wrote:
> Amlogic G12B and SM1 devices experience CPU stalls and random board
> wedges when the system idles and CPU cores clock down to lower opp
> points. Recent vendor kernels include a change to remove 100-250MHz
> (with no explanation) [0] but other downstream sources also remove
> the 500/667MHz points (also with no explanation). Unless 100-667Mhz
> opps are removed or the CPU governor forced to performance, stalls
> are observed, so let's remove them an improve stability/uptime.
> 
> [0] https://github.com/khadas/linux/commit/20e237a4fe9f0302370e24950cb1416e038eee03
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> Numerous people have experienced this issue and I have tested with
> only the low opp-points removed and numerous voltage tweaks: but it
> makes no difference. With the opp points present an Odroid N2 or
> Khadas VIM3 reliably drop off my network after being left idling
> overnight with UART showing a CPU stall splat. With the opp points
> removed I see weeks of uninterupted uptime. It's beyond my skills
> to research what the cause of the stalls might be, but if anyone
> ever figures it out we can always restore things. NB: This issue
> is not too widely reported in forums, but that's largely because
> most of the Amlogic supporting distros have been including this
> change picked from my kernel patchset for some time.
> 
>   .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 40 -------------------
>   .../boot/dts/amlogic/meson-g12b-s922x.dtsi    | 40 -------------------
>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    | 20 ----------
>   3 files changed, 100 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> index d61f43052a34..8e9ad1e51d66 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> @@ -11,26 +11,6 @@
>   		compatible = "operating-points-v2";
>   		opp-shared;
>   
> -		opp-100000000 {
> -			opp-hz = /bits/ 64 <100000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-250000000 {
> -			opp-hz = /bits/ 64 <250000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-500000000 {
> -			opp-hz = /bits/ 64 <500000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-667000000 {
> -			opp-hz = /bits/ 64 <667000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <761000>;
> @@ -71,26 +51,6 @@
>   		compatible = "operating-points-v2";
>   		opp-shared;
>   
> -		opp-100000000 {
> -			opp-hz = /bits/ 64 <100000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-250000000 {
> -			opp-hz = /bits/ 64 <250000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-500000000 {
> -			opp-hz = /bits/ 64 <500000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-667000000 {
> -			opp-hz = /bits/ 64 <667000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <731000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> index 1e5d0ee5d541..44c23c984034 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> @@ -11,26 +11,6 @@
>   		compatible = "operating-points-v2";
>   		opp-shared;
>   
> -		opp-100000000 {
> -			opp-hz = /bits/ 64 <100000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-250000000 {
> -			opp-hz = /bits/ 64 <250000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-500000000 {
> -			opp-hz = /bits/ 64 <500000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-667000000 {
> -			opp-hz = /bits/ 64 <667000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <731000>;
> @@ -76,26 +56,6 @@
>   		compatible = "operating-points-v2";
>   		opp-shared;
>   
> -		opp-100000000 {
> -			opp-hz = /bits/ 64 <100000000>;
> -			opp-microvolt = <751000>;
> -		};
> -
> -		opp-250000000 {
> -			opp-hz = /bits/ 64 <250000000>;
> -			opp-microvolt = <751000>;
> -		};
> -
> -		opp-500000000 {
> -			opp-hz = /bits/ 64 <500000000>;
> -			opp-microvolt = <751000>;
> -		};
> -
> -		opp-667000000 {
> -			opp-hz = /bits/ 64 <667000000>;
> -			opp-microvolt = <751000>;
> -		};
> -
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <771000>;
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

Can you find if an acceptable set of Fixes tag can be added to permit backporting to the current LTS kernels ?

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
