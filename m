Return-Path: <SRS0=il4G=DB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09CFC4363D
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2020 16:51:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB4821D20
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2020 16:51:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YglEr40o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Z1k9nH4U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EB4821D20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HSTaJQDbhAUJ8BmyoJ6MxoPLB2Q1zjqX5ahqJtXxdXM=; b=YglEr40o05tmS3hMrJo8u8jus
	cUHS2Ht/EQBA7LEJxEJUvjq6fCYFfHoV3KoX1jUot0uz9B7lxPHxOXriBjn/QJSxG3R/KyrZ42hfg
	XX6DaEOoEJHnXjev+4iRc+iuQLM8Oerpi2jOMfcWfCUcC/uU+nIykKxtICSPeDRz7S2087mRteltQ
	BMsRPInFS0E0NiAliCRydTWCblcjsodOEcK1x/X865qsxWCRMBgLykRSNEg5oClC4ynhlL98OE7zu
	eJ9/1UQvSfhAsk5lOqMRfWdFOtX+8gnWzGFoq2udguhASBc9MNW9r8H25yf2z44UFMLifv/mqlgMR
	xwAUoPirg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLUSU-0006m2-Ri; Thu, 24 Sep 2020 16:51:02 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLUSS-0006lS-RL
 for linux-amlogic@lists.infradead.org; Thu, 24 Sep 2020 16:51:01 +0000
Received: by mail-pg1-x543.google.com with SMTP id d13so2233637pgl.6
 for <linux-amlogic@lists.infradead.org>; Thu, 24 Sep 2020 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=nVLEl40wEjrSHc0Fo3frFBWNyHJV0Pp0G2WwPeGBD7w=;
 b=Z1k9nH4UEFtPGCSYHH+RpAyfohXzX5eV74hMhkRA2uQTJO/Fq8KKcZiD3c0u8owRbW
 2flavPYLZJpwtTZPiA2rcNcgT3NxVOW33Vnv6DcOsL3fjqf7dch+5Fl905LUgmP6pm4V
 iYlQwW1iRJ7q+P84Bp1PtCwP7fp/y3PhOg7WuWUUpMhgFMcTp0H6ohFEZI1TkwTPm5Gt
 AJG768t/TCC3m2f6MHGUH4I5L7FRXcMMEz1cVHd+BW21/OiCtX9R4f0R7ZXzItal+6X2
 WsFi/ZZK06sEXdkSPfFjPCsTMnQk+i6Tpsi5eR70YQzKmgxmKT3IzRHJjb8otLI5OxLs
 lBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=nVLEl40wEjrSHc0Fo3frFBWNyHJV0Pp0G2WwPeGBD7w=;
 b=iQh5Wpl1ukYE4/MA5R5h503ysEczCnK82VxKPQoL/e5NdZOKtvAVXbUgnq9ltGyQqi
 2Y1STbQECwzQLV8WMZViXfxYatjIbHwYasmraLJt7ac4XhOUnHe470MXoYStT7/HUMKl
 /17PF5ZdIE2mhCWu2lBDzjnk4KZvqma+0s4S1/ZnoNpoq9w6S/5f1q1KdrHflsZsofrB
 w6dGT1xYd24+uCzqgvi5n+MNQJTwb7xKE/ecQnp27SxKREaPu/tMHchtY8XNdKEqWrjb
 ZgxgimTTY2b92BgiOC2nNiZ658HYJuwTxCBJCPo9Jw/wgLrZ9vW6l6QeviDZKg9d5qkw
 EUFg==
X-Gm-Message-State: AOAM530mT1Y2Y6lFFTdNNbtcr/oyXmPqruLGMKSlXY7CwAk9DPBIqOjR
 48vYBCLUinKov3R49t1EsVgXhg==
X-Google-Smtp-Source: ABdhPJz2r7wXPKnOm5/n1d+FqTKlu7pEKDZstm/xZsNC4APYItCZbjU2dEWrBfr6rm/C5Vw8LpRKpA==
X-Received: by 2002:aa7:96c7:0:b029:142:38cd:13de with SMTP id
 h7-20020aa796c70000b029014238cd13demr23352pfq.66.1600966256826; 
 Thu, 24 Sep 2020 09:50:56 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id e1sm34265pfl.162.2020.09.24.09.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 09:50:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
In-Reply-To: <20200923123916.1115962-1-jbrunet@baylibre.com>
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
Date: Thu, 24 Sep 2020 09:50:55 -0700
Message-ID: <7hr1qr9l00.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_125100_894561_B8B3C372 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Da Xue <da@libre.computer>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> If the txdone is done by polling, it is possible for msg_submit() to start
> the timer while txdone_hrtimer() callback is running. If the timer needs
> recheduling, it could already be enqueued by the time hrtimer_forward_now()
> is called, leading hrtimer to loudly complain.
>
> WARNING: CPU: 3 PID: 74 at kernel/time/hrtimer.c:932 hrtimer_forward+0xc4/0x110
> CPU: 3 PID: 74 Comm: kworker/u8:1 Not tainted 5.9.0-rc2-00236-gd3520067d01c-dirty #5
> Hardware name: Libre Computer AML-S805X-AC (DT)
> Workqueue: events_freezable_power_ thermal_zone_device_check
> pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=--)
> pc : hrtimer_forward+0xc4/0x110
> lr : txdone_hrtimer+0xf8/0x118
> [...]
>
> Canceling the timer before starting it ensure that the timer callback is
> not running when the timer is started, solving this race condition.
>
> Fixes: 0cc67945ea59 ("mailbox: switch to hrtimer for tx_complete polling")
> Reported-by: Da Xue <da@libre.computer>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
