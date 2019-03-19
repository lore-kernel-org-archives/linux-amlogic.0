Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E052CC10F03
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:22:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A37D22085A
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tcKdEEuN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mB5mkRew"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A37D22085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ifY3VPHNvqOlu2m3nTt3slbYqzcQ2HMEhE42NHoL1Y=; b=tcKdEEuN/l1Wve
	HgysAQYYy/7mm9HyoCcqQMh1boWCADZdoRhtbzzxwP8yOWAgcY2PWR1G2spnVHf9v2RD6YzZr6iFH
	d5cb6SZfR72MI95wzpxZLrGJXz0au7juAx9387OIs2IXtEHbXYeCwXNuwLZsMYazbpLXNfVXtwwYf
	JWmWGNzIUTR8lvUOGzB8bLRmGkUMpbMxOOSJOY3a9LxNoiTmWmYTGf8EzVb2TkNOybPBO5JPt9PZ2
	OLkXlX6axjZVrA654TXC9HOmQBqjyYnb9IszKoLMgAkLyz6cGp8eQi7ytHuPGGXiO5xYQMFF7UdzM
	g4XqidiH1ymE2mpyRcBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6MBo-0006Ze-Jz; Tue, 19 Mar 2019 21:22:28 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6MBl-0006ZG-Ph; Tue, 19 Mar 2019 21:22:27 +0000
Received: by mail-ot1-x344.google.com with SMTP id i12so149956otp.12;
 Tue, 19 Mar 2019 14:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MNwiVpfGk3bQ+Y9AQVFuLEbxJUByoleMAgYrrdgJDFI=;
 b=mB5mkRewGL+QRfO4aAS+ve+CCjVFvHGLZMC0ybgF3XAPaQ3lt0dLdqT2+vSc/AwcFV
 ko6jd+dlRmwkov6aUaAVkcMX9yY/bmng3kDoxG3xdlN3HrWixn8VklMt9eDAq0SVXHd5
 dxrL9CIcwR3AYZ5fv30MvsaT9EF04BFZBKELmFaXpfyq/yiK1KabvgAa1Rrm6oGDupCo
 TQqziq4zv5vDyBOca70WLAq04/Y8esZXQVONY26yfknYbGSB5XkyiQTqAx60/7ZSDOlU
 o/hADS1EiqPTfH0sdn6RIu4Djc7EhHTmvA9O2Ev0LCQHg2LK0Yibpid0PMY/9KBCh9X9
 p38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MNwiVpfGk3bQ+Y9AQVFuLEbxJUByoleMAgYrrdgJDFI=;
 b=sf7IJnGOlPtbSXreK31FXC90x7Y+7hTBHUxEsHqQ7tthSVpjfYdmkfmEqYiRVmH9Hb
 QneAmiJUcUFn8YrmG4R9QEcnqijHiw52/WeBwMd959S4ve6eV1IoSHQ9pgPKHjcS1y9v
 3fNUBWsONu7tjsawyWNBhquwHOs+HrSH4Qu3BxpbOm6esCke5OjQKIxu6pS7TkZ9iJ3i
 0riRNzVX/XxDUgzFUo/djVDGltQutMipPc8xp24k4C0K/4uYfJA8y7PAzKY72yBPob4h
 AkF5pHiIzfLi3Yxn3HUG4Ufp+gDcRJ58rF6ICp4dlF3QTXWgrP+HHXdZ+ZXD46hT8pi2
 g8Pg==
X-Gm-Message-State: APjAAAXEE995+CJ0MUCEOD9bgp6JuANHDjUdTOfPIPzCkOn45SZjfEaP
 ckrixZ8GUjvD3Eet9D30WGnF0kvxLoNkEO1mpRaoNPXE
X-Google-Smtp-Source: APXvYqwsRe+chiRp9/ji/QVAmBj039OoAMZwpbFziC3gzhPQTzCB4itVVKO28A5WCryAH9GyeMP1kbChpc64OUyNJrA=
X-Received: by 2002:a9d:5614:: with SMTP id e20mr3125794oti.348.1553030544566; 
 Tue, 19 Mar 2019 14:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190318095851.4062-1-narmstrong@baylibre.com>
 <20190318095851.4062-2-narmstrong@baylibre.com>
 <CAFBinCDfOEvmQcE7TgYvXmM1f=pywYbjhbAZWs4AYNXs8y6y7Q@mail.gmail.com>
 <7f391daf-db70-101a-18c7-04abf9c5a164@baylibre.com>
In-Reply-To: <7f391daf-db70-101a-18c7-04abf9c5a164@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 19 Mar 2019 22:22:13 +0100
Message-ID: <CAFBinCBduFG5uK9ghDW98fe4t17UeZj1b3STHByVY15C-3hB2A@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] arm64: dts: meson: g12a: Add AO Clock + Reset
 Controller support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_142225_856794_D45E89BD 
X-CRM114-Status: GOOD (  19.88  )
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
Cc: khilman@baylibre.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, Mar 19, 2019 at 9:47 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 18/03/2019 21:02, Martin Blumenstingl wrote:
> > Hi Neil,
> >
> > On Mon, Mar 18, 2019 at 10:59 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> Add nodes and properties for the AO Clocks and Resets.
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> >> index 31ddf9444b3e..5c0983edf837 100644
> >> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> >> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> >> @@ -4,6 +4,7 @@
> >>   */
> >>
> >>  #include <dt-bindings/gpio/gpio.h>
> >> +#include <dt-bindings/clock/g12a-clkc.h>
> >>  #include <dt-bindings/interrupt-controller/irq.h>
> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>
> >> @@ -122,6 +123,23 @@
> >>                         #size-cells = <2>;
> >>                         ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
> >>
> >> +                       rti: sys-ctrl@0 {
> >> +                               compatible = "amlogic,meson-gx-ao-sysctrl",
> >> +                                            "simple-mfd", "syscon";
> >> +                               reg = <0x0 0x0 0x0 0x100>;
> >> +                               #address-cells = <2>;
> >> +                               #size-cells = <2>;
> >> +                               ranges = <0x0 0x0 0x0 0x0 0x0 0x100>;
> > sorry for noticing this only very late: I missed the #address-cells,
> > #size-cells and ranges property in my last review
> > do you have any change queued which requires this?
> > my understanding is that the drivers for all RTI children should use
> > the register offsets relative to the RTI start address. In that case
> > the child nodes neither have a unit-address nor a reg property, making
> > the last three properties unnecessary.
>
> We need the address-cells/size-cells and `ranges;` to satisfy the need
> for the gpio subnode of the pinctrl node.
>
> For GX, we didn't add the pinctrl in the sysctrl_AO subnode, but we should
> overwise we have overlapping.
ah, I see - thank you for the explanation.

setting #address-cells and #size-cells will probably yield dtc
warnings for the children without unit-address / reg property.
also the pinctrl driver and the syscon driver would still ioremap
overlapping memory regions (syscon: the full 0x100 range, the pinctrl
driver various 4 and 8 byte registers) because both are ioremap'ing
their register space.
but indeed, the overlapping dt nodes are solved with this approach.

Rob acked a binding for the Lantiq XWAY SoC's with a simple-mfd /
syscon as parent and children with a reg property. The parent node
defines a reg and ranges property, but neither #size-cells nor
#address-cells. the binding is documented here: [0]
The requirements seem similar to our pinctrl needs. We could end up
with only a single syscon and no overlapping ioremap for the pinctrl
driver and we may not even have to change the binding.

with this mail I want to start a discussion about the bindings of the
AO pin controller (similar to how we re-considered the binding of the
AO clock controller in the past). at the same time I'm not saying that
we immediately have to change it.


Regards
Martin


[0] https://www.kernel.org/doc/Documentation/devicetree/bindings/mips/lantiq/rcu.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
