Return-Path: <SRS0=45KS=NO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CDFC4320A
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 13:17:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42A3961373
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 13:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42A3961373
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0V8IaAsoFu4uxRPKk8A40g9ma+hLKC7YMIiG7FiRSk=; b=dfWdSB6szwWwVa
	KeknKsyxoD9mpBpm51a12NWOmEpGJTJLZrLnHCQfb8C4uGd1pTMZDzymYm2NRWu7YiDOJVn2AhekL
	PZh2NdNXzDX+GzVCvN6H5zThJf/PNO9zjh9iWXKupR1zgZxtebCYU9pF1kbaGv2iLTwIkVa2xLEX9
	vvP7DWS5a1TbgIHDmELyb5Unvhp/LqFkBO4SlJ6tZK9N/Ye/TP22OwJDYYNkkijHdIVF2lvVVjDkk
	Jnn150Gecwiw69r0IzBf0itvSerXLIGwbmPd4FyRJHjoxRR1CasHs83/GQ3NTefLT8GWuHwH8MAjs
	pxbiswb+3413wq9M8KMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI9pI-00H0eg-AV; Mon, 23 Aug 2021 13:17:20 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI9p2-00H0XT-TY
 for linux-amlogic@lists.infradead.org; Mon, 23 Aug 2021 13:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=gN2erQa4xHFleHaPe8a5OvdToFtGAqPESdt/RHJIVNs=; b=zWC+lJqsd06WF7ILg+Thgu9mE1
 ZtNqlLoOFhBmLLS/ePijatX5aumiOoXsqBcgdLd5kVN38TsPXrlRbHKvRlYUfpmI3bpAqjtOq04D+
 b8i3wUaXqWbQ6f4RvaXSiHJvgkMgBLYR8C6AzHIucciniJaT5whL3C+oR+Y5KkAl5J6M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mI9oi-003T7N-Rk; Mon, 23 Aug 2021 15:16:44 +0200
Date: Mon, 23 Aug 2021 15:16:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, netdev@vger.kernel.org,
 kernel-team@android.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for
 "phy-handle" property
Message-ID: <YSOfvMIltzWPCKc/@lunn.ch>
References: <20210818021717.3268255-1-saravanak@google.com>
 <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_061705_011413_5282A1FE 
X-CRM114-Status: GOOD (  16.29  )
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

On Mon, Aug 23, 2021 at 02:08:48PM +0200, Marek Szyprowski wrote:
> Hi,
> 
> On 18.08.2021 04:17, Saravana Kannan wrote:
> > Allows tracking dependencies between Ethernet PHYs and their consumers.
> >
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> 
> This patch landed recently in linux-next as commit cf4b94c8530d ("of: 
> property: fw_devlink: Add support for "phy-handle" property"). It breaks 
> ethernet operation on my Amlogic-based ARM64 boards: Odroid C4 
> (arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts) and N2 
> (meson-g12b-odroid-n2.dts) as well as Khadas VIM3/VIM3l 
> (meson-g12b-a311d-khadas-vim3.dts and meson-sm1-khadas-vim3l.dts).
> 
> In case of OdroidC4 I see the following entries in the 
> /sys/kernel/debug/devices_deferred:
> 
> ff64c000.mdio-multiplexer
> ff3f0000.ethernet
> 
> Let me know if there is anything I can check to help debugging this issue.

Hi Marek

Please try this. Completetly untested, not even compile teseted:

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 0c0dc2e369c0..7c4e257c0a81 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1292,6 +1292,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
 DEFINE_SIMPLE_PROP(phy_handle, "phy-handle", NULL)
+DEFINE_SIMPLE_PROP(mdio_parent_bus, "mdio-parent-bus", NULL);
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1381,6 +1382,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
        { .parse_prop = parse_leds, },
        { .parse_prop = parse_backlight, },
        { .parse_prop = parse_phy_handle, },
+       { .parse_prop = parse_mdio_parent_bus, },
        { .parse_prop = parse_gpio_compat, },
        { .parse_prop = parse_interrupts, },
        { .parse_prop = parse_regulators, },

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
