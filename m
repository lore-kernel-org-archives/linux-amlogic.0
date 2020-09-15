Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6E7C43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 09:13:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A6E521D7B
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 09:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RqGmOf7u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="Gmmwa8Sa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A6E521D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xg3CwytuYbXuWC1JZVHr0zu1H3MyF28gFUfyko1udtM=; b=RqGmOf7uHwn3McI4ZISHjFoaT
	U72LEEYulvybqLZRJ/s2/NsP7pdkTz/EoiUF45FtZvFpauYx44Bj87tXZB7DOD4MPKhFNZ0rXU8Ju
	TJ+6ngf+s2YKJRAivngmqpjQWyx85ZKOHpSDHYBtaghN6NfBMWbvOMYw1d6h9oXEIxrMbjkmZfEdG
	SeIDwppu9v7kT7V0ATv/oEOsjdB/bBeOhThPrz+f7hfoNcJyE6SioC6b4sVxZv3Q+y5cZHpwUvtyT
	crSoxwZiD5Up+IbEvhnY3vZlyHOYJdFhmJ8ipPvQ2w789nVE4L2YXx672wrfyYNBxWg4AANcgHanP
	Ean2mW4qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI71M-0004bS-6P; Tue, 15 Sep 2020 09:13:04 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI71H-0004Zr-Fn; Tue, 15 Sep 2020 09:13:01 +0000
Received: from mwalle01.sab.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CB43822708;
 Tue, 15 Sep 2020 11:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1600161175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2P5NgU0B9AjWYC5q+V3Ti4erlurb01RNNs/ekO5kyz4=;
 b=Gmmwa8SaNq1wBjgmtbx23XQ4Aq+GkGLeJlA4UeC3ZaWzH1qGxK9dFUBOmbF1lddi3yip+W
 4Hv+k+gC8x+sDVQnS5zAzIdZMndJFqFUt7ClVJhvzrUOwTpCo9s/8/hFo9w+Azsq37lK5o
 ArWMyV0/CqU5KBo6YGZcLMw2FgrRGas=
From: Michael Walle <michael@walle.cc>
To: robh@kernel.org
Subject: Re: [PATCH v2 00/40] PCI: dwc: Driver clean-ups
Date: Tue, 15 Sep 2020 11:12:18 +0200
Message-Id: <20200915091218.28737-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_051259_682735_3990FAB5 
X-CRM114-Status: GOOD (  11.46  )
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
Cc: hayashi.kunihiko@socionext.com, narmstrong@baylibre.com,
 linux-pci@vger.kernel.org, wangbinghui@hisilicon.com,
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, linux-arm-kernel@axis.com, jonnyc@amazon.com,
 jonathanh@nvidia.com, festevam@gmail.com, jbrunet@baylibre.com, maz@kernel.org,
 jesper.nilsson@axis.com, linux-samsung-soc@vger.kernel.org,
 eswara.kota@linux.intel.com, khilman@baylibre.com, pratyush.anand@gmail.com,
 krzk@kernel.org, kishon@ti.com, agross@kernel.org, linux-imx@nxp.com,
 songxiaowei@hisilicon.com, hongxing.zhu@nxp.com,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, yue.wang@Amlogic.com, lorenzo.pieralisi@arm.com,
 m-karicheri2@ti.com, bhelgaas@google.com, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 yamada.masahiro@socionext.com, gustavo.pimentel@synopsys.com,
 svarbanov@mm-sol.com, Michael Walle <michael@walle.cc>, kgene@kernel.org,
 kernel@pengutronix.de, jingoohan1@gmail.com, shawn.guo@linaro.org,
 shawnguo@kernel.org, l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Rob,

> This is a series of clean-ups for the Designware PCI driver. The series
> initially reworks the config space accessors to use the existing pci_ops
> struct. Then there's removal of various private data that's also present
> in the pci_host_bridge struct. There's also some duplicated common (PCI
> and DWC) register defines which I converted to use the common defines.
> Finally, the initialization for speed/gen, number of lanes, and N_FTS
> are all moved to the common DWC code.

> This is compile tested only as I don't have any DWC based h/w, so any
> testing would be helpful. A branch is here[1].

I've noticed that with the latest linux-next, my board doesn't boot
anymore. I've traced it back to this series. There is a similar
board in kernelci [1,2] where you can have a look at the backtrace.

I've bisected this to the following patch:
  PCI: dwc: Use generic config accessors

I'm pretty much lost here. It seems that the kernel tries to read from
an invalid/unmapped memory address.

[1] https://kernelci.org/test/plan/id/5f5f4992d1c53777a0a6092d/
[2] https://storage.kernelci.org/next/master/next-20200914/arm64/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1028a-rdb.txt

-michael

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
