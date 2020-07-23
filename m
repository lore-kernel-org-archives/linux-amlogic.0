Return-Path: <SRS0=T680=BC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3A8C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 10:49:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A4A207BB
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 10:49:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AJN0XGQQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3BPJj4a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A4A207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7GyHyw5zZV1yA+R/n6vqIFB6VbC0uuK4VZBRSlhaP0I=; b=AJN0XGQQLU/nt5S9Zh2OTp55At
	DtxAeA4HZpkRh/0mKn0+vsaEBui1gEwBTrfNXtNedEiiBGP495V77WRQodCwxyM8pgAwWTAP4XHB8
	s3Ny1SP4NkD5ntk9X8lktfdUfTpq808m1fFurGDE6ETWOjrnVJeC/2LfMThG7bbYFxxYNX4sjxOI8
	FnVcoYxvxozzncd4Db/vxT/i5uL31kTb96jVmC29H4jYt5+l+ipWojbgSpSA+2sa0VBO08mSLwlEu
	JaI0uhhY4NKjHxBJq7A/M9e5OJw+gAuLjV4uz/w5TcdskIrh+vhScHGbhTc2l4GUmKtubOsL1JzuX
	BQlBw4sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyYms-0003T5-MM; Thu, 23 Jul 2020 10:49:18 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyYmq-0003SW-N0; Thu, 23 Jul 2020 10:49:17 +0000
Received: by mail-il1-x134.google.com with SMTP id i18so3910026ilk.10;
 Thu, 23 Jul 2020 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=H2D76JwgkUfDIYTKdE7g2Cix8cag2pE241TEcm4cNmY=;
 b=M3BPJj4aB6cllAEoAm1eZJcSOrSnRsc7mCMBsa0qe/vNfKPp/gi9jHdUzlPiEKcX9S
 0OrlTdFEdmhiJ+rp5KMhYUCPUc4l6UVFG279AoYexZrwizj9RkJdq/xWC3TEx9Q7GcTO
 Q7+eQpa55Wean2x+zw6ZN3Z7IAIsO5jOx/sEMpaxyGegvtJuqIfe4CQvfOKL6BaDuQiI
 E76HfJILvD+xRKtbL0EiBhsoYSbKhlhECSnr42sakXZ5rYKR/x08SR+HDgpPT0Sp6qnL
 6dCoKLsOHA+ha5RMlPk+LRYA3Uew2G2Y/SlDyMNNwwWqe3ZQneHvE5Kl08DiORCZzYA1
 VtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=H2D76JwgkUfDIYTKdE7g2Cix8cag2pE241TEcm4cNmY=;
 b=eI60PGU+4R4yi+98L8Byr54it87FiJYcuRQp4lYGpi/g/s4mOLH2qW6ENXYZXZMUeS
 0AKZNdhlSUCGJ0eNH4D5oNPMwxj5NdSILRDmn92hU2u/5cbzs4rVstPuxtnHtGgaMKSB
 DJT2+k3ellagGCxJkBPCCpuGegwN7BSXjCxDmoOpaNm+N1q+I6gVxeE743ZEpyKJfEOz
 seyXxwN7OPgetXZcoNwxwLHrVIafoVBHlcIitAuFuKFLpPG76dnDZevaKGNAPwhRkTtg
 TQp7cGBvVCkn3HG/mDPQCFxkBs3aFkLBZNiZPBPp461gWWLuHb4basnBeoFLyWJdMcvu
 50QA==
X-Gm-Message-State: AOAM5337biFO1vmpUdd0+QAsfrbNmPK0bG2HKcGkHft8qAqq2jGe65Bw
 yDkBrFUkpENnW7/LU1QKjfLzUo8cfqBW6W4dIns=
X-Google-Smtp-Source: ABdhPJzLUmp0DjyX0hHLjPCx8WNK69Xkd1swpIQjKe0yh3jM297nS1tq/GJwnE6Y+vpo6w7ObdMZNsdsvSWZ32MsvNw=
X-Received: by 2002:a05:6e02:1070:: with SMTP id
 q16mr4064212ilj.221.1595501353030; 
 Thu, 23 Jul 2020 03:49:13 -0700 (PDT)
MIME-Version: 1.0
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 23 Jul 2020 16:19:00 +0530
Message-ID: <CANAwSgTMu_VSgZPtX1a3weJnp-qUve8Q1qYiTEB6Tkn2rL-+Rw@mail.gmail.com>
Subject: Reset controller on the Amlogic SoC board.
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_064916_789305_910515B1 
X-CRM114-Status: UNSURE (   5.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil / Martin / Jerome / Kevin.

I am a bit investigating the reset controller for the Amlogic SoC board.
Each of thes reset controllers have different reset IP features.
So we should map the reset controller to appropriate IP nodes
in the DTS to make this work.

Following are the reset controller reg ip blocks as per the Datasheet
Datasheet :- S805_Datasheet V0.8 20150126
Datasheet :- S905X_Datasheet V0.3 20170314publicversion-Wesion
On GXBB / GLX
RESET_REGISTER   ----> 0xc11004404
RESET1_REGISTER ----> 0xc11004408
RESET2_REGISTER ----> 0xc1100440c
RESET3_REGISTER ----> 0xc11004410
RESET4_REGISTER ----> 0xc11004414
RESET5_REGISTER ----> 0xc1100441c
RESET6_REGISTER ----> 0xc11004420

DataSheet - S922X_Public_Datasheet_V0.2-Hardkernel.pdf
G12B / S905X3
RESET0_REGISTER ---> 0xFFD01004
RESET1_REGISTER ---> 0xFFD01008
RESET2_REGISTER ---> 0xFFD0100C
RESET3_REGISTER ---> 0xFFD01010
RESET4_REGISTER ---> 0xFFD01014
RESET5_REGISTER ---> 0xFFD0101c
RESET7_REGISTER ---> 0xFFD01020

Each of the reset controllers have some different bit fields,
For that we need to have reset binding macros accordingly.

Please share your thoughts and If you have some inputs or
another approach please let me know.
I just want your feedback before preparing
and submitting some patches.

Sorry my English is a bit poor to express hope you
will understand what changes I am proposing.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
