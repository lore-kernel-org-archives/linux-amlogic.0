Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4C4CD5BAA
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2026 06:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7uifYyDFNe3WKe1tUbOB4IvDXEWdmNd8he188/HbwA=; b=A1XWIrMHbxI7ga
	Tfud2E3RQdI+eh6xD778bnS7MuC6KUXmnfkBTxf4FN1ILVbMrTiD8REVjL0ybUMdZk1t5Xzn8moCF
	EqVpAVZqWeyRrI5LZZ2MGs3uY94seqGK6MLCddrfzV+HgcElstxjZWsitlttSf4C73kxMEiedkb1E
	4XtQ9WklxPZcciT1LBu8tn3EGRZiGV32oE81LbLsqZxBaa46/syn+0ocEbNXDzshdo1DUFAyTazL+
	r3wr0GRtN1UbMLEK1UIvqu2TAtFzMIZ9cMBaiWgd8QFqTQdprS7yMnAkuOhOt2ngVu7DE8rxyGlE7
	NKzlTv5778Yb7Eaupwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPah2-00000003haL-1pWH;
	Wed, 20 May 2026 06:46:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPagy-00000003hYb-13kv
	for linux-amlogic@lists.infradead.org;
	Wed, 20 May 2026 06:46:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0BFAD4E42CFD;
	Wed, 20 May 2026 06:46:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC8436070E;
	Wed, 20 May 2026 06:46:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F087107E8EB1;
	Wed, 20 May 2026 08:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779259562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dKcYje4RS7cFmYoZ2tIYKDA+VMl5+PAkjiozJ5zsCH4=;
	b=MPo/MyjFKZ6BLm7Xiy+fB0ERKTpIT0x6QG+V098ck6ZrRqCxnovmlWjPKem/Awa8nRtVV+
	I7TOtCWoxJEkX1bOZTr8+JUy26Fm7leRcwuQQFlxzJWJZbVOgmhNoDitsYwqnkKJqipDxb
	wiKdpc1Vmww38H2Xkj5bjaekS8bK8sdcWHRGOCiVYkeTHonfCOH8g8BKk+x2s8TPSUrDGA
	FEczjeTg5EUO/2/MDs29H+6Jq/BSFK9aNLeTpyFGmiUK4/rB4fFd68inDJvxE0BjyFkUBt
	q8c4k1nLmHbvNtJbKPg0Ce8TtFJzhug7firDgpkrVHalWizJUAcg2FPap/P3VA==
MIME-Version: 1.0
Subject: Re: [PATCH v7 04/23] drm: bridge: dw_hdmi: Hold bridge ref until
 connector cleanup
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <e90eddfc-2f57-418a-ae05-43a411d72b99@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
 <20260518180206.2480119-5-jonas@kwiboo.se>
 <177919241969.545972.18169905222569864569.b4-review@b4>
 <e90eddfc-2f57-418a-ae05-43a411d72b99@kwiboo.se>
Date: Wed, 20 May 2026 08:45:49 +0200
Message-Id: <177925954999.1337464.14745526881417951688.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_234608_430692_1454669E 
X-CRM114-Status: GOOD (  22.20  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev, Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Louis Chauvet <louis.chauvet@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, Thomas Zimmermann <tzimmermann@suse.de>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Andy Yan <andy.yan@rock-chips.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Jonas,

On 2026-05-19 17:18 +0200, Jonas Karlman wrote:
> Hello Luca,
>
> On 5/19/2026 2:06 PM, Luca Ceresoli wrote:
> > On Mon, 18 May 2026 18:01:40 +0000, Jonas Karlman <jonas@kwiboo.se> wrote:
> >
> > Hello Jonas,
> >
> >>
> >> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> index b7bfc0e9a6b2..9d795c550f8a 100644
> >> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> @@ -2600,10 +2609,14 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
> >>
> >>  	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
> >>
> >> -	drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
> >> -				    &dw_hdmi_connector_funcs,
> >> -				    DRM_MODE_CONNECTOR_HDMIA,
> >> -				    hdmi->ddc);
> >> +	ret = drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
> >> +					  &dw_hdmi_connector_funcs,
> >> +					  DRM_MODE_CONNECTOR_HDMIA,
> >> +					  hdmi->ddc);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	drm_bridge_get(&hdmi->bridge);
> >
> > I'm not fully following the code paths, but both the report and the fix
> > make sense to me. Only I'd move the drm_bridge_get() before
> > drm_connector_init_with_ddc(), to avoid a short window where no reference
> > is held and the bridge might be destroyed before drm_bridge_get() is
> > called. I'm not sure this can happen, but it's better to write the code in
> > a way that clearly makes it impossible.
>
> dw_hdmi_connector_create() is only called from dw_hdmi_bridge_attach()
> so the bridge should already have a ref for the lifetime of this call.

Ah, that's true. So the patch is correct.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

In case you send a new iteration, please add this extra explanation to the
commit message, similar to the above paragraph.

> I explicitly chose the placement after drm_connector_init_with_ddc()
> to ensure ref count is correctly balanced without having to add a
> drm_bridge_put() call in any error path. I.e. connector destroy() is
> only called when drm_connector_init_with_ddc() succeeds.
>
> This code/call is also planned to be removed in a future series,

In order to remove the !DRM_BRIDGE_ATTACH_NO_CONNECTOR case? That would be
welcome!

Luca


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
