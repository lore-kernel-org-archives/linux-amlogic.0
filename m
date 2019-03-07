Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45245C43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 23:13:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139882081B
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 23:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h+u02ee0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EoksDNfC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 139882081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5uqlfDyIbgH+7B0bMoyhO9bHGQbryzS1iOBrYMib1uw=; b=h+u02ee0V5AGb1
	O18Va6o6TR1wcq3KuBwfLLXXIlUIu4qc2WnxUtQODeATHlAXPhU4ptxTe2SZkTYvx0onBNesA+XJ1
	kUInJlnYxz9FixL2W/fVKpwVuNiZcO1qddrNaulWEuXYvjvNfW58RugUN3+KNmaNmkY7Ec5D5Of4M
	Qu8M6V1+gLJ0OvTkCDkxt1B1WZV8iuwBSQrs2MmKd14wV8VeCAZ3DAYy5uS+ClfsXshSiDzjtyIcg
	x5SvlQ5pXRxLl/rGDMLZvAolyeg2eONgSvTaSooOcUVzD5Eo5FTCbBOPah/m9th9PWlR6pk7NOjfj
	OEwFKoWMXBFFBTduvQLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h22Cd-0007XE-U0; Thu, 07 Mar 2019 23:13:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h22Ca-0007Wp-RX
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 23:13:26 +0000
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 735222087C
 for <linux-amlogic@lists.infradead.org>; Thu,  7 Mar 2019 23:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1552000403;
 bh=INjc24gcVImPOVJ/sMT6g77Zw1IbvRfAw2yxX06dDzA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EoksDNfCFXl5A+ve8NhBGl5MyXtiHYzJOCBKo9QpJSO0TGrfgd9ce9mPjw0thzXRC
 LGCUy6HWulglN1N8sC3Xbx9xuMV2nZ6MipFy/oM2Wd0Em+M02u31PfP3WwWVMUsIxe
 l5eZDJLZiGaQ/cUABiSbGaldUimU7iaB0rJE+8gw=
Received: by mail-qk1-f172.google.com with SMTP id s26so2039321qkm.10
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 15:13:23 -0800 (PST)
X-Gm-Message-State: APjAAAV8Vyk8HdBdyvU+MCb2cVH0B3UoAmIWJ0Dz1JuaPD3xNilhfz8R
 0Lll0R6vokzlhcWInRu0nTeSRBnUZlUY6wK1uA==
X-Google-Smtp-Source: APXvYqyTIEKMIo+xzytE9QrZ1wmMm0DPywRYpBsHAmj72MSJaWnsavZw5xfRKKhsyprvsUZdkgG5oEXgvLOw3rJD2xU=
X-Received: by 2002:a05:620a:13f1:: with SMTP id
 h17mr5451207qkl.147.1552000402566; 
 Thu, 07 Mar 2019 15:13:22 -0800 (PST)
MIME-Version: 1.0
References: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
 <1549022873-40549-2-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1549022873-40549-2-git-send-email-narmstrong@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 Mar 2019 17:13:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLa1QNYTo+Yj-5fC4k8C1bd+V8qi5LiHgLA_qZY+Gy5cg@mail.gmail.com>
Message-ID: <CAL_JsqLa1QNYTo+Yj-5fC4k8C1bd+V8qi5LiHgLA_qZY+Gy5cg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling
 support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_151324_908400_36A7D7B9 
X-CRM114-Status: GOOD (  14.92  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "heiko@sntech.de" <heiko@sntech.de>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Nickey Yang <nickey.yang@rock-chips.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Huicong Xu <xhc@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Feb 1, 2019 at 6:08 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add support for SCDC Setup for TMDS Clock > 3.4GHz and enable TMDS
> Scrambling when supported or mandatory.
>
> This patch also adds an helper to setup the control bit to support
> the high TMDS Bit Period/TMDS Clock-Period Ratio as required with
> TMDS Clock > 3.4GHz for HDMI2.0 3840x2160@60/50 modes.
>
> These changes were based on work done by Huicong Xu <xhc@rock-chips.com>
> and Nickey Yang <nickey.yang@rock-chips.com> to support HDMI2.0 modes
> on the Rockchip 4.4 BSP kernel at [1]
>
> [1] https://github.com/rockchip-linux/kernel/tree/release-4.4
>
> Cc: Nickey Yang <nickey.yang@rock-chips.com>
> Cc: Huicong Xu <xhc@rock-chips.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 85 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |  1 +
>  include/drm/bridge/dw_hdmi.h              |  1 +
>  3 files changed, 85 insertions(+), 2 deletions(-)

This commit in drm-misc-next is breaking booting on the Rock960. I
have FB and fbcon enabled. The boot hangs after this message:

[    3.012334] [drm:rockchip_drm_fbdev_create] FB [1920x1080]-24
kvaddr=(____ptrval____) offset=0 size=8294400

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
