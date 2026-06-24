Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C632CDB471
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2026 12:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8/bn11y0s2JcdI9InTuZvWF2bVZVeVWP73gGqlVAWs=; b=Q+XYV+V9n0XOlE
	TVQs83Rtk/ys0+cPLeXl/CpUi1XUSNkeicmfDlgqUHvmfurE12itZuGvVfijxxxg6JnYPAaJbzGLH
	dcZe7YWQpLlqJw61gM6UlixyhIAlyo+G1amYDT5P4aqyZyd5K2KiosdcytSvGHMBc195Y9dpLFuwh
	AAuhl6njAmB0bHFauKtQnIA+zSTtH4ZczTnxo+YOyxIvAt11vgKUi17x1omQ05RKB5vEvC4KKzALi
	fKd/Oe/j3Tc31Y4aFq2CDUGs/qeA+EQ3Mr22hrdS4vnYw4sHNHh58hCRCKZXIMqAz+LWYYvKCKv2I
	OZTeOhogHJLoMCyekumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcN6V-00000007mNw-3kQx;
	Wed, 24 Jun 2026 12:53:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcN6U-00000007mNq-26SM
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jun 2026 12:53:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9427760018;
	Wed, 24 Jun 2026 12:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B211F000E9;
	Wed, 24 Jun 2026 12:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782305597;
	bh=HJKPKyjooasBtuw7pvPpV0lDfiXrWt987kFsIu3bzBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FqZe9GhHzOTTWP54ShlMDrtjxg67FtUO8+DOBweU09ATTsnzg65sr+eaybs1z8tZr
	 VGCHRpOaqd4kdSw3pNVpRUD2M8HyW/A0FQCcNYdp8C2avSfPntdSGU2igZ2Bj43QZR
	 DzbTwUm4IkI7jJNbzNuPwerbyVEJ4NS9j3k70OjqVq3dD8Bu7TAqKA/5hNztaLUrkh
	 fUrZ3at5KyDSTFAEhhSLHkS+mzmtNp1jxvLO5HehPR22q9bp8fWLtMzF3TFc24oREA
	 kvpaHvQxg/ZRPXIVGOXUi+VXKn/J0IuKxJ6V3Lzu6RiPctu4sp6MftN5mTT0ERUOSq
	 706522OnAGF8A==
Date: Wed, 24 Jun 2026 07:53:16 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: thermal: amlogic: Fix missing header in
 the example
Message-ID: <20260624125316.GA4032772-robh@kernel.org>
References: <20260622100231.438435-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260622100231.438435-3-krzysztof.kozlowski@oss.qualcomm.com>
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

On Mon, Jun 22, 2026 at 12:02:32PM +0200, Krzysztof Kozlowski wrote:
> Usage of defines from headers requires including relevant header,
> otherwise dt_binding_check fails:
> 
>   Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:59.27-34 Unexpected 'GIC_SPI'
>   Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:59.38-57 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
>   Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:60.37-45 Unexpected 'CLKID_TS'
> 
> Fixes: b1c8ccdbd4e9 ("dt-bindings: thermal: amlogic: Add support for T7")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Fix for current RC - commit already pulled in merge window.
> 
> This should be applied fast to fix current RC, thus maybe Rob?

Both applied.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
