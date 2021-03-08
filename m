Return-Path: <SRS0=LTpV=IG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541FFC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 17:43:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E27806528D
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 17:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E27806528D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WtWBuSWpwOzzJ8ksUBUuotST80tevieadGCS0eyasHc=; b=XdHmbPt2jVis5jDJW/D8SwLIF
	hdGemgo4yk4zjdFfsNkRtsv+0aEv0VB0AAjWeIhlFWeemO3B3mIr3rAjF1C7JgV0OwZBzQMsAFDEb
	GjHTJk0l2UchUYHwTqt8VV3mm3DGKgzpLU0IlvFW/HeWWK/8YUi7EGPi+hHk67KNRX5EJRZnSJYme
	XHmUqa4J/kDVwAdPBKdKvVHgq8GI7AFtexcZUFbPW9ZTi4ci5d2UffdsNSxuM25xai880pftK0jUQ
	6tkiFZh22wUmrUxCe0bhN+kYa3E2ji9GnT7cSHqwr/mp8WPJ9vgBwBPtEfgx+VgdgJoZirw6UqNKI
	PzhdH03EQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJJv4-001Upn-NL; Mon, 08 Mar 2021 17:43:50 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJJus-001UlM-CI
 for linux-amlogic@lists.infradead.org; Mon, 08 Mar 2021 17:43:40 +0000
Received: by mail-pg1-x530.google.com with SMTP id w34so5798483pga.8
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Mar 2021 09:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=uwWUWLoMsALxcHxQsbHJKpnMdlF22xA3TzeHsMYUXPQ=;
 b=kCNWT0lXqOkM4RmLLhPl+m10hb8F4CTfgIHCjkBN7f4qzsJj4UM/mUv/ubbV6nDFdq
 29M+SVrALg9Le3ixTZySh1ZrGBUlOCRYz1P+Uy1YJEms06tMjsbanautiiH2sRv4C5wT
 COCQpuyhUEnr/b+Qh0sT9oRhd0rIMYGmzgwljZR01ALVmFoJG8xTtBWqO2Tsylwa5/Za
 uuKP/rtHaqIx6CPjz98lYY2NbG5D9PaKuQN7W3lFAuVk2YUBaSekeG8T5ZjNShVPzHJc
 apZim89uS8F7ze+5DeNUvEj+UZCQRl9OWBbmLw6foIxcnXkhykazV1Px5fSInKpVkIMk
 pgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=uwWUWLoMsALxcHxQsbHJKpnMdlF22xA3TzeHsMYUXPQ=;
 b=PYgKmzWLbAUh7GZJtFnYE/+HkHSckN6XY5nVmhmE/O+bkTXSOlR18XGrJ/QG1gX0SG
 /fJ1ehlvGmjSWxeVDYu11RP/i/u2GN73osYL3w6TTkAIkSflwt0+EYorrpJ/6oc3tn+J
 6H/uq63AP/Gvi3rLmOT6kPKVlJz0BE1p33MklP8VujaCm/KbL4JpuESBNVLrrL2ruTe+
 aH6GjKQpu6moljmRVNB5nuJbU/g2LEBlUE135Rk6LzGz+0wwGJ/6YTbzgQ1K5l6WBlbP
 bLt3v0sjtsF8+L92zN3D4om2hIlEJ3xdxJh6FZVaNtX0kI2iCRsRX8XQPlvLshylAPqk
 nJmw==
X-Gm-Message-State: AOAM532a1UAlEAN80QiHrJhh8VDqHbcVL7w9DEndaq0vTo1kJsYtWz7/
 tHQubTQtuH0S3Ls4HyMBfNkuvw==
X-Google-Smtp-Source: ABdhPJzhf+mB9PVB+1XesHxjolF45VmgaClOL9Eyd/EXSG6MWSeKXpBNT17taop2vTwR/Jd+OT5lBg==
X-Received: by 2002:a63:5044:: with SMTP id q4mr21095579pgl.178.1615225416788; 
 Mon, 08 Mar 2021 09:43:36 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 184sm11855802pfc.176.2021.03.08.09.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:43:36 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/1] arm64: dts: amlogic: Assign a fixed index to mmc
 devices
In-Reply-To: <2921197.CJbAp5Dgou@natsu>
References: <20210127230852.66686-1-alexander.stein@mailbox.org>
 <20210203192824.854491-1-alexander.stein@mailbox.org>
 <2921197.CJbAp5Dgou@natsu>
Date: Mon, 08 Mar 2021 09:43:35 -0800
Message-ID: <7him6135iw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_174338_625023_7FA17908 
X-CRM114-Status: GOOD (  12.11  )
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

Alexander Stein <alexander.stein@mailbox.org> writes:

> Am Mittwoch, 3. Februar 2021, 20:28:24 CET schrieb Alexander Stein:
>> Recently introduced async probe on mmc devices can shuffle block IDs.
>> Pin them to fixed values to ease booting in environments where UUIDs
>> are not practical. Use newly introduced aliases for mmcblk devices from [1].
>> [1]
>> https://patchwork.kernel.org/patch/11747669/
>> 
>> Commit message taken from commit 0011c6d18277 ("arm64: dts: rockchip: Assign
>> a fixed index to mmc devices on rk3399 boards.")
>> 
>> The unconventional order (B, C, A) is due to the fact that sd_emmc_a is
>> (according to the comments) only used for SDIO.
>> 
>> AFAICS all boards either have both sd_emmc_b and sd_emmc_c or only one of
>> them enabled. So the alias order should match the previous non-async order
>> for all of them.
>> 
>> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
>
> Any feedback on this?

Sorry for the delay.

I somehow missed this v3 at the end of the v5.12 cycle, but I've queued
it up for v5.13 now so it should get broader testing in linux-next now.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
