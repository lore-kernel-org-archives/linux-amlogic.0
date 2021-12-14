Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7D6C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Dec 2021 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GsRpbBDRB1Ee4iRW0q/tdwBO74maPp8JJdzX50BD0I=; b=Hi9/8NIcKdchB3
	ACgj0QcjlTTwmXGYigXVDilfbAMXdXMc2c1wZ2xJFazeIPZTW6iSLmJ7i5hE9kQWaxRvwTuvotUGw
	Pi51i5kJ6T+Giqq97yKIuB86CGMHJAvA6oHOSlgGIPfHIzNz7aYvQsDvulsnmcpkiBps9iS0lQAoW
	5fECb4fx4FIvnrCH38XWd/P+jPncMLskdqI8W5BesNpPbQG0Mvv+ChJ9G6UcQMs8TB+jk41l0q6gg
	eM8gJ2uxMIa6QwSq3HXulFdRf2hOFORznm7liaATy/k5PPtL/7mxwtSji5qL3ZkNMiMLRUdMRBG2G
	qxxPpUAGoRWJ/SQOCoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx8d0-00EL4M-J1; Tue, 14 Dec 2021 14:18:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx8bk-00EKWC-Cn; Tue, 14 Dec 2021 14:16:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A9B7B819D2;
 Tue, 14 Dec 2021 14:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C28C34601;
 Tue, 14 Dec 2021 14:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1639491401;
 bh=eG4XEiffsdd9Bx5G2ry7thk1JeTMHFrMPaP5u8+EqRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fQTCcOgPw6gH/kBZwktjgf09OpSiut+qSjaBqz2WUMy2okynRswPgHAKGjbKvF+iI
 FtX82dnym5G3ql/JfVKm6uL7qWTRR5vSxFbFEjKsFBjvhIRfDGGnZINeW/FlRpqSUf
 vlBx7ymrw6Ezr0L344OT1ggmBFPtihLJpYNj+X8U=
Date: Tue, 14 Dec 2021 15:16:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Zhou Qingyang <zhou1615@umn.edu>, kjlu@umn.edu,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Maxime Jourdan <mjourdan@baylibre.com>, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: meson: vdec: Fix a NULL pointer dereference in
 amvdec_add_ts()
Message-ID: <YbinRhwVVPWlwjnq@kroah.com>
References: <20211201084108.GE9522@kadam>
 <20211202160357.75173-1-zhou1615@umn.edu>
 <20211214144613.35fec82a@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211214144613.35fec82a@coco.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_061644_655665_2EC67EB4 
X-CRM114-Status: GOOD (  31.38  )
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

On Tue, Dec 14, 2021 at 02:46:13PM +0100, Mauro Carvalho Chehab wrote:
> Em Fri,  3 Dec 2021 00:03:57 +0800
> Zhou Qingyang <zhou1615@umn.edu> escreveu:
> 
> > In amvdec_add_ts(), there is a dereference of kzalloc(), which could lead
> > to a NULL pointer dereference on failure of kzalloc().
> > 
> > I fix this bug by adding a NULL check of new_ts.
> > 
> > This bug was found by a static analyzer. The analysis employs
> > differential checking to identify inconsistent security operations
> > (e.g., checks or kfrees) between two code paths and confirms that the
> > inconsistent operations are not recovered in the current function or
> > the callers, so they constitute bugs.
> > 
> > Note that, as a bug found by static analysis, it can be a false
> > positive or hard to trigger. Multiple researchers have cross-reviewed
> > the bug.
> > 
> > Builds with CONFIG_VIDEO_MESON_VDEC=m show no new warnings,
> > and our static analyzer no longer warns about this code.
> > 
> > Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
> > Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> > ---
> > Changes in v2:
> >   -  Delete dev_err() message
> > 
> >  drivers/staging/media/meson/vdec/vdec_helpers.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> > index b9125c295d1d..ac60514c475b 100644
> > --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> > +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> > @@ -234,6 +234,9 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
> >  	unsigned long flags;
> >  
> >  	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
> > +	if (!new_ts)
> > +		return;
> > +
> >  	new_ts->ts = ts;
> >  	new_ts->tc = tc;
> >  	new_ts->offset = offset;
> 
> I don't think this change is ok. Sure, it needs to check if
> kzalloc() fails, but it should return -ENOMEM and the caller
> should check if it returns an error. So, I would expect
> that this patch would also touch the caller function at
> drivers/staging/media/meson/vdec/esparser.c.

This is why umn.edu emails still are in my black-hole :(

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
