Return-Path: <SRS0=S6c6=2B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822DAC43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 09:43:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 560D1205C9
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 09:43:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iaK74P0B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BEiRXRNt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 560D1205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uCoytkvj8+PdyzMvtHnmjciZvpHd9gtPVXfQRLI5yVo=; b=iaK74P0BZQ+as9KhzsVbHsb91B
	Zk6yqWYSJhsYI//jjFc5Qw8LHNjuBg91ORPPIf9boKb22qw6KibQ/9YP5eDeuuqc9W2GadjNRjUPp
	k3XJDK/icXLILW0YgVgrzkEe9kVuzwC9AvIxoX+n+8sQAa6iF/5PKsWq4OmwOW8WoQwpFxkD0JT+c
	Bpw2BYFwe0F+/vvkqsEShaa04F78B3pUkU818KnEWsHCcYwDIrL6ltBS64LwXCFnw5AXsvMGf9j6l
	XG3UM/eCV7bA1NzhYZEA1C6tHQfdqnS1l34YG4pz2Rs6TUAv+6jNgV/oXhHFMPCPiXS65yRKHhAMt
	a5NH01ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieyWq-0001VI-2O; Wed, 11 Dec 2019 09:43:32 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieyWn-0001Ua-Cp
 for linux-amlogic@lists.infradead.org; Wed, 11 Dec 2019 09:43:31 +0000
Received: by mail-wr1-x444.google.com with SMTP id b6so23291453wrq.0
 for <linux-amlogic@lists.infradead.org>; Wed, 11 Dec 2019 01:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=z0QzLt7cguGjhYkQBQHVG6HhXU8NuMmHzTVdwtHS9ig=;
 b=BEiRXRNtnIBFjpCSBExLUGZx1Pa6SKsAtXeeJLD6W0NIrioRnhtiOEgMsi4ugdJ3zp
 QSz4GgMNADAajE9pqGigE9t7kXg8yQJn8TM4iG5K2aCTnKRPwWn7UTEzF3a77XnBSxgT
 9JE2grqONb42g6IFklDtyXxlEtrbdRdAQZkRTkXN+VULb9YNs4MsFIzC1v9S1at2bASB
 w6qdaGWc8SDPWo1Uk4S+4IxaK3s0DW4T8dtMxPlBlLziHdeozq+skjRn3dptiBgKm96t
 ffDDrYpcOA+HKEZEcdgbMK2sJwZJ0KEZk3T/SHXU7aCp3kncTv3eIfsNdJZUNiGiuJXO
 +QoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=z0QzLt7cguGjhYkQBQHVG6HhXU8NuMmHzTVdwtHS9ig=;
 b=aMdsD4O+smdVreKD6e45tyxUuhAKBrC1U+aoEUxbACgCEU7osdmKkMzLS2MdZzpjCO
 bzCyBAYPXj7G17iTiJPTkit8eUSqdN0MM6yoPyRBwSZjObxnUUBAksTNKq/FOcoaRbix
 YEDYeQS49TQYHdIw18NLuQ4L5s+yCCp/EJofG9bcxROjOV+nviGcTTLExVqlFrND6FTO
 IMzDXrDaigu1T4Q26WaalGJjjGyQ2Wn+tG5hl3Pj6uTczxKyxnDyAx0yNFJu/cRBHg7P
 GbemBYn6AMIQUF05DwTuFk1hcxhppnbYMrxjCMdgTbUyl4EeDOqtx+u4z01eNX7KGUTp
 c5Ew==
X-Gm-Message-State: APjAAAUrRmPXO+tSzVY6PDuefcNuYDfBoMjXoF+gaxyGixhO2Ar/s9i1
 dLojcr6fLDae6oxWTnqgr5ifRA==
X-Google-Smtp-Source: APXvYqyRpPjVZqQ6wK30FYYM+9G40xoHiGPwj/gyIyeDl0yqTe5vb7IVvt4aDak5sZieLFEduj9Sog==
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr2843035wrp.2.1576057407844;
 Wed, 11 Dec 2019 01:43:27 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s25sm1586444wmh.4.2019.12.11.01.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 01:43:27 -0800 (PST)
References: <20191211070835.83489-1-jian.hu@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: add A1 periphs and PLL clock nodes
In-reply-to: <20191211070835.83489-1-jian.hu@amlogic.com>
Date: Wed, 11 Dec 2019 10:43:26 +0100
Message-ID: <1jimmnkxj5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_014329_438694_CFB297F1 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Chandle Zou <chandle.zou@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 11 Dec 2019 at 08:08, Jian Hu <jian.hu@amlogic.com> wrote:

> Add A1 periphs and PLL clock controller nodes, Some clocks
> in periphs controller are the parents of PLL clocks, Meanwhile
> some clocks in PLL controller are those of periphs clocks.
> They rely on each other.

> Compared with the previous series,
> the register region is only for the clock. So syscon is not
> used in A1.

Again, while this is valuable information for the maintainer to keep up,
it is not something that should appear in the commit description.

The evolution of your commit should be described after the '---'

Also, this obviously depends on another series. It should be mentioned
accordingly

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 26 +++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index 7210ad049d1d..de43a010fa6e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -5,6 +5,8 @@
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/a1-pll-clkc.h>
> +#include <dt-bindings/clock/a1-clkc.h>

When possible, please order the includes alpha-numerically

>  
>  / {
>  	compatible = "amlogic,a1";
> @@ -74,6 +76,30 @@
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x1000000>;
>  
> +			clkc_periphs: periphs-clock-controller@800 {
                                             ^
From DT spec: "The name of a node should be somewhat generic, reflecting
the function of the device and not its precise programming model."

Here, an appropriate node name would be "clock-controller", not
"periphs-clock-controller"

> +				compatible = "amlogic,a1-periphs-clkc";
> +				#clock-cells = <1>;
> +				reg = <0 0x800 0 0x104>;
> +				clocks = <&clkc_pll CLKID_FCLK_DIV2>,
> +					<&clkc_pll CLKID_FCLK_DIV3>,
> +					<&clkc_pll CLKID_FCLK_DIV5>,
> +					<&clkc_pll CLKID_FCLK_DIV7>,
> +					<&clkc_pll CLKID_HIFI_PLL>,
> +					<&xtal>;
> +				clock-names = "fclk_div2", "fclk_div3",
> +					"fclk_div5", "fclk_div7",
> +					"hifi_pll", "xtal";
> +			};
> +
> +			clkc_pll: pll-clock-controller@7c80 {

Please order nodes by address when they have one.
This clock controller should appear after the uarts

> +				compatible = "amlogic,a1-pll-clkc";
> +				#clock-cells = <1>;
> +				reg = <0 0x7c80 0 0x21c>;
> +				clocks = <&clkc_periphs CLKID_XTAL_FIXPLL>,
> +					<&clkc_periphs CLKID_XTAL_HIFIPLL>;
> +				clock-names = "xtal_fixpll", "xtal_hifipll";
> +			};
> +
>  			uart_AO: serial@1c00 {
>  				compatible = "amlogic,meson-gx-uart",
>  					     "amlogic,meson-ao-uart";


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
