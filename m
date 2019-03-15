Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A003C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 20:45:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1600218A1
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 20:45:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aPM6tEnN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KqpADW95"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1600218A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrxUMniqgAW0w6eFgKo6B/tRujTNnD7ekpI62lFYhGs=; b=aPM6tEnNKDavJk
	nn711t0lvCWBpsxF8XF7bTwTU9rlwBUyKXg+BVSlPorxzftIe7S0LH82VuCtXGP0BmiBdTWZCS1+n
	oOv1lim0lAapNl3POdKWFrEnwgVAr/a8i7lLlPfJRn6OEgrP8Xjv7+3eVhJK5mk/W7Uz+mRU8hT3l
	Ff6Cc4s5jMD8lOJt4JaWnU8277yi8PAhPo4ZQyiAcno7G2lWDy0dTbF+iSMAbo+st/o8zkAqeUzie
	75BwioQHfe5Ro0PEa5IhytEXGwPvPn9IwzSyF2stOdC2eik4PPI5+Qnh838F2WN93PDyO+biCnNlJ
	DlqLjH9vs1AnM04v3g8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4ti4-0003cl-CJ; Fri, 15 Mar 2019 20:45:44 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4ti1-0003bI-JT
 for linux-amlogic@lists.infradead.org; Fri, 15 Mar 2019 20:45:42 +0000
Received: by mail-pf1-x443.google.com with SMTP id v64so7138929pfb.1
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2019 13:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=INmq8MbRt/UXoxqFi0o2O4Jb/P0MxYcsAHf+jqSjeuw=;
 b=KqpADW959wxweuXQaNPwEG7NB8DAOpHTugic6BlOW7hVGn/kk3oXiNRnGRXmE2VbrK
 CANNGuSHfjDy8YOtLNHilLW9cpBvlkXun/I5ji5EvutqtORo2gmxOizyU+Ik81FRzCaW
 UHhCFfVHCY63hAI9elb8Mn0pO0IDo6knFb0qq1+E+dKtnVCYTUp/M4n2Iv58yn/7gPoN
 xJITe386f/JW3inCKjWov9d03YHbZyUlYnflcDv2chxOD+akzdsimP8GOgNLB4Fd1btR
 GoZwRoDGW/K38RPRCGoBbTsG/lOWpr9h/Rdu9vhLbPveULADaOU9psCZ6MVYcuHP6ohZ
 oK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=INmq8MbRt/UXoxqFi0o2O4Jb/P0MxYcsAHf+jqSjeuw=;
 b=rf0Vc+F0K8cHsR6GRqxUxRONkqt8D9ncXZUEBB11Kddzw93K5mGsY1B/9dSRwFRXB5
 z38w1AXaKtLgoTWwj2/y2B1O8BTcPype9JY+S2T9qp6AwpGj/ry7gsXZIb3RGP0sxF0x
 BNDLuKzv+65nDWhTqjaGj1Qt/YGliL9ttKiAyT5vO7tDjwNG/woKGnxwn8594C0sXYky
 siO6t6z2NoZfG2PSafRSv0RGEvcoQLtJo2qaVQtR3x1CtBjp4agdA4YOnX9ZONiHob1u
 nVjb+4zFITv9aHR8RPzuImSctbEzFj2tVxbPbBPQs+RXimNSpc7gdMut1AMS+iqLeqch
 vQvg==
X-Gm-Message-State: APjAAAUdBarWn5ey3bKkVvRpcOTsFvEC2vhbMuUwOT5fDWDxS3buKXVS
 P0VTRWI+yLWwDKXWXLulJpFOKg==
X-Google-Smtp-Source: APXvYqxbM7ZNYq0Llh/Da5etx9sUL9osubd8FOI8k7hLkoLxuRuaI3Udfs4WjIB2pUzEiW1tcPtQkQ==
X-Received: by 2002:a62:5687:: with SMTP id h7mr6005464pfj.198.1552682739662; 
 Fri, 15 Mar 2019 13:45:39 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:a567:ae30:4f79:6ce5])
 by smtp.googlemail.com with ESMTPSA id d86sm9975887pfm.18.2019.03.15.13.45.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Mar 2019 13:45:38 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: g12a: add secure monitor and efuse
In-Reply-To: <20190315134244.14141-1-jbrunet@baylibre.com>
References: <20190315134244.14141-1-jbrunet@baylibre.com>
Date: Fri, 15 Mar 2019 13:45:37 -0700
Message-ID: <7h5zsjc1e6.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_134541_690763_99C7A5AA 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds the secure monitor and efuse to the g12a SoC family.
> These are sent together because the secure monitor is required for the
> efuse driver to work properly. This is probably something the bindings
> should show but it was not designed that way when the secure monitor was
> introduced ... something to look at someday.

Queued for v5.2 (branch: v5.2/dt64)

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
