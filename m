Return-Path: <SRS0=biGq=EH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C214C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2020 15:32:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11550206DD
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2020 15:32:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJCwShEq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wB+1iKH/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11550206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I2P2wosKy+9QFSym//LRCKo6y1cGCV0N87sckHQ+Dzc=; b=WJCwShEqVssePo3wXp00iSxed
	hA1NejLOJ2vzB/68moaIU128XhEJ4yDnaBiLP1JxypaQidS0DOsOsmusTQRbm8W6RFbe2NZy4kdZ4
	sQHBFhbZBWnD0Xj8XXOZdd+D30V1eHB6QoB+hbT4Zn5REoFrSpFdI8HQ6ytdazqnN2cvAfORJsZPl
	QSddnoWyoopqNPpehIW5Gmg7Zeh2irgeAuyq5lJmbVk0tEXxce6/2/SkUVRPNHE6wBO0KSl/I/akS
	cHtElC51kDoiTZj8fPXrO3fcl2kHsJ44X6Gejan+EvNMXFbavAi0kASYsORYDp+vcvX596BUEZytx
	9zJh38ucw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZFLN-0003U7-U5; Sun, 01 Nov 2020 15:32:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZFLL-0003TK-OB; Sun, 01 Nov 2020 15:32:32 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07331206D8;
 Sun,  1 Nov 2020 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604244750;
 bh=zaRSNwY1ZAh179FupbjBNapW+0OGmxmNUA2NqRQM7DA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wB+1iKH/vDi/y6iMdpvBhXq5ykVyK6NFK3Qbre4RK8xVpLewqtmHU5OiDVTVbcao7
 5JfCP/wyiVXtk/jpUyC+/J5OqGKpRL1oAZ9j4zUrqNVfuIjcui33sgK0OmNFTmrRNi
 CXOe6tW3hVJLsBmEcSrtBGvyD4cFwlIQWwxejtS8=
Date: Sun, 1 Nov 2020 15:32:25 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] iio: remove unneeded break
Message-ID: <20201101153225.0abf45c2@archlinux>
In-Reply-To: <CAFBinCDKf_TJb9ONfz+383NB0yKDb2a_zxXktAoBHKg_03L2+Q@mail.gmail.com>
References: <20201019172824.32166-1-trix@redhat.com>
 <CAFBinCDKf_TJb9ONfz+383NB0yKDb2a_zxXktAoBHKg_03L2+Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_103231_865902_BAA04190 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: linux-amlogic@lists.infradead.org, lars@metafoo.de,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 trix@redhat.com, linux-kernel@vger.kernel.org, krzk@kernel.org,
 andy.shevchenko@gmail.com, pmeerw@pmeerw.net, khilman@baylibre.com,
 jonathan.albrieux@gmail.com, alexandru.ardelean@analog.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 20 Oct 2020 21:39:17 +0200
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> On Mon, Oct 19, 2020 at 7:28 PM <trix@redhat.com> wrote:
> >
> > From: Tom Rix <trix@redhat.com>
> >
> > A break is not needed if it is preceded by a return
> >
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  drivers/iio/adc/meson_saradc.c       | 2 --  
> for meson_saradc.c:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Applied,

Thanks,

Jonathan


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
