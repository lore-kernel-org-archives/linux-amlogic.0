Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4627CCDB47E
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Oct 2023 22:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPpHJDxwPJEXCNFE5fO8uZEVqb5nuXrFypWKUBmDWLI=; b=d/y/i8jVV8QKUb
	K5RfOqwc264ks5GVTM2K9ReEzv4LerFsC0LlI2/jHxNP+xVbS+qC1MOJ8OCucvqjLxzaloPXCv+lZ
	Ga/K9vu3V6v2uHHLUXEbAUEeQRLJzVI5Q3muwu914//kPOUXxdLHmIRMGTju9pueUz3hrF6KTQTce
	KL91Qv/ifs7fMYurdeC3mQ4rWubv1Wshvio84VMkLjk1YhkxhJD7RM42jXjPqIUdy4cZ6MGEWaend
	/B1vPHEjGZa9XABRcawhdMyIO/M+APUXslBTpRm9MsgUV1UHNcFy7jMfdeVRjy6gHL208VmMrel+v
	syBSK2njWKhM0c8WVJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrQDi-004LZN-0q;
	Fri, 13 Oct 2023 22:01:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrQDf-004LYi-2H;
	Fri, 13 Oct 2023 22:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8C9A3B82C40;
	Fri, 13 Oct 2023 22:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC245C433C7;
	Fri, 13 Oct 2023 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697234476;
	bh=eN7+8Uo6JxL07H1+Tga+pr6b8+j6RjcgOEu8xBzIYig=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KYvvVIrF5//SG+aOAPpO3yWmmp1TqkuMIlU8WxVNmZDEhYWdtuFm+6kba3N9CE9Cq
	 jLFWe4Rhl7nhpLf/wx/PxCClh+kbhGuuIIT+ModtT7r1iAZoqO5OVh1m8GkUoTdreA
	 uyfODD467MPyXEHr97OmwdZC3cO3m0xV2bbhUlLXeSVp9CN9o4/Gd2eGIsegyw0m7U
	 uvDmAhJSP7k9uEf45oWh5agWBwdIm6/5Ju0ponf+KoPFpNAzKCoONa+U27g+KAyJgd
	 MwpfyNG1UXXA1tCMSRQ/t+spLCiEfrKM/5meejxctbynQvm2IphlygNupZ6VHp6VbJ
	 Dihkm/p62bC4w==
Message-ID: <2fb931d1aa2190b918d0ddba87579eeb.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jmswnvub2.fsf@starbuckisacylon.baylibre.com>
References: <20231010062917.3624223-1-xianwei.zhao@amlogic.com> <20231010062917.3624223-5-xianwei.zhao@amlogic.com> <5e0bd4bba88701dd1a7a3e89d18412f0.sboyd@kernel.org> <1jmswnvub2.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH V2 4/4] clk: meson: c3: add c3 clock peripherals controller driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 13 Oct 2023 15:01:14 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_150119_898259_DBC7C083 
X-CRM114-Status: GOOD (  17.38  )
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

Quoting Jerome Brunet (2023-10-13 00:38:14)
> 
> On Thu 12 Oct 2023 at 16:51, Stephen Boyd <sboyd@kernel.org> wrote:
> 
> > Quoting Xianwei Zhao (2023-10-09 23:29:17)
> >> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> >> index 76be4bbd2afb..c8d59d28c8ff 100644
> >> --- a/drivers/clk/meson/Kconfig
> >> +++ b/drivers/clk/meson/Kconfig
> >> @@ -140,6 +140,19 @@ config COMMON_CLK_C3_PLL
> >>           Say Y if you want the board to work, because PLLs are the parent of most
> >>           peripherals.
> >>  
> >> +config COMMON_CLK_C3_PERIPHERALS
> >> +       tristate "Amlogic C3 peripherals clock controller"
> >> +       default y
> >
> > Why are these default y? They should depend on something like ARM64 and
> > even then I don't see why we want to enable them by default if we're
> > building the ARM64 kernel.
> 
> Should indeed depend on ARM64.

Cool.

> 
> Those are the main clock controllers. Like for other AML SoC families,
> they are necessary to boot the device which is why they use 'default y'
> 
> Is it a problem ?
> 
> The whole meson directory depends on ARCH_MESON, so the drivers will go
> away if Amlogic support is removed on ARM64.

No it isn't a problem if the entire section is implicitly depending on
ARCH_MESON.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
