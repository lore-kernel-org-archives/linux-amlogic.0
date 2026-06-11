Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D89CD98D5
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 22:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=rs0K49g5SAwqc2aPnoancjnyK5H57xYlOJD9a33hBCo=; b=xfvg55W6vAQcAu
	b1QQOSwLxVzARsRFZqTHqa/xFG6sqN+YM5vLBs53JPCD70vspvLN0sL333WXJhZdxWQG0BrjYo0Xn
	s58k2o0LaubJFvCexH5fS7HGcGNExx9MZjSz2C8Ahw6W3oVrOmGPdxVAbr7b7GDAHjPsMKZjOvd2S
	3vodqhKYYH3Qgbl4WRlyrrsGYKAeiwQnbwq1KuzA3J520REcTCl7Qv26ZXfnq4aP23kNl5ZmrP+QQ
	1detpHXQLcwL9D2gmxENrIsy3dymRZSzWHYMmeQQLSvEZV9i7CeM5hdBlcwy4+nJcKgdDD92t9FTO
	t2V4qLPLbF3rDa9UtBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnbA-0000000A8Hg-1a8S;
	Thu, 11 Jun 2026 22:10:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnb8-0000000A8HR-2LNt;
	Thu, 11 Jun 2026 22:10:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5ADC43E78;
	Thu, 11 Jun 2026 22:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0C71F000E9;
	Thu, 11 Jun 2026 22:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781215801;
	bh=uzVD5s+95WmQgg4kuThSYNI11+iYet9ftNMS9PZCYWg=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=WT9pt1f23qU4nuc0lOmfmxft1w4QZmMjX0jSY3qNiMo/1MI3uhXlQpq1dU8bwe3ws
	 dKLDI9s1ONUJa4yXyoaJP1GZ9nxqesa1kBVF+o+9GacgWztrt8CWjXRKjOfgAhLDSw
	 MOLaWjmN3IAie74C3apbYLj1TiMSoyaHRJ7y7k1cAgiE2wALhPxRD/FJdZn/U3Gxa0
	 UnA10NC75Jc3M3lzyMnV/CezfGkg7AcMp0Uv1WuBWQEeL/euBhKlgBvM5nYjHfxMBT
	 09RFTPlAH+VaP87iW/ufGpEEasyjaqL9KCEcILJ2A2RoDVcy5Im37as4iryc2s27r9
	 /4YGpGUI5HtTA==
Date: Thu, 11 Jun 2026 17:10:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shuvam Pandey <shuvampandey1@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Fan Ni <fan.ni@samsung.com>, Shradha Todi <shradha.t@samsung.com>,
	Hanjie Lin <hanjie.lin@amlogic.com>, linux-pci@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: dwc: Guard RAS DES debugfs deinit
Message-ID: <20260611221000.GA524832@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f97352506d8d813f70f441de4d63fcd5b7d1c3e.1779123847.git.shuvampandey1@gmail.com>
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

On Mon, May 18, 2026 at 10:44:17PM +0545, Shuvam Pandey wrote:
> dwc_pcie_rasdes_debugfs_init() returns success when the controller has
> no RAS DES capability, leaving pci->debugfs->rasdes_info unset. The
> common debugfs teardown path still calls
> dwc_pcie_rasdes_debugfs_deinit(), which dereferences rasdes_info
> unconditionally.
> 
> Return early when no RAS DES state was allocated. In that case no RAS DES
> mutex was initialized, so there is nothing to destroy.
> 
> Fixes: 4fbfa17f9a07 ("PCI: dwc: Add debugfs based Silicon Debug support for DWC")
> Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-debugfs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-debugfs.c b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> index d0884253b..c3671cb2f 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> @@ -557,6 +557,9 @@ static void dwc_pcie_rasdes_debugfs_deinit(struct dw_pcie *pci)
>  {
>  	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
>  
> +	if (!rinfo)
> +		return;

I guess this prevents a NULL pointer dereference, right?

>  	mutex_destroy(&rinfo->reg_event_lock);
>  }
>  
> -- 
> 2.50.1 (Apple Git-155)
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
