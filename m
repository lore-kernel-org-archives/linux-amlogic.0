Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A2FCD4840
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 May 2026 18:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=my89cwrviqFTLO8f6sDXByf/06ji/zCdUYDck+3Bs9A=; b=wF7TxQy287Nm71
	Q3Cw3m1/SLqNHqpW0utfprUO5h9UeXeL+50QqyFytngzwQUDHN+yp6UVOXjIkZFmgSdGOJK23XClj
	LNGJ8TBBliM6k+rbyGEizCQ8gYPOgiTmM6KIL/8M1NxjI9VALi0ZpSVBFmjWFPC/qpKGZkhSFMEtp
	cr/PoYASAXMtjbRTZU3SYT8VoFLD3EKweZ1kc7ydnKBHdKD6qcspih0gkgTkOR0SnDTLfPDISH3Uq
	bvu+HSK8i3EaiIV5l9CiyLQSDJJvRYPrx9ZvZExciX3FyKpZ4zcqL8l+jgIgJAcnHQ/VPI2pcAbGk
	eUanQ2stvpD5PduHfp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVnR-0000000EY2q-2H2G;
	Mon, 11 May 2026 18:56:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVnN-0000000EY0y-2QEX
	for linux-amlogic@lists.infradead.org;
	Mon, 11 May 2026 18:56:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD32244590
	for <linux-amlogic@lists.infradead.org>; Mon, 11 May 2026 18:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A355AC32782
	for <linux-amlogic@lists.infradead.org>; Mon, 11 May 2026 18:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778525760;
	bh=zIB79Xk6boPPhMmzQH/JqpB68ofRCBiWIY7ln6Jka+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gsXWUjbyow7NEAQM0X0NALFGmQpalpbS9xBt2Q8RvtDLJbAfXJJkychRH7mExvXH3
	 wLvWHyJefAS26wLfKstTSKg4fpYzXUzP9z8dBvpeunIG7OR8L+kw39IhzmarZrdw/h
	 btm81FfGDWtRy7mD9/ufgpqgi4b5BojlFQrrwerXbOl2YVC1Ogd4soD3R18nrQrEhG
	 nDr0emt/gHeMqaLpCF0fBYUdU7KS4/fQWh/w8yFK16D23lmWQHLQ/HbuI5h5SUrqtG
	 w7slVsBwfjrHsBXY80jeoLoXsCFsndGoqWJdNItHUlKljlND4E3ff8s1IBMBD4kXtw
	 okmwUrKGPyRTw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a88db610ccso5430542e87.2
        for <linux-amlogic@lists.infradead.org>; Mon, 11 May 2026 11:56:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Vl/CMVDG3ag8nqLdMn+1QVxYGSwWF3Z6njJW5SmwD1pFGq4enshZy4OELj6j5us5Np1yNoYlt7kL91fuF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx96TFdfK1H2YiWNw6TcD2/bTdUmZcZDz8GXVjn85it9Qb4ucuP
	VSdpr1/ueGCbTqCzxkkYs1eG4nY3y2oTKfQix+eqe5oBX5c6L04LjQTOvup4RnVg1E53/VwTj3P
	+DVlFjlT0fcupNoNm4SJCTs9TTm+3p8Q=
X-Received: by 2002:a05:6512:3ba4:b0:5a8:63e0:cd92 with SMTP id
 2adb3069b0e04-5a8b709be01mr3083162e87.33.1778525758018; Mon, 11 May 2026
 11:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260511165942.2774868-1-robh@kernel.org>
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 20:55:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLkmoN3iY=d5TgkLswgEt4Dgx_j3BAJPX-ASL+VnF_EzHw@mail.gmail.com>
X-Gm-Features: AVHnY4LWa20oUaE1F0JxYrIcNTXFA3pQESxY2XotgaPrY2W88xHdQsN2xv93t9I
Message-ID: <CAD++jLkmoN3iY=d5TgkLswgEt4Dgx_j3BAJPX-ASL+VnF_EzHw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Consolidate "sram" property definition
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul <vkoul@kernel.org>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Parvathi Pudi <parvathi@couthit.com>, Mohan Reddy Putluru <pmohan@couthit.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michal Simek <michal.simek@amd.com>, 
	Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, "Andrew F. Davis" <afd@ti.com>, 
	Hussain Khaja <basharath@couthit.com>, Suman Anna <s-anna@ti.com>, 
	Ben Levinsky <ben.levinsky@amd.com>, Tanmay Shah <tanmay.shah@amd.com>, 
	Erwan Leray <erwan.leray@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Roger Quadros <rogerq@ti.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, dmaengine@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_115601_660678_E5BFF703 
X-CRM114-Status: UNSURE (   9.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgNjo1OeKAr1BNIFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBUaGUgInNyYW0iIHByb3BlcnR5IGhhcyBiZWNvbWUgYSBk
ZSBmYWN0byBzdGFuZGFyZCBwcm9wZXJ0eSwgc28gY3JlYXRlIGEKPiBjb21tb24gc2NoZW1hIGZv
ciBpdCBhbmQgZHJvcCBhbGwgdGhlIGR1cGxpY2F0ZWQgZGVmaW5pdGlvbnMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgoKSSBsaWtlIGl0LgpS
ZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+CgpZb3VycywKTGlu
dXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
