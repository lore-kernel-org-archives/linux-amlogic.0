Return-Path: <SRS0=t9u8=3N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DA1C2D0CE
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jan 2020 08:20:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35CB520838
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jan 2020 08:20:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aO0SKEvG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35CB520838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKW6wfETgKTbNwhYvbD5t3pmgXUJ4JwjDjP4SvYUSkg=; b=aO0SKEvGivu3lz
	m2RuJa4lNTMtbSSZsW4qJYZhvrLa/g37+MWy8jRn6lx1RU80l4XgYtHySFeu9lfKFptQ+Lkg3dUoL
	KpAscPs5nTWzk4IAxfriKZBukmxYeoAln6R7nQxAXuXMbT7g/w/EjZ8Dn9OAXg7lJLxVYRX1lCeHE
	hRoB1ZMDER+O6KnLu8+KMgg5mQbttCOupSGCuEe+ypPMcoqvTeHYtt+HqiXgrLQrD3NOxh9hSPD2e
	ekqVPaRHXzqAwQUEsczncfwBYour3htik2/F+LvaounO/uJkBKPdN04ia8FTZC0qOMUs8VxB5kIdF
	mLPbBsfq9Jw/mrj2d1Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuuCk-0007Xn-Gz; Fri, 24 Jan 2020 08:20:38 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuuCh-0007WZ-OS
 for linux-amlogic@lists.infradead.org; Fri, 24 Jan 2020 08:20:37 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0CB192000F;
 Fri, 24 Jan 2020 08:20:25 +0000 (UTC)
Date: Fri, 24 Jan 2020 09:28:50 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Kishon Vijay Abraham I <kishon@ti.com>, Yue Wang <yue.wang@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 2/7] dt-bindings: Add AXG shared MIPI/PCIE analog PHY
 bindings
Message-ID: <20200124082850.GT1803@voidbox>
References: <20200123232943.10229-1-repk@triplefau.lt>
 <20200123232943.10229-3-repk@triplefau.lt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123232943.10229-3-repk@triplefau.lt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_002035_927630_72BF59D6 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing Reviewed/Acked-by tag from v5.

On Fri, Jan 24, 2020 at 12:29:38AM +0100, Remi Pommarel wrote:
> Add documentation for the shared MIPI/PCIE analog PHY found in AXG
> SoCs.
> 
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  .../amlogic,meson-axg-mipi-pcie-analog.yaml   | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
