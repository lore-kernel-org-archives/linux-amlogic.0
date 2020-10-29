Return-Path: <SRS0=5ZAx=EE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D2BC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:12:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 280D8206CA
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mSLYr/Uj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuMYLOx1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 280D8206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RsYJDc6bpo0eehyJNkDW1p4N4FF/hB5NSVU00msHl7s=; b=mSLYr/UjiMJnenKhrSe4NpT6H
	dk3INgrvCAd4/SkziB2lQtj15HiJnSa2sZ0ONzuD0ZOwDw06CB5qYVLd7OfnGz2DwrLQQ8glle4vt
	QhlXGym7hCCv3BFCCggaZyvsSBGFUe0bSmYTPLS8ZrUVc3qb7VEUh/iR2DlpfWfxrdTnOwdf+KEP6
	QxpryCwwvO5Px4t6Fap4fE5H+RA8VsGfNi4UE+DfaKBRH9m66eaYDoExEVbvNdmT2FiPtwu14ZXh2
	JoMafwSngvnHZqqzVjPdwwgHA4T9GAAKi4Fy8r6q4F8hVtmp72PsT44lCdeYgYQAcFeCSfAsSaW07
	Xw5pMzcGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGA9-0002fs-9i; Thu, 29 Oct 2020 22:12:53 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGA6-0002fJ-O7
 for linux-amlogic@lists.infradead.org; Thu, 29 Oct 2020 22:12:51 +0000
Received: by mail-pg1-x543.google.com with SMTP id z24so3504544pgk.3
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2020 15:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=LexN8YVXygah8E+BhRyOEnkuxN6ep+Yup593pkObYw0=;
 b=cuMYLOx136WyJxq/7rZTQMZ+CQTkOmHSXN49/NLmy5j3i4yCygiwgKLN3zACvyrEKD
 omjShSmKopC5d0CVh/shylgeqTg1Tgfq0vnAwMf49dD8ZuW/fICNIAMJqbNUsCONLE10
 YymsqlyM1dLRcFekczm9wCxc/iT5uAqN5LQR8GF/H9UBP3EnP7uc/VqUHlUwxCqt7t3S
 g38Gkfwc9Wq1FRuttfxtXJ5jCZCmcurSoYrnN6bGYMrORlQltsMr6VoqHqI1YKITxqkG
 BsCKl8kcc2UyZbgn81v2whufq4HZ87lF6xrsbnTySURCSJC1blKFveb1R+KOSGrlyCkO
 Johg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=LexN8YVXygah8E+BhRyOEnkuxN6ep+Yup593pkObYw0=;
 b=mbBOvMm6XeTSP+nnZpkXwldMTY8FPuQmrnvEGL8A6rNFDpw32LCtsvicz/NKelYZph
 BuO6j9/ehKfd8SSYxdI7B4X/nVIZZThbD/KYYDhC2yJjrCtqNZyaV3kHD6xCvlj80ump
 6mA0zz4dI2kiJLjWKjbkuDxaNacOUzlg0Qi9WQTYKrsJS+l/SZ2/EbrescxS/VhNVKez
 MmPxn2W+w/Lg/3Ztf+AcouEwWNTtMZNT1H0kfdYClac1yrF7LuvTorST+vK37wlv1p9n
 e1BR6qHyGr2HBSaoN1+/VvAMCo60xvi27gLvgvslFxVVuPTAkSc0Vcrx1HFaAx1u1lDa
 5O6Q==
X-Gm-Message-State: AOAM530YxwTzZ6opz1peJJwxa7Wb3Zb9vd/4NC/zlcDDoxvLWALjSv6c
 xD640a+25Qb/KAsr+Hq1aC4=
X-Google-Smtp-Source: ABdhPJy0Ttsg8HNWGwX6Kp9sWCdg1yCF7JN7GB9BQAAWDnhcJBBXT+RwpK391AYg+TINn+AdKcRV2w==
X-Received: by 2002:a63:f446:: with SMTP id p6mr2917548pgk.67.1604009568803;
 Thu, 29 Oct 2020 15:12:48 -0700 (PDT)
Received: from SL2P216MB0475.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:19::5])
 by smtp.gmail.com with ESMTPSA id
 b7sm4100754pfr.171.2020.10.29.15.12.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:12:47 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 05/13] PCI: dwc: Ensure all outbound ATU windows are reset
Thread-Topic: [PATCH 05/13] PCI: dwc: Ensure all outbound ATU windows are reset
Thread-Index: AQHWrWuC4GikzhqGKUGSkw9tkhUTo6mvJla0
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:12:36 +0000
Message-ID: <SL2P216MB0475A290104BEB83332A89B5AA140@SL2P216MB0475.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-6-robh@kernel.org>
In-Reply-To: <20201028204646.356535-6-robh@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_181250_821537_F76B8869 
X-CRM114-Status: GOOD (  20.85  )
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Kevin Hilman <khilman@baylibre.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Yue Wang <yue.wang@Amlogic.com>,
 Murali Karicheri <m-karicheri2@ti.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Andy Gross <agross@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Han Jingoo <jingoohan1@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/28/20, 4:47 PM, Rob Herring wrote:
> 
> The Layerscape driver clears the ATU registers which may have been
> configured by the bootloader. Any driver could have the same issue
> and doing it for all drivers doesn't hurt, so let's move it into the
> common DWC code.
>
> Cc: Minghuan Lian <minghuan.Lian@nxp.com>
> Cc: Mingkai Hu <mingkai.hu@nxp.com>
> Cc: Roy Zang <roy.zang@nxp.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-layerscape.c       | 14 --------------
>  drivers/pci/controller/dwc/pcie-designware-host.c |  5 +++++
>  2 files changed, 5 insertions(+), 14 deletions(-)
>
>  diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
>  index f24f79a70d9a..53e56d54c482 100644
>  --- a/drivers/pci/controller/dwc/pci-layerscape.c
>  +++ b/drivers/pci/controller/dwc/pci-layerscape.c
>  @@ -83,14 +83,6 @@ static void ls_pcie_drop_msg_tlp(struct ls_pcie *pcie)
>   	iowrite32(val, pci->dbi_base + PCIE_STRFMR1);
>   }
>  
>  -static void ls_pcie_disable_outbound_atus(struct ls_pcie *pcie)
>  -{
>  -	int i;
>  -
>  -	for (i = 0; i < PCIE_IATU_NUM; i++)
>  -		dw_pcie_disable_atu(pcie->pci, i, DW_PCIE_REGION_OUTBOUND);
>  -}
>  -
>   static int ls1021_pcie_link_up(struct dw_pcie *pci)
>   {
>   	u32 state;
>  @@ -136,12 +128,6 @@ static int ls_pcie_host_init(struct pcie_port *pp)
>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>   	struct ls_pcie *pcie = to_ls_pcie(pci);
>  
>  -	/*
>  -	 * Disable outbound windows configured by the bootloader to avoid
>  -	 * one transaction hitting multiple outbound windows.
>  -	 * dw_pcie_setup_rc() will reconfigure the outbound windows.
>  -	 */
>  -	ls_pcie_disable_outbound_atus(pcie);
>   	ls_pcie_fix_error_response(pcie);
>  
>   	dw_pcie_dbi_ro_wr_en(pci);
>  diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>  index cde45b2076ee..265a48f1a0ae 100644
>  --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>  +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>  @@ -534,6 +534,7 @@ static struct pci_ops dw_pcie_ops = {
>  
>   void dw_pcie_setup_rc(struct pcie_port *pp)
>   {
>  +	int i;
>   	u32 val, ctrl, num_ctrls;
>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  
>  @@ -583,6 +584,10 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>   		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
>   	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
>  
>  +	/* Ensure all outbound windows are disabled so there are multiple matches */
>  +	for (i = 0; i < pci->num_viewport; i++)
>  +		dw_pcie_disable_atu(pci, i, DW_PCIE_REGION_OUTBOUND);
>  +
>   	/*
>   	 * If the platform provides its own child bus config accesses, it means
>   	 * the platform uses its own address translation component rather than
>  -- 
>  2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
