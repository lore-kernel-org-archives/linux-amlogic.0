Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19144C4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:46:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F3FB2225F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tIc3+JI/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gIhnws7a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F3FB2225F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8COklKvk03bgmG9RM4JLi3oT2aGxcIxYCzPCAgpKfbM=; b=tIc3+JI/NOugRuelxQQcVvS4t
	PKkZpNAQTpthBgSYRHaZawoR1A/US7VjL83tq3pCGb/zIFFdMgxxHhWk3ApZnM9G+05Rjh1i8UHNf
	zM7x0MgfBFFJ8bItECIzUXsBVSdgPk9qdMsFr9vhvRGyYTCGpIdNww+5qXwRu0p10754pwiVswejI
	dy6ci3hpMqfLYLBjzOUVN6YPGb6iabLgNQ1EpShIYXo4VGu4iM3q9jxzR6JrhJKBA8c79wMX4U28K
	GZ9clIbY4F82uqrZj8cYW4r7gIo6bR/cRTTDDm7bTBvp8PFffqTsgrtrIJMYp5B1IB1dAgwnhD/cO
	vDXLp8x7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUxag-0003Fh-Ul; Tue, 20 Oct 2020 19:46:38 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUxad-0003ET-Mu
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 19:46:36 +0000
Received: by mail-ej1-x643.google.com with SMTP id o26so510646ejc.8
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xQdN4e8sb8e85GEPtGpigBDe2ADdz+RJ3oBJUBCMZjg=;
 b=gIhnws7aM+fhvCkD1Dt/BHUVIFG6DroGv/rxfklooMW5vCWf482Gu4p8ckgMuW8WcL
 eLD+e+KpW5LIimgMB656uVSMROGYZno9RdNzIH4at6TFo+cSt7PkpaNY7LqUNCgj5zMQ
 B/1Pgcy0N2mTbMCBGqfmFyLoBZuRyFi7ralUj1ZeIWdFvvFq9KyoBDRL72gpxtl9HvtQ
 sae1IKwYGdNOWPpRVrhwirqxPHFpkTfc3NCs1qVvKQmCe0UklDV25OL7/F1IlXw3XrQw
 vN0yCy88mDOmbWf0wiXa3QiJh9DkjZSljx6wv5HuofImAbTiNhqRmT48yFQ1+d+uAESJ
 GALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xQdN4e8sb8e85GEPtGpigBDe2ADdz+RJ3oBJUBCMZjg=;
 b=QZ8EhMDpjVkJyH6l4QAU4b/YlqSWI3vAaJ7Jufp+TM+zxE+VoAet1pHal2Fg+T8JX5
 0rKM5IZGjQBJIG7z+4PbFtM6lvkGt2NWEh/Lkho3SMqhV8OafMfk1vP9k7e7M/iPCAAN
 VK9htSuMdMHUwRPnDeaZnGl2DidUtClz7Ep8W1p+ixAffBMJsBtry3Hbc8GRTAJplQJP
 dqKQrIINLGUXJ9xyngu9DstH8NJCN8WmSHaZMPgszm7pjaZKHoD7PpF5VOfsEgPJmreL
 tPH9f4SDaX0IJmOqVwwYq5YLXRxpz43zu61u84q7UIicDue84ioORS6qNtGZTmNJXKYo
 Cyog==
X-Gm-Message-State: AOAM532Yobhz7pta1QmXPVDk/uPp/yLjL3tJBdktQTmezjLvEdQWEFRd
 5hT8SvCZBHAVWxcMOCS2hv9symgh/FNpFMWjF9E=
X-Google-Smtp-Source: ABdhPJx2MHroFdlTmNDtbUWu1ZhlQB87fZC12HOSohcHqgvy9QoA5Wfe/eetl1ZUEH7sy6RelMfaj7TmigG+twnT48s=
X-Received: by 2002:a17:906:1a10:: with SMTP id
 i16mr4812341ejf.162.1603223194667; 
 Tue, 20 Oct 2020 12:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201020120141.298240-1-jbrunet@baylibre.com>
In-Reply-To: <20201020120141.298240-1-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Oct 2020 21:46:23 +0200
Message-ID: <CAFBinCBCxROWP2a1QG8Vuqr4x6U7ZkDb+Kdifv-M+06QN49GNg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: add missing ethernet reset ID
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_154636_084770_FDD5AF09 
X-CRM114-Status: GOOD (  10.06  )
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
Cc: Anand Moon <linux.amoon@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Oct 20, 2020 at 2:10 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> From: Anand Moon <linux.amoon@gmail.com>
>
> Add reset external reset of the ethernet mac controller
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

note to self:
we're using the Ethernet reset on Meson8b and Meson8m2 for a long time
and I don't remember any problems with it *knocks on wood*

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
