Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552B8C48BEB
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 09:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0Q5NN1J6s9jpaFXSZchvMYIRBwQqOhwxBJzMX4ZDxE=; b=IF94D9CflpD7Pb
	vdGRkHbr3JokQyCWc1wi/W9bZ6Ue63T+fSNS0Yl8iwa2dqF4XUPEQItYk+Bnf+zyXRgMFe39sU4Uf
	RGOD82ZaijEaiGujoh4sSn0RT6n5eY2yAdL3P3TQxx9MFjxX48KllfRc2PE6NtdvcoQt6ahKVAYZT
	3eAqpfFGpIs8sSC30Jwjb7W9mSarCzNxenSYI252gKzo8qCDbR42ndB7o2tEm6PgYKihWr8M4MFOJ
	fnd1jjO6w97spScDx4jY+WAXgHbysO7mKy0xoX0cfAmX8b2oARivnFbEpo4GhCi4AfzL+FNd1ebcu
	IGPGeBtEvQI2y04bu3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5Zp-00000004IIx-1FQd;
	Thu, 22 Feb 2024 09:41:13 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ZR-00000004Hyb-1Mtw
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Feb 2024 09:40:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33d38c9ca5bso2547947f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Feb 2024 01:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708594846; x=1709199646; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=eDfk374ak2aj4U9CiiV0QysDtfpirDyDxvL4BxqbaqM=;
        b=cUPBcwoAn8iMME5CRjixUVUiaCi3lQvt8DII48KSy+rilgrbnXy8H6VCjDNxDYausj
         YXjAj6v+3tnrs3AICuJPXu3eEw7YKW8W4DIcfB7041obO6xjl96plZaOKotaAX829LHl
         AasJujKtNcv1ZyO3y4RApaImZ7VxY0uvlEk66r16N4dHWjgfYwUU84QpDfOvlV0z2Tun
         g8LhqdhmekI8u2RSSZnaCVXf435+D/hdpMIzJ2pFnX54zEDdLnuABF1AWovJK565EQvN
         jbWH7SSQAR8XNpyKZHdKDLIoJk4h640aKnc1y/pyUW8ZYYKUNu/9R9KipX/sdfu59g9m
         c6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594846; x=1709199646;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDfk374ak2aj4U9CiiV0QysDtfpirDyDxvL4BxqbaqM=;
        b=LTJmrFrgwTNnWhcsN3g1276nf03c3nMbc6DTcFyJJ5/Ou5U/apWQkKrkyPHJo+Xz0m
         +2G+QH86o+GqC36dTSot/zIjG610GYujIiDQcw5mkCxheILtmXt/4/h7VOb5z5w6FONF
         +M9bd8QccjnTXfW1HxQEBQh1zZnP4LKxNwZ8iCsDVfbA2a1CNeCr7nfiAgxnUB88zngO
         HIGfy0aYZ4QL1pQ+CloamivivXOOMHBPV/QEskNRjDCWg17Vt77BgzlMvMqiHFB8QpC/
         fe5DJca95CzuZgrTHv4x+4JqO1zEa65AkOnXrbA5n0949xPkQOHMuozHp8G6bbFTEUJ/
         6/6g==
X-Forwarded-Encrypted: i=1; AJvYcCXuIlL2/trN3embXRbFLDLLqWE4JLLVU38bE8CGduljD07mM1uEmkJ0mbyiZm8o995Ar+jba/vzfw89bWlTvfFHcbGCQHzXm4R/knYOofMfi/4=
X-Gm-Message-State: AOJu0Yxw/7m9fc5JO+gaYMACteuGsksjRxFS0yk3T9BaJX5QBNTjj1HH
	Il4pA5yIXjZnX7TmUpqUjk8GZIIb+kToqW4u0jMIH8cSdM3NbDDSeZ+JTJwYnS0=
X-Google-Smtp-Source: AGHT+IG5rkzGOGgFCat5JaFS4ufYwwZ9KH5dC97ai2bBbn/Ybhk9OGrUNxlKouDoMUdjhRCttgQ9Lg==
X-Received: by 2002:adf:fec7:0:b0:33d:6cc0:b884 with SMTP id q7-20020adffec7000000b0033d6cc0b884mr5221035wrs.10.1708594846378;
        Thu, 22 Feb 2024 01:40:46 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:e0f9:f458:9920:7af9])
        by smtp.gmail.com with ESMTPSA id bk30-20020a0560001d9e00b0033cddadde6esm20291902wrb.80.2024.02.22.01.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:40:45 -0800 (PST)
References: <20240222082523.1812-1-greena88@gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Adam Green <greena88@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-g12b-odroid-n2*: Add support for
 overclocking Hardkernel ODROID-N2 boards.
Date: Thu, 22 Feb 2024 10:37:28 +0100
In-reply-to: <20240222082523.1812-1-greena88@gmail.com>
Message-ID: <1j8r3cet0i.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014049_644006_8A48ACC0 
X-CRM114-Status: GOOD (  14.49  )
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


On Thu 22 Feb 2024 at 08:25, Adam Green <greena88@gmail.com> wrote:

> Hardkernel actively supports overclocking these boards in their own
> documentation. (https://wiki.odroid.com/odroid-n2/hardware/overclocking)
>
> This aligns the SoC opps with those in the board vendors bsp source.

Patch title is too long - checkpatch.pl should have given a you warning
for this.

Not sure it is wise support overclocking directly in mainline, not by
default at least. Maybe as an overlay ? even this I'm not too sure.

>
> Signed-off-by: Adam Green <greena88@gmail.com>
> ---
>  .../dts/amlogic/meson-g12b-odroid-n2-plus.dts | 25 +++++++++++++++++++
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 17 +++++++++++++
>  .../dts/amlogic/meson-g12b-odroid-n2l.dts     | 25 +++++++++++++++++++
>  3 files changed, 67 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> index ce1198ad34e4..1731d542a00c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> @@ -15,6 +15,31 @@ / {
>  	model = "Hardkernel ODROID-N2Plus";
>  };
>  
> +&cpu_opp_table_0 {
> +	opp-1908000000 {
> +		opp-hz = /bits/ 64 <1908000000>;
> +		opp-microvolt = <1030000>;
> +	};
> +	opp-2016000000 {
> +		opp-hz = /bits/ 64 <2016000000>;
> +		opp-microvolt = <1040000>;
> +		turbo-mode;
> +	};
> +};
> +
> +&cpub_opp_table_1 {
> +	opp-2304000000 {
> +		opp-hz = /bits/ 64 <2304000000>;
> +		opp-microvolt = <1030000>;
> +		turbo-mode;
> +	};
> +	opp-2400000000 {
> +		opp-hz = /bits/ 64 <2400000000>;
> +		opp-microvolt = <1040000>;
> +		turbo-mode;
> +	};
> +};
> +
>  &vddcpu_a {
>  	regulator-min-microvolt = <680000>;
>  	regulator-max-microvolt = <1040000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> index a198a91259ec..0c71e8bc0124 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> @@ -13,3 +13,20 @@ / {
>  	compatible = "hardkernel,odroid-n2", "amlogic,s922x", "amlogic,g12b";
>  	model = "Hardkernel ODROID-N2";
>  };
> +
> +&cpu_opp_table_0 {
> +	opp-1992000000 {
> +		turbo-mode;
> +	};
> +};
> +
> +&cpub_opp_table_1 {
> +	opp-1908000000 {
> +		turbo-mode;
> +	};
> +	opp-2004000000 {
> +		opp-hz = /bits/ 64 <2004000000>;
> +		opp-microvolt = <1022000>;
> +		turbo-mode;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
> index e26f3e3258e1..b16a69d0cad6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
> @@ -97,6 +97,31 @@ codec {
>  	};
>  };
>  
> +&cpu_opp_table_0 {
> +	opp-1908000000 {
> +		opp-hz = /bits/ 64 <1908000000>;
> +		opp-microvolt = <1030000>;
> +	};
> +	opp-2016000000 {
> +		opp-hz = /bits/ 64 <2016000000>;
> +		opp-microvolt = <1040000>;
> +		turbo-mode;
> +	};
> +};
> +
> +&cpub_opp_table_1 {
> +	opp-2304000000 {
> +		opp-hz = /bits/ 64 <2304000000>;
> +		opp-microvolt = <1030000>;
> +		turbo-mode;
> +	};
> +	opp-2400000000 {
> +		opp-hz = /bits/ 64 <2400000000>;
> +		opp-microvolt = <1040000>;
> +		turbo-mode;
> +	};
> +};
> +
>  &eth_phy {
>  	status = "disabled";
>  };


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
