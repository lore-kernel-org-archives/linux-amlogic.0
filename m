Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50589C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 11:43:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1038621D79
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 11:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1038621D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=353o+FOjNJu3ATcj4l6wZDo1nqUsjCHutdTvn2Ps1R0=; b=HmBwKxbvGqSJ6i14Jfc94/W8m
	Ty7eeQQ8u+eCZh7/uvX/b80+y5WED1NTpIAwUE5SDxZto936RrCjZy25hk4j21KeANKesR8W+fCVI
	utpOjWLKHrYn0GbWgOvfJzNegBEy33iGCGQBlC4kOf8COhljpXjkBkSOJUvMMM+KPB4HSXCLtsjnH
	8X8Q42qglFORTm5eFx7jvAK1fuuKMd8tXVgJVWW9HaVRK2jmJohorFUC1VmECxI7NQx+zPubEpGhl
	fgOwMmqde+1+wM4VZGEW4HVpxpt6t6WQ9BXGIcG6d1/p6xOPubnlbN0rtQBPqsYdr6LX4wmUgVJPv
	9vPI0Iegg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwOH6-0004gX-WF; Mon, 04 Jan 2021 11:43:49 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwOH4-0004dz-5n
 for linux-amlogic@lists.infradead.org; Mon, 04 Jan 2021 11:43:47 +0000
Received: by mail-ej1-x62d.google.com with SMTP id d17so36325400ejy.9
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Jan 2021 03:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=s9b3G+1wnt0fqvQLZfc718wWCxYrFOqLj99ZBc9EiHo=;
 b=N4K5zTpfvEf9GyU5JoMNLIDIR+zWfC22FxvyvteNXgVR4rh56MRqOLVSZtaMupaRQP
 gIo3JpiGBYilVXPLMr/DWadV17ubcrqiOsqdkylrBeGCBRjrx2p2l+rOTSfRctypDTyQ
 PSlGBmczgSBzk6oJ5c2BiMtozqaDqZUfUceiY0Gj48bEpdLY7MmiG1h20fRD7Tv7Y+8o
 4jcb1kk53TO7c75op2kUmtSLN+wWfZPQRet16PevqVfSKjTMHPS189f0QAiPxRO3tA0N
 kRyqQB4tYaGQSjRmWpEAV/8RLIbA5TSBiFW/Ikae3HP5KC8dAZsEvktm+ZXLuznoNTi2
 av9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=s9b3G+1wnt0fqvQLZfc718wWCxYrFOqLj99ZBc9EiHo=;
 b=AekF1oKMs/ZYoupPBhdxACVuFXqTj1SDo+cjOK70X7nQEG8aOptw3e0SOil9EOZ/+X
 XcixaQdZ66Q5GlFghZto9vaLYOQJrMTLyOw07nM5j47Trw9jx5d3ftZv2La1wHtbjIAu
 F59+88ICPoWTb9g+M47wFaD5tiRNR971hfIhCfEcHU6opp47d5trTu8oqid5nZSvMvkx
 M+CMAVJgUjnqzWxFlGK60RoIXpPz0rFkca0+GvTgCZwkUdPAylJ6nkgm5mZe88GVg96/
 3x9uACLtQ6JRIA3UAI2p6+/2NafWeRVoZ+egwDm83b/xj/Ay0vbL8VsNHXMFSxOJpbH9
 kVJQ==
X-Gm-Message-State: AOAM532i2JD2q0pghpPw8gT8Bnzo5xbtSu0eg5vvMVRPfmPXzgIqRg8e
 3I7jNmAEeMV+MJXgZ79H+EdNajOtTDCwYA==
X-Google-Smtp-Source: ABdhPJwGvjTksyTEsh8ZsoIujwHjf6GyWgK9chy76WycbY1TeT6KTvHXkYeyko77ghZGFlgSLXZg9w==
X-Received: by 2002:a17:906:b793:: with SMTP id
 dt19mr65969463ejb.120.1609760624753; 
 Mon, 04 Jan 2021 03:43:44 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id e10sm23445564ejl.70.2021.01.04.03.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 03:43:44 -0800 (PST)
References: <20201221183624.932649-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/2] clk: meson8b: cleanup unused code
In-reply-to: <20201221183624.932649-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jwnwtvseo.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 04 Jan 2021 12:43:43 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_064346_305491_CB59038B 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 21 Dec 2020 at 19:36, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> these patches are two small cleanups for code we don't need anymore.
> The first patch removes support for old .dtbs. I am not sure if the
> "fallback" logic still works as I have not tried this in a long time.
>
>
> Martin Blumenstingl (2):
>   clk: meson: meson8b: remove compatibility code for old .dtbs
>   dt-bindings: clock: meson8b: remove non-existing clock macros
>
>  drivers/clk/meson/meson8b.c              | 45 +++---------------------
>  include/dt-bindings/clock/meson8b-clkc.h |  2 --
>  2 files changed, 5 insertions(+), 42 deletions(-)

Applied, Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
