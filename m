Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD20606A31D
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cgpJhfiz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HeXH2eNd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ciY6z4fKoObzODMT4Sow58zv2qq4yFeiydQj0rrQpKU=; b=cgpJhfizA/NEUgjOadHDbNZboc
	o7v3m22zSu0YjyKyFd9D+3eb8Vv2kJC21u6fNNLiaSfGd3YINH0vPU5bqJB2fQHAs+fBMzCj3BX9g
	DpzzCiYoD1F3G7stNMPpESnPG/yfysQSmZTsRRtoOVnF/8cIi/x9JtyywV9TyHtubSRnWuCKOeyaH
	kDAo8E1o6GfjGZKjA0YK5tJGNnEjWLG/hJWBYrnw/YzPyjVCA+DTBaWdNu7pJtxOfGFCKhS0aCXNk
	dj2XozcmvM+x8Pq6vKFFfchZ+KyhboGrxJ9CG+dO8amWnssImbHgKzb6hi5e/2NtubJQU9lFKhLqz
	nfzmQkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTA0-00000009qZx-0p1W;
	Thu, 29 Oct 2026 16:39:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjbu-00000003FWw-1ilo
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Oct 2026 15:12:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F41B601FF;
	Fri, 16 Oct 2026 15:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F291F000C4;
	Fri, 16 Oct 2026 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792163561;
	bh=zExOvzSfNAOGhWyHayoCJYIMW12XGItswYYl/21/DBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HeXH2eNd0qTi1KJWMDpX2qurIIHfELGudDOFsBVj38SK5hgtwRmtRu++Y/B5kYqqd
	 A4blc5Fp2xS9ugu94PJEByj6vIlDtKLwiWnVuaMsxRz0Ir4yLDMdWRBi4NsEDJfgYI
	 dTCWHHQPHA4O4L72QOauM8WSJ4JjVCneqoIAwA1rVTR79Lh6W41DTt4LcokcrG/DS7
	 QghFRktl0qmqBt0Q2454sV5etB2cRZSEkJVEe4jVB1iPvoqhJu/FGnl3nmWT7TfuCi
	 kYiPGdYgWB0PP3fl0nc6yx6ZWW1MUxK7rfa2DXZnz9GRXCns4+n+2ph4Izy2R1nkwe
	 CPOLN30xIOzMQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Aun-Ali Zaidi <admin@kodeit.net>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Liviu Dudau <liviu.dudau@arm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, Francesco Dolcini <francesco@dolcini.it>, Ian Ray <ian.ray@gehealthcare.com>, Martyn Welch <martyn.welch@collabora.co.uk>, Peter Senna Tschudin <peter.senna@gmail.com>, Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Alison Wang <alison.wang@nxp.com>, Stefan Agner <stefan@agner.ch>, Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Yongbang Shi <shiyongbang@huawei.com>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, Saurabh Sengar <ssengar@linux.microsoft.com>, linux-hyperv@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>, Huacai Chen <chenhuacai@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jianmin Lv <lvjianmin@loongson.cn>, Mingcong Bai <jeffbai@aosc.io>, Qianhai Wu <wuqianhai@loongson.cn>, Xi Ruoyao <xry111@xry111.site>, Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org, virtualization@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, Iker Pedrosa <ikerpedrosam@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>, Hans de Goede <hansg@kernel.org>, LiangCheng Wang <zaq14760@gmail.com>, Alex Lanzano <lanzano.alex@gmail.com>, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Chia-I Wu <olvaffe@gmail.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, Gurchetan Singh <gurchetansingh@chromium.org>, Haneen Mohammed <hamohammed.sa@gmail.com>, Louis Chauvet <louis.chauvet@bootlin.com>, Melissa Wen <melissa.srw@gmail.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Ruben Wauters <rubenru09@aol.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Zack Rusin <zack.rusin@broadcom.com>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: (subset) [PATCH 00/75] drm/connector: Convert all drivers to atomic_create_state and remove reset
Date: Fri, 16 Oct 2026 17:12:34 +0200
Message-ID: <179216354629.2387589.2597043397406887835.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2026 09:39:27 -0700
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 14 Oct 2026 19:26:23 +0200, Maxime Ripard wrote:
> This is a follow-up to the plane and CRTC reset removal series, and
> part of a larger effort to remove the reset hook from all KMS objects.
> 
> The connector reset hook is overloaded: it is called both at probe
> time to create the initial software state and during suspend/resume to
> reset hardware and software state. These two roles have different
> requirements, and the reset hook is not fallible, making error
> handling difficult for the initial state allocation path.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next)

[02/75] drm/adp: Switch to drm_atomic_helper_connector_create_state
        commit: db1de27aca30ebaad04aea74ac21e4c4fb531a37

Thanks!
Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
