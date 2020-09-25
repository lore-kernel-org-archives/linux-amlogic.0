Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB649C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 14:14:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1924208A9
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 14:14:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1uMKoC51";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jJuocI/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1924208A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GtXsAvvNV+Rp3N5voGnigS0Qy6+gFsyUO8tL9vw3CZs=; b=1uMKoC51FsaPp1Kf9LxzGFr1F
	U90jF6U3ZTKV94vnEI1Jh8q6NEtHqPRfn4Fn0oiUTLtk8WF0uPrv8qOPXQ8sIoI0NRQkT+LhprlTf
	wsx1xW09+VnjdF5qdkstl4LavHgfnOqlYYHfaCmRw559fgqeFV0lrRRbqhJ8RdHGYWybc4rLt+mPm
	g6dexzTEUnebXJj+Ao9gaAjdO8taBH0PCiZhedn2LAqkuptLWJD6QpIV8BRGxb2GyWtJdi3/kPw0L
	RH42o2dj9d7mXBkjfOwvQvqFRK2RxGWFMJlQain2sTF8IA+iJAo3DqK+xgX9FmQa5InB6I0gj0s8j
	Uz0WS6GHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLoUN-0003qr-Jz; Fri, 25 Sep 2020 14:14:19 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLoUK-0003px-SQ
 for linux-amlogic@lists.infradead.org; Fri, 25 Sep 2020 14:14:18 +0000
Received: by mail-ed1-x543.google.com with SMTP id i1so2671918edv.2
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Sep 2020 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=wM9M9SzefD5gqh6rUe+GGK3P8rbYWiC3a0TiUA4Suek=;
 b=jJuocI/bplwYAWFLuhGNb/1qgyrDnRkMLJAlZdkhGDJJsUt4ok2/cyUbysJMmCGDKA
 KXH9ftBquli+ARnXX4BDOeYilgqtVQ7ln8kOH1qXr48cU4hrWRFBhEuWYUrLzLgpp2PB
 gdPfZa3GoCJ0u2CVL/zGIo1yn3QawYh7274Sgw53RbqpDTyn45QUqUixesApHD9H7wY6
 BQaVd+GhKSE+N6ed7ZcaylKPV1wNGLOhJurEGTLlHszLFU1245uSjl0dJvrxnWiPPUXC
 sLzmP+bB360gkGoyR6jEcWZw2nlmWDuw+ZuNC1pfQxRBpzatPZkbcAmcIW5ixv9QfZmo
 wdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=wM9M9SzefD5gqh6rUe+GGK3P8rbYWiC3a0TiUA4Suek=;
 b=eQtc+JgvM8v+igqM7bdMYM2Z5uAT15elHV3ek8rgzGPcd0/ZeY083R/Hl0E5T9Z8uL
 2jS3W0Wr/rhiU2kk+EuoR4tRVGMuCq/reoASPpJfZnOv1z2j3ci8lc1fUHkNbmy9GCzD
 zbR/Dn3903A2PIn/F/Ut71/KDV6mbbJmubeH3OnaTMreQ7r1FDUdCc4qP4NoKjgTkiE6
 L9Noij2+0tmGHwhXDyjMpXSl55n03tsn08CYrelTUolKP+O3i2Bt2cfTBMzmSP4+b8LK
 922lo+sv1VoaHMW+cUn+xBx+3fcZMbAkDId5nhI35hAWACpUlGGsWH81pSfezc5wTpEo
 dXEQ==
X-Gm-Message-State: AOAM531KsbZd+EoTVCkX47wDpcsYhLewW9GQ+nEtHhR19ZATNHwKUVre
 xADk40XQOR7ombCXp4edyn7iUw==
X-Google-Smtp-Source: ABdhPJzwIPCGQ+75gzlRe/ufSmeKulNDnlPMmGvgzb28BYKfC4imiU3i9M+FUIyU2tCF/soD6aW5iQ==
X-Received: by 2002:a50:bb62:: with SMTP id y89mr1551879ede.261.1601043252055; 
 Fri, 25 Sep 2020 07:14:12 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id k6sm1934617ejr.104.2020.09.25.07.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 07:14:11 -0700 (PDT)
References: <24a844c3-c2e0-c735-ccb7-83736218b548@gmail.com>
 <7hk0wj9ki2.fsf@baylibre.com> <1jzh5e8bld.fsf@starbuckisacylon.baylibre.com>
 <20200925134445.rk366jip5ne4x7em@linutronix.de>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] mmc: host: meson-gx-mmc: fix possible deadlock condition
 for preempt_rt
In-reply-to: <20200925134445.rk366jip5ne4x7em@linutronix.de>
Date: Fri, 25 Sep 2020 16:14:09 +0200
Message-ID: <1jh7rmj64u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_101417_202917_C28085BA 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: linux-rt-users@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Brad Harper <bjharper@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 25 Sep 2020 at 15:44, Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> On 2020-09-25 11:11:42 [+0200], Jerome Brunet wrote:
>> I'm not sure about this.
>> As you have explained on IRC, I understand that IRQF_ONESHOT is causing
>> trouble with RT as the hard IRQ part of the thread will not be migrated
>> to a thread. That was certainly not the intent when putting this flag.
>
> That is my understanding as well.
>
>> This seems pretty unsafe to me. Maybe we could improve the driver so it
>> copes with this case gracefully. ATM, I don't think it would.
>
> Running the primary handler in hardirq context is bad, because it
> invokes meson_mmc_request_done() at the very end. And here:
> - mmc_complete_cmd() -> complete_all()
>   There is a lockdep_assert_RT_in_threaded_ctx() which should trigger.
>
> - led_trigger_event() -> led_trigger_event()
>   This should trigger a might_sleep() warning somewhere.
>
> So removing IRQF_ONESHOT is okay but it should additionally disable the
> IRQ source in meson_mmc_irq() and re-enable back in
> meson_mmc_irq_thread(). Otherwise the IRQ remains asserted and may fire
> multiple times before the thread has a chance to run.

Looks like we need to do manually what IRQF_ONESHOT was doing for us :(
This brings a few questions:

* The consideration you described is not mentioned near the description
  of IRQF_ONESHOT. Maybe it should so other drivers with same intent
  don't end up in the same pitfall ?

* Why doesn't RT move the IRQ with this flag ? Seems completly unrelated
  to RT (maybe it is the same documentation problem) 

* Can't we have flag doing the irq disable in the same way while still
  allowing to RT to do its magic ? seems better than open coding it in
  the driver ?

>
> Sebastian


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
