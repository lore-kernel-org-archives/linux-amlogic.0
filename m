Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83190C43444
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 13:57:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54CE120675
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 13:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iDyX39+k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YL38T6hK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54CE120675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FaY6y76Z/ADAOo0E1g9HOjGQdXkkOmhJXdruwhX2N4=; b=iDyX39+kW/zLxA
	NtN+bZMMIIBRyime6QDwQ9S5uk2UjeIHUdDJgHVB/NFK4Z7ZfnLpS2PXgAQaFZHLTMujIjuVYGIeF
	CVQAE0+hhYBDLfj22SB3hp5wILm+WPDSXaD+m1HXgOz+FJ8DKeDGtTLhh5HwvGn2Sea9Oj1XAo5rT
	D38xK/WzkrRho0Odqz67tMoBB3Y9RoA7L87D1l2sFbfr7ZSOz1CXy6X5NLvOwy28U4bw4RbFUeCtj
	BoE5upFXIoyY0wDxn6zrvpsbzhI72FqhvbBs7wybGs5SoyXpj7UZ52j/f+OwyefbeJKn+UxIQSmrV
	UU8YBZFnoqPjOx5fqTcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghxJS-00027L-A2; Fri, 11 Jan 2019 13:57:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghxJP-00026j-EU; Fri, 11 Jan 2019 13:57:28 +0000
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A632C2184A;
 Fri, 11 Jan 2019 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547215046;
 bh=m0Xsc6Ix/Cy38LGIhqMpzZ30ovr3Vnh/krJy6wr6dEY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YL38T6hKO8ZrGZ24G3n6QaQ+KXDjo3QMwsGMc+tMqDb3qhladAFeogIwf1VTOmu0D
 7hMnwqAKMi+F2o9qa2boEK3+dH/bA7TnekyJyXavGuJUrFOz7eq3y+vx2S9lERDt+3
 vVaRyHnIhuLqaLrW8Kh2VTWIbGCzk82SYqm3p/Yk=
Received: by mail-qt1-f171.google.com with SMTP id i7so18848799qtj.10;
 Fri, 11 Jan 2019 05:57:26 -0800 (PST)
X-Gm-Message-State: AJcUukeuP9oDyPQvQ/xmqEbiQRK6n7Njcxo670V3ASW5eWX5gI5YbrPA
 LD1l65F7d/85oEJyzE/tcII6A6P2qEEbD0smuQ==
X-Google-Smtp-Source: ALg8bN5FRyqTcibbgPPE8vr5AFsY7vz7Kfn8LsBuLCdmNtI0z8f7l4m/ozrk47sNSn6ULoHdMxsSckEinoZ7afMfqHo=
X-Received: by 2002:ac8:2d2b:: with SMTP id n40mr13326310qta.38.1547215044694; 
 Fri, 11 Jan 2019 05:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20190109202934.29304-1-robh@kernel.org>
 <20190110144537.p5setcurwu6bwrtl@rric.localdomain>
In-Reply-To: <20190110144537.p5setcurwu6bwrtl@rric.localdomain>
From: Rob Herring <robh@kernel.org>
Date: Fri, 11 Jan 2019 07:57:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKMYY5RsCjzp4eMnW0YrohcqwmhVj0hfUEVrbGJEFx05w@mail.gmail.com>
Message-ID: <CAL_JsqKMYY5RsCjzp4eMnW0YrohcqwmhVj0hfUEVrbGJEFx05w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
To: "Richter, Robert" <Robert.Richter@cavium.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_055727_521215_EBA295BE 
X-CRM114-Status: GOOD (  21.10  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, David Brown <david.brown@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Wei Xu <xuwei5@hisilicon.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "Nair,
 Jayachandran" <Jayachandran.Nair@cavium.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, "arm@kernel.org" <arm@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Baolin Wang <baolin.wang@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Orson Zhai <orsonzhai@gmail.com>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Simon Horman <horms@verge.net.au>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Will Deacon <will.deacon@arm.com>, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chanho Min <chanho.min@lge.com>,
 Duc Dang <dhdang@apm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Kukjin Kim <kgene@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Jun Nie <jun.nie@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 10, 2019 at 8:18 PM Richter, Robert
<Robert.Richter@cavium.com> wrote:
>
> Rob,
>
> On 09.01.19 14:29:34, Rob Herring wrote:
> > External Email
> >
> > The 'arm,armv8' compatible string is only for software models. It adds
> > little value otherwise and is inconsistently used as a fallback on some
> > platforms. Remove it from those platforms.
> >
> > This fixes warnings generated by the DT schema.
> >
> > Reported-by: Michal Simek <michal.simek@xilinx.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Will Deacon <will.deacon@arm.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > armsoc folks, Please apply directly.
>
> > diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> > index ff5c4c47b22b..c616132f7d6d 100644
> > --- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> > +++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> > @@ -27,28 +27,28 @@
> >
> >                 cpu@0 {
> >                         device_type = "cpu";
> > -                       compatible = "cavium,thunder2", "brcm,vulcan", "arm,armv8";
> > +                       compatible = "cavium,thunder2";
>
> We are just checking if removing the "brcm,vulcan" string has any
> impact on early silicon revisions we want to support (see also
> BRCM_CPU_PART_VULCAN).
>
> Maybe you make this a separate change?

Dropping brcm,vulcan was unintentional (regex fail). Though keeping it
means we need a schema change as it was not documented to be a
fallback.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
