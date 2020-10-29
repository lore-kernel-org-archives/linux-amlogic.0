Return-Path: <SRS0=5ZAx=EE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78470C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:20:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF34A20FC3
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XAEIik2u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXYioUG+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF34A20FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iIXvB5Laf6rFJgEEHcZKDFd9Mtqi+tY+qDP1JGDe8Vs=; b=XAEIik2uDGqNnt071TbkBbu6u
	ezrBQEJiLE5gxaktrrY1oEueEkaF1tUx52XSAqrj3mqGTXM2WNIfvRvpZBaX0rmmgFzFBTD0TX06a
	V5J83mZVjsrATwrqFxyti6J+/3uVjBz7iKN1ZJpSspEkJGzoJx2g3zdSyjjoI4tDy7TODC+9mzc23
	KYUpCJdqqq5/1C6T3tMVrRfhf8n2qf/2pDlcsCGDLnVXFLvYvK+U9tMYVZbsLbxbcEecyVR2lnzqQ
	sIY+WtreE3kwte5GCBSs8UQLey8GQBQZ9nR052npuEIx6lNFZPQr4NdQ/8HDUpTZb35kzs3WUDpLQ
	pRzADrtqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGHc-0003X1-Ac; Thu, 29 Oct 2020 22:20:36 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGHZ-0003WB-MP
 for linux-amlogic@lists.infradead.org; Thu, 29 Oct 2020 22:20:34 +0000
Received: by mail-pf1-x441.google.com with SMTP id j18so3580354pfa.0
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2020 15:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=FOoaeCn33/ipYh2zHeIJMAsJ57EgPtJEMeLEEZX4GBg=;
 b=JXYioUG+T5BQ59RxZlgLJQH7xPvNe0cS4rzH12hBu8Sym70lt57gs1Pkds6SaAC90f
 C3p4B/4Q6npqOo5DKBxAKnFr8Kr4AF1uO+D+Ybt8FQbFC+7/aOyWoa6f6jO36vPhv0gf
 Jjtf9S6d68AHuDpRG+QKdxw5bSxHZGZXSEik17nQFn+f68Wqy2q3nvCZtN6+WU98ZRAG
 VszFLN/zelOKJe17cacdXwXVg7TJ/4AjuBm4KJpsj6U1SK4lG4aAOMOWRXgBcboPoO8U
 tsx9Md4BKIalifnFtjCPMfAoZtgsGDdYTZBqkx2AAhFMAKZyDqleF9XqFeOmr5LPiz12
 Ereg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=FOoaeCn33/ipYh2zHeIJMAsJ57EgPtJEMeLEEZX4GBg=;
 b=oLUIz5z3UsQpRBLicOBuRNIDW6KQKtMmaHOoPG/Up6wW1bmoqAOTiEQB50a2KFLRgV
 cvoo1rgWkhIqQo6TJMtHk8aVuIKYh8KhNaRedeMfKX26nPQIci/SGpwM2fTAm59FkUZc
 ci4cdXbyYq8A5cvNpdj5OjuhUQuVS4n+eCNf7dzAvscji3vXwWSbw6ZdMRuMVYRuWKGX
 +K99SXFHzeNvI1rrTm8TbMZ2VA+sc3FLy70xMxK5wFMTJKu4wX06OU8G/JJCux5nkcg/
 fhZwi3LWIdhp84aeDAQd8U2DUCpBb77odbQNR1mO+BS1nje0YCBHJdlvmC677w5pNfJi
 zTNw==
X-Gm-Message-State: AOAM531UdLA8rVTW/HjPthXt9+1MCwaLbOweOZkPGyap4A6qvRYQhPBd
 xvaPmQIDVkBDmRhBWesCXgk=
X-Google-Smtp-Source: ABdhPJzIHxSZFeeHkKrEYBnNoJGKIQEtuuPzw7YrhdkseS3FZyrRqbwhxcs5J9Iyjnq9UuKpbBh01Q==
X-Received: by 2002:a17:90a:ab8b:: with SMTP id
 n11mr1378340pjq.162.1604010031783; 
 Thu, 29 Oct 2020 15:20:31 -0700 (PDT)
Received: from SL2P216MB0475.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:19::5])
 by smtp.gmail.com with ESMTPSA id
 i30sm3772040pgb.81.2020.10.29.15.20.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:20:30 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 09/13] PCI: dwc: Rework MSI initialization
Thread-Topic: [PATCH 09/13] PCI: dwc: Rework MSI initialization
Thread-Index: AQHWrWuJaaGDQXSS2Eu3W5SQBB5/HqmvKH4y
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:20:19 +0000
Message-ID: <SL2P216MB0475953C235B27D3E6C01CE2AA140@SL2P216MB0475.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-10-robh@kernel.org>
In-Reply-To: <20201028204646.356535-10-robh@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_182033_781846_11F5EC16 
X-CRM114-Status: GOOD (  14.03  )
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
> There are 3 possible MSI implementations for the DWC host. The first is
> using the built-in DWC MSI controller. The 2nd is a custom MSI
> controller as part of the PCI host (keystone only). The 3rd is an
> external MSI controller (typically GICv3 ITS). Currently, the last 2
> are distinguished with a .msi_host_init() hook with the 3rd option using
> an empty function. However we can detect the 3rd case with the presence
> of 'msi-parent' or 'msi-map' properties, so let's do that instead and
> remove the empty functions.
>
> Cc: Murali Karicheri <m-karicheri2@ti.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Minghuan Lian <minghuan.Lian@nxp.com>
> Cc: Mingkai Hu <mingkai.hu@nxp.com>
> Cc: Roy Zang <roy.zang@nxp.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-keystone.c     |  9 -------
>  drivers/pci/controller/dwc/pci-layerscape.c   | 25 -------------------
>  .../pci/controller/dwc/pcie-designware-host.c | 20 +++++++++------
>  drivers/pci/controller/dwc/pcie-designware.h  |  1 +
>  drivers/pci/controller/dwc/pcie-intel-gw.c    |  9 -------
>  5 files changed, 13 insertions(+), 51 deletions(-)

[...]

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
