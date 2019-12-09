Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1C7C2BD09
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 08:32:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1635120726
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 08:32:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JCNb8MZq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="l2RINini"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1635120726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yijtAG1DVL4FNN3fLxaxnmJFUv5VVYRQ2Ks4L/jEi0Q=; b=JCNb8MZqD6T5maeNeVTkJqEUI0
	GR4XSdMvehFFS2fuE5fKSBnUUMz1vve8GsFFZVuTJJx9o6Xqk7u3idQkCyhY/tRjx91ocxAIdiaSr
	uX6KhdWnccadaR9kwdEvjOvlDDuX+oFUrv7pOSa29hoqQe+Ohs3hzhUWXvWoa5RhJBtMMROdR8pHg
	1CmchF31w+6OXljmwWPXoZiGqxk64YUt3P2L90JiUmkRwPBSX/zvrdnW7xhV5IhqtBObTLdLu+VgH
	MyoBBVsmt+Cy1C7cine27QfqZn2Lto8qEcdgoZLwg0Lctlx80C1TP/0PgLqtwn7BV9kNgOUR2GPDe
	csI6v52A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieET0-0005Oq-PM; Mon, 09 Dec 2019 08:32:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieESs-0005H1-PG
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 08:32:24 +0000
Received: by mail-wm1-x343.google.com with SMTP id b11so14431683wmj.4
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 00:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=emf4IJEEMsmxfQFP3fayTObEfLJTqttr7F9XFtfzuqY=;
 b=l2RINiniKcey/jhYyNEjboTgQuFh87XyROBMa0gj84/Vm4tnZlbyZamK6aJYwRdYBn
 uqHL+5kmm95wY5dB41OWQXTWCUveOtySqUfhMwfer/v8Zb1TYo9st7wgVs1pPSWwjQnE
 CTWybUczEiNtygy24UTDLkRuDSYBdDwHu6Rw5oEQYbRCuQN3N1sOmM/QgTGJrqYK/+gd
 ZsBs5IBMow3rG8I+aOTopBP+NLYSYP93vryqBdFCNpkC9MIh76Nwq73qdxpBNEwpOy40
 MLrjAHDJQUIoyS8+q75zjNhm3Z0PuAC7sNYZQKTbpnxuI+nQ0TAGdRfv5aoeVP8gz0BD
 SLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=emf4IJEEMsmxfQFP3fayTObEfLJTqttr7F9XFtfzuqY=;
 b=RwPnnyD2xNQmUyDFv9gbOGSHpsJC706j5fjYxbqJFTayrPvatIk3V6XAWc3hDBcVRM
 OaLtVbyxkCDw9X2L1SZmeAbStSvjYDxci08G970XXtFFM0dWOtCzZgUfQICqk+j4eTlO
 zWnalbkQ3o32BHHtg5gSYwOl4M3FQQIqhr4uOuDem2QZrzwxTMRX5Dn9OmwRUXwJ0yqX
 KyKv2B3m3ihjEGldptKGD3wdCabdYOFJUn7EyTF7OE01TZLQDP1FztCp2etdZnIBepWP
 pqRf7osQtzj11FI5+seElfEY6po8gQmXMbe/f4sl+JAI8s/Y3K2MMMxBdNgFwEe9hIMX
 QIRA==
X-Gm-Message-State: APjAAAVFl+Nm/arOvMZ5PmCTC5t9s4zlvDvoTLG+sahMuvZzDkuplb04
 eMu1Z5e8qico8fCFR2PXNwNMOJ5ZxaI=
X-Google-Smtp-Source: APXvYqzCeYkH/XjSzuD2xv6U2QTFu/p0/ipUgx0/xb5fgeGV8FOzVH5MhgwTY08LUaCdUwXNjXg2fA==
X-Received: by 2002:a05:600c:2144:: with SMTP id
 v4mr22522732wml.141.1575880340584; 
 Mon, 09 Dec 2019 00:32:20 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id v188sm13242989wma.10.2019.12.09.00.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 00:32:19 -0800 (PST)
References: <20191208210320.15539-1-repk@triplefau.lt>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Remi Pommarel <repk@triplefau.lt>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Yue Wang <yue.wang@Amlogic.com>
Subject: Re: [PATCH 0/2] PCI: amlogic: Make PCIe working reliably on AXG
 platforms
In-reply-to: <20191208210320.15539-1-repk@triplefau.lt>
Date: Mon, 09 Dec 2019 09:32:18 +0100
Message-ID: <1jpngxew6l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_003222_867854_19F1F8CD 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-pci@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sun 08 Dec 2019 at 22:03, Remi Pommarel <repk@triplefau.lt> wrote:

> PCIe device probing failures have been seen on some AXG platforms and were
> due to unreliable clock signal output. Setting HHI_MIPI_CNTL0[26] bit
> solved the problem. After being contacted about this, vendor reported that
> this bit was linked to PCIe PLL CML output.

Thanks for reporting the problem.

As Martin pointed out, the CML outputs already exist in the AXG clock
controller but are handled using HHI_PCIE_PLL_CNTL6. Although
incomplete, it seems to be aligned with the datasheet I have (v0.9)

According to the same document, HHI_MIPI_CNTL0 belong to the MIPI Phy.
Unfortunately bit 26 is not documented

AFAICT, the clock controller is not appropriate driver to deal with this
register/bit

>
> This serie adds a way to set this bit through AXG clock gating logic.
> Platforms having this kind of issue could make use of this gating by
> applying a patch to their devicetree similar to:
>
>                 clocks = <&clkc CLKID_USB
>                         &clkc CLKID_MIPI_ENABLE
>                         &clkc CLKID_PCIE_A
> -                       &clkc CLKID_PCIE_CML_EN0>;
> +                       &clkc CLKID_PCIE_CML_EN0
> +                       &clkc CLKID_PCIE_PLL_CML_ENABLE>;
>                 clock-names = "pcie_general",
>                                 "pcie_mipi_en",
>                                 "pcie",
> -                               "port";
> +                               "port",
> +                               "pll_cml_en";
>                 resets = <&reset RESET_PCIE_PHY>,
>                         <&reset RESET_PCIE_A>,
>                         <&reset RESET_PCIE_APB>;

A few remarks for your future patches:

* You need to document any need binding you introduce:
  It means that there should have been a patch in
  Documentation/devicetree/... before using your newclock name in the
  pcie driver. As Martin pointed out, dt-bindings should be dealt with
  in their own patches

>
>
> Remi Pommarel (2):
>   clk: meson: axg: add pcie pll cml gating

Whenever possible, patches intended for different maintainers should be
sent separately (different series)

>   PCI: amlogic: Use PCIe pll gate when available
>
>  drivers/clk/meson/axg.c                | 3 +++
>  drivers/clk/meson/axg.h                | 2 +-
>  drivers/pci/controller/dwc/pci-meson.c | 5 +++++
>  include/dt-bindings/clock/axg-clkc.h   | 1 +
>  4 files changed, 10 insertions(+), 1 deletion(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
