Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08228C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:42:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F2112224B
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:42:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RmxE+LYe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="o88PlNkV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F2112224B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A8pI1KEgx+qbf31z/rBhBQDqIgGqhVIqLRta0MfCOX8=; b=RmxE+LYes4acPvSBLNzyfcTzm
	18/y/UEfoizHAdW0SVOnefQecdYu4h1UPmdVlEZgCtJjN4QJXYNPkPEsJ53VGWznCkPzpIFTfcv4M
	q8WsZlpu54NcbIxPku11UbkImdWXG4kZAS9/uw64H1K6Eb2dGvrIk/zuwqcWurY2yj+dmQWQLpYF2
	ocI6hmBhwv2gtN3RtUQdnEthToVd2ubbYHpkv4TsS1DI2WVlUsFM28Kn58cLvTfnAKLbLqJPDLluf
	sy/gqy6FlH851Ta00XMLCbnt7qjgl2IRQbR/05kqVkMxswla2w0a8KO9Qaj5zHxh5X4NFw0NCzWxy
	AuLh+cmlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUmHc-0002t1-S5; Tue, 20 Oct 2020 07:42:12 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUmHa-0002rv-Ac
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 07:42:11 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1603179726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IyHsTupE9fuRCreVd/5Khl5usGRzJYicWfZVGY98Tjk=;
 b=o88PlNkVACqAvIX4H5PqG/DTmKfZqGqoXRwIJizXfHw8wI1qJGLezu0+0hNa0tQV/TiFBj
 HLI9fye+zlRG5VDv7wrokipiFK/zb4Gf3j7Caf4jKrTMzfYglJaGtXwsYizmkOd091BNaY
 u3UbVvQuDv0THJu8SzSxBe8n/rYNTtU=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F0A6AE09;
 Tue, 20 Oct 2020 07:42:06 +0000 (UTC)
Message-ID: <09636f3b8dbd3838ba7a568f611a0323e85c4404.camel@suse.com>
Subject: Re: [PATCH] usb: cdc-acm: fix cooldown mechanism
From: Oliver Neukum <oneukum@suse.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Tue, 20 Oct 2020 09:41:34 +0200
In-Reply-To: <20201019170702.150534-1-jbrunet@baylibre.com>
References: <20201019170702.150534-1-jbrunet@baylibre.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_034210_507970_EA89243D 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Pascal Vizeli <pascal.vizeli@nabucasa.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am Montag, den 19.10.2020, 19:07 +0200 schrieb Jerome Brunet:
> Commit a4e7279cd1d1 ("cdc-acm: introduce a cool down") is causing
> regression if there is some USB error, such as -EPROTO.
> 
> This has been reported on some samples of the Odroid-N2 using the Combee II
> Zibgee USB dongle.
> 
> > struct acm *acm = container_of(work, struct acm, work)
> 
> is incorrect in case of a delayed work and causes warnings, usually from
> the workqueue:
> 
> > WARNING: CPU: 0 PID: 0 at kernel/workqueue.c:1474 __queue_work+0x480/0x528.
> 
> When this happens, USB eventually stops working completely after a while.
> Also the ACM_ERROR_DELAY bit is never set, so the cooldown mechanism
> previously introduced cannot be triggered and acm_submit_read_urb() is
> never called.
> 
> This changes makes the cdc-acm driver use a single delayed work, fixing the
> pointer arithmetic in acm_softint() and set the ACM_ERROR_DELAY when the
> cooldown mechanism appear to be needed.
> 
> Fixes: a4e7279cd1d1 ("cdc-acm: introduce a cool down")
> Reported-by: Pascal Vizeli <pascal.vizeli@nabucasa.com>
> Cc: Oliver Neukum <oneukum@suse.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Oliver Neukum <oneukum@suse.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
