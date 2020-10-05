Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EBBC4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 17:39:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 854DF207BC
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 17:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mWhMteLH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fqoWjzFJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 854DF207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v1aV5RwUy13dIqzdQoO6BY4fOWCK1kdlWvtn+PI6/Uo=; b=mWhMteLHxnMmxunp+unoz+Nm7
	lf5/oQZ7pgT1kIvZJUFXJ8faOcwbXxqb+gAE3pzK+ID9tvCygh8/BiVo8wvpG1K4hyEBCfx4IDK4T
	5I1/alI2K3n5HsYuz53zNiegt6jUVCpeBVtS80J/T2s43d+NqmRoaggJJJjY1NyxjVMV45gCYH0lr
	hXSpltLG420hPFqjpHWoSYkNudQXLCADCZFlEbeBjqP1anEYcqIPPuCPjSOT+jjAiV6lOxB0xPsh9
	dA5uXkKjs+/u5zVhiAtMMiKVh7wMjduqqRP+I5Od7RJRRaJOAM3bQx7wpDSTKKAZ5bnuOnrCjWCAm
	geErGvBew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPUSN-00006U-EA; Mon, 05 Oct 2020 17:39:27 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPURy-0008Gs-3g
 for linux-amlogic@lists.infradead.org; Mon, 05 Oct 2020 17:39:03 +0000
Received: by mail-pj1-x1042.google.com with SMTP id p21so205713pju.0
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Oct 2020 10:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=UTMXxxCy4l41QKGq1QwaYFDAa/g4IpXkny8TTXjyz4U=;
 b=fqoWjzFJJGRigcVlBBUJHEg+VjEPNYQaN1LTQbR+W19zia0cNQGz8G4cMz5Aw2Bu7g
 CCiDEBBDTzU2GR0IGSAxDqh4c10f4KxmEQGOmU2aIpt87won5r0WWs33jqojalwxIRyS
 UCJawJGBqzx5GqjSIzNFsnRLWerIgw4BTb87hQo5ePE/G2gX64KmtkCrJjr1lcHkOAuf
 rcvPW9yJjea5ELHmWcPDzt6LUDXuVuMxqyWwI4cbuUyPe/u3+RAxURq/RwHhtTYkmOMU
 kXMBUJxh9qpUDxZQU9XRBhZl2H7kZlsjTxfumzLO30b3Y4Exak+ZNG/1DCNUOAxMw6UG
 W4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=UTMXxxCy4l41QKGq1QwaYFDAa/g4IpXkny8TTXjyz4U=;
 b=irYvSta7z3k8ajwfmjG5TQN7XMhSWdymQzlcg47X7HwTyOGoXOlLH+n1Rik17TV8xC
 cEwaHG9j4aPp4+q1FpsIHuwIf2iMq7PLfB5kfbuTUyCzSuRGsJx6ClnG5ZMd1rWQxzts
 cfv1Vr/v0IDaTkN+PKNDIrr0jN313uw8U9VvdNoBfMvVs50elfVkUmcB1XBBzBbXBq9l
 65Uot/hS2PwTEaUkmI61Pnae4J4We+rNvA+o53nq2EA+HJTglOqRkPBNQZ9GUhNQ3jXn
 jyQZYWa5Z2PbFnoRYxGRZQ3AYl4eet94r0UIMMNIUcnIXSwrn3DD05vpPG+FK16UAhN2
 jmiA==
X-Gm-Message-State: AOAM532cpEPbtwpbrCyREeLOeLMVzuKFHQp5jMpE2l3EoBV3f8OptB1t
 7811ArEJzExZ03zbMmlX5l/0R3pycjU7M8Kd
X-Google-Smtp-Source: ABdhPJyfWaE9Sx8kj1Z1cGcM+FckvGyIdZkM6oPPU3nSbk8fUYziYQdHKLj3htizKgTTR45N5NccPQ==
X-Received: by 2002:a17:90a:62c4:: with SMTP id
 k4mr524548pjs.174.1601919537084; 
 Mon, 05 Oct 2020 10:38:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 78sm490113pfz.211.2020.10.05.10.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 10:38:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] arm64: dts: amlogic: updates for v5.10 (round 2)
In-Reply-To: <20201003192906.GB8203@lx2k>
References: <7ho8lkl9fw.fsf@baylibre.com> <20201003192906.GB8203@lx2k>
Date: Mon, 05 Oct 2020 10:38:55 -0700
Message-ID: <7ho8lgefo0.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_133902_319599_70314B6D 
X-CRM114-Status: GOOD (  13.41  )
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
List-Id: <soc.lore.kernel.org>
Cc: linux-amlogic@lists.infradead.org, soc@kernel.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Olof Johansson <olof@lixom.net> writes:

> Hi Kevin,
>
> On Fri, Oct 02, 2020 at 12:22:27PM -0700, Kevin Hilman wrote:
>> The following changes since commit 63fafc5a046b1e21756de691b48f0c70c25e1426:
>> 
>>   arm64: dts: meson: initial support for aml-s905x-cc v2 (2020-09-18 13:35:27 -0700)
>> 
>> are available in the Git repository at:
>> 
>>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2
>> 
>> for you to fetch changes up to c0c6f8e527a652d4785cb38ac82be0c95913349d:
>> 
>>   arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible (2020-10-02 11:32:17 -0700)
>> 
>> ----------------------------------------------------------------
>> arm64: dts: amlogic: updates for v5.10 (round 2)
>> - add/enable USB on AXG SoCs
>> - misc cleanups
>> 
>> ----------------------------------------------------------------
>> Martin Blumenstingl (1):
>>       arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible
>> 
>> Neil Armstrong (2):
>>       arm64: dts: meson-axg: add USB nodes
>>       arm64: dts: meson-axg-s400: enable USB OTG
>
> Scripts found a snag:
>
>   b3cf5ff01d47 ("arm64: dts: meson-axg-s400: enable USB OTG")
>   628c9c809f84 ("arm64: dts: meson-axg: add USB nodes")
>
> are missing a Signed-off-by from their committers.
>
> Looks like you added a Reviewed-by, but not a signed-off when you appled them.
> Mind respinning? Thanks!

Hmm, I've switche to b4 for this, so must be a b4 hiccup somewhere.

Sure, I'll respin.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
