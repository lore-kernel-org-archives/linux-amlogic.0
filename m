Return-Path: <SRS0=5ZAx=EE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CAEC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 13:02:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3424120809
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 13:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="attM5fvs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1mT2NYH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3424120809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yXgl4n5vdgRoBDmtxNAqTyBfLrqlxnxg8SQ1pqwLZN4=; b=attM5fvsshNnqOycT0Ggb30m4
	ZpoL+EAWby64q1rH/mmU8+2Q+M+u1KDvgaRnUyN5pT+IEaJlTNMcUVIj3ItAGnSD83RPngAJ+sG+4
	IeOgtuiVky2/CbU6DEloSXkrZhw5/mHTqHcPmt425VsKRzlnR4FZhzWd2Mds+YkcAso8Doiqc+/c/
	7O569iSZgkKJ+AGFUi+Yg8fWbcr9zMmIgQZxx58d33hnFB4+KT+Shfd0PLWR/RRH26tP23S3ha/O4
	nZupYpaio5Xwu3nxM0FvGBl2D03lxjpvhsPWiAX2jAtCrqHzLJuraOfpOkMZTRL6wRJggufFU7MbW
	YwDFR2GEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY7Ys-00084b-KH; Thu, 29 Oct 2020 13:01:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY7Yq-00084A-Jd
 for linux-amlogic@lists.infradead.org; Thu, 29 Oct 2020 13:01:49 +0000
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 222E120E65
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2020 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603976507;
 bh=OzIlRpXLdeGRcoA/MVFEQyHps4XuaG+UwlBrggFdE0A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j1mT2NYHsoJ27PjrIOdCHm29Dr0jIJanUSSvW3ovjtCA+2JsQwP4TF17V8h45KLn6
 q/rWGnzjK5R5HCKtdT1UjO2CPNs0DlEyYrKGlf249zeQobn/tqoqqoSOkKF0nQ/tJx
 XzpLkOIXBR85Tjr1fxwi0eRNQozFeZBPxlNnWRvE=
Received: by mail-ot1-f47.google.com with SMTP id f37so2126428otf.12
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2020 06:01:47 -0700 (PDT)
X-Gm-Message-State: AOAM533e92nnD8SmZ06zlO9MDVf+KuNc4jJa63IueJ4Y/7own65NGlW0
 qGg7Me2nmCKtjEmFq82mDsQ2zUz7aYQknOB6/Q==
X-Google-Smtp-Source: ABdhPJy/bhS7KTF1WNqgQUUalxQA1GfpAd7FTQIi3yYFWyIBt0GxzCWPuCwRMAMfnaaUFyZdFb4NCZ8rTg453LUEqGQ=
X-Received: by 2002:a9d:62d1:: with SMTP id z17mr3193317otk.192.1603976506229; 
 Thu, 29 Oct 2020 06:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-2-robh@kernel.org>
 <87h7qdx4oz.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h7qdx4oz.fsf@mpe.ellerman.id.au>
From: Rob Herring <robh@kernel.org>
Date: Thu, 29 Oct 2020 08:01:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJWzmGNifrJEKGg582kZNtjnWHaUkG0EinWqjhGaeL1dg@mail.gmail.com>
Message-ID: <CAL_JsqJWzmGNifrJEKGg582kZNtjnWHaUkG0EinWqjhGaeL1dg@mail.gmail.com>
Subject: Re: [PATCH 01/13] PCI: dwc/imx6: Drop setting PCI_MSI_FLAGS_ENABLE
To: Michael Ellerman <mpe@ellerman.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_090148_834509_4E98DC1F 
X-CRM114-Status: GOOD (  18.62  )
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
 Neil Armstrong <narmstrong@baylibre.com>, PCI <linux-pci@vger.kernel.org>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 linux-arm-kernel@axis.com, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Yue Wang <yue.wang@amlogic.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Murali Karicheri <m-karicheri2@ti.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Oct 28, 2020 at 7:21 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Rob Herring <robh@kernel.org> writes:
> > No other host driver sets the PCI_MSI_FLAGS_ENABLE bit, so it must not
> > be necessary. If it is, a comment is needed.
>
> Yeah, but git blame directly points to:
>
>   75cb8d20c112 ("PCI: imx: Enable MSI from downstream components")

I think I did read this at some point and then forgot about it when I
made the change later...

> Which has a pretty long explanation. The relevant bit probably being:
>
>   ... on i.MX6, the MSI Enable bit controls delivery of MSI interrupts
>   from components below the Root Port.

The thing is that all seems not i.MX6 specific but DWC specific given
MSI handling is contained within the DWC block. So I don't see how
this could be an integration difference.

So maybe everyone else is still just setting CONFIG_PCIEPORTBUS
typically and haven't noticed? Is it correct for the host driver to
set MSI enable?

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
