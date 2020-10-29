Return-Path: <SRS0=5ZAx=EE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2653C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:15:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47B8C206CA
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:15:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mV6cccTx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATMcJHxQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47B8C206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4mOTTbWYGBP/HYvqI3RTiHo/94aLUhFkAnWSi1Gdgus=; b=mV6cccTx13hkEeZZGUuTnknV2
	TxDRraxVmYmaczZWCwvJw+LiphJKgzfJZDC3cx3GzNItY0IcTB5a+ypo9/+Y3tu7mcqJv30yPN5AT
	2RxeDSBQja1Xo6L1Psw60Dh72Hk2mjak6Sffe/vW5Zay53pKT0K+yBxYKjB/NZLSKMQSN0X1iDjrO
	KZMABaH0uLpv03okmL7K3VT/5ztTPVmjF0m5PogFnRN7gQyGyVhUmz4wEJyN9gYOSo8vmf3xvDWj2
	Z93TwTE1ZAeK9O5/a2uWc3dW9UuvI1RKPT/4pFG3miZ04xrABLFkULlil85VUTGmBsDFxK3w9uRt2
	NO52tYMQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGCy-0002zO-9j; Thu, 29 Oct 2020 22:15:48 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGCw-0002yp-B1
 for linux-amlogic@lists.infradead.org; Thu, 29 Oct 2020 22:15:47 +0000
Received: by mail-pg1-x543.google.com with SMTP id o3so3479923pgr.11
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2020 15:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=wb9YwAxk2NQxLFpcYqM6hbPaI2aklAiVUdGq2NV0NhI=;
 b=ATMcJHxQmcMBWJSdahPYM75Ks+3p5JFHoEoVc7wKHtTMTbGrJ5GPrQzOTiqlY/O2FA
 WcTEd1DVFH8+A73QhQ7zJ1qFHeH931aweF+gFgULPrr0iJsUs9Arm7T0zDOQ7iGDiXIr
 K62PsZ6J0HRNE6V/79CiAYGV5qsWbEjJZ4U/s4YTUzibO5SupXBCGG4Yd4cmcB6LnzJL
 ucNZ9eyosFtlWjFHFpJ4JjOOjjyB8hIRnG42xcgmVOsrZkbJkz320MI+awHTrpziRXml
 0CcGcuey+fWXuCZiaAV7DePF42FtnVFkTRchEYkAoEEQtmtloHnfynN+A7jngOoU0BUr
 hlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=wb9YwAxk2NQxLFpcYqM6hbPaI2aklAiVUdGq2NV0NhI=;
 b=syLlZHyHM5+PbvxMf20G6tQ4U0+JhdrW5CPNnYYPZof/2vmXLB6lQYK0tmi67bDWe2
 MkfNfhbpi8Jh6isGEGNReWLWOp1nq5RDuL0l8EQkedVMn1+MKr7zgyS5Js1YOM50dRPc
 EQvZxtWAPaFNk5LcdTh4R/prQJvuolsvR2NlS1gwue2fcQOMTAFFrdXLIqKXUsK8Mmcz
 7aC7vd6ubkgtuYkG17rP+/EaSmpBGtof/SYzKx6VxqWMZ4/wLVAaBwZZm6/CtHqljYfk
 m9MjOpxyLOzRtpUhDlXw0kIXtQP3B89H4fk9lZw+xPjG6YGca74KF9Iz9htx0CX76TWL
 IW/A==
X-Gm-Message-State: AOAM533hKQvtj5syTidkIcwtn0YlTJqx0H18gnBR3GrtnJDzkc+Yo8nQ
 gCN1Xl1qa+UGbeOFSm170Rw=
X-Google-Smtp-Source: ABdhPJxlHYl+cZgk+KIPjNe48JdRu/zKn8ZJifDV9M3gXsbKATnx6XuuuC+nrXnuW0dPRIEWcL42zA==
X-Received: by 2002:a17:90a:bf05:: with SMTP id
 c5mr1353597pjs.11.1604009744576; 
 Thu, 29 Oct 2020 15:15:44 -0700 (PDT)
Received: from SL2P216MB0475.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:19::5])
 by smtp.gmail.com with ESMTPSA id
 34sm1704038pgv.53.2020.10.29.15.15.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:15:43 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 07/13] PCI: dwc: Drop the .set_num_vectors() host op
Thread-Topic: [PATCH 07/13] PCI: dwc: Drop the .set_num_vectors() host op
Thread-Index: AQHWrWuFryq4LWMsWUG3+ygcwfeheamvJygg
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:15:32 +0000
Message-ID: <SL2P216MB0475BFB1A3DF471129F61B93AA140@SL2P216MB0475.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-8-robh@kernel.org>
In-Reply-To: <20201028204646.356535-8-robh@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_181546_421490_D5A3D0E5 
X-CRM114-Status: GOOD (  12.22  )
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
> There's no reason for the .set_num_vectors() host op. Drivers needing a
> non-default value can just initialize pcie_port.num_vectors directly.
>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../pci/controller/dwc/pcie-designware-host.c | 19 ++++---------------
>  .../pci/controller/dwc/pcie-designware-plat.c |  7 +------
>  drivers/pci/controller/dwc/pcie-designware.h  |  1 -
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  7 +------
>  4 files changed, 6 insertions(+), 28 deletions(-)

[...]

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
