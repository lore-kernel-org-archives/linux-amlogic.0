Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA279D6552F
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Dec 2025 10:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5i7bPKq4XrIkC2wdr6AXQTrFK9QR9Gho8zxhy6Jg5yE=; b=MYwfsosaTIOMUc
	XU+6Z3GB32+c/SJc77H8hyXeFktsZ2yfPAAAjYYrI43TBvO8iWo61Ys7KUmyZLvIOmGgZfJTNfx3+
	QeJ6MSLbigV50UHt51DJq+ER+3Cr1YI1vgc8qZJ+2ozdRGzaCUbVp6vzQkwFG5n5VwGvHoJDXfmkb
	Hp/YrVqPeyQpff3ZaJLY3k9S4EsPgNvg+fmPaqg947d/djN4WFnGxXRuIhkMFR8/yc1u+7ZMwuBan
	K7ARgxoUBHlR0W3iIAf+ScK8/36+Ee610R28hF3IeU3vMPPpFD9BRf0efsS8VIgT1zwV7ToQJe2n4
	ENNv6NmtJUULlEB/wReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVojA-00000006e3k-3Dcv;
	Wed, 17 Dec 2025 10:25:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoj8-00000006e30-1y8g;
	Wed, 17 Dec 2025 10:25:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1352D40DA9;
	Wed, 17 Dec 2025 10:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672F4C4CEFB;
	Wed, 17 Dec 2025 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765967149;
	bh=GnNxtunhk2yGE92crKgwZuDyghpZFV6MjwtyyPhQ2Yw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=YbFTZ/ocqRqcOLMTMFILNJXICobjQuhAvnKW71QN94skeBsUUZZrXpa9oyIL7q180
	 aDZCrv46lYFzWhM0uJgoZ+jlNKhDrOOZu/KHrXzJf9jrCrwOTa4ffpMNzzW0t5DpH8
	 6YA301b6LWbk2fVcMjIqMHi/PSX2LKOVPhb99OiuAJfhpYVZUZRhiWg7ViKjKgyPpm
	 dNdRREU/bPVPzTPFZknnUsYqACMtEajQG2UgYyiyNmvnEmG8y+e3hFkOENS8zZ9lf+
	 yXBfmQKV1K76D6m8N1wN3z/vaoZ7nZWPJC4umZ6tl1aQltuIQ/arYPqJ69xV9uLEcd
	 sNnkvhb9edgRw==
Message-ID: <e6df5ec2f2d0b38a533c3d154587948f@kernel.org>
Date: Wed, 17 Dec 2025 10:25:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 22/22] drm/bridge: imx8qxp-pixel-link: get/put the
 next bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-22-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-22-b5165fab8058@bootlin.com>
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
X-CRM114-CacheID: sfid-20251217_022550_525274_5969A7B8 
X-CRM114-Status: UNSURE (   5.87  )
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

On Tue, 16 Dec 2025 18:58:55 +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
