Return-Path: <SRS0=cz5x=ER=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C78C388F9
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2020 18:14:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 718DA2072C
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2020 18:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x/XdFXGQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mdragon-org.20150623.gappssmtp.com header.i=@mdragon-org.20150623.gappssmtp.com header.b="NyLczoip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 718DA2072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mdragon.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PLhZ9R6D+Qs8cnwxP4gbr5Q2ONKOMPfinQszXR9RR3E=; b=x/XdFXGQER6WgC7qOH0MtQT2e
	FllQG+NuUQQmPk7ewH1md5qf5pvv1LFD1w2EkkRwdXXgXx9mzBC7tmRUikPgyHSvH00Bh3bVbMBgh
	bmo9QWOhcciqwyU1YDO79KpP+zj4nCsEOoC11bvKcnU4Q3r+In8JDZQLZdTKlayOu/2xgHcY7KQBF
	6q0o7tMEH6Mo+Rz0/mxLQ8aQ4r650NoXB4T6KzbipGXNd/5Q4VNvT8IqFQtUqkgW9wRMpr+pBepzE
	bwKVO2CzEFJPz1SMKdpnnffg4hoa+eTnIbNsfnoD2HyWIocalR5roDfBOWnLQaULBrzi7YwK0X9b7
	ehNm38E9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcudi-0007qH-Lh; Wed, 11 Nov 2020 18:14:38 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcudf-0007pb-V8
 for linux-amlogic@lists.infradead.org; Wed, 11 Nov 2020 18:14:37 +0000
Received: by mail-ed1-x542.google.com with SMTP id t11so3254685edj.13
 for <linux-amlogic@lists.infradead.org>; Wed, 11 Nov 2020 10:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mdragon-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zO3D0a45Igw1j0rP0rI6v9FXbaeSgt3Z73q8vgCpVAc=;
 b=NyLczoipnoNwKS6Pl5fDOvm+wy/+E0GJl5jJk3+2v1jcFX+0oGmc6CPFYDQtBfNLqD
 ZaSLJ9rXXU79zygH0yIbIXHYRGxV8E9oFhbzNMv+RuMAW7sfFiOuOCjdWtxNAjp35znU
 M07LpiAJNCDzqdQ6uonPmim3arA2gHRbIlWhIQax/vycenbWNs1frcwUBosZ0UHcfDsS
 i73lYfheFMDSDU0fngnOXAmRaSSYo2sd2b1jsZkubetEPkooAkUyowu8DeRSpPw+rqzi
 CzBDIUbt2O/GWxq2aMpd9hpbl5AHtueG4jtNYu2gPrkKnnqtF2tqPcsbhkfLlRvM7V+/
 6y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zO3D0a45Igw1j0rP0rI6v9FXbaeSgt3Z73q8vgCpVAc=;
 b=I6D3h4y8HCZ+g8+xK90wcQPs2OJfTp5CW7AuJ1VrmP3AaVmpgrvaTiCY5ZQuLG0Dxp
 bM+6sCBryz2iByIfOKOQdv6H0AEglvANlZrx6CvuEFaC+EIpbhYKo2a5Q3wDY6tjRPTz
 Eue+J569c3hbYUEB+snAA66RG3aXjHqggyLWhtnB/FVNrOUh2G0NtmeJYsSOKD8wFQT/
 OLEG4eBjhXI+fvt5viqzMbJ/88hMEdzblcXO7JaHtKxAv6X2kPNV662dQJPkwxCSKEyA
 BSPI7Gc0eKB+psyKuKLmS8sNt7JAEsERWC5tJYGVYtIDt3p8SZgvODp25mg+N2xNXPoI
 +uGA==
X-Gm-Message-State: AOAM530dUGYxcCo9PYiwk0ZH2DYDWBu/D+ybpJc/NieVwZUINDfxPhv4
 KQaiJHhHKGp21EPgOBqymWQHmX4+JhOzDlXV6OKgnQ==
X-Google-Smtp-Source: ABdhPJwA63+KLvDY8lRvBh2rEtO45JYSttXM+eaDaOyyROJbpu7MC5efOWABhX92jpF6Ylbpdb9GaaAo/IAs04o82EM=
X-Received: by 2002:aa7:c7cf:: with SMTP id o15mr745891eds.15.1605118472400;
 Wed, 11 Nov 2020 10:14:32 -0800 (PST)
MIME-Version: 1.0
References: <CAFW1BFwi9nXW3ZZjK2pH2JUPh9Xj0PdM61+4sOY-YjA=i-AwEQ@mail.gmail.com>
 <7ho8k6ulw3.fsf@baylibre.com>
In-Reply-To: <7ho8k6ulw3.fsf@baylibre.com>
From: Michal Lazo <michal.lazo@mdragon.org>
Date: Wed, 11 Nov 2020 19:14:20 +0100
Message-ID: <CAFW1BFzYcnXzVRSMu4tPthy4F0i_1hfWRxWwabnMSeOax9RsyQ@mail.gmail.com>
Subject: Re: How to fix pcie ranges for nvidia GFX card
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_131436_144311_D254B99C 
X-CRM114-Status: GOOD (  19.20  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello
more bars has problem

[    1.417571] dw-pcie fc000000.pcie: IRQ index 1 not found
[    1.431519] meson-pcie fc000000.pcie: host bridge /soc/pcie@fc000000 ranges:
[    1.436260] meson-pcie fc000000.pcie:       IO
0x00fc600000..0x00fc9fffff -> 0x0000000000
[    1.444357] meson-pcie fc000000.pcie:      MEM
0x00fca00000..0x00fdffffff -> 0x00fca00000
[    1.479863] meson-pcie fc000000.pcie: Link up
[    1.479922] meson-pcie fc000000.pcie: PCI host bridge to bus 0000:00
[    1.484882] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.490314] pci_bus 0000:00: root bus resource [io  0x0000-0x3fffff]
[    1.496610] pci_bus 0000:00: root bus resource [mem 0xfca00000-0xfdffffff]
[    1.503438] pci 0000:00:00.0: [16c3:abcd] type 01 class 0x060400
[    1.509385] pci 0000:00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff pref]
[    1.516038] pci 0000:00:00.0: supports D1
[    1.519991] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
[    1.528550] pci 0000:01:00.0: [10de:128b] type 00 class 0x030000
[    1.532291] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00ffffff]
[    1.538485] pci 0000:01:00.0: reg 0x14: [mem 0x00000000-0x07ffffff
64bit pref]
[    1.545642] pci 0000:01:00.0: reg 0x1c: [mem 0x00000000-0x01ffffff
64bit pref]
[    1.552781] pci 0000:01:00.0: reg 0x24: [io  0x0000-0x007f]
[    1.558301] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    1.564944] pci 0000:01:00.0: Max Payload Size set to 256 (was 128, max 256)
[    1.572269] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 63.008
Gb/s with 8.0 GT/s PCIe x8 link)
[    1.586828] pci 0000:01:00.0: vgaarb: VGA device added:
decodes=io+mem,owns=none,locks=none
[    1.595109] pci 0000:01:00.1: [10de:0e0f] type 00 class 0x040300
[    1.601025] pci 0000:01:00.1: reg 0x10: [mem 0x00000000-0x00003fff]
[    1.607345] pci 0000:01:00.1: Max Payload Size set to 256 (was 128, max 256)
[    1.643679] pci 0000:00:00.0: BAR 9: no space for [mem size 0x0c000000 pref]
[    1.645070] pci 0000:00:00.0: BAR 9: failed to assign [mem size
0x0c000000 pref]
[    1.652405] pci 0000:00:00.0: BAR 8: no space for [mem size 0x01800000]
[    1.658958] pci 0000:00:00.0: BAR 8: failed to assign [mem size 0x01800000]
[    1.665858] pci 0000:00:00.0: BAR 6: assigned [mem
0xfca00000-0xfca0ffff pref]
[    1.673017] pci 0000:00:00.0: BAR 7: assigned [io  0x1000-0x1fff]
[    1.679056] pci 0000:01:00.0: BAR 1: no space for [mem size
0x08000000 64bit pref]
[    1.686557] pci 0000:01:00.0: BAR 1: failed to assign [mem size
0x08000000 64bit pref]
[    1.694406] pci 0000:01:00.0: BAR 3: no space for [mem size
0x02000000 64bit pref]
[    1.701910] pci 0000:01:00.0: BAR 3: failed to assign [mem size
0x02000000 64bit pref]
[    1.709758] pci 0000:01:00.0: BAR 0: no space for [mem size 0x01000000]
[    1.716313] pci 0000:01:00.0: BAR 0: failed to assign [mem size 0x01000000]
[    1.723213] pci 0000:01:00.0: BAR 6: no space for [mem size 0x00080000 pref]
[    1.730200] pci 0000:01:00.0: BAR 6: failed to assign [mem size
0x00080000 pref]
[    1.737531] pci 0000:01:00.1: BAR 0: no space for [mem size 0x00004000]
[    1.744086] pci 0000:01:00.1: BAR 0: failed to assign [mem size 0x00004000]
[    1.750986] pci 0000:01:00.0: BAR 5: assigned [io  0x1000-0x107f]
[    1.757035] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    1.762200] pci 0000:00:00.0:   bridge window [io  0x1000-0x1fff]
[    1.768580] pcieport 0000:00:00.0: PME: Signaling with IRQ 31
[    1.774709] pcieport 0000:00:00.0: AER: enabled with IRQ 31

On Tue, Nov 10, 2020 at 12:54 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Michal Lazo <michal.lazo@mdragon.org> writes:
>
> > Hello
> > I have khadas vim3 with nvidia PCIe card
> > Anybody has an idea how to fix pcie ranges so we can have nvidia gpu working?
>
> Can you try this patch[1]?  Neil found this issue and we were testing
> locally, but hadn't yet submitted a fix.  If this works, we'll get a
> formal patch upstream.
>
> Hope that helps,
>
> Kevin
>
> [1]
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 1e83ec5b8c91..0a220fb10841 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -134,8 +134,8 @@ pcie: pcie@fc000000 {
>                         #address-cells = <3>;
>                         #size-cells = <2>;
>                         device_type = "pci";
> -                       ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000
> -                                 0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
> +                       ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00400000
> +                                 0x82000000 0 0xfca00000 0x0 0xfca00000 0 0x1600000>;
>
>                         clocks = <&clkc CLKID_PCIE_PHY
>                                   &clkc CLKID_PCIE_COMB
>
> > This is what I get in dmesg
> >
> > [    1.548188] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
> > limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 63.008
> > Gb/s with 8.0 GT/s PCIe x8 link)
> > [    1.562742] pci 0000:01:00.0: vgaarb: VGA device added:
> > decodes=io+mem,owns=none,locks=none
> > [    1.571028] pci 0000:01:00.1: [10de:0e0f] type 00 class 0x040300
> > [    1.576944] pci 0000:01:00.1: reg 0x10: [mem 0x00000000-0x00003fff]
> > [    1.583263] pci 0000:01:00.1: Max Payload Size set to 256 (was 128, max 256)
> > [    1.622407] pci 0000:00:00.0: BAR 9: no space for [mem size 0x0c000000 pref]
> > [    1.623803] pci 0000:00:00.0: BAR 9: failed to assign [mem size
> > 0x0c000000 pref]
> > [    1.631136] pci 0000:00:00.0: BAR 8: assigned [mem 0xfc800000-0xfdffffff]
> > [    1.637861] pci 0000:00:00.0: BAR 6: assigned [mem
> > 0xfc700000-0xfc70ffff pref]
> > [    1.645033] pci 0000:00:00.0: BAR 7: assigned [io  0x1000-0x1fff]
> > [    1.651070] pci 0000:01:00.0: BAR 1: no space for [mem size
> > 0x08000000 64bit pref]
> > [    1.658576] pci 0000:01:00.0: BAR 1: failed to assign [mem size
> > 0x08000000 64bit pref]
> > [    1.666410] pci 0000:01:00.0: BAR 3: no space for [mem size
> > 0x02000000 64bit pref]
> > [    1.673913] pci 0000:01:00.0: BAR 3: failed to assign [mem size
> > 0x02000000 64bit pref]
> > [    1.681763] pci 0000:01:00.0: BAR 0: assigned [mem 0xfd000000-0xfdffffff]
> > [    1.688500] pci 0000:01:00.0: BAR 6: assigned [mem
> > 0xfc800000-0xfc87ffff pref]
> > [    1.695648] pci 0000:01:00.1: BAR 0: assigned [mem 0xfc880000-0xfc883fff]
> > [    1.702385] pci 0000:01:00.0: BAR 5: assigned [io  0x1000-0x107f]
> > [    1.708426] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
> > [    1.713592] pci 0000:00:00.0:   bridge window [io  0x1000-0x1fff]
> > [    1.719626] pci 0000:00:00.0:   bridge window [mem 0xfc800000-0xfdffffff]
> >
> >
> > And this is what we use right now to setup ranges
> > https://github.com/chewitt/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi#L137
> >
> >
> > Any idea how to properly set up ranges ?
> >
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic



-- 
Best Regards

Michal Lazo
Senior developer engineer
mdragon.org
Slovakia

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
