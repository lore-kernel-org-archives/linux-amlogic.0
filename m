Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82806C3ABCB
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 May 2025 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wwvxh1c12yeP1mcFndC6E/ea3bkz7nFmQ25kqAiT+ps=; b=JHqAoOr37uJ+qE
	VsDf/ceKwd2BCWIuysH0PawG1Ota3qvX/9pMRVDho+sYQCxM2qmOlQaiVIp2QNdLQI7BNsLPh4bHX
	LkO3XYbrOt9UFD3d/ROLtpwoFQvhB/KRJEAxdDUfO6+qccW5XVcLzr4acYHoKryLhs58I+PBieIEe
	LEqn/aSngXPpM2HHnjALiKD/prH6rPiwLOt+eCj76ok5VQxHEMIn/SychHYzivBMwUakJ1WB1eQ8U
	ja/nG4BClTIFItx6Dno0eb70bQEFldyRaVpgMb9gcc0bsEvjPmbcXw5l7uEU8lcSeY/gepHjwJXwF
	qtVp3m3KymXrPBhjt0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDgCB-00000005iMS-1O5p;
	Sat, 10 May 2025 09:08:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDg0F-00000005gxi-3xzX;
	Sat, 10 May 2025 08:56:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2AB26A40A57;
	Sat, 10 May 2025 08:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9C1C4CEE2;
	Sat, 10 May 2025 08:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867374;
	bh=Ty+SuvC27JKyVPo5kwDSn6Vcmvyw7zf8JUSFENB4Udk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=AEgc34wpj1ZefFXoxT56t2Tj6K1edVyK4KnK3pM71s7L9KTRxInv3j/vr9rJ8nX5i
	 nwCTehEJTFs6eap2ML02KpP6Zb6i6hFN3VtjVPtNnWCwBFQ+TPu+LVyovvTgucqACh
	 OvKa1VQwQmEQMYhgvXdOdCEO/kB/uw9GLLYIdy2DjrVb7SW7OHAhz42ZAR2XHQfqYi
	 NIjnKAdN+YTTjiS1tqhKgLzVFW9p+Gn7TaNor7bp7YPT4ezS2s06TDSjAnhyyEFftl
	 KSnro8PULHUGj0u8osPSQml7j19d7HuaiuB+4v2UbpmdsnRK9SVu7fkyHWYPudEbBu
	 kaEm+hnQts6mg==
Message-ID: <3b2d3e047a8c0f1735c154f46f420216@kernel.org>
Date: Sat, 10 May 2025 08:56:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 14/22] drm/rcar-du: dsi: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-14-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-14-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent
 Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Kocialkowski" <paulk@sys-base.io>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_015616_050070_FA14B3F9 
X-CRM114-Status: UNSURE (   5.02  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 9 May 2025 15:53:40 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
