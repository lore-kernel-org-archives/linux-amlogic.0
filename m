Return-Path: <SRS0=5ZAx=EE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1CCC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:18:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94A17214F1
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:18:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uCVZIKvq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efjnQN8B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94A17214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H3jaD1WvSVZsoA+/JKlEMxPaZtNfvqmXzN8XdWE44B8=; b=uCVZIKvqx9ktl8rP7yUf6tx0r
	lzu/BfkyLrMcCUqbMaTpgmxbW6v/l25+fTus5v10xN+XxoxQKkCva7GRBdLn+KupjkYwFyAtDnNQu
	kWVsItZWHaQx+KMxt073VdZjIWIEGsmHEWFK+PxO9zIuIeY3gFC24D0Vxujjr5V8KDXemGuH8DEuB
	kV+R9zWNI04Aoh0fs6tdikDDVdlNNYjpDBm7IlfiYW56KQ8YY856MuYRLOeziPGPRkt95cryQwWb+
	fs9z7/0bXeN6k3O0c/QCnm1efLYoPMo2875Lb/dsmLc4R3+PJgLlM2IV5PnwMKPz6+aU48PSy0hua
	hM5eOCrTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGFp-0003F5-C0; Thu, 29 Oct 2020 22:18:45 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGFm-0003EE-TL
 for linux-amlogic@lists.infradead.org; Thu, 29 Oct 2020 22:18:43 +0000
Received: by mail-pg1-x541.google.com with SMTP id r10so3494338pgb.10
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2020 15:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=0JLyqfoztBsM4bd8GDzwKmcvHsdDBe0Vipxzr6rfQ6o=;
 b=efjnQN8BYX87Tjs3cdlMM5rbHmXG6lM/LdGTA8BLHkD+wr3lwYOVZBW7+BdpO4MfuN
 +TlDghiZ4ZXBSa0vZBgvec8u4PN3mBdzhbeITS/6g7uOmseOxMiweI6rZW6wgDEsELgA
 5GIEsVfBMgcdeomUPNI8IW0drzniTV6u41RzzzL1eFFz/g2M/b9y9C1bkx89HRd0ewsE
 iKkqWm+ECzvRLnc685+eeX+FsIH9QcAI09kKGKWs6wHyiNsQxDhRzR8VRrcDoYOivPeO
 LxUYW7C+uSJOblQZDGo0+yJIT7QWRCLremt1WF5O1mljBaXEUpv/5tugMPqYGftgdYCw
 41FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=0JLyqfoztBsM4bd8GDzwKmcvHsdDBe0Vipxzr6rfQ6o=;
 b=GkRzwrFaBj/PcZlWJWikMy6BRoKSYaSwDsApdrwv0MVGdMpGoEQ+H81JBbAdg4cwat
 7Tj4uzp+nZ8bwPeh1ki53EGx6pLN82B8zZOgvIJ0zMv1k2grxqfMKVkoVO/swYWQbS6o
 motbpVVdhkNBRO2Ay5PqldfvXnfk2cHhfdkcYvqFGibs0Xi85Hzy8MGPnj2fhhuS83ZU
 xstPqVP0FY4dRfjiXaBCyD+LajdkqZKU3q8DDoj5kOUM4ZZIEZ2pNEwOgbS8UoEfsDwp
 mBKAniWZlL+EgD63/JXd6TuuhX5gNonHIt0ii51M1pF9ZnfX0Ag1FoOrZUguOhpEpo0U
 bb7w==
X-Gm-Message-State: AOAM532MojAq56WEUzQrjQajZuiBboAWQVG6Jp1RCb+CTc0g7Ly7eWAc
 iPidHWk9ny7svZDNe8AvSaM=
X-Google-Smtp-Source: ABdhPJyKzky7Hlxd2ju++O4t3nei2/mY1jw3pY46QxIKFwE+ZIP26mYCGKOsIJiQiTBtuu8EYwlZAg==
X-Received: by 2002:aa7:9811:0:b029:15d:2c0e:e947 with SMTP id
 e17-20020aa798110000b029015d2c0ee947mr6362369pfl.76.1604009920927; 
 Thu, 29 Oct 2020 15:18:40 -0700 (PDT)
Received: from SL2P216MB0475.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:19::5])
 by smtp.gmail.com with ESMTPSA id
 20sm3913757pfh.219.2020.10.29.15.18.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:18:40 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 08/13] PCI: dwc: Move MSI interrupt setup into DWC common
 code
Thread-Topic: [PATCH 08/13] PCI: dwc: Move MSI interrupt setup into DWC common
 code
Thread-Index: AQHWrWuFOQ/rIkS/ZEGWk+b2wGddk6mvJ/u9
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:18:28 +0000
Message-ID: <SL2P216MB04754345E108C4B2DD752C1FAA140@SL2P216MB0475.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-9-robh@kernel.org>
In-Reply-To: <20201028204646.356535-9-robh@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_181843_005785_97857B31 
X-CRM114-Status: GOOD (  16.06  )
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
> Platforms using the built-in DWC MSI controller all have a dedicated
> interrupt with "msi" name or at index 0, so let's move setting up the
> interrupt to the common DWC code.
>
> spear13xx and dra7xx are the 2 oddballs with muxed interrupts, so
> we need to prevent configuring the MSI interrupt by setting msi_irq
> to negative.
>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Yue Wang <yue.wang@Amlogic.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jesper Nilsson <jesper.nilsson@axis.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Xiaowei Song <songxiaowei@hisilicon.com>
> Cc: Binghui Wang <wangbinghui@hisilicon.com>
> Cc: Stanimir Varbanov <svarbanov@mm-sol.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Pratyush Anand <pratyush.anand@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@axis.com
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  3 +++
>  drivers/pci/controller/dwc/pci-exynos.c       |  6 -----
>  drivers/pci/controller/dwc/pci-imx6.c         |  6 -----
>  drivers/pci/controller/dwc/pci-meson.c        |  6 -----
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  6 -----
> .../pci/controller/dwc/pcie-designware-host.c | 11 +++++++++-
>  .../pci/controller/dwc/pcie-designware-plat.c |  6 -----
>  drivers/pci/controller/dwc/pcie-histb.c       |  6 -----
>  drivers/pci/controller/dwc/pcie-kirin.c       | 22 -------------------
>  drivers/pci/controller/dwc/pcie-qcom.c        |  8 -------
>  drivers/pci/controller/dwc/pcie-spear13xx.c   |  1 +
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  8 -------
>  drivers/pci/controller/dwc/pcie-uniphier.c    |  6 -----
>  13 files changed, 14 insertions(+), 81 deletions(-)

[...]

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
