Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD67D2D0E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 12:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5PogCCDFXe15l0hX+JA+HgRwA9M2IL5y+7lX6MjsP0=; b=HBLhd7OJLUVeVN
	VdsJ6wAIpsFsunqk37C1PL/3H3WSKVrPZ8WDbwlFm37XCePXwTQOQh+XBO6D0yqAeMCCmz4MtWQwJ
	0D1XOBEU6kUigSHSuVYf4FdiwgrCAj/EFgtx/sECf0OjdpoMn+6u1wBw5IzSxnNH/zSllKGE3bjK+
	ggL5ePfSFEq6g8nQ5SAno7+SLT6/Rq6L09e+zsojXKhUYWVQyZoQvLL2wh+ivsS/4JO7zIIS72jr6
	TWmnCbU8CfUq/fdUk76+uGdffRKD40UWYzDQYQ1oYa++OaC0fqzJyGmXxbi+6UT/yRsEovagbr3v3
	INehXHa5JbJm0jJLrIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfde1-000000075Ks-47JL;
	Tue, 13 Jan 2026 12:37:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfde1-000000075Kf-0xHK
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 12:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7F0360134
	for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 12:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B16AC2BCB0
	for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 12:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768307828;
	bh=/jEbcQNNf+2y5DghSoCRU+Htja2/wQhqeKPPtGlgrS8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ComgjcI5VNR9q3dPbYO78SELFnXvnbFO3a2D+MW7vnjF21y21j+R6bjEBdIqVKVyI
	 rBaal5wvdHui7U8Vn1fb6UXphD7tmYI7EbURPOenXwtO/8BFJOXF4fYhwMIid5IDPQ
	 n4Yv61wK0o8M4u6SAR0BNoMHD6N03YK94He8dfhIOxwaNymlEtAjpOfVcMe+61HySM
	 dx/kdO75/NGB5MC8dfbtjbSLuJZUVYIwS474XlBn/9h4vbDBOoraoVTtiEwsoBzBrz
	 Qgte2rouu6eR1GVZeWVhX7P5t8Svn2VeDz2MRnzSYh2JwcXq9n4q8ACQ8N5eM139iR
	 s+7GlbXdpnT1A==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38301bf7864so56412831fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 04:37:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/KQHqnot8ifcWMfmuZQ8k4U5eib/8P4oU/hibrJ9aONVO2eyeh9pPy4znrwADOY+qPkuqCFn5VkFyoydZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwCHdoN52kokZfkZm3SRZ+ShoM3gjdxIWh7iI3jmNMmmQxPk2W0
	5mDPZYvDuBJ/ysNCdN89CQh0ZNLj29/VUsKQ7U2b9n6UiqnPpwKMqfbxSVczPoIOlaBIbK3j0qc
	wlNK6V/Jc37Gz7sQM2crIec0vO/krWwZ6014TvWLVcg==
X-Received: by 2002:a2e:ab19:0:b0:37b:9361:711d with SMTP id
 38308e7fff4ca-38350a55384mr8601501fa.8.1768307826023; Tue, 13 Jan 2026
 04:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com> <a2a610a3-aead-4e85-8a4c-7b83ccf276dc@lunn.ch>
In-Reply-To: <a2a610a3-aead-4e85-8a4c-7b83ccf276dc@lunn.ch>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 13:36:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
X-Gm-Features: AZwV_QhI9rebW3ffX0n9A2EUYniK94gLsNSjXRbzl9peLeeXv9eI-nHhZ9l6ybY
Message-ID: <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v6 2/7] net: stmmac: qcom-ethqos: use
 generic device properties
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
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

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMjo0NeKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAxMToxNTo0MUFNICswMTAw
LCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YnJnbEBrZXJuZWwub3JnPgo+ID4KPiA+IEluIG9yZGVyIHRvIGRyb3AgdGhlIGRlcGVuZGVu
Y3kgb24gQ09ORklHX09GLCBjb252ZXJ0IGFsbCBkZXZpY2UgcHJvcGVydHkKPiA+IGdldHRlcnMg
ZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVzIGFuZCBzdG9wIHB1
bGxpbmcKPiA+IGluIGFueSBsaW51eC9vZi5oIHN5bWJvbHMuCj4KPiBJcyB0aGUgaW50ZW50aW9u
IHRvIHJlYWQgdGhlc2UgcHJvcGVydGllcyBmcm9tIEFDUEkgdGFibGVzPwo+CgpOby4gT3RoZXIg
dGhhbiBhIGNvdXBsZSBwcm9wZXJ0eSBnZXR0ZXJzIHdoaWNoIGNhbiB1c2UgdGhlIGZ3bm9kZQph
YnN0cmFjdGlvbiwgdGhlcmUncyBub3RoaW5nIGhlcmUgdGhhdCByZXF1aXJlcyB0aGUgT0YgZGVw
ZW5kZW5jZS4KCkJhcnRvc3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
