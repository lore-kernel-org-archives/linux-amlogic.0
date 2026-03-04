Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427DAEDEC1E
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 07:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrhX8xuXD4DHKsuh/QCuL6WmpO1kPEmxF1rWsiUZXrY=; b=MBekqb7XG7Zz32
	cJRKP1fnqpKW6fQF16mYRw6ntj9awTUNOnEJzqvbACTO0vIrLxTCsefrAKbRa/03MmUKqEU34HJ5E
	WNnmV1YW22ORYTixwqBosriWMZsWl7NFNnkr9wCpNTh8hMRsCZPogbmmaMKjVb9XkmGMps8XgtwZn
	2rS2ZXWkREX39K9fiumwI3AnrmgKNykA3xmcOwXAhkhV2pDu7NdD5MAJCL4RLoGa0CZlwo1bXzQRp
	cmv1K4Mz/G68KzntSUdlN2gGjQfVKSoKktgwH3o2+8bG/7B5RT9Bns+2MHliudtDpfToONStn8mh7
	DVHcELpI6QOVnysX8Gxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgjM-0000000GbNz-0Rf8;
	Wed, 04 Mar 2026 07:33:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgjK-0000000GbNn-2wCO
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 07:33:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A23360097;
	Wed,  4 Mar 2026 07:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4817EC19423;
	Wed,  4 Mar 2026 07:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772609592;
	bh=8l87FG3GfJ8GOGQId/6eYI/ACFLADMHOJZvD/ixFexk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HOMSWQIrUCrYfDhcT1LekIwNg0z7E1jHDc7bo6lVsZ2I8YneR/S/G/tKdCXEXGs0Q
	 XfKKNVNqODC2qSDdytIoSSm98eG3ZlePGTPyNOYbIOZi42mHHw/CJqcmbZ28t6I+pG
	 hajkmVxa969r5CkWKo0YNEKvY2b9xJTL+tAJzvv6WxiR+veQ3fKbn8nJwh74P2UEAK
	 CWSSAjy1aFLISt7ZMQfQHcIRzEmLk9YaPDFtQC+DZPbgtM16IKeb7A6ZzmHpdD4AAZ
	 yShTiebgwMWI753LCzzb/m3a+H7AzAIRrL33TzVFGW2sjxwcoBR97qWEeCTASw/AVW
	 oRjZB4mbAQLLw==
Date: Wed, 4 Mar 2026 08:33:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
Message-ID: <20260304-uptight-rugged-badger-c40d0d@quoll>
References: <20260304-amlogic-dma-v5-0-aa453d14fd43@amlogic.com>
 <20260304-amlogic-dma-v5-1-aa453d14fd43@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304-amlogic-dma-v5-1-aa453d14fd43@amlogic.com>
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

On Wed, Mar 04, 2026 at 06:14:12AM +0000, Xianwei Zhao wrote:
> Add documentation describing the Amlogic A9 SoC DMA. And add
> the properties specific values defines into a new include file.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/dma/amlogic,a9-dma.yaml    | 65 ++++++++++++++++++++++
>  include/dt-bindings/dma/amlogic,a9-dma.h           |  8 +++
>  2 files changed, 73 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
