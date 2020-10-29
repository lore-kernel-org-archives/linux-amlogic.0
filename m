Return-Path: <SRS0=5ZAx=EE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AA7C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:24:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3CCD20782
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D2v416Zd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBJct0dO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3CCD20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lUJoLv+pttYey7+TCr58tvt5aoWAH3tdfADr0hRrbK4=; b=D2v416ZdF6z/mrtaDGgyixDDZ
	SPk+EBG2luFyUQxPLzMlOJxKEye46u5U1GKBuHUgYsgrt4M0Gtl93YyfBZ/hskhPcGm0HYKq+uOCK
	JXcKPbpI2JJ3JxbUCsmA5tUTYoZMciRThtAQh1Rgy6kUL69X7bXcIMDwJg2qoH4sFhdswzm2ymcOm
	XjETnZMJVteK6izzSwnCxrQBzFkWckp1sPKtLhKFCGCWs9jxGji+56Ha2JyxqhTqsNOYW2qPM+qaa
	vpK8gVmBYYJi/5P4rUct3BtjWx9STXReaLXP8xofEa6yOoeh9FLEJI5lR7T9mOVE0eWRUhQUwNE3/
	RV9Ncyigg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGLG-0003zK-61; Thu, 29 Oct 2020 22:24:22 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGLE-0003yg-1V
 for linux-amlogic@lists.infradead.org; Thu, 29 Oct 2020 22:24:20 +0000
Received: by mail-pf1-x444.google.com with SMTP id c20so3558445pfr.8
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2020 15:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=9mqbTtWDUKSZ1WPBFs+gFlrLeX5B0ppunvO1L1WoE6Q=;
 b=tBJct0dOj+8ac7g5SqfP/LNRCHS59hKwwbbqYi7lNSKlrhy/NDKVbecFO37UWLFSp/
 wslaeWTzhgor+pJeRp4v4aqxuk1RlwQu3T14KY0fe1VHrzCOVOurZfXjDiNFQNHPtvIr
 fme+iceW0Mh6HMjDSqOaLFQMu9czNnfzN6jWy7MGypoGZ+uZvmTQ+uVaVQyADFNSzfHN
 puKdoYBwGf6oN8GqUzBpQA9AV5euZaDb1HjxJBVy3nPBOiRn4DO60EX1QYShMUER2Qun
 YgvMXDLhc1c/1EIzR9jy1K6BC4jgBAnu4YWfqGnJb0qP2CCWhoYIXKftkZ6bN2osiqQk
 VJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=9mqbTtWDUKSZ1WPBFs+gFlrLeX5B0ppunvO1L1WoE6Q=;
 b=bWOM7y0N45bgnSmiy0rFsuyFlesmq9Pb3Vszp47gPcIW9rVlvuC0cy5owwWpar8o9u
 RQiFQhVqpee3+1tS4uvyVDtcTpY9NlPMDh6A6Nf6VbH/hvtX/NlyGrhT7BEMY1FA3YyW
 tqF9df/saQE6xP5cSPKLxdPMpt+SetphGM2tX/rlcVkw3QLmot3WRwz1X5epZM+fNOMc
 ZrNGNwNkfXGf6mEP3L4AfVySVawn7K+NAIjuo3FJHU/dxdfde3NF9fxlLDOIBsPWTBU0
 VV+p/MhTE4udEN9R6BeQjR5iLBtaez4LtX0rXfzoh1Ao7gZmdiZMw0/cySaCbu5OFHq6
 OT0A==
X-Gm-Message-State: AOAM533Tra0PBVs4Ix6QQMyrRK8MgxxbfNawloIX30Ao7YZGufNhMG5E
 5k1Idx0dqNbvbCXEW6Olrk4=
X-Google-Smtp-Source: ABdhPJyf9HkO546mjW9pBJiNrvmxxbKS5PCAVoKRcNjZQMkBpSaL2UdBzGRuMr78otZem6jWtaFUtw==
X-Received: by 2002:a17:90a:7c03:: with SMTP id
 v3mr1953144pjf.233.1604010258165; 
 Thu, 29 Oct 2020 15:24:18 -0700 (PDT)
Received: from SL2P216MB0475.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:19::5])
 by smtp.gmail.com with ESMTPSA id
 q16sm3686700pff.52.2020.10.29.15.24.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:24:17 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 10/13] PCI: dwc: Move link handling into common code
Thread-Topic: [PATCH 10/13] PCI: dwc: Move link handling into common code
Thread-Index: AQHWrWuJoIKvQ2UL9k+TQsNhRy2uqqmvKY0c
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:24:06 +0000
Message-ID: <SL2P216MB04751BBE5822E3BA7DA91D76AA140@SL2P216MB0475.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-11-robh@kernel.org>
In-Reply-To: <20201028204646.356535-11-robh@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_182420_101843_BC77C29F 
X-CRM114-Status: GOOD (  17.30  )
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
> All the DWC drivers do link setup and checks at roughly the same time.
> Let's use the existing .start_link() hook (currently only used in EP
> mode) and move the link handling to the core code.
>
> The behavior for a link down was inconsistent as some drivers would fail
> probe in that case while others succeed. Let's standardize this to
> succeed as there are usecases where devices (and the link) appear later
> even without hotplug. For example, a reconfigured FPGA device.
>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Murali Karicheri <m-karicheri2@ti.com>
> Cc: Yue Wang <yue.wang@Amlogic.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Jesper Nilsson <jesper.nilsson@axis.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Xiaowei Song <songxiaowei@hisilicon.com>
> Cc: Binghui Wang <wangbinghui@hisilicon.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Stanimir Varbanov <svarbanov@mm-sol.com>
> Cc: Pratyush Anand <pratyush.anand@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@axis.com
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  2 -
>  drivers/pci/controller/dwc/pci-exynos.c       | 41 +++++++----------
>  drivers/pci/controller/dwc/pci-imx6.c         |  9 ++--
>  drivers/pci/controller/dwc/pci-keystone.c     |  9 ----
>  drivers/pci/controller/dwc/pci-meson.c        | 24 ++++------
>  drivers/pci/controller/dwc/pcie-armada8k.c    | 39 +++++++---------
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  2 -
>  .../pci/controller/dwc/pcie-designware-host.c |  9 ++++
>  .../pci/controller/dwc/pcie-designware-plat.c |  3 --
>  drivers/pci/controller/dwc/pcie-histb.c       | 34 +++++++-------
>  drivers/pci/controller/dwc/pcie-kirin.c       | 23 ++--------
>  drivers/pci/controller/dwc/pcie-qcom.c        | 19 ++------
>  drivers/pci/controller/dwc/pcie-spear13xx.c   | 46 ++++++++-----------
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  1 -
>  drivers/pci/controller/dwc/pcie-uniphier.c    | 13 ++----
>  15 files changed, 103 insertions(+), 171 deletions(-)

[...]

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
