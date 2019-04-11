Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B00CC10F11
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 01:05:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572BB20850
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 01:05:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QPX9arhk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 572BB20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVOCFzPwHkeoPNsboV/ZKlkcHctJXznJspZXlrWdRBE=; b=QPX9arhk1gb5PK
	nthnfbB+WIzgtqvfEaDM4oSwCen9MyX5YjtGU4o6qbttkSM+GS89Dz2NrEhB7N6viNHOtsFiGfOqt
	26hYs5hpxBpXF3t7QoSD5xTn3VApK/7tglFivjuTLvJrmsXOKzt/UjouqUTGKkv4DSU25vG0wpHYn
	1FEPZitrbjpQOpV74GM5DP62QG4+UWcVL2oA9ETl7h3I8sC4xGe/JSREMnnbYVpSXAI15TnfFLu7j
	kXSxvt1IcgOp2ZYQXOpBBCP35EM4UWh/1O7wtYIdaYja0q3Mo7RRLOCD/gklgjsWm0gtvYXJXIbqA
	gK8w5or0HW5vTjGOZ66Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEO9m-0002Vf-2Z; Thu, 11 Apr 2019 01:05:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEO9d-0002O3-7i; Thu, 11 Apr 2019 01:05:26 +0000
X-UUID: 84db623a435b42c4bb56c7c7ff499a8c-20190410
X-UUID: 84db623a435b42c4bb56c7c7ff499a8c-20190410
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1491029869; Wed, 10 Apr 2019 17:05:16 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 10 Apr 2019 18:05:03 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 11 Apr 2019 09:05:00 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 11 Apr 2019 09:04:59 +0800
Message-ID: <1554944699.10179.181.camel@mhfsdcap03>
Subject: Re: [v2 PATCH 4/4] phy: phy-meson-gxl-usb2: get optional clock by
 devm_clk_get_optional()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 11 Apr 2019 09:04:59 +0800
In-Reply-To: <CAFBinCBoQ6C7MrtwSctDgFPpXnaRVKm490piGOFmN2i2PV3GOQ@mail.gmail.com>
References: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
 <9f04a619e8a2cc44f5b1fe299a08f237f069d56d.1554874961.git.chunfeng.yun@mediatek.com>
 <CAFBinCBoQ6C7MrtwSctDgFPpXnaRVKm490piGOFmN2i2PV3GOQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6CF08254F7B4AD4CBBAD478DAA7D9C5E9F0742FDD2D8A18FA0B5EF750B3D59842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_180525_283700_501BC22A 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: David Brown <david.brown@linaro.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Motoya Tanigawa <tanigawa.motoya@socionext.com>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Andy
 Gross <andy.gross@linaro.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 2019-04-10 at 19:59 +0200, Martin Blumenstingl wrote:
> On Wed, Apr 10, 2019 at 8:13 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > Use devm_clk_get_optional() to get optional clock
> >
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> now also:
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> (on my Khadas VIM by manually adjusting meson-gxl.dtsi and dropping
> the clocks in usb2_phy0 and usb2_phy1)

Thank you:)



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
