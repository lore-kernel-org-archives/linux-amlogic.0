Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667D1C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 09:25:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3489620657
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 09:25:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Im/SYVv6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sg0rQeFU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3489620657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zSHMYyi7fT6eMyW0VwstwWzlBKUd2lG7JHR08UucHYc=; b=Im/SYVv6BfhuZwrcQs5pfCgKV
	rERM+f6kqEvDyJSGSDW5GHNaefcO/LuLe5c9AqH18lmPgW1UlI0OVsnq4QAlTd2b3bBGfaFPqY8QD
	k+vGU/hcHI5fz4ahQXTUgSP6DFQMmZjeOms1V2XG+LURQwQZk4CPMJemckjj6lQQ6/jKYA5d3833k
	FvLNilc++k1naiaqjI0XR3lPNOdfAR39o6w+vljRGS1lKZCDkMqwOeiN3TUHwLS/JCwjc2TZRWsi3
	0KtyBHpVLa65w+BiW+Tc+47O9j5vnj+rVb8PO0FQDUZy0nJmwJTxwfX9g7kuRylLc7w+LFhdffCse
	0uvs9pdaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxoWT-0007Wx-1E; Tue, 21 Jul 2020 09:25:17 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxoWO-0007VW-6Y; Tue, 21 Jul 2020 09:25:13 +0000
Received: by mail-lj1-x244.google.com with SMTP id s9so23288320ljm.11;
 Tue, 21 Jul 2020 02:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ze6lJWvJHZbmrt8N27YOntoBu13Av/K4oTVWvmf42EM=;
 b=Sg0rQeFUrG/1Joo1uXLswuZgL8HlliGcFZBnS7LPFBO0yiQa6vpYGNpyG1QVcQ4gjo
 eVUJva/qdPy31j6nav5crh4VtOaDJdkCm5Q8G/eT8G5Y3ehbfx7cGBi/jSJXZm5FMYjT
 XtiyGdwDLA+4nEc7zf+GLmrwEfRtIvSgMi+tktHNmpafTUy7PHes4Z73wLY4o2Oqw9X5
 6UaogLOr9+pp0xHgZ/kUxwoDTR34U3PLocaYUDw7JVhaUXcjcmtQYpCpst/m+f23g3TE
 7tuTllKB2WGle9AHQLNJaZmBA3KPtyPLUiszU0gyA28I79yFWXc6gs4Te4ybM8ZxxhH2
 rULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ze6lJWvJHZbmrt8N27YOntoBu13Av/K4oTVWvmf42EM=;
 b=Hv8Pcku1fjmpQOEAHXt2QEv+MyKB+3Stu9pdXBS1h4Y3GNZDYhtFlytqqNGU/ky0YB
 EXmzhRBtmb6Biwer6qkgwPSUmY2OM2WXBHd4XR0aFhvWArhbRWnZe0QYA6v/PJLNwn60
 Hwhq/svUw+EQ+1tir8xjEI3zfjUL6Vb6cryvw+7a3c/GfjSaBixeAmRPvq6rWzCO8t+1
 i2uimemn/yHvlE7WZq1Ai5bEumd7B6Q8RYsDNlVLZ1nPwATkakshtdzoClNHjuFZ+bKB
 fMQaQIJZ5TpS3e4mWDwmqmEfJWnb2b2YKFxl2VhwiWt2Xasf1GtZLtLHqn0iVYSb1NmK
 e9tQ==
X-Gm-Message-State: AOAM530Pi/Rq0mGq7HeWaAyv6Tu7pcXNU97Y3IZKVk+3CZ++Hz9N+/GS
 htIHNPKLAPfYZhIvOdx7rfr/r3Y4dEpKkfC3P78Jofyz
X-Google-Smtp-Source: ABdhPJyVqq/e5qtdfaM4Pt8zraL2Gu3jDazqIA7Ge6GF1VOUJm15J1RP3WN1Q8JW4PbN5N5rOWnxwOMnPvEAva9XsBw=
X-Received: by 2002:a2e:3602:: with SMTP id d2mr12878639lja.152.1595323509227; 
 Tue, 21 Jul 2020 02:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200719141034.8403-1-christianshewitt@gmail.com>
 <20200719141034.8403-4-christianshewitt@gmail.com>
 <90da2697-9dcc-1d75-eded-bf4bdc4b594b@baylibre.com>
 <fc679db1-be92-c384-0fe2-3b06c920ea75@baylibre.com>
In-Reply-To: <fc679db1-be92-c384-0fe2-3b06c920ea75@baylibre.com>
From: Dongjin Kim <tobetter@gmail.com>
Date: Tue, 21 Jul 2020 18:24:57 +0900
Message-ID: <CADoNuNepjmZgdAVAMM8Y6FA8uL5rd96e5qdn1_HDHKj6Lsnu6A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson: add support for the ODROID-N2+
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_052512_260076_804106AD 
X-CRM114-Status: GOOD (  19.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Dongjin Kim <tobetter@hardkernel.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Can we use "Hardkernel ODROID-N2Plus" instead of "Hardkernel ODROID-N2+"?

Thanks,
Dongjin.



On Tue, Jul 21, 2020 at 5:24 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 21/07/2020 10:10, Neil Armstrong wrote:
> > On 19/07/2020 16:10, Christian Hewitt wrote:
> >> HardKernel ODROID-N2+ uses an Amlogic S922X rev. C chip capable of higher
> >> clock speeds than the original ODROID-N2. Hardkernel supports the big cpu
> >> cluster at 2.4GHz and the little cpu cluster at 2.0GHz. Opp points and
> >> regulator changess are from the HardKernel Linux kernel sources.
> >>
> >> Suggested-by: Dongjin Kim <tobetter@hardkernel.com>
> >> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> >> ---
> >>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
> >>  .../dts/amlogic/meson-g12b-odroid-n2-plus.dts | 53 +++++++++++++++++++
> >>  2 files changed, 54 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> >>
> >> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> >> index 5cac4d1d487d..6dc508b80133 100644
> >> --- a/arch/arm64/boot/dts/amlogic/Makefile
> >> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> >> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
> >>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> >>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
> >>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> >> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
> >>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
> >>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
> >>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
> >> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> >> new file mode 100644
> >> index 000000000000..99e96be509f8
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> >> @@ -0,0 +1,53 @@
> >> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +/*
> >> + * Copyright (c) 2019 BayLibre, SAS
> >> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "meson-g12b-odroid-n2.dtsi"
> >> +
> >> +/ {
> >> +    compatible = "hardkernel,odroid-n2-plus", "amlogic,s922x", "amlogic,g12b";
> >> +    model = "Hardkernel ODROID-N2+";
> >> +
> >> +    vddcpu_a: regulator-vddcpu-a {
> >> +            regulator-min-microvolt = <680000>;
> >> +            regulator-max-microvolt = <1040000>;
> >> +
> >> +            pwms = <&pwm_ab 0 1500 0>;
> >> +    };
> >> +
> >> +    vddcpu_b: regulator-vddcpu-b {
> >> +            regulator-min-microvolt = <680000>;
> >> +            regulator-max-microvolt = <1040000>;
> >> +
> >> +            pwms = <&pwm_AO_cd 1 1500 0>;
> >> +    };
> >> +
> >> +    cpu_opp_table_0: opp-table-0 {
> >> +            opp-1908000000 {
> >> +                    opp-hz = /bits/ 64 <1908000000>;
> >> +                    opp-microvolt = <1030000>;
> >> +            };
> >> +
> >> +            opp-2016000000 {
> >> +                    opp-hz = /bits/ 64 <2016000000>;
> >> +                    opp-microvolt = <1040000>;
> >> +            };
> >> +    };
> >> +
> >> +    cpub_opp_table_1: opp-table-1 {
> >> +            opp-2304000000 {
> >> +                    opp-hz = /bits/ 64 <2304000000>;
> >> +                    opp-microvolt = <1030000>;
> >> +            };
> >> +
> >> +            opp-2400000000 {
> >> +                    opp-hz = /bits/ 64 <2400000000>;
> >> +                    opp-microvolt = <1040000>;
> >> +            };
> >> +    };
> >> +};
> >> +
> >>
> > Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> >
>
> Wait no, it should be:
>
> / {
>         compatible = "hardkernel,odroid-n2-plus", "amlogic,s922x", "amlogic,g12b";
>         model = "Hardkernel ODROID-N2+";
> };
>
> &vddcpu_a {
>         regulator-min-microvolt = <680000>;
>         regulator-max-microvolt = <1040000>;
>
>         pwms = <&pwm_ab 0 1500 0>;
> };
>
> &vddcpu_b {
>         regulator-min-microvolt = <680000>;
>         regulator-max-microvolt = <1040000>;
>
>         pwms = <&pwm_AO_cd 1 1500 0>;
> };
>
> &cpu_opp_table_0 {
>                 opp-1908000000 {
>                 opp-hz = /bits/ 64 <1908000000>;
>                 opp-microvolt = <1030000>;
>         };
>
>         opp-2016000000 {
>                 opp-hz = /bits/ 64 <2016000000>;
>                 opp-microvolt = <1040000>;
>         };
> };
>
> &cpub_opp_table_1 {
>         opp-2304000000 {
>                 opp-hz = /bits/ 64 <2304000000>;
>                 opp-microvolt = <1030000>;
>         };
>
>         opp-2400000000 {
>                 opp-hz = /bits/ 64 <2400000000>;
>                 opp-microvolt = <1040000>;
>         };
> };
>
> Neil
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
