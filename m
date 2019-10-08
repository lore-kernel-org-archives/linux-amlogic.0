Return-Path: <SRS0=0688=YB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B02C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 14:23:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B681A20673
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 14:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R3i4rnLP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B681A20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkl8uaAVlcd+NANU37Yfn4jlRhFJvD4/CA2wQ/fpvq4=; b=R3i4rnLPRPXsI2
	dHXeDanELR4Ej4BN7jmUTghx3KBRlyrzjIC18l5adVgQHoCR+jH6uL4FAhZeRq6khJNjvqwK8i4yF
	XeW/+A5kkTjbW138LsPp16XG5ORZL3I3WU8GpO+LMkQsCVzpLiafUNGeNm7OepgzvXz6wRrP2qcPM
	NtmslCvg202Nw7BZLOB8lRuUgiWFwTOJ30CW6qF5QBMoHQu8skjLiOTiGVJc9n7Wdj6TabfER50dn
	9ub6vMRUKC7GndZ9r4Wx+JY7gA+IowKSHpYomfHikRBEQLbTYTOgPmsIDkTRmx7MPvmZLDZnCepMZ
	xuXmKX00ZG1uO67u572g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHqOW-0000Cp-W3; Tue, 08 Oct 2019 14:23:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHqOU-0000CO-Fy
 for linux-amlogic@lists.infradead.org; Tue, 08 Oct 2019 14:23:19 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iHqOJ-0007ME-4O; Tue, 08 Oct 2019 16:23:07 +0200
Message-ID: <1570544586.18914.9.camel@pengutronix.de>
Subject: Re: [PATCH v3 0/3] reset: meson: add Meson-A1 SoC support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Xingyu Chen <xingyu.chen@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,  Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 08 Oct 2019 16:23:06 +0200
In-Reply-To: <1569738255-3941-1-git-send-email-xingyu.chen@amlogic.com>
References: <1569738255-3941-1-git-send-email-xingyu.chen@amlogic.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_072318_533873_EFA2DAAB 
X-CRM114-Status: GOOD (  13.81  )
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
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Xingyu,

On Sun, 2019-09-29 at 14:24 +0800, Xingyu Chen wrote:
> This patchset adds support for Meson-A1 SoC Reset Controller. A new struct
> meson_reset_param is introduced to describe the register differences between
> Meson-A1 and previous SoCs.
>
> Changes since v2 at [1]:
> - add comments in header file to indicate holes
> - reorder the Signed-off-by and Reviewed-by
> - remove Jianxin's Signed-off-by
> - add Kevin's Reviewed-by

Thank you, I have applied patches 2 and 3 to reset/next.

regards
Philipp

> Changes since v1 at [0]:
> - rebase on linux-next
> - add Neil's Reviewed-by
> 
> [0] https://lore.kernel.org/linux-amlogic/1568808746-1153-1-git-send-email-xingyu.chen@amlogic.com
> [1] https://lore.kernel.org/linux-amlogic/1569227661-4261-1-git-send-email-xingyu.chen@amlogic.com
> 
> Xingyu Chen (3):
>   arm64: dts: meson: add reset controller for Meson-A1 SoC
>   dt-bindings: reset: add bindings for the Meson-A1 SoC Reset Controller
>   reset: add support for the Meson-A1 SoC Reset Controller
> 
>  .../bindings/reset/amlogic,meson-reset.yaml        |  1 +
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  6 ++
>  drivers/reset/reset-meson.c                        | 35 ++++++++--
>  include/dt-bindings/reset/amlogic,meson-a1-reset.h | 74 ++++++++++++++++++++++
>  4 files changed, 109 insertions(+), 7 deletions(-)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-reset.h
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
