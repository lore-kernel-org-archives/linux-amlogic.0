Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AB0C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 09:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5AF32146F
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 09:36:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ujBn8OYW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5AF32146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=epigenesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPGnM2LJXGhtUZzG7GXmiETQOObeHOQe9Qw9f42kbtM=; b=ujBn8OYWnAQhUR
	zzKZ+4vjOoOGAYbgebSQS3MMx+lE9faiWG2SeJ+p3gxaovL2asTSQtmfJcGhwnXPXsU+Ks8hC0ayd
	JH0B+5e0Cd1YRV3H/idEk12sRlk4jnvxTUtEsGMmxE1e6mzAWnzOXmZdHGRCDcPIaTs2fTrf2eYnK
	7x6+WfWmLZY0NIS4JTXShMe3cmEqP5Vb8Lv5gMRtqR0aEjJ7PpoIRSTX9aVVxf3e2RSaa4Vv4jNSW
	vT97Gi+o8TzL3EAnl6sXv6+EIhiiT6woY+5ST5OW175V2Dz8A5Q2AjMhZjGgFhYTmA7mee5+XpMie
	dt874iSRyQiILORQ8orw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghtEX-0000r2-EI; Fri, 11 Jan 2019 09:36:09 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghtEU-0000ou-GC; Fri, 11 Jan 2019 09:36:08 +0000
Received: by mail-wm1-f65.google.com with SMTP id g67so1675553wmd.2;
 Fri, 11 Jan 2019 01:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JQOucpdrnT7+zXl7VJsymkDpIfXi+qUvv0538yBHyEw=;
 b=IzhEqYB/8nEPIo9CEecXBUQbozwRcPMRN7DVzRz2W/M/VpdD5CYlHUMrytsaX1z+up
 lgzyNlTmd8g2l8O+cbDEWEgFEPi99hSBD0p0JFy8q5J7rUX0w0a0lm8jVWuhpFHHTj2A
 oNhQZnPQXf1MRuNphw4ruD8q+Sy2LeaPD0V8r09/OiOnaukyvGzbzHeWlIhfrvuSTJ4C
 q3i19NC1ValZj9l9Tgd2+jDuvgqr95lvuOUfxMvKKZmfdsN0F63GIlw+uzOSW6hBFrgL
 XDkZz5G1P42NqudQrC/MFR3RcoJcDrLunjaoRl8VPtZMhIFBJ3+vLC/CCAY8lGPPsc25
 rYhg==
X-Gm-Message-State: AJcUukd03tjiGnIt4wFlq/ZgyxNPQxszkCP0tm08H09Ynkq5oCupicmJ
 LzWboAUnJIc2OQ9Vv9CFSgc=
X-Google-Smtp-Source: ALg8bN53WXc9adTnVt1Z0sGXBGd7z6TZvEz4OPmr1sNYS7g9NKv0bNGRKrhlE0yvJww+I3vh4VIHzw==
X-Received: by 2002:a1c:dc02:: with SMTP id t2mr1481865wmg.78.1547199363530;
 Fri, 11 Jan 2019 01:36:03 -0800 (PST)
Received: from ingrassia.epigenesys.com
 (host194-85-static.3-79-b.business.telecomitalia.it. [79.3.85.194])
 by smtp.gmail.com with ESMTPSA id k15sm98426875wru.8.2019.01.11.01.36.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Jan 2019 01:36:02 -0800 (PST)
Date: Fri, 11 Jan 2019 10:36:00 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 1/2] pinctrl: meson: meson8b: add the eth_rxd2 and
 eth_rxd3 pins
Message-ID: <20190111093600.GA30612@ingrassia.epigenesys.com>
References: <20181229143556.27339-1-martin.blumenstingl@googlemail.com>
 <20181229143556.27339-2-martin.blumenstingl@googlemail.com>
 <7hzhs8ovag.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hzhs8ovag.fsf@baylibre.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_013606_552506_586C4B57 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 10, 2019 at 05:08:39PM -0800, Kevin Hilman wrote:
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
> > Gigabit Ethernet requires the Ethernet TXD0..3 and RXD0..3 data lines.
> > Add the missing eth_rxd2 and eth_rxd3 definitions so we don't have to
> > rely on the bootloader to set them up correctly.
> >
> > The vendor u-boot sources for Odroid-C1 use the following Ethernet
> > pinmux configuration:
> >   SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_6, 0x3f4f);
> >   SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_7, 0xf00000);
> > This translates to the following pin groups in the mainline kernel:
> > - register 6 bit  0: eth_rxd1 (DIF_0_P)
> > - register 6 bit  1: eth_rxd0 (DIF_0_N)
> > - register 6 bit  2: eth_rx_dv (DIF_1_P)
> > - register 6 bit  3: eth_rx_clk (DIF_1_N)
> > - register 6 bit  6: eth_tx_en (DIF_3_P)
> > - register 6 bit  8: eth_ref_clk (DIF_3_N)
> > - register 6 bit  9: eth_mdc (DIF_4_P)
> > - register 6 bit 10: eth_mdio_en (DIF_4_N)
> > - register 6 bit 11: eth_tx_clk (GPIOH_9)
> > - register 6 bit 12: eth_txd2 (GPIOH_8)
> > - register 6 bit 13: eth_txd3 (GPIOH_7)
> > - register 7 bit 20: eth_txd0_0 (GPIOH_6)
> > - register 7 bit 21: eth_txd1_0 (GPIOH_5)
> > - register 7 bit 22: eth_rxd3 (DIF_2_P)
> > - register 7 bit 23: eth_rxd2 (DIF_2_N)
> >
> > All functions except eth_rxd2 and eth_rxd3 are already supported by the
> > pinctrl-meson8b driver.
> >
> > Suggested-by: Jianxin Pan <jianxin.pan@amlogic.com>
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Tested-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
Reviewed-by: Emiliano Ingrassia <ingrassia@epigenesys.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
