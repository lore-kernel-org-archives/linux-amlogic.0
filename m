Return-Path: <SRS0=W+6h=WD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572F6C32751
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2019 14:34:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E25621E71
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2019 14:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Saqg58Ub"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E25621E71
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FguTPn8Q0fF5V9cza9wY0veJVO9Sp0NwTOUGsTUQQLU=; b=Saqg58UbVE0Vhl
	qE4qPVZ7fyB6adCInzdf/tWf7ycHyzW+wFE6fU63Db4Zy18dcALjcw0wyrdweDeym02GUHgyz/oWh
	mdPL7Ly35Dcf7eaJ6GXg4PPeJjKTrRN8FtsidLoQ8cnsbKi9k0PRSjsUEtDhAth9kzWWlaT3aUesB
	Gif80wa1iDzreBLJOLf9ge/mNaIuNqexP+kMWUGSCtdE5mGZQAVLIYLv7gCM8EULHCWxuGSuuLwOJ
	FkmLgH0AteTS/ad6VSziYB9RmCZTzXXBzm4H1WMrcGH2YIyE+gOMvrZVeA/oy4btm2NybTWkZD6dR
	7qbm/rbOnZfJLWDUoObA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvN1Z-0005v2-L7; Wed, 07 Aug 2019 14:34:45 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvN1W-0005uW-SW; Wed, 07 Aug 2019 14:34:44 +0000
X-Originating-IP: 88.168.111.231
Received: from localhost (lpr83-1-88-168-111-231.fbx.proxad.net
 [88.168.111.231]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4B53F240002;
 Wed,  7 Aug 2019 14:34:32 +0000 (UTC)
Date: Wed, 7 Aug 2019 16:34:31 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFCv2 1/9] dt-bindings: mailbox: meson-mhu: convert to yaml
Message-ID: <20190807143431.6w6dg44mjiwtffi2@flea>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805120320.32282-2-narmstrong@baylibre.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_073443_077733_5E56F67A 
X-CRM114-Status: GOOD (  16.00  )
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
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Aug 05, 2019 at 02:03:12PM +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic MHU controller over to a YAML schemas.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../mailbox/amlogic,meson-gxbb-mhu.yaml       | 53 +++++++++++++++++++
>  .../devicetree/bindings/mailbox/meson-mhu.txt | 34 ------------
>  2 files changed, 53 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/meson-mhu.txt
>
> diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
> new file mode 100644
> index 000000000000..2536a0082cff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mailbox/amlogic,meson-gxbb-mhu.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson Message-Handling-Unit Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Amlogic's Meson SoCs Message-Handling-Unit (MHU) is a mailbox controller
> +  that has 3 independent channels/links to communicate with remote processor(s).
> +  MHU links are hardwired on a platform. A link raises interrupt for any
> +  received data. However, there is no specified way of knowing if the sent
> +  data has been read by the remote. This driver assumes the sender polls
> +  STAT register and the remote clears it after having read the data.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-gxbb-mhu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 3
> +    maxItems: 3

You don't need to specify both here. If one is missing, the tools will
fill it automatically with the other's value.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
