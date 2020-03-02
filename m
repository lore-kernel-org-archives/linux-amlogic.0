Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1248BC3F2D2
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 09:56:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D802921D56
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 09:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mlp6ZTdc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n5wPZ1Vd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D802921D56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmctsnrHF9oVph6hLgv51MNR/sThXaUQUEWWzCtypRs=; b=Mlp6ZTdcY0XN49
	noc/XDGG5zkMq1wTKPFADMdNj0RY97/k8weMbGJ5ZRrvdfdP6OVhsAUnnFms+HacUrg20M7GVR02O
	1Frh+Oc66XLJo67Fz9euw2Irs/TfifS/eOxydYGdNmgBcgXFiLl637AqrIrNIfzxTGg2pICGi1PIV
	BCZAzbfODPXhfqPjk1npxkDFR5TJBFEz36zR4hv52EYnHbr8cRvaOtiOy7HuVk5/ux6OkcN3DYDAw
	kSRZz6xLghKWt730j1TBQmueE+xmJFK0kplEiOdN+horD9oMJ42f/8e1C1v18ZG5+BKucRcGPKn9Y
	OCafs1RzPn4Fh9aHTagw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8hoT-0003gY-Af; Mon, 02 Mar 2020 09:56:37 +0000
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8hoQ-0003fn-Jy
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 09:56:36 +0000
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D308854A;
 Mon,  2 Mar 2020 10:56:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583142993;
 bh=QXED3Ldnro9xx/8nL5IJOBDjr3YPn6bHKN3OhtIpvmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n5wPZ1VdS6fljZ7Lehb9ytqdKfYGKbOyZ3DUFJMTWi73z+KctZRKi2Gd6sI1n+ou/
 77JwsuI7Kctrnb8KOUqdMpdKoVIRmxrmkPvSphJ8WmicJTgz0ljoTpBLB4e957LFFQ
 ccOjRe/9yVbQagjkeBISR49uHOll9JNI9T3HjiPc=
Date: Mon, 2 Mar 2020 11:56:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 03/11] drm/bridge: dw-hdmi: Plug atomic state hooks to
 the default implementation
Message-ID: <20200302095608.GH11960@pendragon.ideasonboard.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206191834.6125-4-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_015634_809674_0B72FF85 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 boris.brezillon@collabora.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

Thank you for the patch.

On Thu, Feb 06, 2020 at 08:18:26PM +0100, Neil Armstrong wrote:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

How about adding a commit message ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 051001f77dd4..fec4a4bcd1fe 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2494,6 +2494,9 @@ static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
>  }
>  
>  static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.attach = dw_hdmi_bridge_attach,
>  	.detach = dw_hdmi_bridge_detach,
>  	.enable = dw_hdmi_bridge_enable,

-- 
Regards,

Laurent Pinchart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
