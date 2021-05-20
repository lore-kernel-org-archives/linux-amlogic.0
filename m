Return-Path: <SRS0=eZXa=KP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A21C433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 14:13:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2CCE6100A
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 14:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2CCE6100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MiCdD3jm4Av7gANoSKH38i87rsliwv4fl8Z84Cb7lk=; b=Odx+Cnt3bxmGGXQziyMLC/ymS8
	eLJMfHGpml/pbxKEscySAoBBDosXa3/WwgCJcS5ehzEEbX5VPDyguw3sd6zXucu4TVVfT9vu76XcV
	4ImT3Kzv33o/b6W18p5BIEZX2Bje9N32YPCxh1Jqk3+egb+TN2zUVDxYDHcCyDJTGaxQwdp7xnAz7
	vC0GQQ6Neqa54c5fi1/3dRA7n3gPMnwRcUD1TC/4/bdsyTBuTtzL0EXeVQB6QDAJ2BVdI8K3teTIR
	ADKkyrOkvJ+o1CnrAw/PlE6KxxqoQ9FBxmaOvb/bjrWnPQXRSHSuzlm0TEBxdmF4Q+IyOnmx6/RWg
	oB1qr0OA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljjQ3-001OTb-9m; Thu, 20 May 2021 14:12:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljjO8-001NCY-6t; Thu, 20 May 2021 14:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GOWJWXESEPqFm8xdV+XYBQPbsNW1C/ZIjXdnlsXFdjI=; b=2DXkQF5LJZ3GVErNVmziYjiPT8
 Hpl6gCzUKMd2/nUHyupTHBaciCxn0yXNxQLl69s3eOJv1DCZMgAL+OQGnxmOW4WCEkFr5w9wBlFVQ
 ASY4rSsNVoNXe/ldt4Jtq85S+5Czf1ZVtcrUTAc7V+vonKhfIOF0BxmMJNTwLf4AGd8qN/ESguBsJ
 DJDzYcydBgaLU0pJ+H4JJNVEw7vpO6BXwZNR1VGS8Nd2SehuLOPQJMb46nkmqrKwZzvI5weKI4N2o
 bfI25wUPQqzkmcrf2c29RBHbXqPrtnI7dDVAN72030vYz4tLgd/8YHVvKjIi9nC9B6pIypc/md+4O
 WuMJUf+A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljjO5-00GPTa-MU; Thu, 20 May 2021 14:10:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA2606100A;
 Thu, 20 May 2021 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621519856;
 bh=gIBY97jslXsti2SI4ZA+8vXGfXHxGk/m/lfeX2OPoFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cfbaxJfdUWFcEQ5oRVyzkKmYCpG5OO9V85ooMIrl87DTqruYMt2DiQxuD/P80qqPM
 /Pd/Kmm+pOFirbpfc5DO7eh6T5fOHA4epdGwP38XhtXMO9IWYw0vWurYjsDrJeBOkW
 D4gqDfQ9KXyp2S9FgzPlXMe4E6SXfgIEYVBV9TY4=
Date: Thu, 20 May 2021 16:10:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jirislaby@kernel.org
Subject: Re: [PATCH 0/3] tty: serial: meson: add amlogic,uart-fifosize property
Message-ID: <YKZt7lCBhesXzoQP@kroah.com>
References: <20210518075833.3736038-1-narmstrong@baylibre.com>
 <9c6ce679-1721-be40-c1b2-6ae90503d2cb@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c6ce679-1721-be40-c1b2-6ae90503d2cb@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_071057_779875_A528FC3C 
X-CRM114-Status: GOOD (  16.93  )
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

On Thu, May 20, 2021 at 03:55:35PM +0200, Neil Armstrong wrote:
> Hi Greg,
> 
> On 18/05/2021 09:58, Neil Armstrong wrote:
> > On most of the Amlogic SoCs, the first UART controller in the "Everything-Else"
> > power domain has 128bytes of RX & TX FIFO, so add an optional property to describe
> > a different FIFO size from the other ports (64bytes).
> > 
> > This adds a property in the bindings, reads the property from the driver and updates
> > the DT with the new property.
> > 
> > Changes since v2:
> > - removed spurious blank line from bindings
> > 
> > Changes since v1:
> > - switched to a more generic "fifo-size"
> > 
> > Neil Armstrong (3):
> >   dt-bindings: serial: amlogic,meson-uart: add fifo-size property
> >   tty: serial: meson: retrieve port FIFO size from DT
> >   arm64: dts: meson: set 128bytes FIFO size on uart A
> > 
> >  .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 +++++
> >  arch/arm64/boot/dts/amlogic/meson-axg.dtsi                   | 1 +
> >  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi            | 1 +
> >  arch/arm64/boot/dts/amlogic/meson-gx.dtsi                    | 1 +
> >  drivers/tty/serial/meson_uart.c                              | 5 ++++-
> >  5 files changed, 12 insertions(+), 1 deletion(-)
> > 
> 
> Could you apply patches 1 & 2 ?

Sure, will go do so now...


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
