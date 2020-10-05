Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1401C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 17:45:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 165C2207BC
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 17:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zq2ATKr8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mtOZvAeM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 165C2207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GVpgJoGoWMR34mcw3FS7WUOiuNSikAN8Y16iDdx0RmA=; b=zq2ATKr8z58aOwVeiPT+s3CIy
	jjMH6lrXVBJ5OomQKVN2hatZeMnBVVPh18YwpOKGcvf9LwDT4wg0aAEZ7hSP1XpWZBMbCPoZgwBR/
	Jbv3Vmg9mWiCKOqdLTxeulHwJqKKA+I9kU3NKJDs950StbBqyEDI793nj9zYtzw7Mv56Cda+5E4Hh
	eTP2qwnh8PqvKzpSo1TBj/OkCN8OHZC8naoXT7HGlOZHeVpoHo4x552hL7VBJpW8sd1c55NHfzKeU
	dXKbCol2AbcIoSmgLoUxJtaBhxS/F7dLEKheSYHeD2jVtpzDlSt0SuUlBwbU0TjXB2eAYHWKFJgPe
	FgDotXXBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPUXg-00035J-MA; Mon, 05 Oct 2020 17:44:56 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPUXK-0002rR-NV
 for linux-amlogic@lists.infradead.org; Mon, 05 Oct 2020 17:44:42 +0000
Received: by mail-pj1-x1041.google.com with SMTP id i3so219183pjz.4
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Oct 2020 10:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=wwl1KqqfD8lJl+FQvgmE3OZJPcCmhISXxxuDwE5gCQ0=;
 b=mtOZvAeM2KPfdQe7wg1PYSUhiogWZ5X9PN5h70CHTwu1Z+MFGTDy3yZrenGMdSf33P
 vJdAkbkuGw4+iQmJ97WODFmy6DOYYuBxJ+jgH1m4NKdnrzR4lZQ8m19/hzglBzewLf3/
 jgao6L8oN8EXn5+Eya9AWmp7UIpNGWttMplGhsu1EOauKav1xFwPN9nBZvPyhzU7zRMg
 4Y8QnJdFvhGxiM+FJvzGA+Z2Xb+fD51zzWrKu+KY2aeX+YElxBFGpaWxFQNiTFAt6g2p
 eGx9vX/b38qwMh9t4T8V/6Qfqj9kQ4Qsz6hxIJbRwt+zDQeR0rU3APsleGhaRTJQahOj
 YxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=wwl1KqqfD8lJl+FQvgmE3OZJPcCmhISXxxuDwE5gCQ0=;
 b=JAQzMqAA7YlVbooX5rI2flKRx57JsjICaw2ousr7JYMFvhbFIcFSRx6xO+eYFRQMpg
 UShVKnD3673ok/9Dj/F9J2clV0fAV8X9Ka8J31NIGdjS1G99lRUQCzit/OcIAwf4fLSX
 /GGaoOkS5A3RdrDT2y5UVEuDzGhGC/E/UGUal77NEEfNKmbssp6SLazNRCfIGXKGGNP5
 p6xImyRtuZLl+29i78RSparEW1huKa6IXiG+3VaAom8xdqqaU7hk8Ryj3y8qzhzVZdku
 GhJEJgCK2i0B3rGANFAu9vbM0rwK+BQTdN+1mxaNRKGZRBkZrmAiV2Iesf9H8vepFInC
 Y6kw==
X-Gm-Message-State: AOAM530M7rS/+EiTkjjRp9T1+0+nuT80JjUisrxzaysGtiLPBvIOFP0q
 Ft0vvkkrYsBmTj73HFhvZ+1YDCq2JLRNmzkQ
X-Google-Smtp-Source: ABdhPJyYMkRwpZDZl7xGRc0E8cS2FLcLGQ982hgS3GiS+CX062sE4EWarcR/dM1BjNbHP9I15DfVgg==
X-Received: by 2002:a17:90a:8c83:: with SMTP id
 b3mr544071pjo.206.1601919871791; 
 Mon, 05 Oct 2020 10:44:31 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id f17sm545488pfq.141.2020.10.05.10.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 10:44:31 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] arm64: dts: amlogic: updates for v5.10 (round 2)
In-Reply-To: <20201003192906.GB8203@lx2k>
References: <7ho8lkl9fw.fsf@baylibre.com> <20201003192906.GB8203@lx2k>
Date: Mon, 05 Oct 2020 10:44:30 -0700
Message-ID: <7hk0w4efep.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_134434_822355_31845195 
X-CRM114-Status: GOOD (  10.47  )
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

> Looks like you added a Reviewed-by, but not a signed-off when you appled them.
> Mind respinning? Thanks!

Here you go....

The following changes since commit 63fafc5a046b1e21756de691b48f0c70c25e1426:

  arm64: dts: meson: initial support for aml-s905x-cc v2 (2020-09-18 13:35:27 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2.1

for you to fetch changes up to 1fdc97ae450ede2b4911d6737a57e6fca63b5f4a:

  arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible (2020-10-05 10:40:34 -0700)

----------------------------------------------------------------
arm64: dts: amlogic: updates for v5.10 (round 2)
- add/enable USB on AXG SoCs
- misc cleanups

----------------------------------------------------------------
Martin Blumenstingl (1):
      arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible

Neil Armstrong (2):
      arm64: dts: meson-axg: add USB nodes
      arm64: dts: meson-axg-s400: enable USB OTG

Scott K Logan (1):
      arm64: dts: meson: add missing g12 rng clock

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts    |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi |  4 +++-
 3 files changed, 59 insertions(+), 1 deletion(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
