Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1A5C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCrNtHafp2FIxegE1yXnpSR2wf2ihNa4n5I7ucsiLAw=; b=T4xlpkeVJmnLNs
	ktf44UXF2e0Yzr7S7AkT2961W6lC5x5dftXHj88V+zYZYNh0qOQSwbkjGoJ4gKfW4j1isexrSJFs8
	iXs7cSRFEm53c8Vqhfl4MpM0iDdBVc8qKZQCzh35jyJVX3GJODdgT5CTqgpoRo49dYNjavPfLamfo
	qW8373cIeMNV+7BAZ6lwv+puddbugG+WjW4T+UrCT0MXEwZIIb16FhpiCeAtgGbWcQszbKeTCqFSA
	ZAKClRcpzyDhvCuYMKvuup9UrAYbVI1LGQm02hTRYZupY4NYkyeB47rqda70Z7z7Wj0Rms+6FNxX7
	J9zgnuwXX3n+9oTrNaAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAUD0-004HiA-TO; Wed, 28 Dec 2022 11:02:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAUCw-004Hf5-L0
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 11:02:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C21EFB81258;
	Wed, 28 Dec 2022 11:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72317C433EF;
	Wed, 28 Dec 2022 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672225365;
	bh=B+kIgsbyyYwzcCIKPiZMpmbnCMNl6xqsXDtyJEIVNw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YdnLrNXKFoCGABlpow37gP9VNIeEfLMxRhvSRa3SD8MCWf/xz1UXmo5U4Lh0z+Ot3
	 AqPVjGQYZouqxEh9Bwr+bRMbxcOOJ6GDZ0Jz+GVF7+/go7Yb60Cyg3ovWv+6rDbqyl
	 cpGvF8tcMPk104aSnmxm+CrZECzxEKD7vingzbdk8thDYMYKPI3Xpze3jwYy43nwRp
	 NTxSpgmBdpKkv7c+PRnT2t5KZ7b5t8zC4X+C5EZQo0dVlNwmGAD/5jInOTPx+NOETF
	 mAyaO5Fnj84pAU48yEtYfPXHc1b1wl1Vn9O8IccsqnCfu2Ty+/J/bQY+bkqC+EieeR
	 i89deR5FZpuUQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1pAUCu-00067t-1E; Wed, 28 Dec 2022 12:02:48 +0100
Date: Wed, 28 Dec 2022 12:02:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 08/11] dt-bindings: usb: Add binding for Via lab
 VL817Q7 hub controller
Message-ID: <Y6wiWIH5S3jJnkai@hovoldconsulting.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-9-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221228100321.15949-9-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_030251_528994_847B270A 
X-CRM114-Status: GOOD (  18.72  )
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

On Wed, Dec 28, 2022 at 10:03:17AM +0000, Anand Moon wrote:
> The VIA Lab VL817-Q7 is a USB 3.1 Gen 1 4-Port hub controller that
> features 4 downstream ports, an internal 5V regulator and has
> external reset pin.
> 
> Add a device tree binding for its USB protocol part.
> The internal LDO is not covered by this and can just be modelled
> as a fixed regulator.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  .../bindings/usb/vialab,vl817q7.yaml          | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> new file mode 100644
> index 000000000000..4ae995160fd5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Via labs VL817Q7 USB 3.1 hub controller
> +
> +maintainers:
> +  - Anand Moon <linux.amoon@gmail.com>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - vialab,usb2109

This isn't a valid compatible string for USB devices (should be
"usb<vid>,<pid>").

Same for the other binding.

Also the bindings should go before the driver changes in the series.

Johan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
