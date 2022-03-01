Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761F0C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uU+Ga4QdjLSBUGFUHX4kk0XNHv2zVY6thcXom1qdsKA=; b=RF5/dDKJQ2zRrf
	2krKvRUdqMwsRxb45Brb7OCMu82nR0uZGh47Jk0v/+Py+RBzKtrXEOgHYhgE29BlLOIAqJjEVxsLl
	m641LVi9/GrTmlxk91PGSmIgaWj1TZ6UoITCEgWqfyD0430jy8sMmIllQI7xIs43XtYvKPxlOSqix
	DjwsbzUOGmlyE54znPhnJm+csq9eSA7oZlZCWlt6cUZV8KaREVIEpHTMgP6NbxSI6cKmHvQ1VcDS9
	YDSl8h0c6Uxxu+ER49+PrnZFBd0sMNyshGgL5hBoh9rcW+E3C0Hv4lFlZ2NTu5qB7anBWRMmdefUm
	glFTq3Pq3sBDyDMJfeEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP9g7-000ZCJ-Qr; Tue, 01 Mar 2022 21:05:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP9g5-000ZBZ-8A; Tue, 01 Mar 2022 21:05:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DAD260F93;
 Tue,  1 Mar 2022 21:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D72C340EF;
 Tue,  1 Mar 2022 21:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646168700;
 bh=+giOaAjXTXHBc6Q8z1vDjngTHJyi+4Yw/zEpOyQGKRQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jlt84sel6Mj+tBBej8jK6EJrrkyMaV7/S20YoDwiMJjV54mMzUuhWnofEa1BEw040
 AlVsMiugsy/KqZMH56Mbq4Trg7w3W1LFcQTgMNt0os0dUmDxDcitOhWNTpnNQWg5XJ
 c1T6ddAKzJEauBhdZRdxo3T/wdPJG7tMvN3P7J2c=
Date: Tue, 1 Mar 2022 22:04:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V7 3/6] tty: serial: meson: Describes the calculation of
 the UART baud rate clock using a clock frame
Message-ID: <Yh6KedQgtLYkuG7k@kroah.com>
References: <20220225073922.3947-1-yu.tu@amlogic.com>
 <20220225073922.3947-4-yu.tu@amlogic.com>
 <CGME20220301131754eucas1p1b8d762c90f4677b92a305f3eefec761f@eucas1p1.samsung.com>
 <180d7038-4ae2-80d4-0760-4be24ec11836@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <180d7038-4ae2-80d4-0760-4be24ec11836@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_130501_351196_70B9F541 
X-CRM114-Status: GOOD (  14.06  )
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

On Tue, Mar 01, 2022 at 02:17:53PM +0100, Marek Szyprowski wrote:
> Hi,
> 
> On 25.02.2022 08:39, Yu Tu wrote:
> > Using the common Clock code to describe the UART baud rate clock
> > makes it easier for the UART driver to be compatible with the
> > baud rate requirements of the UART IP on different meson chips.
> >
> > Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> 
> This patch landed recently in linux next-20220228 as commit 44023b8e1f14 
> ("tty: serial: meson: Describes the calculation of the UART baud rate 
> clock using a clock frame"). It causes kernel crash on my Amlogic based 
> test boards: Odroid C4/N2 and Khadas VIM3:

Ok, this series is causing lots of problems, I'm just going to revert
the whole thing from my tree, thanks for letting me know.

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
