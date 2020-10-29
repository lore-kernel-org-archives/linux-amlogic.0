Return-Path: <SRS0=5ZAx=EE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF03CC4741F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:34:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 352AC206DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 22:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JzmcKC/W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gy+FevCW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 352AC206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eEUAE7MP7Y55Ai/Rye7dI1CuHp38Ih60jX0VG6majWE=; b=JzmcKC/W7siGty4gzq0dhkh95
	JUoj3Ec2Nyu6KsPqCtGWVfdt65lY+I/NCYRXzKIYYkiKlBM+71kv3Ce0ZxeqTebxFSK2x9PQZSbbj
	iR2D+juBqgan12fb9+R10HKqBoCD1/tjB4Zp7c6k+wXkhlAr5fIT89ZwBkwSFeMyht2XdWY4Y6d0K
	1VJbR4WhZFNqRa95SIfVp+0LgsftgN7emW1vap5O+6dmkSRNjKbF/cbUxedpr26StzSZTjquoakb9
	kpE4m/JW2DPbVAtoTxVsDwniAzBsi+n0eDdlRtqADMu3rT41FstXFvCUnwdBCIT6tEyXSYnV9/THC
	t40NxAP5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGVH-0005e5-Ho; Thu, 29 Oct 2020 22:34:43 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGUf-0005Jb-Pa
 for linux-amlogic@lists.infradead.org; Thu, 29 Oct 2020 22:34:07 +0000
Received: by mail-pl1-x642.google.com with SMTP id w11so1992952pll.8
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2020 15:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=odZpHbQegqT56U/cV/zJ1qrd6r3mGVChHF0VMSj69o0=;
 b=gy+FevCWq3xOKFvYbDpwz/v/EbxdJwTn9QVRUJOTJih66PW1TK/3NCZSJDPw9s+lse
 bkn74gnr4dgUfMBduEsxwTi2+ufO5e/+hUGIsMqkVs/R90SRyOZN7E7Oo/Uiz4+/kdKI
 XSLd+pdpeS8hOp+w4CCkgtaXITBk3FeqS/Atf8ilvae/ogwHTlVc0Ego1liS94BkKlv+
 1upTB8XaECpXOjZFIGOHsSRwFVRuMF4SuobL1D0hQWgog7GripUtaiOtQDlhGkAE3kHv
 vTu7ty07GqlJzrf6WKLjk+wXp1xMQLRtLDu6cF6UfdcVzOs3s0GSgD61pl8eeKqYlUAH
 skUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=odZpHbQegqT56U/cV/zJ1qrd6r3mGVChHF0VMSj69o0=;
 b=rxYC9f1K2JlKmYHFu76nw+ZebfqUWIOs8sLC5RtUo2EshqQXdRn1hsY8TQ2Wy4hWrV
 sLeeITBuGyCLubyOh8HAO1mFm2AiJc4Zd+yTEkvoA7t4Nhl9wPFD5+9s/8mb0ys+Srsb
 3Aq4t7hvZpnhzhNifGHAx/ir1PzHr0Dn3X83jFO5jxHtYoBvV9RQt0kWcxY1FHLVmeJi
 xhZUq9m2w5qHxszFoRKwin4eutf2493czUKiUIKf2+LZJGN89DYu6WZ3sBQrdY3r/4b8
 PjJVPf6wp13W5kp0PRSzOxp3J4R6oNWXyz7rC3MmgdqnAAhXUBzxy3pCCRIf/L/eVZDE
 ni1A==
X-Gm-Message-State: AOAM530vxHJVMbPmh9HufEEqWpgIGGxmFOTPKksUkAXR07qQ/sEz2dN5
 mv4WIZgpe179BgqObNN6HsQ=
X-Google-Smtp-Source: ABdhPJz+1FMPSkLVT3GNpxHHfWtt2o0ojp3jORJQkn1z2v1aWL9snq6p3aEN0mFkDfNYztLrINb5ag==
X-Received: by 2002:a17:902:bd01:b029:d4:d73d:7644 with SMTP id
 p1-20020a170902bd01b02900d4d73d7644mr6117533pls.69.1604010843618; 
 Thu, 29 Oct 2020 15:34:03 -0700 (PDT)
Received: from SLXP216MB0477.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:9::5])
 by smtp.gmail.com with ESMTPSA id i24sm3912204pfd.7.2020.10.29.15.33.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:34:02 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 12/13] PCI: dwc: Move dw_pcie_setup_rc() to DWC common code
Thread-Topic: [PATCH 12/13] PCI: dwc: Move dw_pcie_setup_rc() to DWC common
 code
Thread-Index: AQHWrWuNe0SVTqZ+qUiqNCgd41OCHamvKtka
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:29:06 +0000
Message-ID: <SLXP216MB047727F5D8FE67D796651A8BAA140@SLXP216MB0477.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-13-robh@kernel.org>
In-Reply-To: <20201028204646.356535-13-robh@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_183406_050545_168524D6 
X-CRM114-Status: GOOD (  14.67  )
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
> All RC complex drivers must call dw_pcie_setup_rc(). The ordering of the
> call shouldn't be too important other than being after any RC resets.
>
> There's a few calls of dw_pcie_setup_rc() left as drivers implementing
> suspend/resume need it.
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
> Cc: Minghuan Lian <minghuan.Lian@nxp.com>
> Cc: Mingkai Hu <mingkai.hu@nxp.com>
> Cc: Roy Zang <roy.zang@nxp.com>
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
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@axis.com
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c           | 1 -
>  drivers/pci/controller/dwc/pci-exynos.c           | 1 -
>  drivers/pci/controller/dwc/pci-imx6.c             | 1 -
>  drivers/pci/controller/dwc/pci-keystone.c         | 2 --
>  drivers/pci/controller/dwc/pci-layerscape.c       | 2 --
>  drivers/pci/controller/dwc/pci-meson.c            | 2 --
>  drivers/pci/controller/dwc/pcie-armada8k.c        | 2 --
>  drivers/pci/controller/dwc/pcie-artpec6.c         | 1 -
>  drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
>  drivers/pci/controller/dwc/pcie-designware-plat.c | 8 --------
>  drivers/pci/controller/dwc/pcie-histb.c           | 3 ---
>  drivers/pci/controller/dwc/pcie-kirin.c           | 2 --
>  drivers/pci/controller/dwc/pcie-qcom.c            | 1 -
>  drivers/pci/controller/dwc/pcie-spear13xx.c       | 2 --
>  drivers/pci/controller/dwc/pcie-uniphier.c        | 2 --
>  15 files changed, 1 insertion(+), 30 deletions(-)

[...]

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
