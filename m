Return-Path: <SRS0=sksW=BY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568DCC433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2020 02:40:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1859420716
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2020 02:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cPn8Gus6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com header.i=@endlessm-com.20150623.gappssmtp.com header.b="Sqf58RQs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1859420716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=endlessm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PuLUYg6yZJBsIeeU2D17DGHZ66H0rYoM5cYpHNY8D5A=; b=cPn8Gus6X/g5O62L18d57gcNn
	74gvFpMH1MQLL2H82ph2eBa1BYfiRO1IP9hCID7l56hz7gB3EfXEjo/KhhqB3Bthj8Hm33XHDOV1s
	dgSsMF/yLLQTYsgnBEhMJzHj3hS8FW8huUH/v1Nd6FKCfjTB9m5lAkzfkCbEEXGyaVtRY+4bKHAWv
	U3lxIixocHrUtYfT89lgCY+uAMbbtGHxi6O6WwS8xW1F2Bj9J34+IO1TmjtNOMci8Y0z3wJuww9vE
	+TSCMdSMxk8ohW+JPjWtevQ7Nq7a1ulya9xP9SgwQZ1Oty0SquMj8ivnqEpF0r5wpS01+cZvn7lJt
	dcCC4bjcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6PdH-00008f-Ay; Fri, 14 Aug 2020 02:39:51 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6PdF-00008F-QJ
 for linux-amlogic@lists.infradead.org; Fri, 14 Aug 2020 02:39:50 +0000
Received: by mail-qk1-x72f.google.com with SMTP id l64so7179406qkb.8
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Aug 2020 19:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZ6uCDucoCrjq7wssRj6w1SOixy0ta11TI9DijZgsRs=;
 b=Sqf58RQs2U15oSxveT3IOlsZlILIwejEP5vKxw969QWYQMAdGxASvrCIJo3KCzQ203
 j/xYsURdZ6oi6bti9wKH7xSmjIhmAk5enbz/lpAj27tE2dKkH/n44AxtkIuplhn1EQB8
 k0WTmYWdjloegGvBVK21fz2laQrUNgIrUtmbX8kZAFAcSlmYIGLeiA+bu9DHsq8/vCcy
 lBtrS4OZVYjH/AB17y3iYI+5+TV5K6ChpFguH+MJoxjouxquHg7SsUr3Z/ic0170OtOB
 R9yLNpndDTXwxQPesXncI4WOgquy+J9hfaWJ0LKYAntA4rS2da7gWkgSjOI+9qb7lIn7
 26ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZ6uCDucoCrjq7wssRj6w1SOixy0ta11TI9DijZgsRs=;
 b=EEo1lNK4811Es7fQAizKybUIoFPj8NP8cqK+X/DBb/Hddzg1yESoqB8EK+4MkMqJHU
 AFPqW3Z9jmvp7qq2etxRer/hynv68E4neFj30RE1mzdYl1o30CYGrjF6gsKDeNiyqKJP
 QAalXmqxsUET5YsUCnZQDDB8HRMvsX6fiQH7PDsB/sX+AwW/Stg7SJ8d/wmmTV5OLG44
 Y2qUq5hHR3wNeJQnrx1AbvVjH9TcTyps2hwBLf9a1l2JJihL5SyVfRufLuHigwjusVYS
 xB6GWHdGvJIDvS5qiwwugzF1kCXuA6XKon9Q+8ZB+jQt/M9c9jl5YgdgmeLg8nyvcdCE
 vBuw==
X-Gm-Message-State: AOAM533MScCTdJ/KqJw1pM9AICHSAK1pv2gX1xxKQ6eiotYeZ3ihQHOO
 4w+szNLZFZGkbaYe6JUq4efTAbwvhzp7Pq4w633z7h2YVHg=
X-Google-Smtp-Source: ABdhPJzl85unywbc8jxb0ylQThKZbmOPmzc2RxknhpxdTl5AoavqDoA9iQaSugzwvn9EM8arxNuzfBQqalWa+ZXrhp0=
X-Received: by 2002:a05:620a:133a:: with SMTP id
 p26mr231677qkj.458.1597372786141; 
 Thu, 13 Aug 2020 19:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPpJ_efVhfH-aq2NcDmK61vn7+mM_wy+nisuMg9AZhHEr=hu7A@mail.gmail.com>
In-Reply-To: <CAPpJ_efVhfH-aq2NcDmK61vn7+mM_wy+nisuMg9AZhHEr=hu7A@mail.gmail.com>
From: Daniel Drake <drake@endlessm.com>
Date: Fri, 14 Aug 2020 10:39:35 +0800
Message-ID: <CAD8Lp45+vqZzMmMn4xg6dyQ+TvyUVhOW6ZHE8KvVuc_AcM3oAA@mail.gmail.com>
Subject: Re: [QUESTION] drm/meson: Hardware cursor plane for Amlogic/meson
To: Jian-Hong Pan <jian-hong@endlessm.com>,
 Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_223949_951149_E31FEB64 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Wed, Aug 5, 2020 at 3:53 PM Jian-Hong Pan <jian-hong@endlessm.com> wrote:
> Meson drm does not support
> hardware cursors and current versions of X will disable pageflipping
> when using software cursor, which is a big performance hit. [2]
>
> We also learned there is the hardware cursor plane supported by
> Amlogic chips from the slide "Mainline Linux on AmLogic SoCs" [3]. Is
> it possible to have the hardware cursor available over the drm
> interface?
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/3143
> [2] https://gitlab.freedesktop.org/xorg/xserver/-/commit/0aaac8d783e78c040a70a55ba8d67809abd7e625
> [3] https://people.freedesktop.org/~narmstrong/lca2018-amlogic/#/section

Curious if you have any quick input here. If it's feasible to enable
the drm cursor plane on meson-drm then X would be able to perform a
lot better especially now that we have usable GPU drivers too.

Thanks
Daniel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
