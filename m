Return-Path: <SRS0=Q90K=3E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037C5C32771
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 20:18:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB2542064C
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 20:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MPiq33NG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB2542064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nT4A9aYaJd02ayT622DyNwVbDOexFK1Pi8ol7+2wTV8=; b=MPiq33NGD7Y00L
	iZSZHuIPrAn9CZP6AmwKpyWZHTkRc9D3YtdTAid0prgL3jqEc+MNN0Z97xqXi63YwWfmZdU+nw79p
	DwFPlD4vENGyNf1F++ld9nKRmpnTs3K+W1trQnmOFLdePnbtCfeAbAcdMq7E40Hxzdog07PErpRUf
	M3R1h1YCeNpcC2ibc2WKGVgbwQCL4MJlNVzZaw/xZiJGr+pe/Y3xgZ6sRHAcaBrTaodgQaw+ea1Vk
	4BgQisObFEo3CFVDtN7XXinhcLk1/3Rpgog44iXe5AEskxHWPMCy78zPfd8Ej2zI5OysCXRh5kEFw
	7iNxYtsL78vdQeJGKJtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irp7d-0005bJ-TL; Wed, 15 Jan 2020 20:18:37 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irp7M-0005KU-Nx
 for linux-amlogic@lists.infradead.org; Wed, 15 Jan 2020 20:18:24 +0000
Received: by mail-ot1-f65.google.com with SMTP id 77so17271071oty.6
 for <linux-amlogic@lists.infradead.org>; Wed, 15 Jan 2020 12:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=15O0u5i/rLLeI7Psjs2fWQ8eJ8azzo914oeadZHzrto=;
 b=qgmAAql/HlNNma51Tg7ZvOvnc39i1mkGejl54KU/HkLvRlGC7xVOf0EM7uE8t6KvSU
 GZ0phFM02pO1jkLDjRgT7sHez4IFzzZpkPEQrMtDbOs9VXQGjdRRZZFUtWu9XAI9uBtl
 VpKBOw/mo24TBKHQQ1eQ547CppOsO0x0V+JRBNN+Ih2lqr60uZAmrsLL3pDsuEplBCM5
 BYtDtPKkPk3iEAEbBKdLwZJc2i+i5KBpiZyaz6EYDBUoxq0Y/eR1S6UwX1SSq4MkQToJ
 nd18ecEDUbFaSFphQ790iRAuvbv3qBn47WZb+OiQs4kGAQebiJJMHVseSxxK+p9yhdWm
 KRwA==
X-Gm-Message-State: APjAAAXMp8gdzMExPXUPuvmf03ysiT8a8AFKzlzS7/MGZr6Trpzamr5q
 O1N2lP9nzjEL+3UHO0G71MVMJ8E=
X-Google-Smtp-Source: APXvYqzZjJk4dQ4+x8jkssH6z4KPZVhUtxo2nzAyPT0gWacMF0oV3Boj/hDaNCZGA2debRznwF+e0w==
X-Received: by 2002:a9d:21f5:: with SMTP id s108mr4174606otb.152.1579119497346; 
 Wed, 15 Jan 2020 12:18:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v14sm6879377oto.16.2020.01.15.12.18.15
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 12:18:16 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 22061a
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 15 Jan 2020 14:18:14 -0600
Date: Wed, 15 Jan 2020 14:18:14 -0600
From: Rob Herring <robh@kernel.org>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: power: add Amlogic secure power
 domains bindings
Message-ID: <20200115201814.GA28654@bogus>
References: <1579087831-94965-1-git-send-email-jianxin.pan@amlogic.com>
 <1579087831-94965-3-git-send-email-jianxin.pan@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579087831-94965-3-git-send-email-jianxin.pan@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_121820_776081_10E78CF5 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jan 2020 19:30:29 +0800, Jianxin Pan wrote:
> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
> 
> The bindings targets the Amlogic A1 and C1 compatible SoCs, in which the
> power domain registers are in secure world.
> 
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     | 40 ++++++++++++++++++++++
>  include/dt-bindings/power/meson-a1-power.h         | 32 +++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>  create mode 100644 include/dt-bindings/power/meson-a1-power.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
