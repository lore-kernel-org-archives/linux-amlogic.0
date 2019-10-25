Return-Path: <SRS0=91Jp=YS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51899CA9EBC
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2019 15:25:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09EB321D7F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2019 15:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ceG/GSvM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09EB321D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uO5vYUQnaY0Dfip6rupati73efMRmUrB1arvvVXybbw=; b=ceG/GSvMesRuaW
	1ZQ1TgCgKjMDDcjve09EZkAHDUFqvWOnpJ56kxP177AAKefKGjLfzfZ7+9a5kcxa6ne5lDuL0MnWd
	Zh38SCXqypmUHEnYRri4M0ALF1fnqKEeoDPKHtYTSVwrBUPL5vtsGpMd3f2IaXuqDfOx1LcOHbKYp
	Y8uDeojbbmocv22HwuCcLxHeskB2ctYIeD43NL7NH5T0CwCtHgCxdDtVDkNHOv1lW5Daa5BRWRabo
	LaEWTrJuxvOG1c3KfkJZTwBtH09E9x5RRdeLXl0u9CrmO9CdjhoKDPUvilSwWsltK83JDzG5527XR
	AgoJOGqExjuKcAan85Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iO1Sb-0000IA-C8; Fri, 25 Oct 2019 15:25:05 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=deadmen.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iO1SX-0008Eq-Lb; Fri, 25 Oct 2019 15:25:03 +0000
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1iO1SQ-0001q4-Ix; Fri, 25 Oct 2019 23:24:54 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1iO1SK-0007sB-Ir; Fri, 25 Oct 2019 23:24:48 +0800
Date: Fri, 25 Oct 2019 23:24:48 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH v3 0/4] crypto: add amlogic crypto offloader driver
Message-ID: <20191025152448.y3d45bt22gaavede@gondor.apana.org.au>
References: <1571288786-34601-1-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571288786-34601-1-git-send-email-clabbe@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_082501_949640_5534E155 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2019 at 05:06:22AM +0000, Corentin Labbe wrote:
> Hello
> 
> This serie adds support for the crypto offloader present on amlogic GXL
> SoCs.
> 
> Tested on meson-gxl-s905x-khadas-vim and meson-gxl-s905x-libretech-cc
> 
> Regards
> 
> Changes since v2:
> - fixed some spelling in kconfig
> - Use devm_platform_ioremap_resource
> 
> Changes since v1:
> - renamed files and algo with gxl
> - removed unused reset handlings
> - splited the probe functions
> - splited meson_cipher fallback in need_fallback() and do_fallback()
> 
> 
> Corentin Labbe (4):
>   dt-bindings: crypto: Add DT bindings documentation for amlogic-crypto
>   MAINTAINERS: Add myself as maintainer of amlogic crypto
>   crypto: amlogic: Add crypto accelerator for amlogic GXL
>   ARM64: dts: amlogic: adds crypto hardware node
> 
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   |  52 +++
>  MAINTAINERS                                   |   7 +
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  10 +
>  drivers/crypto/Kconfig                        |   2 +
>  drivers/crypto/Makefile                       |   1 +
>  drivers/crypto/amlogic/Kconfig                |  24 ++
>  drivers/crypto/amlogic/Makefile               |   2 +
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 381 ++++++++++++++++++
>  drivers/crypto/amlogic/amlogic-gxl-core.c     | 331 +++++++++++++++
>  drivers/crypto/amlogic/amlogic-gxl.h          | 170 ++++++++
>  10 files changed, 980 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
>  create mode 100644 drivers/crypto/amlogic/Kconfig
>  create mode 100644 drivers/crypto/amlogic/Makefile
>  create mode 100644 drivers/crypto/amlogic/amlogic-gxl-cipher.c
>  create mode 100644 drivers/crypto/amlogic/amlogic-gxl-core.c
>  create mode 100644 drivers/crypto/amlogic/amlogic-gxl.h

Patches 1-3 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
