Return-Path: <SRS0=JbOA=IF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E710C433DB
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Mar 2021 22:10:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E271564FEF
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Mar 2021 22:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E271564FEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/XCwIrTQsXY+6w+IS29pN+AS7f/pGHUuis/vfPApCZM=; b=V3xBWXlO6pLvzBqU2W88WInh1
	ZF3WbcDkScmmFk2+2A9o/7PEDbXF22rQW+YzzR+uSMltaN220jO18nvEE1ejew9TdpnuUBoLX5L2c
	amQp7LPwhT2CmpW7DlY0wpDkca4XF6NEH935IjvDwMIA+j7on/nLmxPnI+2lZSUj6mp9mI3YzZI9f
	c4gvflpSI9ncm3g7GPxUQw8CEKDmGxPSb1r5V04wt0ygVl7xSjxXRXYKgHdEbM3CCKMchJOUPGzVO
	LSbtDZeWzdxkreAwgBTjCmEKIMzLT4k/U1jUS8rdEpriMJ7q2zGQT1OBLD1GAQEV9zledPh5YBpZP
	bV2Zgjbjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ1bZ-00Cs5F-02; Sun, 07 Mar 2021 22:10:30 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ1bK-00Crwr-UU; Sun, 07 Mar 2021 22:10:17 +0000
Received: by mail-wr1-f54.google.com with SMTP id e10so9379939wro.12;
 Sun, 07 Mar 2021 14:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w0FBb8CnoCr7tqR94rY/v8Qic5qKjXRNMAaFBeahA3I=;
 b=YDDppGLdlB7B/CGaruYGbHIzGIq+03PYJwWWW35GL57fzO0A+l5oNug2U+FDMhMr9Y
 TAhURYW1dJYQC8ZFTDJ2TB0pJjYN03LwgY4tdtENi/9Urh2uc0Mgd+sLN6FLEpqjN7M7
 BA3OSQEIgCJTetHoR9mn8ofnDsWWQtnKg/S+A0uA76uVqbdzdje1qp6VKtjRJqVwGCfI
 LG7+uQD7lZXDbabhab2djM2AoLgzWl9341ouaxR6IVvnH26NcvFcYGYxpRBFKe7PNbtP
 BMQ/EFEAS+okqLKEFi03pH+Tz0tN4VurUUeEKzT1Pv8yFqBooZVRKaZPV03H5ssj4m5t
 E1Kw==
X-Gm-Message-State: AOAM531kA7sYiySc2Nos6O9j0a3KqveTxuXYO4JlAZZmq1qbtqkFXdCI
 NCTVbHweekTx7R15EJtx9QA=
X-Google-Smtp-Source: ABdhPJz1EuAgHQbWUMttHlGdzXLBLuK8NfZzUmdIXnw5+kar1/RkTecBM2iv5KBusGCU6NdnIeRj6g==
X-Received: by 2002:adf:a2d3:: with SMTP id t19mr19655343wra.299.1615155014465; 
 Sun, 07 Mar 2021 14:10:14 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id m14sm16525603wmi.27.2021.03.07.14.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 14:10:14 -0800 (PST)
Date: Sun, 7 Mar 2021 23:10:12 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 Binghui Wang <wangbinghui@hisilicon.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 5/5] PCI: dwc: Move dw_pcie_msi_init() from each users
 to designware host
Message-ID: <YEVPRDt1By8TG9O5@rocinante>
References: <20200924190421.549cb8fc@xhacker.debian>
 <20200924190742.76939458@xhacker.debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924190742.76939458@xhacker.debian>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_221015_344782_47C41864 
X-CRM114-Status: GOOD (  11.35  )
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

Hi,

> Currently, dw_pcie_msi_init() allocates and maps page for msi, then
> program the PCIE_MSI_ADDR_LO and PCIE_MSI_ADDR_HI. The Root Complex
> may lose power during suspend-to-RAM, so when we resume, we want to
> redo the latter but not the former. If designware based driver (for
> example, pcie-tegra194.c) calls dw_pcie_msi_init() in resume path, the
> previous msi page will be leaked. From another side, except
> pci-dra7xx.c we can move the dw_pcie_msi_init() from each users to
> designware host, I.E move the msi page allocation and mapping to
> dw_pcie_host_init() and move the PCIE_MSI_ADDR_* programming to
> dw_pcie_setup_rc(). After this moving, we solve the msi page leakage
> as well.
[...]

A small nitpick.  All the "designware" should be "DesignWare" both in
the commit message and the subject.  Similarly, "msi" would be "MSI",
and "I.E" would become "i.e.,".  If you ever sent another version of the
patch, that is.

See the following for reference:
  https://lore.kernel.org/linux-pci/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com/

Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
