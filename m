Return-Path: <SRS0=UvWR=2F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9BAC43603
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 21:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E970224676
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 21:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a2JIWr3l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZCtFipn4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E970224676
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jgOdHHTKWYfeyXxIN64ixxPJpK6KJeZtxmu4BGVf6xw=; b=a2JIWr3lFOB7Pe
	TwgdCiqzIjfacfz6pq8w0fDGJTnM0xLvazttvCdXll0xDAI1z7FUEENpTztTSSq2YSZ8pSrzNVaXx
	IavczdyzVvQN8b0TgL/nr4wzdZsRrBrQCxeYczR0ou+7W5nVha/mTnIdQ2qJvh/nP7PG99tiQcLSt
	xINQk9vxezzq9AMbJf9fNrfRAAuzdkNB0mVP1rX0ZJYcs2/Kp4Ny2W7MSsmGl5I2zDoCIZtFv2FEp
	bVrhYem1SUX/QPjMnyy/IZDLIHmAlNUaoj7f4OzD2mLgEd3U9uAnpsZmR04PL94tk1be3CNxmwfxJ
	/Mhv6FlvgkYFwN/Jo7rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igbBv-0003RR-1l; Sun, 15 Dec 2019 21:12:39 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igbBs-0003Qo-JU; Sun, 15 Dec 2019 21:12:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id b72so2499006wme.4;
 Sun, 15 Dec 2019 13:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3g/A/VhKALqZSKzxwKBBQCqFaLT6bu0ReDrDf4DLQc=;
 b=ZCtFipn4ACffkMmwhawkSiNoVgx0+1I/zetuvwljhG+tWyZ0QQPaYyTf0tYB3xkngk
 6Zdhi3lnfLaSVuaQ1DqhKu1f/SKPj5x54V3ruUFI3TrsEfeMqsB2gcJLKV59QYW9WVrS
 Tf8W2Vez+GWK2BdLTjqd69ZTyInxjiH22HRxCj3h2cYInl4jj2OhyBxX+t1t8OIcaBPU
 d8YwQjidrlvmNzBDYimEfKgMzxiXGIffGNSy509VGvm+HlZ5Yy9P3bC9XKTeKsS2VAR5
 tuUCD+Wzn/d1Wq8Qko4UIOccdH5ozey4wwt1KKWzVwWjaCUvOt2jN1q22S5O/YmLQMQR
 GrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3g/A/VhKALqZSKzxwKBBQCqFaLT6bu0ReDrDf4DLQc=;
 b=KuakcfMRhXSOuCSNF+2gft6XnvQgoJSLSxo9x6b19nJv1dmK7DXKthU5iNpdoy/gGY
 05mbiDOvTjBfRvtGSLtxsyVb6FZwwUATLO5Hh7eXZupcDR/OBdGKMWFfpjCoLeo5pva7
 bKuMV0gvIWC8GjI500sEP3p8jpLAp9yNLhHN9IehFbOl11ap2tO7UrApc8yioNALdeOU
 +h9Qa5zlzbJ5yGqTJloHhY6zeq9YIclnPgZbZjEdrTzCjwod1taUGXO7tnMNk/OtHZ1x
 G0EtezQMO2oYj2xwjkJpswkEVzNrfVFBya2S6lVye76t1ky4Fq3fDjDN6OzCflC6WfaB
 q1Ag==
X-Gm-Message-State: APjAAAWxYpV1sl6CN+T8AA5vP+a/F2GMONC08316zmAXTaWfQojhKgkR
 69IOoPwH2/anP+5tlOEhbe4=
X-Google-Smtp-Source: APXvYqxJS/WP2zOOmRW0orqTzZD1jmdig6IvEjlAtgAQFwQIvIMmtkBtCQxOdm7tqfX0VPIRQxJT0Q==
X-Received: by 2002:a7b:c342:: with SMTP id l2mr27920141wmj.20.1576444354953; 
 Sun, 15 Dec 2019 13:12:34 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1370FCC00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:370f:cc00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j12sm19888598wrw.54.2019.12.15.13.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 13:12:34 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [RFC v1 0/1] drm: lima: devfreq and cooling device support
Date: Sun, 15 Dec 2019 22:12:22 +0100
Message-Id: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_131236_665623_F42EE624 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 alyssa.rosenzweig@collabora.com, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is my attempt at adding devfreq (and cooling device) support to
the lima driver.
I didn't have much time to do in-depth testing. However, I'm sending
this out early because there are many SoCs with Mali-400/450 GPU so
I want to avoid duplicating the work with somebody else.

The code is derived from panfrost_devfreq.c which is why I kept the
Collabora copyright in lima_devfreq.c. Please let me know if I should
drop this or how I can make it more clear that I "borrowed" the code
from panfrost.

I am seeking comments in two general areas:
- regarding the integration into the existing lima code
- for the actual devfreq code (I had to adapt the panfrost code
  slightly, because lima uses a bus and a GPU/core clock)

My own TODO list includes "more" testing on various Amlogic SoCs.
So far I have tested this on Meson8b and Meson8m2 (which both have a
GPU OPP table defined). However, I still need to test this on a GXL
board (which is currently missing the GPU OPP table).


Martin Blumenstingl (1):
  drm/lima: Add optional devfreq support

 drivers/gpu/drm/lima/Kconfig        |   1 +
 drivers/gpu/drm/lima/Makefile       |   3 +-
 drivers/gpu/drm/lima/lima_devfreq.c | 162 ++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_devfreq.h |  15 +++
 drivers/gpu/drm/lima/lima_device.c  |   4 +
 drivers/gpu/drm/lima/lima_device.h  |  11 ++
 drivers/gpu/drm/lima/lima_drv.c     |  14 ++-
 drivers/gpu/drm/lima/lima_sched.c   |   7 ++
 drivers/gpu/drm/lima/lima_sched.h   |   3 +
 9 files changed, 217 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
