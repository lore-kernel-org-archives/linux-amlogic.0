Return-Path: <SRS0=UvWR=2F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FE4C43603
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 11:30:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E346206CB
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 11:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQHtU4xu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E346206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbUfWJOwxCPPwzkB/FUnQwFzN3n55vjPtXDO4aaRC5w=; b=TQHtU4xu2NwVwi
	UxheiUWwmaVGJQP9xA3o4+CVO3tFW46ZqcizqBg6DPqDqXuiUXv67AFBfJV1+Ky4a1VFb5VDI60gA
	j0S97FiHswSRlntZb8wgKOuDk6SHP4KK+Czwfw2/MJlPzEBjYMQ2e5zOjC5xP4NeVfnCHrxDapCXx
	0PvTMamhyCk9gf5RWFWc2RmNfsm+DFsltBDQ9DDIyh0WZfQ+nVkFIiOo8rfdoL+yWbKeMJHpx58VS
	X+9OE+Ql1FswOZob3HETQazj7+JyVUXvCd+eb/HfkOAGS6XXjOhLu7RjHay72VwHSDo3aZ5RZ0LjD
	9oGgNBKq/leiu6ZIf0ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igS6H-0000ZB-4J; Sun, 15 Dec 2019 11:30:13 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igS6E-0008S9-0T; Sun, 15 Dec 2019 11:30:11 +0000
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id F41F9200003;
 Sun, 15 Dec 2019 11:29:55 +0000 (UTC)
Date: Sun, 15 Dec 2019 12:38:20 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH 2/2] PCI: amlogic: Use PCIe pll gate when available
Message-ID: <20191215113820.GC7304@voidbox>
References: <20191208210320.15539-1-repk@triplefau.lt>
 <20191208210320.15539-3-repk@triplefau.lt>
 <20191209110314.GQ18399@e119886-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209110314.GQ18399@e119886-lin.cambridge.arm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_033010_190912_3B47EAEA 
X-CRM114-Status: GOOD (  20.10  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Dec 09, 2019 at 11:03:15AM +0000, Andrew Murray wrote:
> On Sun, Dec 08, 2019 at 10:03:20PM +0100, Remi Pommarel wrote:
> > In order to get PCIe working reliably on some AXG platforms, PCIe pll
> > cml needs to be enabled. This is done by using the PCIE_PLL_CML_ENABLE
> > clock gate.
> 
> s/cml/CML/
> 
> In addition to Jerome's feedback - it would also be helpful to explain
> when CML outputs should be enabled, i.e. which platforms and why those
> ones?
> 
> > 
> > This clock gate is optional, so do not fail if it is missing in the
> > devicetree.
> 
> If certain platforms require PCIE_PLL_CML_ENABLE to work reliably and
> thus the clock is specified in the device tree - then surely if there
> is an error in enabling the clock we should fail? I.e. should you only
> ignore -ENOENT here?

Good point. Will do.

Thanks

-- 
Remi

> 
> Thanks,
> 
> Andrew Murray
> 
> > 
> > Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> > ---
> >  drivers/pci/controller/dwc/pci-meson.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> > index 3772b02a5c55..32b70ea9a426 100644
> > --- a/drivers/pci/controller/dwc/pci-meson.c
> > +++ b/drivers/pci/controller/dwc/pci-meson.c
> > @@ -89,6 +89,7 @@ struct meson_pcie_clk_res {
> >  	struct clk *mipi_gate;
> >  	struct clk *port_clk;
> >  	struct clk *general_clk;
> > +	struct clk *pll_cml_gate;
> >  };
> >  
> >  struct meson_pcie_rc_reset {
> > @@ -300,6 +301,10 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
> >  	if (IS_ERR(res->clk))
> >  		return PTR_ERR(res->clk);
> >  
> > +	res->pll_cml_gate = meson_pcie_probe_clock(dev, "pll_cml_en", 0);
> > +	if (IS_ERR(res->pll_cml_gate))
> > +		res->pll_cml_gate = NULL;
> > +
> >  	return 0;
> >  }
> >  
> > -- 
> > 2.24.0
> > 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
