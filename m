Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72DAD3ABF8
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Dec 2025 07:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksz0Gg1jqwelQXBEbWorADR7xgJYZ7eW2QpS9Zj1LiI=; b=je3gpMpndDg/Lz
	7rGR4Y1gKACXtY35lNzhcW0iOfejjSySn3cowZ4Dg1okhq3hroPYswcWhaN4ItxmzB5gVCJiuG4Ns
	MArVG5mahktkz3zeQMBMt5hpYA4abCJ1e41/cuDKirlT+72OHgLZbboEoFvP2IClxJx/esZ8FStUc
	74O59mHGlOvpHHJO4CiiDeLTO93qlEbIc/GasW3DZ5pkI+Tnxz8YHayvG+UU/joQyLTmoEK8hxwu2
	U4fi9B34IHyRfnAW73muFhnQbTjGhGIfZR/z5xG1IUefbAPzp9xY4WJuZHfx0EbzDM/ymHQ7kxJQi
	P6y8gipBQxMjxY+GcCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRmTt-0000000Ahwv-2DPv;
	Sat, 06 Dec 2025 07:13:25 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRmTq-0000000AhwC-1IzN
	for linux-amlogic@lists.infradead.org;
	Sat, 06 Dec 2025 07:13:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso5775463a12.0
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Dec 2025 23:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765005200; x=1765610000; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F6O9y5Z+AdkoL+Tm0wkCr7cebT9+l7JoZ+wcqNIg4NU=;
        b=Iwp5fEu4MGdQDhn3Gofbzmge6A2h6HtcdIv07NPHn7sunri/G/+muzE1sbadSfK9oZ
         umoVC6yiuKKQZtFglKhzv+jJXeYzuC+FFAakrsDtD/qfV4LDsvSiSSlBZKdMbWfVoxfT
         myQBv9sAIK0LVA8zKExDwUeJc7DRH8L5wyYMrt9o30a7PJ8hupPQviKcOgsihcc+sNjk
         ze4jnPtgkUktzU6lkHj2QBqYfguM9Xp8VqZPjZ6UL5qgesmXOhD9WR+IsZE3BlmqdSyM
         fA+TZeRxMCtTN1MpIccoAnU6FNi75tD5QJJn0Jo8abBDwJj/txGnbiPnVenHg+YjTxj5
         E0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765005200; x=1765610000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6O9y5Z+AdkoL+Tm0wkCr7cebT9+l7JoZ+wcqNIg4NU=;
        b=I/EzpAA5YUUSIk8tnpxHPdRC5F1Yx+BNi+uK7cda7+OH45kTOgOOD8xj1IbK4DaZ2c
         kTmQsSILDaXMZLAfcwYZCsCq56BAoW0asPC1jGJOTpS5gA9Y47kPe8Xzx1xXskLbvGYX
         SmT6lQ9boxUO+PEh1p8Y2pYFJDIMNgs7vtwEuyIlYgsFwS1WUi0EPqkg2XY3xwOVkM3E
         X0E696vOomJQwZubheHw6clSqM1HceykHTQigL/YELVeJMB+Q1nHFb0a1875rktUykTO
         ETGGyd/g285f+gqdWLOwQFO1N7QTSr1hFK2fDKH3Sua0TUIhwg4TW6Fijblx9WefETuD
         Dopg==
X-Forwarded-Encrypted: i=1; AJvYcCX+xbEXrCBWR9b+HKrFsdRS+6u8pCfZ7pTyhFwbxJBR+o5lLKhxhHkhfnvkF5bURuSI2S2f3XY9BTefglbE@lists.infradead.org
X-Gm-Message-State: AOJu0YyPq06/tCDjBImjFtiON5Crv5F1hYskrPobzNtNGYjs4LVz/egT
	mDXcXKMfZVrgm/2VjI1mIqzxTtT6hVGm2aDxHmUf68UGVSeEe8aroXQ4d2Oq2YGHKv684u83Ndj
	6go8QvmtwYcfJZ+uJQmdY4izaq+GvbVQ=
X-Gm-Gg: ASbGncv+NkToUC4JrAPAQF2YC4yf08iIxvSjawniNX4ut+au29xrhRSVmG6/h1ehYtV
	QGcaie89TYlfEqMCvn9vyRgkqSVi4f3BFXEdss3x0yUxtvVkpYpDFxjIq5S8us5nhV6+YvPFkaU
	0/Pls8Ua2ftgKRNLRM1Q/Xfp0z+jUbfOzQqGD7qHfvLHlK05DNXgvgQWrHLGbvhflj71XoXfe7c
	Zyn+MdtstsxqofTDl3meZR9i2A4h5+cY7pOy/uBA8BumpoCOyDXEBNI3fniv/qptuz6Yw==
X-Google-Smtp-Source: AGHT+IGwqPkGdPum0faeStLtu2ktwCeeXpdd/Gr8bwvAvPpRB4dJntX84+9feZ0xNyk77ATtUZIZiKkj4xtUXhaRTNE=
X-Received: by 2002:a05:6402:26c8:b0:649:19bf:bba2 with SMTP id
 4fb4d7f45d1cf-64919bfc0d5mr1360036a12.17.1765005199541; Fri, 05 Dec 2025
 23:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
In-Reply-To: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 6 Dec 2025 12:43:03 +0530
X-Gm-Features: AQt7F2p5UjYlgHBMh4GKU7Y8S9VjvIpYJkR0ez5ZYJAnsWIvHhN0798bvgLMxKg
Message-ID: <CANAwSgSqHR1kYxo8SaHcBfq=eij_YmVAidy8M+h1dFeK2nz1ug@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12b: Fix L2 cache reference
 for S922X CPUs
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_231322_359043_093BB4D0 
X-CRM114-Status: GOOD (  16.24  )
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

Hi Guillaume,

On Sun, 23 Nov 2025 at 22:44, Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> The original addition of cache information for the Amlogic S922X SoC
> used the wrong next-level cache node for CPU cores 100 and 101,
> incorrectly referencing `l2_cache_l`. These cores actually belong to
> the big cluster and should reference `l2_cache_b`. Update the device
> tree accordingly.
>
> Fixes: e7f85e6c155a ("arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC")
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> index f04efa828256..23358d94844c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> @@ -87,7 +87,7 @@ cpu100: cpu@100 {
>                         i-cache-line-size = <32>;
>                         i-cache-size = <0x8000>;
>                         i-cache-sets = <32>;
> -                       next-level-cache = <&l2_cache_l>;
> +                       next-level-cache = <&l2_cache_b>;
>                         #cooling-cells = <2>;
>                 };
>
> @@ -103,7 +103,7 @@ cpu101: cpu@101 {
>                         i-cache-line-size = <32>;
>                         i-cache-size = <0x8000>;
>                         i-cache-sets = <32>;
> -                       next-level-cache = <&l2_cache_l>;
> +                       next-level-cache = <&l2_cache_b>;
>                         #cooling-cells = <2>;
>                 };
>
>
> ---
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
> change-id: 20251123-fixkhadas-c84da7d7c47c
>
> Best regards,
> --
> Guillaume La Roque <glaroque@baylibre.com>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
