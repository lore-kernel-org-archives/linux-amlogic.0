Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30822EE7FF4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 10:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTudbTHxwU2/J6mCjhmLRxUdOhe2dWowr91qdOgoUl4=; b=uGDs+RYCNX6cOG
	U038W1sP1DHa+lo570IyINEnuWqb6gOxNFhPevoxXPV/LkJuXb3Ity/eldcuDwYTFLrwrz+s6P0Oz
	plH+fc4eMVfFP/hvKBqzvmcCk3/JtPvuQJmEgF/z9tQK20Zug23dQJUXs4jYc2LdoSEMEfuEPG0gV
	VgOw6suPNHag2cTd4HxGWAkabg7scLMWpOXohMFxIehBVej4TTtonjYBTuv3JGAU0HnTNHlDCkF5t
	oSWqvgyXWEwPpCKh7/JxwMR/RF1AXYU4HVv/gXGwPBKNIbPri8jWMTSsb0ccpsd1RElT9IVJIhFbY
	IUgLn2CaSGXvZp5QOlNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeBG-000ChE-2P;
	Mon, 11 Sep 2023 10:30:10 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeBD-000Cca-2p;
	Mon, 11 Sep 2023 10:30:09 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 087A11007F4; Mon, 11 Sep 2023 11:30:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1694428202; bh=C5p79trdszxhTp7l4miBmtFH2djt9s/BNEVz7vucdGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTUf/QEnG6qzsYG5+vFdadVDn4/IwdyuBe0bT6RTlMeBz1YjK/Vo/IScYcisbTRsx
	 WnHxZ4UA60YcdOpPARgb6E2ZhavbJneG2YRJyO7F0ASqWwnFyMh19qsJHnD5TYkhDl
	 ImVF5H0idaeG3tf8LZXpE+hGfBr+fncAHGK+pu3+PS8kW/nGmEVU6J0urBoBt1fo8E
	 4MK87aZLh4BQppOL/zjC/s7cJovk2Jz1yF9dV4nBTCT6P5IiwRkLjNVdxWq9h7GDjl
	 tuN4Eu0K5mdnhMKnIyuDiE2g2pQUAmoVc0khKS3TFQK1FHO2pWU8oq+OkvUed2G2ED
	 Sdm0dV3w5xarA==
Date: Mon, 11 Sep 2023 11:30:01 +0100
From: Sean Young <sean@mess.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	zelong dong <zelong.dong@amlogic.com>, linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Qianggui.Song@amlogic.com,
	Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
Subject: Re: (subset) [PATCH 0/3] This patchset adds IR controller driver
 support for
Message-ID: <ZP7sKdvAWQQSrTmX@gofer.mess.org>
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <169442559302.3235506.15361466537260729684.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <169442559302.3235506.15361466537260729684.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_033008_076794_17D6828B 
X-CRM114-Status: GOOD (  13.68  )
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

On Mon, Sep 11, 2023 at 11:46:33AM +0200, Neil Armstrong wrote:
> On Fri, 25 Aug 2023 19:53:07 +0800, zelong dong wrote:
> > From: Zelong Dong <zelong.dong@amlogic.com>
> > 
> > Meson IR Controller supports hardware decoder in Meson-S4 and later
> > SoC. So far, protocol NEC could be decoded by hardware decoder.
> > 
> > Zelong Dong (3):
> >   media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
> >   dt-bindings: media: Add compatible for Meson-S4 IR Controller
> >   arm64: dts: meson: add IR controller for Meson-S4 SoC
> > 
> > [...]
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)
> 
> [3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
>       https://git.kernel.org/amlogic/c/dc8bc779feb5e855421215384f23de90a4fcd622

Would make more sense to have all three patches go in together through a single
tree? I was about to apply all three of these patches to the media_stage
tree.


Sean

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
