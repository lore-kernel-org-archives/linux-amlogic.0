Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F048C61DBC
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2026 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWsRAXt3/8vmwz/fv4jgjMkQxHS1gxr/9w+OwZI8gxs=; b=mCqKteKn6i4QRV
	YqPVLq/+Eq2oqwTRtlzOqPJf+mbshT4oZfWtTwP02V75PO0hhKhUJJJ6Lzof8I0p54o75+aVAYs4y
	NAwBjLcbCzAKoCfUy7WWY/mJwEXqoNjv//15u+EBjLDW8M6hO+giorYWoHcuIhalRJZurEY08NGv5
	KKSEnNh+/ouuUQkMXTZddHGqPYX3vj1WwrNVF9ebIH1qAbt13XaYotVoLVFNcvnCyXXroRHSXeBaU
	h68MW9ECpsbp06W69FCvekCigbq6aRjSt++e06ULkjaEgRuVPUZpofhk2C7hAnjFFFS9Ju+UuAPsN
	XvlU5sb9z5BJFVoAyZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynXh-00000000VFy-3dj6;
	Tue, 25 Aug 2026 09:34:05 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySrR-0000000GVjj-3oOx;
	Mon, 24 Aug 2026 11:29:07 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2B5911F82E;
	Mon, 24 Aug 2026 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787570893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oRfeKqw0N0kQLKC+424hjjzXjyHez3BAAze+hVfK2Rg=;
	b=jPAk+QU8Oz9JiYGtn+V5jZxMEyjAvNiz7x+giw+idIe7iWHZ3M9kfknb1WdCY6dzXCmQD3
	RUzjbubEF3hnieEB81hcTriJJ/TZwn9WrJvXmwfrSSxcQQ1ZlbjhLeh4wlav9BK5HaMwO3
	6684oDDWCwOgqkGGromNNiB5crtoKp8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787570893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oRfeKqw0N0kQLKC+424hjjzXjyHez3BAAze+hVfK2Rg=;
	b=5lDYM8Sp+2Zs/UK8WEQsqpqKl/p+3waU+CqzB8+6scnvBPnqiDamSiTmKrctumFJCWBEYi
	aX34sUfDAX5NblCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787570889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oRfeKqw0N0kQLKC+424hjjzXjyHez3BAAze+hVfK2Rg=;
	b=bsPlg+u0OwdeHNbNGrLeK44/R8qCs4CSg2PYS8tAMdo+SiYAgso2oR9h7L/qr4Kf3DuMkG
	JKgB4VRdqQ8XdeAhqD8b8vI76Bx+jM9yHqOPuKlYDaI0OV9UYbWCi5Q1nsdyTPB6peYLQF
	TjI7tAEaxq6cznVveiRZRfRGOnX5P94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787570889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oRfeKqw0N0kQLKC+424hjjzXjyHez3BAAze+hVfK2Rg=;
	b=OLusts3Smqe2AFyYsDutCyN37J42MZz2JAj9qpn2mbZkclBOoroaTNZlb/XsAZWC4PdLh8
	KxcB0oUEd1WRgsCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2DC4E1333B;
	Mon, 24 Aug 2026 11:28:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l1sQCsYqjGpBYAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 24 Aug 2026 11:28:06 +0000
Message-ID: <c56a1ec4-b70d-4ff6-a2ca-4ff625845b4e@suse.de>
Date: Mon, 24 Aug 2026 13:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/70] drm/crtc: Convert all drivers to
 atomic_create_state and remove reset
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Janne Grunau <j@jannau.net>, Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Alison Wang <alison.wang@nxp.com>, Stefan Agner <stefan@agner.ch>, Ruben Wauters <rubenru09@aol.com>, Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Yongbang Shi <shiyongbang@huawei.com>, John Stultz <jstultz@google.com>, Sumit Semwal <sumit.semwal@linaro.org>, Xinliang Liu <xinliang.liu@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, Saurabh Sengar <ssengar@linux.microsoft.com>, linux-hyperv@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Liu Ying <victor.liu@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Marek Vasut <marex@denx.de>, Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org, virtualization@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Aditya Garg <gargaditya08@proton.me>, Aun-Ali Zaidi <admin@kodeit.net>, LiangCheng Wang <zaq14760@gmail.com>, Alex Lanzano <lanzano.alex@gmail.com>, Hans de Goede <hansg@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Chia-I Wu <olvaffe@gmail.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, Gurchetan Singh <gurchetansingh@chromium.org>, Michal Simek <michal.simek@amd.com>, Javier Martinez Canillas <javierm@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Jocelyn Falempe <jfalempe@redhat.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Dharma Balasubiramani <dharma.b@microchip.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, Huacai Chen <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, Mingcong Bai <jeffbai@aosc.io>, Qianhai Wu <wuqianhai@loongson.cn>, Xi Ruoyao <xry111@xry111.site>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Biju Das <biju.das.jz@bp.renesas.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org, Iker Pedrosa <ikerpedrosam@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Haneen Mohammed <hamohammed.sa@gmail.com>, Louis Chauvet <louis.chauvet@bootlin.com>, Melissa Wen <melissa.srw@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Zack Rusin <zack.rusin@broadcom.com>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
X-Spamd-Result: default: False [-0.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	FORGED_RECIPIENTS(2.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:k@chaosmail.tech,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:liviu.dudau@arm.com,m:linux@armlinux.org.uk,m:alim.akhtar@samsung.com,m:inki.dae@samsung.com,m:kyungmin.park@samsung.com,m:sw0312.kim@samsung.com,m:linux-samsung-soc@vger.kernel.org,m:stefan@agner.ch,m:rubenru09@aol.com,m:tiantao6@hisilicon.com,m:kong.kongxinwei@hisilicon.com,m:jstultz@google.com,m:linux-hyperv@vger.kernel.org,m:festevam@gmail.com,m:kernel@pengutronix.de,m:s.hauer@pengutronix.de,m:laurentiu.palcu@oss.nxp.com,m:l.stach@pengutronix.de,m:paul@crapouillou.net,m:linux-mips@vger.kernel.org,m:paulk@sys-base.io,m:jbrunet@baylibre.com,m:khilman@baylibre.com,m:martin.blumenstingl@googlemail.com,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:linux-arm-msm@vger.kernel.org,m:marex@denx.de,m:airlied@redhat.com,m:kraxel@redhat.com,m:geert+renesas@glider.be,m:linux-renesas-soc@vger.kern
 el.org,m:marcus.folkesson@gmail.com,m:zhang.lyra@gmail.com,m:orsonzhai@gmail.com,m:alain.volmat@foss.st.com,m:rgallaispou@gmail.com,m:alexandre.torgue@foss.st.com,m:mcoquelin.stm32@gmail.com,m:philippe.cornu@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:yannick.fertre@foss.st.com,m:samuel@sholland.org,m:gargaditya08@proton.me,m:zaq14760@gmail.com,m:lanzano.alex@gmail.com,m:olvaffe@gmail.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:michal.simek@amd.com,m:javierm@redhat.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:jfalempe@redhat.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,s:kieran.bingham@ideasonboard.com,s:laurent.pinchart@ideasonboard.com,s:tomi.valkeinen@ideasonboard.com,s:mcanal@igalia.com,s:chenhuacai@kernel.org,s:chunkuang.hu@kernel.org,s:dakr@kernel.org,s:thierry.reding@kernel.org,s:nouveau@lists.freedesktop.org,s:linux-rockchip@lists.infradead.org,s:lvjianmin@loongson.cn,s:wuqianhai@loongson.cn,s:manikandan.m@microchip.com,s:
 nicolas.ferre@microchip.com,s:jonathanh@nvidia.com,s:mperttunen@nvidia.com];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[renesas];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,jannau.net,chaosmail.tech,lists.linux.dev,amd.com,arm.com,armlinux.org.uk,samsung.com,kernel.org,linaro.org,vger.kernel.org,nxp.com,agner.ch,aol.com,hisilicon.com,huawei.com,google.com,microsoft.com,linux.microsoft.com,gmail.com,pengutronix.de,oss.nxp.com,crapouillou.net,intel.com,sys-base.io,baylibre.com,googlemail.com,lists.infradead.org,linux.dev,somainline.org,oss.qualcomm.com,poorly.run,denx.de,redhat.com,glider.be,linux.alibaba.com,foss.st.com,sholland.org,iki.fi,ideasonboard.com,proton.me,kodeit.net,iscas.ac.cn,collabora.com,chromium.org,igalia.com,bootlin.com,tuxon.dev,microchip.com,loongson.cn,aosc.io,xry111.site,bp.renesas.com,sntech.de,rock-chips.com,nvidia.com,raspberrypi.com,broadcom.com];
	R_RATELIMIT(0.00)[to_ip_from(RLoadnimawcdo3as9ydearnodd)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[135];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_042906_264339_C12AC181 
X-CRM114-Status: GOOD (  14.41  )
X-Mailman-Approved-At: Tue, 25 Aug 2026 02:34:04 -0700
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTWF4aW1lCgpBbSAyMS4wOC4yNiB1bSAxNjozOCBzY2hyaWViIE1heGltZSBSaXBhcmQ6Cj4g
VGhpcyBpcyBhIGZvbGxvdy11cCB0byB0aGUgcGxhbmUgcmVzZXQgcmVtb3ZhbCBzZXJpZXMsIGFu
ZCBwYXJ0IG9mIGEKPiBsYXJnZXIgZWZmb3J0IHRvIHJlbW92ZSB0aGUgcmVzZXQgaG9vayBmcm9t
IGFsbCBLTVMgb2JqZWN0cy4KPgo+IFRoZSBDUlRDIHJlc2V0IGhvb2sgaXMgb3ZlcmxvYWRlZDog
aXQgaXMgY2FsbGVkIGJvdGggYXQgcHJvYmUgdGltZSB0bwo+IGNyZWF0ZSB0aGUgaW5pdGlhbCBz
b2Z0d2FyZSBzdGF0ZSBhbmQgZHVyaW5nIHN1c3BlbmQvcmVzdW1lIHRvIHJlc2V0Cj4gaGFyZHdh
cmUgYW5kIHNvZnR3YXJlIHN0YXRlLiBUaGVzZSB0d28gcm9sZXMgaGF2ZSBkaWZmZXJlbnQKPiBy
ZXF1aXJlbWVudHMsIGFuZCB0aGUgcmVzZXQgaG9vayBpcyBub3QgZmFsbGlibGUsIG1ha2luZyBl
cnJvcgo+IGhhbmRsaW5nIGRpZmZpY3VsdCBmb3IgdGhlIGluaXRpYWwgc3RhdGUgYWxsb2NhdGlv
biBwYXRoLgo+Cj4gV2hpbGUgcmVzZXQgaGFzIHRoZSBzZW1hbnRpY3MgdG8gcmVzZXQgYm90aCB0
aGUgc29mdHdhcmUgYW5kIGhhcmR3YXJlCj4gc3RhdGUsIHRoZSB2YXN0IG1ham9yaXR5IG9mIGlt
cGxlbWVudGF0aW9ucyBhbmQgYWxsIHRoZSBoZWxwZXJzIG9ubHkKPiByZXNldCB0aGUgc29mdHdh
cmUgc3RhdGUsIG1ha2luZyB0aGVtIGVxdWl2YWxlbnQgdG8KPiBhdG9taWNfY3JlYXRlX3N0YXRl
IGluIHByYWN0aWNlLiBUaGUgYXRvbWljX2NyZWF0ZV9zdGF0ZSBob29rIG1ha2VzCj4gdGhpcyBl
eHBsaWNpdDogaXQgb25seSBhbGxvY2F0ZXMgYW5kIGluaXRpYWxpemVzIGEgcHJpc3RpbmUgc3Rh
dGUKPiB3aXRob3V0IGFueSBzaWRlIGVmZmVjdCwgYW5kIHJldHVybnMgdGhlIHN0YXRlIHBvaW50
ZXIgb3IgYW4gRVJSX1BUUgo+IG9uIGZhaWx1cmUuCj4KPiBUaGlzIHNlcmllcyBjb252ZXJ0cyBh
bGwgQ1JUQyBkcml2ZXJzIHRyZWUtd2lkZSBmcm9tIHRoZSByZXNldCBob29rIHRvCj4gYXRvbWlj
X2NyZWF0ZV9zdGF0ZSwgdGhlbiByZW1vdmVzIHRoZSByZXNldCBob29rIGZyb20gc3RydWN0Cj4g
ZHJtX2NydGNfZnVuY3MgZW50aXJlbHkuIFR3byBkcml2ZXJzICh0aWxjZGMgYW5kIGxvb25nc29u
KSBoYWQgYWN0dWFsCj4gaGFyZHdhcmUgcmVzZXQgbG9naWMgbWl4ZWQgaW50byB0aGVpciByZXNl
dCBob29rOyB0aG9zZSBhcmUgbW92ZWQgdG8KPiBDUlRDIGNyZWF0aW9uIGluc3RlYWQuIFRoZSBj
b252ZXJzaW9ucyB3ZXJlIGRvbmUgdXNpbmcgYSBjb21iaW5hdGlvbiBvZgo+IENvY2NpbmVsbGUg
c2VtYW50aWMgcGF0Y2hlcyBhbmQgbWFudWFsIGFkanVzdG1lbnRzLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgoKSSd2ZSBnb25lIHRocm91Z2gg
dGhlIHNlcmllcyBhbmQgaXQgbG9va3MgZ29vZCB0byBtZTsgZXhjZXB0IGZvciBwYXRjaCA1MC4K
CkZlZWwgZnJlZSB0byBhZGQKClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4KCnRvIHRoZSBzZXJpZXMgd2l0aCB0aGUgZXhjZXB0aW9uIG9mIHBhdGNo
IDUwLgoKQmVzdCByZWdhcmRzClRob21hcwoKCj4gLS0tCj4gTWF4aW1lIFJpcGFyZCAoNzApOgo+
ICAgICAgICBkcm0vYWRwOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVf
c3RhdGUKPiAgICAgICAgZHJtL2FtZGdwdTogdmttczogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVs
cGVyX2NydGNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9hcm06IGhkbGNkOiBTd2l0Y2ggdG8g
ZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL2FybWFkYTog
U3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2NydGNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRy
bS9leHlub3M6IFN3aXRjaCB0byBkcm1fYXRvbWljX2hlbHBlcl9jcnRjX2NyZWF0ZV9zdGF0ZQo+
ICAgICAgICBkcm0vZnNsLWRjdTogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2NydGNfY3Jl
YXRlX3N0YXRlCj4gICAgICAgIGRybS9ndWQ6IFN3aXRjaCB0byBkcm1fYXRvbWljX2hlbHBlcl9j
cnRjX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vaGlzaWxpY29uOiBoaWJtYzogU3dpdGNoIHRv
IGRybV9hdG9taWNfaGVscGVyX2NydGNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9oaXNpbGlj
b246IGtpcmluOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVfc3RhdGUK
PiAgICAgICAgZHJtL2h5cGVydjogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2NydGNfY3Jl
YXRlX3N0YXRlCj4gICAgICAgIGRybS9pbXg6IGRjOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxw
ZXJfY3J0Y19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL2lteDogZGNzczogU3dpdGNoIHRvIGRy
bV9hdG9taWNfaGVscGVyX2NydGNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9pbmdlbmljOiBT
d2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJt
L2ttYjogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2NydGNfY3JlYXRlX3N0YXRlCj4gICAg
ICAgIGRybS9sb2dpY3ZjOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVf
c3RhdGUKPiAgICAgICAgZHJtL21lc29uOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0
Y19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL21zbTogbWRwNDogU3dpdGNoIHRvIGRybV9hdG9t
aWNfaGVscGVyX2NydGNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9teHM6IG14c2ZiOiBTd2l0
Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL3F4
bDogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2NydGNfY3JlYXRlX3N0YXRlCj4gICAgICAg
IGRybS9yZW5lc2FzOiBzaG1vYmlsZTogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2NydGNf
Y3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9zaW1wbGUta21zOiBSZW1vdmUgdW51c2VkIHJlc2V0
X2NydGMgaG9vawo+ICAgICAgICBkcm0vc2ltcGxlLWttczogU3dpdGNoIHRvIGRybV9hdG9taWNf
aGVscGVyX2NydGNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9zaXRyb25peDogc3Q3NTcxOiBT
d2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJt
L3NwcmQ6IFN3aXRjaCB0byBkcm1fYXRvbWljX2hlbHBlcl9jcnRjX2NyZWF0ZV9zdGF0ZQo+ICAg
ICAgICBkcm0vc3RpOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVfc3Rh
dGUKPiAgICAgICAgZHJtL3N0bTogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2NydGNfY3Jl
YXRlX3N0YXRlCj4gICAgICAgIGRybS9zdW40aTogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVy
X2NydGNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS90ZXN0czogU3dpdGNoIHRvIGRybV9hdG9t
aWNfaGVscGVyX2NydGNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS90aWxjZGM6IE1vdmUgaGFy
ZHdhcmUgcmVzZXQgdG8gQ1JUQyBjcmVhdGlvbgo+ICAgICAgICBkcm0vdGlsY2RjOiBTd2l0Y2gg
dG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL3Rpbnk6
IGFwcGxldGJkcm06IFN3aXRjaCB0byBkcm1fYXRvbWljX2hlbHBlcl9jcnRjX2NyZWF0ZV9zdGF0
ZQo+ICAgICAgICBkcm0vdGlueTogYm9jaHM6IFN3aXRjaCB0byBkcm1fYXRvbWljX2hlbHBlcl9j
cnRjX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vdGlueTogY2lycnVzOiBTd2l0Y2ggdG8gZHJt
X2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL3Rpbnk6IHBpeHBh
cGVyOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVfc3RhdGUKPiAgICAg
ICAgZHJtL3Rpbnk6IHNoYXJwOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVh
dGVfc3RhdGUKPiAgICAgICAgZHJtL3VkbDogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2Ny
dGNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS92Ym94OiBTd2l0Y2ggdG8gZHJtX2F0b21pY19o
ZWxwZXJfY3J0Y19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL3ZlcmlzaWxpY29uOiBTd2l0Y2gg
dG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL3ZpcnRp
bzogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2NydGNfY3JlYXRlX3N0YXRlCj4gICAgICAg
IGRybS94bG54OiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19jcmVhdGVfc3RhdGUK
PiAgICAgICAgZHJtL21pcGktZGJpOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19j
cmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL2F0b21pYy1oZWxwZXI6IFJlbW92ZSBkcm1fYXRvbWlj
X2hlbHBlcl9jcnRjX3Jlc2V0Cj4gICAgICAgIHN5c2ZiOiBDb252ZXJ0IHRvIGNyZWF0ZV9zdGF0
ZQo+ICAgICAgICBkcm0vYW1kZ3B1OiBkbTogQ29udmVydCB0byBhdG9taWNfY3JlYXRlX3N0YXRl
Cj4gICAgICAgIGRybS9rb21lZGE6IENvbnZlcnQgdG8gYXRvbWljX2NyZWF0ZV9zdGF0ZQo+ICAg
ICAgICBkcm0vbWFsaWRwOiBDb252ZXJ0IHRvIGF0b21pY19jcmVhdGVfc3RhdGUKPiAgICAgICAg
ZHJtL2FzdDogQ29udmVydCB0byBhdG9taWNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9hdG1l
bC1obGNkYzogQ29udmVydCB0byBhdG9taWNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9pbXg6
IGlwdXYzOiBDb252ZXJ0IHRvIGF0b21pY19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL2xvb25n
c29vbjogTW92ZSBoYXJkd2FyZSByZXNldCB0byBDUlRDIGNyZWF0aW9uCj4gICAgICAgIGRybS9s
b29uZ3NvbjogQ29udmVydCB0byBhdG9taWNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9tZWRp
YXRlazogQ29udmVydCB0byBhdG9taWNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9tZ2FnMjAw
OiBDb252ZXJ0IHRvIGF0b21pY19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL21zbTogZHB1MTog
Q29udmVydCB0byBhdG9taWNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9tc206IG1kcDU6IENv
bnZlcnQgdG8gYXRvbWljX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vbXhzZmI6IGxjZGlmOiBD
b252ZXJ0IHRvIGF0b21pY19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL25vdXZlYXU6IENvbnZl
cnQgdG8gYXRvbWljX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vb21hcGRybTogQ29udmVydCB0
byBhdG9taWNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9yY2FyLWR1OiBDb252ZXJ0IHRvIGF0
b21pY19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL3J6ZzJsLWR1OiBDb252ZXJ0IHRvIGF0b21p
Y19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL3JvY2tjaGlwOiB2b3A6IENvbnZlcnQgdG8gYXRv
bWljX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vcm9ja2NoaXA6IHZvcDI6IENvbnZlcnQgdG8g
YXRvbWljX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vc2l0cm9uaXg6IHN0NzkyMDogQ29udmVy
dCB0byBhdG9taWNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9zb2xvbW9uOiBzc2QxMzB4OiBD
b252ZXJ0IHRvIGF0b21pY19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL3RlZ3JhOiBDb252ZXJ0
IHRvIGF0b21pY19jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL3ZjNDogQ29udmVydCB0byBhdG9t
aWNfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS92a21zOiBDb252ZXJ0IHRvIGF0b21pY19jcmVh
dGVfc3RhdGUKPiAgICAgICAgZHJtL3Ztd2dmeDogQ29udmVydCB0byBhdG9taWNfY3JlYXRlX3N0
YXRlCj4gICAgICAgIGRybS9hdG9taWMtaGVscGVyOiBSZW1vdmUgX19kcm1fYXRvbWljX2hlbHBl
cl9jcnRjX3Jlc2V0Cj4gICAgICAgIGRybS9jcnRjOiBSZW1vdmUgcmVzZXQKPgo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FkcC9hZHBfZHJ2LmMgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZrbXMuYyAgICAgICAgICAgfCAgMiAr
LQo+ICAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jcnRjLmMg
fCAxNyArKysrLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY3J0Yy5jICAgfCAxOCArKysrLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9j
cnRjLmMgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FybS9t
YWxpZHBfY3J0Yy5jICAgICAgICAgICAgICAgICAgfCAxOCArKysrLS0tLQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jICAgICAgICAgICAgICAgICAgICAgfCAxOCArKysr
LS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2NydGMuYyAg
ICAgfCAxOSArKysrLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0YXRlX2hl
bHBlci5jICAgICAgICAgIHwgNDUgLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9kcm1fbW9kZV9jb25maWcuYyAgICAgICAgICAgICAgICAgIHwgIDQgKy0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuYyAgICAgICAgICAgIHwgMTMgKy0tLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jICAgICAgICAgICB8
ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vZnNsLWRjdS9mc2xfZGN1X2RybV9jcnRjLmMgICAg
ICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9kcnYuYyAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hp
Ym1jX2RybV9kZS5jICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tp
cmluL2tpcmluX2RybV9hZGUuYyAgICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vaHlwZXJ2
L2h5cGVydl9kcm1fbW9kZXNldC5jICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0v
aW14L2RjL2RjLWNydGMuYyAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dw
dS9kcm0vaW14L2Rjc3MvZGNzcy1jcnRjLmMgICAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2
ZXJzL2dwdS9kcm0vaW14L2lwdXYzL2lwdXYzLWNydGMuYyAgICAgICAgICAgICB8IDE4ICsrKyst
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYyAgICAgICAg
ICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0va21iL2ttYl9jcnRjLmMgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vbG9naWN2Yy9sb2dpY3ZjX2NydGMu
YyAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vbG9vbmdzb24vbHNkY19j
cnRjLmMgICAgICAgICAgICAgICB8IDI2ICsrKysrKy0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19jcnRjLmMgICAgICAgICAgICAgICAgfCAxOCArKysrLS0tLQo+ICAgZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX2NydGMuYyAgICAgICAgICAgICAgICAgfCAgMiArLQo+
ICAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuaCAgICAgICAgICAgICAgfCAg
NCArLQo+ICAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgICAgICAgICAg
ICAgfCAxNSArKysrLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0
Yy5jICAgICAgICAgICB8IDE4ICsrKystLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
bWRwNC9tZHA0X2NydGMuYyAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvbWRwNS9tZHA1X2NydGMuYyAgICAgICAgICB8IDIwICsrKystLS0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL214c2ZiL2xjZGlmX2ttcy5jICAgICAgICAgICAgICAgICAgfCAxNyArKysrLS0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2ttcy5jICAgICAgICAgICAgICAgICAg
fCAgNCArLQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZC5jICAgICAg
ICAgICAgfCAxNCArKystLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2NydGMu
YyAgICAgICAgICAgICAgICB8IDE3ICsrKystLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF9kaXNwbGF5LmMgICAgICAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0v
cmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jICAgICB8IDE3ICsrKystLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9jcnRjLmMgICAgICB8IDE1ICsrKy0t
LS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3NobW9iaWxlL3NobW9iX2RybV9jcnRjLmMg
IHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMg
ICAgICAgIHwgMTggKysrKy0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fdm9wMi5jICAgICAgIHwgMTggKysrKy0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zaXRy
b25peC9zdDc1NzEuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9zaXRyb25peC9zdDc5MjAuYyAgICAgICAgICAgICAgICAgIHwgMTAgKysrLS0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9zb2xvbW9uL3NzZDEzMHguYyAgICAgICAgICAgICAgICAgIHwgMTAgKysrLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHB1LmMgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2NydGMuYyAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDQgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9jcnRjLmMg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zeXNmYi9kcm1fc3lz
ZmJfaGVscGVyLmggICAgICAgICAgIHwgIDQgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zeXNmYi9k
cm1fc3lzZmJfbW9kZXNldC5jICAgICAgICAgIHwgMjAgKysrKy0tLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vdGVncmEvZGMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKystLS0tCj4g
ICBkcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX2t1bml0X2hlbHBlcnMuYyAgICAgICAgICB8ICAy
ICstCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19jcnRjLmMgICAgICAgICAgICAg
ICB8IDQ5ICsrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L2Fw
cGxldGJkcm0uYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS90
aW55L2JvY2hzLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1
L2RybS90aW55L2NpcnJ1cy1xZW11LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGRyaXZl
cnMvZ3B1L2RybS90aW55L3BpeHBhcGVyLmMgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAg
IGRyaXZlcnMvZ3B1L2RybS90aW55L3NoYXJwLW1lbW9yeS5jICAgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYyAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9tb2RlLmMgICAgICAg
ICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdGVzdHMvdmM0X21vY2tfY3J0
Yy5jICAgICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2NydGMuYyAg
ICAgICAgICAgICAgICAgICAgIHwgMTQgKysrLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92
YzRfZHJ2LmggICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfdHhwLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgZHJpdmVycy9n
cHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2NydGMuYyAgICAgICAgICAgICAgfCAgMiArLQo+ICAgZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rpc3BsYXkuYyAgICAgICAgICAgfCAgMiArLQo+
ICAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMgICAgICAgICAgICAgICAgICAgfCAx
OCArKysrLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMgICAgICAg
ICAgICAgICAgfCAyMiArKysrLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9rbXMuaCAgICAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9sZHUuYyAgICAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9zY3JuLmMgICAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdGR1LmMgICAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2
ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfa21zLmMgICAgICAgICAgICAgICAgICB8ICAyICstCj4g
ICBpbmNsdWRlL2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5oICAgICAgICAgICAgICB8ICAz
IC0tCj4gICBpbmNsdWRlL2RybS9kcm1fY3J0Yy5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDEyIC0tLS0tLQo+ICAgaW5jbHVkZS9kcm0vZHJtX21pcGlfZGJpLmggICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQo+ICAgaW5jbHVkZS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVy
LmggICAgICAgICAgICAgICAgfCAgMSAtCj4gICA3OCBmaWxlcyBjaGFuZ2VkLCAyNzUgaW5zZXJ0
aW9ucygrKSwgMzg1IGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiA3ZWE1OGI5ZGRi
NTIyNjRhNGVkMzZiY2NiOTc1MDYyYWRhMzJjNjJkCj4gY2hhbmdlLWlkOiAyMDI2MDcwOS1kcm0t
bm8tbW9yZS1jcnRjLXJlc2V0LTE0YTRkNWJjOGQ0MQo+Cj4gQmVzdCByZWdhcmRzLAoKLS0gCi0t
ClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICkZyYW5rZW5zdHIuIDE0NiwgOTA0NjEgTsO8cm5iZXJn
LCBHZXJtYW55LCB3d3cuc3VzZS5jb20KR0Y6IEpvY2hlbiBKYXNlciwgQW5kcmV3IE1jRG9uYWxk
LCAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
