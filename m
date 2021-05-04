Return-Path: <SRS0=bYYt=J7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35BFC433ED
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 00:06:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5BC861183
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 00:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5BC861183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u/5TyZYfHoZrGN2Th/A7s6kA7N99k01YG/+6mUrdt+M=; b=mBYKCJLM7DZuUhce3nXRLquWg
	BCHfYgYM9nSs0YVrV6EdsqkJoVFU4zEkNZKQOxLxhQPh0qbpRD3KY6iJTaCex0nI9RoqCDNkRGgW+
	WTICdSISscJqWVrXfLSiiKJIEEuz3wt2BejmiADQsLXpqQuvJgOM9qMUjXb4FZ/6aCInkjkmGerjj
	IIDnf2UIlPHOGgkgBgJDagOfBZX583nrqn50bONiyqhQGzKDrId8bkpnZRSJH6aRUgSVMbnoCh1bj
	1LnxEqY7pRjZ5Mdj/XbVNiYjh2M/x8qwdnfJl+/6NvUq4oh61KkorEDTHutGlxjxZHUSnx6Fqu8+1
	+M7HMpapA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldiZt-00F5SP-G2; Tue, 04 May 2021 00:06:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldiZd-00F5QR-VO
 for linux-amlogic@desiato.infradead.org; Tue, 04 May 2021 00:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=kDzDiZKgkuBIzy2dA89gX09XTeJ0XvlvWikD1ZLB35M=; b=u5CHk8nPTGW04lbqRx4AxiF88z
 YKTmIx7Av/xUyPYotXBUs1iT8b2FTVZMIjGtRbugNRPl5xLg9SkUYonFxvGui40rqIy5ki+HHXJQf
 P2jBcvctM0Ko36dcqSRtDOjV4Ai1h6GAmjdRRS6FdDY8aWbGcVWjqoNi0eQtUbN48h3uaLTI5gt47
 N+rUnHhj7YBCuAZASUsKRSK3PoKBKDtWTh1QcywAjZ72Fm6yfILK7wAP0YJb4GQ3vYmeaBVDC2kJV
 fH9VseFG7zPJwfzCpKsE0nkNw81lmfeCwFcpjXbPjD/5WqiacEOxRJPtaTtE1a81rRFSKMM1atiPD
 5Hf7PUzQ==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldiZa-003ZE0-Tj
 for linux-amlogic@lists.infradead.org; Tue, 04 May 2021 00:06:00 +0000
Received: by mail-pl1-x62c.google.com with SMTP id a11so3821601plh.3
 for <linux-amlogic@lists.infradead.org>; Mon, 03 May 2021 17:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kDzDiZKgkuBIzy2dA89gX09XTeJ0XvlvWikD1ZLB35M=;
 b=BYhlbG9htRgrcm+j6xb+5irs8Y2dtX5BPN5vT5dthFFmdc2wdcqYLSvoBiQPgxhkdY
 HoVp94XBkH6mPX4rCVCDF+zBm45SWZtY8IWGXZNTNrmLvCavxTjNeQzFv8T8TmB9wVA2
 7888+TcYr5UOpB+lvNwW85F0nGc6AYEEZu+ujGZM+YpgLVZBKY1PU0BtwXu1l5bUCYB0
 8OCyyxQfF7OLxOe1pCS9xGID8DbETrBqZofbsGwN2eKv3Nla4gx6WzK7/j5lMFwGete8
 wf2zgsy3Td3kI5HUP+SDTfiY778dus1rTEXM4kkj8qnIr+hrf/cxm5gaBwBiXvasAy/t
 UgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kDzDiZKgkuBIzy2dA89gX09XTeJ0XvlvWikD1ZLB35M=;
 b=B32yA18NKEpVg6pi6ti+17FG+B7AGQs4vJZJB0YXz0SHVDg+8na6IeJvvzmIzAM74w
 FrBF5oX+mHuqyX4Uc6qyamRyVuOqgL11ElNCUnXkxsBn3lH0LIJeNbP8lNQKn/xT299V
 Vf8Wct9Giu11o6fTiHTSj5QY+oYeJe4sZSv1x/e7ZZ0I8MHeZ/nzcRrq89HqcA4ZSkbr
 4/fVyaZx/+tN27tgEqgQ9fN20qVpJz/LpMWcKEuqsGhGxzf+Mmt4kNKVMGfBSZdUWeMW
 FS8hRp2cnNZ01YJng2RO2S5fIp7T2sF30MciaNFthT6NCFdpqSEtrimUxcqX4XCBHBXu
 8PiQ==
X-Gm-Message-State: AOAM531LY8QvUrMn+/IHybiy6OFLpMvASSwCH6iaKBn6MlNpJV9JZXUG
 FVDzg82BBI4ykmgw2wlsStxjXw==
X-Google-Smtp-Source: ABdhPJz5KY4WXvst87q3waruwTbClvq21tHkxMG77SNnVmypEkEmefQ2ACx56GjiUXnBm9I1L+fwcg==
X-Received: by 2002:a17:902:b68c:b029:e6:bb9f:7577 with SMTP id
 c12-20020a170902b68cb02900e6bb9f7577mr23126893pls.0.1620086756012; 
 Mon, 03 May 2021 17:05:56 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id gm17sm10499510pjb.11.2021.05.03.17.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 17:05:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: vim3: enable hdmi audio loopback
Date: Mon,  3 May 2021 17:05:52 -0700
Message-Id: <162008674673.40672.13568672227710431914.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429084253.59692-1-jbrunet@baylibre.com>
References: <20210429084253.59692-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_170558_994064_0F242C97 
X-CRM114-Status: GOOD (  12.13  )
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

On Thu, 29 Apr 2021 10:42:53 +0200, Jerome Brunet wrote:
> Enable audio capture frontends and a tdm decoder.
> This makes it possible to loopback the audio played on the hdmi codec,
> which is the only output interface at the moment.
> 
> Of course, one TODDR device would be enough to do that but since
> the 3 FRDDRs are enabled on the playback side, let's do the same on the
> capture side.

Applied, thanks!

[1/1] arm64: dts: meson: vim3: enable hdmi audio loopback
      commit: ed678d85ab2ebb75d23b68c1b4af4dd068f14edd

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
