Return-Path: <SRS0=vGGV=G4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A40EC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:43:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FD3A23101
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FD3A23101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wjAbg8K3VAHNd0kpXHi75v/U9bqAmk+jZrmLsDj71c=; b=K1UPKKhAx7eWD/Anl08tRkdoRX
	pcrwWVjTK9xe5NNkAuv0hkDTQg1Y+502xz42G8OmYgiDcqRshdbbAOgor1s32nmyIz4M4c+6wnaY/
	1QEgRQRK0+cpJ2wEYEOK+2hruWNJiGcxan0bG6MJvqs29A7TXGsrhqH3zzJQmZrwnAufS4AjjqN+r
	jCKlZBEdOgXtTW7gwpSHRh2yf0bJp/wVp9DBNnZlRDPvhtk00ujAFBGYdFdeA/lZkcUYJ3j7jfBTG
	2d3Sg3ShGNMXYKWLf1+fqGYIJYJHPu7cBM0sgIFN0xPVV+nA22DOR4dWZtQHY+jf6hhrH8PN8/h/n
	XLunzC6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l46pJ-0008NV-17; Mon, 25 Jan 2021 18:43:01 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l46ok-0008Ax-W1
 for linux-amlogic@lists.infradead.org; Mon, 25 Jan 2021 18:42:29 +0000
Received: by mail-pj1-x1034.google.com with SMTP id my11so217730pjb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Jan 2021 10:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4onalLG5dOSDL+p5kQVrRWnpJSo+5uub7PjHtub2eVI=;
 b=TgtdO7gF+yWLGfZrm6l4+J45ey1ut/gRJ5xjfDQrfgnhZpmmPsDZ9agun9ptmnEiq2
 6fQCmwKxwSYhygO0LQq3WW7YZkpZUmF5LZ46SfYFRZReYfjwG2bVxhjq4RCP07942E1i
 u3ET02yKGmNswpVAE5hF5QKgCMw1f20p+jeECC2QyMQ5DLObdk6O+W/kOIdQgM7TqVT/
 TnbLP2sYhvUlYmNpNLw1MSBy/qHehmNoYxUy0EDmH/ZH788Ix4EtBEM7yB/EGvWQez/g
 mazi3xrJgMDLUgNFqJnkdezISN5ydy4dn2/3b+PGIInc9h274Z1L7NlPr1i8R7hFByOl
 YsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4onalLG5dOSDL+p5kQVrRWnpJSo+5uub7PjHtub2eVI=;
 b=ULVuEq6iHjSmE/m1t+KHOJDnR5DTlWG/9z1nORuFr5ImocnT6C13hLB+RMBd6j4lqA
 KBV+5Q2Ol/4slU3qmVnd1ovkcVK8blTxEIq6/MbV4BB4tTa75OaOpLq9VoFsu4nTfZIQ
 nlD+u2xEG7GiLRgxQgHkk2VXPSIj5GnWv3/5gD3ATaX27ErxDTrBqCDfV86dX/DHFzh8
 FpdHMpo9f+rXw6cZWez7Kx9VH77yrSzPy2UiCgasSefkOl659zMBs4gce61uuUswQdqR
 bytKQ5HRjole8aZklsdi00uxe5HJlPUWMT0dxkiw9LGjj3r1AG41fI3hks4ov+IqARkT
 tNnw==
X-Gm-Message-State: AOAM530Tcw2es6SfyJJpIRIG3ikmLElBI2QruH8vS0SwOr2l8JzNWuKG
 say8IC9mpaU4g+6QEhq1o60+KA==
X-Google-Smtp-Source: ABdhPJzGc42I9MCeoVi4XGLbASjLAAVZt8aQijY8wbGw7XEv7s04GgAhkaBUSd45HnRv1Ivu+5QWlw==
X-Received: by 2002:a17:902:8bcc:b029:dc:45d9:f8b2 with SMTP id
 r12-20020a1709028bccb02900dc45d9f8b2mr1885881plo.62.1611600144701; 
 Mon, 25 Jan 2021 10:42:24 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id n1sm75584pjv.47.2021.01.25.10.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 10:42:24 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: meson: shorten audio card names for alsa
 compatibility
Date: Mon, 25 Jan 2021 10:42:19 -0800
Message-Id: <161160013614.17631.10125019287812409672.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210101063737.26635-1-christianshewitt@gmail.com>
References: <20210101063737.26635-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_134227_151009_AC9A95F0 
X-CRM114-Status: UNSURE (   8.59  )
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

On Fri, 1 Jan 2021 06:37:37 +0000, Christian Hewitt wrote:
> This patch shortens all audio card model names by dropping the SoC prefix
> (for conformity) and rewording those that are still longer than alsa's 15
> character name limit [0] to avoid userspace config issues.
> 
> [0] https://github.com/torvalds/linux/blob/master/Documentation/sound/alsa-configuration.rst#common-parameters-for-top-sound-card-modules

Applied, thanks!

[1/1] arm64: dts: meson: shorten audio card names for alsa compatibility
      commit: cf21697a8c5bf65eb4e05717ca5caee8215c3797

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
