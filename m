Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B7CCD8CA7
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2026 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RiYoLQlRsrsoZ36QqCtmjqe+85uhgKpH5vf8lJm6pmQ=; b=Yd2N6U0M+1d/wB
	1MvAAXG9y8YHBDdYM0aaP46voeK+kJQyI7WeZai5VJ0MP9kyjFBBxSV2e+Io8r6CruhLjCnE5Dnnh
	Xs3STVh9xLrlW82bM9i9r+ioRiCOK1CS9CkZapd0nysgWmWkkyMl+WMqp+Nwk7L92D6q2n4S1uq7L
	EgG4RCdHmMKcpXCpJkaPU8eJ63U1WN5bPEOxMCwwrI8x55H9s/hho87H6oDoJQHMpPKWC4ssEWReP
	tsifE3mQTlt8rXXSzKXJs23e9DOumms/5lDzUql/sd/605z29fUGu0JVFBWG33w7hXdEQcM30zmyz
	j9htsrABMf5R4ibLSplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVW2-000000036Hx-3hlw;
	Mon, 08 Jun 2026 08:39:26 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVW0-000000036Fz-3A7e;
	Mon, 08 Jun 2026 08:39:26 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id CE9F41FC18;
	Mon,  8 Jun 2026 10:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1780907957;
	bh=z8UFPckcbkUDtOhYm05+yDC1pbRjWLGHos3Y900ReCg=; h=From:To:Subject;
	b=k0CkhSSuENH6FvKBjSYNZqeeBs0nsjwzBN7/rWsUL39SC6f99XSrqQBMKFB57XHrd
	 3I8h/qU+JaiL9PImIm+fRWgEURAlZsg+f6eiqkez2YVTzhHqLybK219HsDvkbDoqI3
	 dM4IMHjgbC49Y7YiW/j9OtVVLjStJ5biCTWGGtjXn9zPcit2UxxQjslLiDtDhtZmzZ
	 WnS/Mwz1fHg9p3qzbaIODY+ZdLF/BHd/P7MLF2aAX0JID2Crf3q5aUUGWFvUbsd9pF
	 mK+nMKrowzyVzDHOpjAZ3SxbAStwTG5WA+EKfecTWhcLrCP3Gi+iVMNM8iNungmUR7
	 MjXbLTJ+8CuiQ==
Date: Mon, 8 Jun 2026 10:39:11 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 4/8] drm/bridge: pass extra events to the HPD callback
Message-ID: <20260608083911.GA35760@francesco-nb>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
 <20260608-hpd-irq-events-v4-4-30b62b335487@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608-hpd-irq-events-v4-4-30b62b335487@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_013924_974123_FBE6E113 
X-CRM114-Status: UNSURE (   9.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jun 08, 2026 at 12:33:05AM +0300, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
> 
> Bridge drivers report these events through the
> drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
> callback, specified during the drm_bridge_hpd_enable(), letting
> underlying drivers (e.g. drm_bridge_connector) to receive these events.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
