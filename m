Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665D2D6552C
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Dec 2025 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFpMTrh1rQYnBlPBeIzMbLvTTqB6Y8zw9b7vhJU3KMM=; b=4ofVtJgTR5ISjj
	868xdlcQ22KeSXZLDXCPX0GvvuyAwqosEGr2S4MWBzS/l+fWZtfb2IACHM1SV65POCEUvM4cPKzsp
	fi4LPO9sLLbghs3HpzH/oFFsOvItNZCVU4oBNAjcSY2/xJ+vZoYhfgxMD1VDuB7mvzlNMaIqJsTel
	mWRDzzbszQdOsBLcqVAQxjQiCsM+tzlJ1RghtBnLY3l1/kw4WWLf5v5iR/6bTUDBXYlM/njjl9dB1
	DuPkXxCNNOLofYLAQwbWImYJfRSEE1b9O0QJ0hw0bUaR9lLi3MCeCg6EKG9WMgv2iF5spStmPRrZj
	CyhqvKZedPhM++ftKMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoda-00000006bdL-0M34;
	Wed, 17 Dec 2025 10:20:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodG-00000006bFm-02lw;
	Wed, 17 Dec 2025 10:19:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 685A84432A;
	Wed, 17 Dec 2025 10:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBFFC19421;
	Wed, 17 Dec 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966785;
	bh=fJfYyQsSeLQOss48wj6CAg5BxlIApsVGcX6BEMY+KK8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aQeoRHM+TibsLmXwFNHe2NxMIf97IfBwI3Pg30hMh9GSe9zJkjaTYVqnVFvUzK1eO
	 hqEQHweDaAiEYuLlPpORiJkPZIkXeo6wCE9zochTalRWSUuAlc5hFIsrO83aOjMHQc
	 dRDBXCaydtBWbBPLhu4uiRNN5MNGkCxbiijFFTpwoKsMjBiyz7fSzN05w0kR1HecYr
	 2BzJ+YfrqyRk3+VKVNamL+je8lR7xEqaXbUUbdtOq2oWqaScH4kTOjKtiYYWZwhkAP
	 PrQCawA95SgM7kkFgsvUlGK8wVa42zlA4iNvg64opzMHA23KfnBNWF7wPh3QPeq1fZ
	 N57d79xsvAOMQ==
Message-ID: <aff5a75a33e6e111347a7a79ebc26ddc@kernel.org>
Date: Wed, 17 Dec 2025 10:19:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 14/22] drm/bridge: imx8qxp-pxl2dpi: remove excess
 error message
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-14-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-14-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021946_104537_2B03CAC6 
X-CRM114-Status: UNSURE (   5.96  )
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

On Tue, 16 Dec 2025 18:58:47 +0100, Luca Ceresoli wrote:
> imx8qxp_pxl2dpi_find_next_bridge() already emits a DRM_DEV_ERROR() for
> every error except -EPROBE_DEFER. The caller emits another one, which is
> redundant. Remove the message in the caller and keep the two in
> imx8qxp_pxl2dpi_find_next_bridge() as they are more informative about the
> error cause.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
