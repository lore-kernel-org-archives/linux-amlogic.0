Return-Path: <SRS0=PPRh=DZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B976C433DF
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Oct 2020 19:00:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5CE522264
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Oct 2020 19:00:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="huqiXOjJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qhWiWAYm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5CE522264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DvqdkgBxYUqmhQK2qXF1E8sY4RJzLN9w3/I1FT+J0lI=; b=huqiXOjJ2V2SU1KWEnAikLSdL
	3bD9r9Fe/tLKqzjs/f0bedCKEJuMuBjCNG7bc4l988UozxB7I8zT709ZnAQsdm69WXJt7iCKsmbCz
	HZnHFHGq+RJ3ox6waDz6bCvCVSg5u1UWZLT4p23wvGHWpli4xzPXNhRsLi9Qk0OmNqd9d2agTi3qy
	aueENQOD00yDbBV6HPKrmkewXbBnYs7I9nt41yr+vd1T+31PhB9UXfBWHI84Y4x9kD7Nuvrdqjurn
	BKw0mQuH0/8FCm/AHPbSTaYEm/50f1kiCxNZ6sWcfuenx8eYGeLr6/WT9uFnCjTYx4g+C2gKjbrNU
	KaicVuqGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUDuN-0002xs-Vw; Sun, 18 Oct 2020 18:59:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUDuI-0002ws-Vn; Sun, 18 Oct 2020 18:59:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=q0BhqrN3gbd6Z80uxUuHxnuOGNa3MQpvn/ujKpbjoKc=; b=qhWiWAYm9fZ2KNDR/Yk3WeXFl4
 HF2RciAjYHBQMCf3sjKhvFkXSfibnOaNYa7rSxO4GAjMdOb5lKFie8w5W48ySlrw8CCYSSnOZO0Xg
 5v+vzHZ7K/VxCxY2aBAso6UvZLXpaapi00aBgR18RXogoXyWfK3p9m9265NrgW55bmABmFf/ljB+D
 9Af5uL1UZOzL5n8T3eza+cGiO5HDs2I27gnorvuwnA1XSsP05jdLks+n6C8PrE6p/2IOOkRu9s0Qf
 2gQIITEDGF8BYWCD3hQsOGqb9beW/Q62vFU/IQef0kDvAQTCEweywjgtWsVjiKxR3wbF0iuVRtPwK
 m1h79KbA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kUDuB-0007Wk-NT; Sun, 18 Oct 2020 18:59:43 +0000
Date: Sun, 18 Oct 2020 19:59:43 +0100
From: Matthew Wilcox <willy@infradead.org>
To: trix@redhat.com
Subject: Re: [Ocfs2-devel] [RFC] treewide: cleanup unreachable breaks
Message-ID: <20201018185943.GM20115@casper.infradead.org>
References: <20201017160928.12698-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201017160928.12698-1-trix@redhat.com>
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
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, usb-storage@lists.one-eyed-alien.net,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-pm@vger.kernel.org,
 ath10k@lists.infradead.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, industrypack-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org, spice-devel@lists.freedesktop.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-nfc@lists.01.org,
 linux-serial@vger.kernel.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 storagedev@microchip.com, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, clang-built-linux@googlegroups.com,
 patches@opensource.cirrus.com, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-power@fi.rohmeurope.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
> clang has a number of useful, new warnings see
> https://urldefense.com/v3/__https://clang.llvm.org/docs/DiagnosticsReference.html__;!!GqivPVa7Brio!Krxz78O3RKcB9JBMVo_F98FupVhj_jxX60ddN6tKGEbv_cnooXc1nnBmchm-e_O9ieGnyQ$ 

Please get your IT department to remove that stupidity.  If you can't,
please send email from a non-Red Hat email address.

I don't understand why this is a useful warning to fix.  What actual
problem is caused by the code below?

> return and break
> 
>  	switch (c->x86_vendor) {
>  	case X86_VENDOR_INTEL:
>  		intel_p5_mcheck_init(c);
>  		return 1;
> -		break;

Sure, it's unnecessary, but it's not masking a bug.  It's not unclear.
Why do we want to enable this warning?


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
