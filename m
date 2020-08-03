Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA25C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 11:10:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEE3820719
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 11:10:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XPztGiis"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEE3820719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RVZO7JM0hK0CgIp22lj4vcRs1rAWksqsPsvHN49kknc=; b=XPztGiissNib4J5CEaKVM/tJV
	a02aFigaCYgfGFeh8qFZ1DOveTLmi1kkEan02logj5i4WBenBlyPAi7Bo5Y+QeSNrXrW/isNr8dcr
	bCHwYjraNQztuKt5rt4lijqYs/btDl9EM5ciSr9uTdnoA2JHb2JoYh3mctsBsYECqjZt3e1Jstz1b
	6kN9qEKYQhYD8H8kP9pD83JPWtQti6rPLBGyd746uByW317UY5pDM4bY2rV8m4v7tGFVq+rPweGAG
	w92Lxd+hMPESrvyxR3eMGGuZhiMDHNvT5gmnlwO0zaoWXw7STZGO/wnSajcHfH5mhx2Nnwoy/XGZL
	Jh9PT6GKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2YMg-00042e-LK; Mon, 03 Aug 2020 11:10:46 +0000
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2YMe-000425-2l; Mon, 03 Aug 2020 11:10:45 +0000
Received: by mail-lf1-f67.google.com with SMTP id h8so20211503lfp.9;
 Mon, 03 Aug 2020 04:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IVlqnbhGeE/kEX8giPA2WMnSp+K7doLgjgnP7NlrDCA=;
 b=T3Nqan76NGi7nIxV7z+vowq4CdPO98GYmmX5gyzOxmjwmKeDSRcF4UILCUpM5ZKYa2
 pLgAacT6IIpIQjewYWZ89cH82Ru8jKmXq/Fqsi2Ye4mX5uWgu6Dmg0mmwQV+1Kz5FEj6
 ZAz2A1NWPdNlMahLB5X29omq+TXIw7X1DC47nU07hkmimp795Ia2VCO4Pho5IzvOnqk3
 B9G6WriQW3Ny6P9J4jn1PXqqjisMO80GwjJDJMurtIv2HMeIjelDCnFcXmDgTvQ9QIPH
 Ay6ij+AztxuoTtgj3HTM1PIOqfu6yXlksOF3S6eaPJdXvwpavCvu+ODqMMPc45Avwsn+
 cCCw==
X-Gm-Message-State: AOAM531ZjEu4vb/BnBDWMuWjD17BkdOywmYjKCHXiR+LvB8FXMxUgyrs
 RTEhWwhF8jbO3kxg0cnl+0sVao8l73HWiw==
X-Google-Smtp-Source: ABdhPJwDn1LIRAkaOQfRhdgLpHGi10SbVqsf2QNj2hkXkIp0DxOdq2YHuUrtx962TLKrOo25eXPOGQ==
X-Received: by 2002:ac2:5338:: with SMTP id f24mr8306483lfh.5.1596453041410;
 Mon, 03 Aug 2020 04:10:41 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id y19sm4704991lfe.77.2020.08.03.04.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 04:10:40 -0700 (PDT)
Date: Mon, 3 Aug 2020 13:10:39 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 00/10] Remove surplus dev_err() when handing an error
 from platform_get_irq()
Message-ID: <20200803111039.GA90692@rocinante>
References: <20200802142601.1635926-1-kw@linux.com>
 <20200803020151.GA291575@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200803020151.GA291575@bjorn-Precision-5520>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_071044_184441_E5D64E36 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>, Binghui Wang <wangbinghui@hisilicon.com>,
 linux-arm-kernel@axis.com, linux-tegra@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org,
 Kukjin Kim <kgene@kernel.org>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Richard Zhu <hongxing.zhu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, rfi@lists.rocketboards.org,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 20-08-02 21:01:51, Bjorn Helgaas wrote:

Hi Bjorn,

[...]
>
> I squashed these together and applied them to pci/irq-error for v5.9,
> thanks!

Thank you!

> The cover letter claims there should be 10 patches, but I only got 9.
> Just FYI.

There indeed should be 10 patches.  I sent the missing one (not should
why it didn't go through) this morning making sure it falls under the
thread with the cover letter.

Sorry about that!

The missing patch can be seen here:
  https://patchwork.kernel.org/patch/11697463/

Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
