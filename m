Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35054606A325
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pWoEfsG5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6pwSGRN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cnH4LjdHDd/DF5zSsj2x1EeUF2GW9cwfk6HjCF1hHz4=; b=pWoEfsG5YywS9Po0/ls8LGd5xE
	ocCMQ9Vh1SvapBGkNYyU3zlvR8lOUau+kjUOFksDVXqEyzSBFRiAQVwVA963UxICmE48+vNyEuVPw
	uWZIOCRCrAlLHpx7i+MDpj7uTECfwijt+Cv9+9uBtKVCzthhVclKogHlVRxwy0gqxf3hy7WpkY11h
	S483MLRnhr6ZKye2yyOAvxrUclSugus8rd8RIKziGBbmfdvddRcEYZNfYWR0KJiT408Lyy5jh9Yd4
	O37s44zd7P07z74LCotJkWLNcZUmpqRH7hya7Tt5Ah5sjumcZ/siGwLVB8x/ZTsXy1WS8DariyL1k
	YPr4amfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmoP-0000000Blq2-3Yk6;
	Fri, 30 Oct 2026 13:38:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmoP-0000000Blpk-0YGY;
	Fri, 30 Oct 2026 13:38:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22E3E41713;
	Fri, 30 Oct 2026 13:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B895D1F000C1;
	Fri, 30 Oct 2026 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793367508;
	bh=C2S7rduE7F27e/ACslqZKocTp/JTh21Fn7y8iprLI+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F6pwSGRNK0eicHwv4sWaVzrGABaI7Kcr8UwklPuzziX/9g4PceqQiyip94FKU92Sn
	 yK+wgRrs54sOD0/Afs8KSLgbc1XHhfMD1sTCAMKOEVOXBuRidENzicTpRkFwC5Drsh
	 TFqswhNmzAyPeXj4y0zDecf++b1piEtnkJVqvpF+hLWG5sAGP2AiJZL9e47EBH78bW
	 et8iaI4wnqFB7A7TsU9/PFkQ+NhS0+9ztnNFeU1IgNWoayj62P723V2TXOXccc+euZ
	 SmtChrl8Mr0i2fvr4iGY6GeHD6WAKK/fYcDPPFkt/TeYkC0lT16nSZhem5wJfjJcE9
	 /A4du6Xt6WWNw==
Date: Fri, 30 Oct 2026 08:38:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
	David Airlie <airlied@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Aakarsh Jain <aakarsh.jain@samsung.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	freedreno@lists.freedesktop.org,
	David Lechner <dlechner@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peng Fan <peng.fan@nxp.com>, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>, linux-gpio@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>, linux-media@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Eric Anholt <eric@anholt.net>, linux-clk@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-rpi-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
Message-ID: <179336750291.3442134.12651355159128189290.robh@kernel.org>
References: <20261028120216.2657397-1-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 28 Oct 2026 07:02:12 -0500, Rob Herring (Arm) wrote:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
> 
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/clock/qcom,kpss-gcc.yaml     |  2 +-
>  .../bindings/display/brcm,bcm2711-hdmi.yaml          |  2 +-
>  .../bindings/display/msm/dp-controller.yaml          |  2 +-
>  .../devicetree/bindings/display/msm/hdmi.yaml        |  4 ++--
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml  |  2 +-
>  .../devicetree/bindings/gpio/loongson,ls-gpio.yaml   |  2 +-
>  .../bindings/iio/adc/amlogic,meson-saradc.yaml       |  2 +-
>  .../bindings/media/mediatek,vcodec-encoder.yaml      | 12 ++++--------
>  .../devicetree/bindings/media/samsung,s5p-mfc.yaml   |  2 +-
>  .../devicetree/bindings/pci/mediatek-pcie.yaml       | 12 ++++++------
>  10 files changed, 19 insertions(+), 23 deletions(-)
> 

Applied, thanks!


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
