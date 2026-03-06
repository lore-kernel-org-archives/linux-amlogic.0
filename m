Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C40F513F9
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Mar 2026 04:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AF51O2BeluUy466LMySBjWREu1qXmAyzn1W0QRkPlw=; b=W2hK4ArQ/JAemL
	KBemQN6u3EAJdFkEYFK4EYwbhGka9BSeyGvAEMLObaBqBzzXCusi92xXswhPhSVV0h90GMeXEqRCs
	mXLeDFaxwir1d66TqzBc4lR8C8HsXYahWz79YxMGqzbmRYgES0rNteuB68aB9VNYi8xOe8YXBWQ8Z
	K0Ixljnit0pXENoYqfmVQLKd6H+LnTVW0HZ8/8luDnNSddQv+cHNnpjdtVHg1cdFmg+1rNPGQOsTy
	m3ZIgS3+WucJvQvYBnpxz3/5midstb6IoahcmoOnb18EOWjBU+lBmSNdG3gbkLRNC1nf9GGYdod+J
	ka9kMz2CYjBYmJGv2+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyMaq-00000002zvV-0JBz;
	Fri, 06 Mar 2026 04:15:16 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyMam-00000002ztx-3EFY
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Mar 2026 04:15:15 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b9431300833so13451066b.0
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 20:15:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772770510; cv=none;
        d=google.com; s=arc-20240605;
        b=TbSiM3i8HHQmSG0zT1sndhYJhAT0UW1Q1AWQc/t+zh9iSYWc2EEDI5wr1ihfZwNqst
         4zkwnkLnYrAqszEnAe0BI7fcdY81k5PByCIwP4qkv6ZlBQYeLFh4lKiUdKVP1bImMFTE
         9TQnYPW60x9xLYvs1GJs7LI6UXM3SoikTao7KZ66xDIp0Ql3XSxyb1ZDt0QqoZNGSz9x
         QFnc+xRk3i44+rhUzNLWfkHBI69VSDqL1UID4m+EZWieeIreQjKq3gdj01OoT+wmt1/j
         UlNHl+EmFd3h3iN6i1v2v61OO89zs+3AaGrnjRlZErv1Xro7AmofQLgjqu2ueu1KHm1J
         BaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        fh=v2r8SguNBMkxulmZTGY6ufyVnSlUNKvjvf3hm9QieSg=;
        b=Ew8svDOGfGFx9DdNb0ujuywgIeqXPw8OPZMst3aJVf2gX5RlANMS2QYuFMyEUCR1Lj
         ioxDEIFICJkFe4pPA+TuUXXqvruL2yl/G5RNwB0s4O3CPMcUeQxqxkaxIcEi8PA8bM5N
         douUMqroYQa4BAG2ZHg26LMvLI5sbTlgZclQHIkgugDO78tfxsUfNI0TJ08Q2xPvrycY
         8hu8EMCsbtGW7fdqC3IFePDI7wRuE6+1b0ILhXWRnBFDep49wu8co6uJdxyMvZooz9F3
         l1FoOn9xpniD6igE2uAjPwwbvv8XV+eUzVt/gBfV37+p5PCQ/xrDUczFIL2vQNPMh/HZ
         FWwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772770510; x=1773375310; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=b1y3QByW7KPVsJykodjSG2MkBg0CDEMn1sg7E8Fa43QBG8FIJtl8tHMNe9CbePFfrW
         sUNzBDNmPRZSYV24NOD2dQOUgqaeityjK/Z4yHPCNFXTLZfWGGNW8m+thYOawkT9fKmy
         q9rqYkfbX3ghbt30h7YH5MxaZOOj6e9JCaYwjZMBpE/VeNN3KbVAJKSkQ+/5zJPWHnCz
         dC0xQ5i6IcYAnQM9wsT2GTePVbM+nfr+nq7xG1WivV+hvnmm14RW+R9AjFl8BXap21lP
         aYHtQKuGEs2Nm9th9rGxW8sH1edw/MIoIdBkEhOMB2cizm0QN9qeMZlcL++N9bsIfw7a
         0/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772770510; x=1773375310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=D4AC/BHtMHgmXTNIcbppCtd89jw2mS3q4veyF5v4/vjhITnWYzDvVlyfO3o8omLU5J
         0m0vbWgk3SESaRNsl65Q/m5OB78pCh093mM82odgDeXICNDEMmMH03QMFgpMC2Zn1gEh
         wfwCeqsIec9PiKy1Sd+BZ4/U1gXJH1lrmc5LZ2n9CQK3o89ZyLgeMgAtxwmaeZUK4nmA
         UKrQvU9SytHq2YwOtlnQmqzFNUkx0H2u+yqHopYuRlMSmvWDe9V3E2j8YqZvX2UFxgB2
         oDZHrhB/NzUD77c9+yLa+IPm4+f8QhgZfl3AJxjE8TRy4PKjfJO6AprjR/dKkX33hpnh
         t1Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXILzb7o/ckTWGNdqE4ku0ejjd06p17i5CbxlFMRjESbUX8nNtK8G+aIIdZxwSfcK6ul/JMDpd4C7gMqPt5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh6i09cmYA+5jIPJfEWkISCIdZrkkN2qFUd6bzYb4vqriOHjxC
	TR6v8SMCEfgPa8v9H0Y/C7Lqt6cBR7opZm2EllB9yZo5kioISg1kjgGQty2uLMPooncl5+sYVB4
	l8yZ638j7xUCKWl5n4FU8/MUoOAuuu1c=
X-Gm-Gg: ATEYQzwWWWYVcf7odUJU2UN1VtGHIu5MF9/Qkl3XrXaR8RlRTIK/ebY5DDq89wK3Ya2
	gC0Y0mpVVoZjfPcp3wILq/veEfm29ujWBKfvMiWQmKKH5/2yS/0z24GcdgFCr9eo0aVTxKTFxA+
	XYAFJBux+dYtsz0CX3KK1WKrr4g4Stz4q312JntIW5Us7UCOtfIwtd8qZ26Xr6Hgjxxcl7CT8yL
	d1Kht4vEdV8wf/TFdGLZQVz1BE4udLDNF0TJ0awHDkvq0a1WywpeIGXgt08DDxrzV2P4ijbmUmH
	0l+YhA==
X-Received: by 2002:a17:907:6d02:b0:b93:6bfe:d556 with SMTP id
 a640c23a62f3a-b942db8682dmr33539966b.7.1772770510037; Thu, 05 Mar 2026
 20:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20260304140329.7089-1-linux.amoon@gmail.com> <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 6 Mar 2026 09:44:53 +0530
X-Gm-Features: AaiRm51D8WbPwjbtXZGUsnsbSyyBH4WmUaM2xaSBTKwsUjOwhQr-zWi1-hyOtG4
Message-ID: <CANAwSgQ8eKV4jyxGeva_2aT98sPW=44Q9J5PxMgJ-bs3XdwrkA@mail.gmail.com>
Subject: Re: [RFC v1 00/18] PCI: Enable async probe by default
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Chocron <jonnyc@amazon.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Paul Walmsley <pjw@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Xiaowei Song <songxiaowei@hisilicon.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Niklas Cassel <cassel@kernel.org>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>, 
	Koichiro Den <den@valinux.co.jp>, Hans Zhang <18255117159@163.com>, 
	Sai Krishna Musham <sai.krishna.musham@amd.com>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, Vidya Sagar <vidyas@nvidia.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:PCI DRIVER FOR SAMSUNG EXYNOS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <imx@lists.linux.dev>, 
	"open list:PCIE DRIVER FOR AMLOGIC MESON" <linux-amlogic@lists.infradead.org>, 
	"open list:PCIE DRIVER FOR AXIS ARTPEC" <linux-arm-kernel@axis.com>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:SIFIVE DRIVERS:Keyword:fu [57] 40" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_201512_838262_9E78E399 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Chen,

On Thu, 5 Mar 2026 at 05:57, Chen Wang <unicorn_wang@outlook.com> wrote:
>
> Hello Anand,
>
> On 3/4/2026 9:51 PM, Anand Moon wrote:
> > Following recent asynchronous probing updates to the Rockchip PCIe
> > controller, this change enables default async probe functionality for
> > all DesignWare Core (DWC) based controllers to optimize boot times [0].
> >
> > [0] https://lore.kernel.org/all/20260226101032.1042-1-linux.amoon@gmail.com/
> >
> > This PROBE_PREFER_ASYNCHRONOUS flag help to parallelize device initialization.
> >
> > Thanks
> > -Anand
> >
> > Anand Moon (18):
> >    PCI: al: Allow asynchronous probing for background link training
> >    PCI: amd-mdb: Allow asynchronous probing for background link training
> >    PCI: armada8x: Allow asynchronous probing for background link training
> >    PCI: artpec6: Allow asynchronous probing for background link training
> >    PCI: bt1: Allow asynchronous probing for background link training
> >    PCI: dra7xx: Allow asynchronous probing for background link training
> >    PCI: exynos: Allow asynchronous probing for background link training
> >    PCI: fu740: Allow asynchronous probing for background link training
> >    PCI: intel-gw: Allow asynchronous probing for background link training
> >    PCI: keystone: Allow asynchronous probing for background link training
> >    PCI: keembay: Allow asynchronous probing for background link training
> >    PCI: kirin: Allow asynchronous probing for background link training
> >    PCI: layerscape: Allow asynchronous probing for background link
> >      training
> >    PCI: meson: Allow asynchronous probing for background link training
> >    PCI: sophgo: Allow asynchronous probing for background link training
> >    PCI: tegra194: Allow asynchronous probing for background link training
> >    PCI: uniphier: Allow asynchronous probing for background link training
> >    PCI: visconti: Allow asynchronous probing for background link training
> >
> >   drivers/pci/controller/dwc/pci-dra7xx.c     | 1 +
> >   drivers/pci/controller/dwc/pci-exynos.c     | 1 +
> >   drivers/pci/controller/dwc/pci-keystone.c   | 1 +
> >   drivers/pci/controller/dwc/pci-layerscape.c | 1 +
> >   drivers/pci/controller/dwc/pci-meson.c      | 1 +
> >   drivers/pci/controller/dwc/pcie-al.c        | 1 +
> >   drivers/pci/controller/dwc/pcie-amd-mdb.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-armada8k.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-artpec6.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-bt1.c       | 1 +
> >   drivers/pci/controller/dwc/pcie-fu740.c     | 7 ++++---
> >   drivers/pci/controller/dwc/pcie-intel-gw.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-keembay.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-kirin.c     | 1 +
> >   drivers/pci/controller/dwc/pcie-sophgo.c    | 1 +
> >   drivers/pci/controller/dwc/pcie-tegra194.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-uniphier.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-visconti.c  | 1 +
> >   18 files changed, 21 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
>
> Suggest you indicate in the title of the cover letter for the next patch
> that this patchset is only related to dwc.
>
Thanks, If I get positive feedback I will append dwc in the $subject.
> Thanks,
>
> Chen
>
Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
