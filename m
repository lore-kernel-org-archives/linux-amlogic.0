Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03692C64EC7
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Mar 2023 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gen5SmvAnp1ruwcQkqBZPGG4IvU+GXrQExNOETDAu8A=; b=UdX+62xRdvGuYQ
	DKdqlfNR8Oo3A8nPZMt3n4Kl/HRhJF9qgQxacM70mMER2G3SYpF7mgOPPvzLdkim3JI3kKoDZWwvU
	QCZbQ8OvwKrr8auBV9RhJLuutDLg496WG8dNaqEDFhf4BZpOP+kjSDOqLuzQU7R4MxHgcCQAVHKIC
	obAGYSRpMePkVBEQS1XcuIHdyExj5UvsfsbSAm9iDnJyFbsqZumHvLnhiyEgvCHrmin1oPnQDO1cn
	z1qxCN1Zvd+oCwMC2KberxeWNrdf8d8/BECWJVR/MkF/VKUCyGDTxmeE+f2mohMnQGUk9m9OPscm1
	ftdIhwQQJnVL+JNuflvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXMW1-00GLgX-Sq; Wed, 01 Mar 2023 13:29:05 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXMVx-00GLfG-VR; Wed, 01 Mar 2023 13:29:04 +0000
Received: from [IPV6:2a02:8428:2a4:1a01:e0e2:57dd:1e1b:9944] (unknown [IPv6:2a02:8428:2a4:1a01:e0e2:57dd:1e1b:9944])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 856B52003F3;
	Wed,  1 Mar 2023 14:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1677677334;
	bh=COPfjTnGYNEk1CSxqTittZhM1owZnHRb42fgnaqziXo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hmtuyEtGse2XerfmJy9hES0UXrwvQJiCGkXn7lUx9c8dM1iw/tvlO4Tqs5KPoG6iU
	 3aLAeGnnUsXGjjpQlIQHFzYYJrh4RU9bsDYyFPyFbsA5f2p2JfZ5NiUila8VzSr9mo
	 AoZLNuwCrsfBwEKGt9qxaN4pDBo6jJzPn63XSeNgdORAuyqIYhWVTw45SW95b2CgyS
	 prPq59f2Xcpqds1WQlquU+xfwb7Yrshk1uxeLbz+8dqOFn9Cx8INCVLPZ2RhcQcjJM
	 mNV7s2pWw90iYEPsYpuPbauuv8VrvkEjw52kgbDXy/ggkZJyDKWzldy1lcMy48txbQ
	 klEjMVZr5OkeQ==
Message-ID: <c3b9c231-10ef-ef69-c702-9e1052b8e704@free.fr>
Date: Wed, 1 Mar 2023 14:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Conflict between video-lut and pmu on meson-g12
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: AML <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Chris Healy <healych@amazon.com>,
 Will Deacon <will@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Pierre-Hugues Husson <phh@phh.me>
References: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr>
 <CAFBinCAdTHuN+AZKm0Yt=Gv0KgMtRruAHDgcF0qrLTZpki3JRQ@mail.gmail.com>
 <CAFBinCBb_5KChqD6wqj_MFxEH_hxL_U3nnA=+1AR8dhdQQVCzw@mail.gmail.com>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Content-Language: en-US
In-Reply-To: <CAFBinCBb_5KChqD6wqj_MFxEH_hxL_U3nnA=+1AR8dhdQQVCzw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_052902_199999_17A036FB 
X-CRM114-Status: GOOD (  18.27  )
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

On 28/02/2023 22:49, Martin Blumenstingl wrote:

> While thinking more about this - I think the whole .dtsi code should
> be improved. Both of the PMU IO regions are part of the &dmc region.
> So I think &pmu should be moved inside &dmc (with the offsets adjusted
> accordingly of course).
> 
> Also I think the dt-bindings are incomplete: according to the driver
> code we're using XTAL as input clock.
> But this is not described anywhere in the dt-bindings.
> dt-bindings should always describe the hardware. The driver can decide
> not to use it but the bindings must always be complete.
> And with this comes the question: is the DMC PLL specific to the PMU
> or is it shared with something else (e.g. the actual memory
> controller)? On the 32-bit SoCs (Meson8b/S805 for example) there's a
> whole DDR clock controller (used by the DDR memory controller), so I'm
> wondering if these newer SoCs are still following that approach.

FWIW, the vendor device-tree specifies the following nodes:
https://android.googlesource.com/kernel/arm64/+/f5269100977385d1fd4a5ef68e49631892cf4fe4/arch/arm64/boot/dts/amlogic/g12a_s905x2_u215.dts

	canvas {
		compatible = "amlogic, meson, canvas";
		dev_name = "amlogic-canvas";
		status = "okay";
		reg = <0x0 0xff638000 0x0 0x2000>;
		phandle = <0x111>;
	};

	codec_io {
		compatible = "amlogic, codec_io";
		status = "okay";
		#address-cells = <0x2>;
		#size-cells = <0x2>;
		ranges;
		phandle = <0x112>;
		[...]
		io_dmc_base {
			reg = <0x0 0xff638000 0x0 0x2000>;
		};
	};

	ddr_bandwidth {
		compatible = "amlogic, ddr-bandwidth";
		status = "okay";
		reg = <0x0 0xff638000 0x0 0x100 0x0 0xff638c00 0x0 0x100>;
		sec_base = <0xff639000>;
		interrupts = <0x0 0x34 0x1>;
		interrupt-names = "ddr_bandwidth";
	};


I don't understand how it's possible to have 3 overlapping ranges?
Unless the respective drivers know to map only specific ranges?


Regarding your DMC (DDR memory controller) clock question,
clock tree seems to be:
24 MHz XTAL feeds DDR_PLL block,
which outputs DDR_CLK pulse for the DMC.


Something I do not understand is that the datasheet states:
DMC unsecure register. Base address 0xFF638000.
Offset 0 = AM_DDR_PLL_CNTL0
Offset 4 = AM_DDR_PLL_CNTL1
...

And then also states:
The following registers' base address is 0xff638000.
Offset 0 = DMC_REQ_CTRL
Offset 4 = DMC_SOFT_RST
...

And these two register sets have nothing in common
(except the SAME base address...)

https://android.googlesource.com/kernel/arm64/+/f5269100977385d1fd4a5ef68e49631892cf4fe4/include/linux/amlogic/media/registers/regs/dmc_regs.h

Is there perhaps a typo in one of the base addresses?


Regards.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
