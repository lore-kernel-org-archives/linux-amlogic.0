Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59593606A322
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 04:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JDfEvqBo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFixfOuo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BjyRxYyZ2gBMKUcSkiWg6r/b4fsTh0DePCneuBJvgwk=; b=JDfEvqBoSveEnzQSozd9pzMun0
	/WpoGeQgiK6IBDjp3uU0Xv7efuvwgffjEKoPIgA674FJ3Uvn8uRyGM0bgI61ma0LDjjxsPZfLnlgW
	ovRkSR12OtGpr+cw6xAdegycCo/KHzspZ8CabC+aRAjOnU4M3SwieDv2DZyK+CZ1icnHB8YNx+JKA
	rAxvPSuK6Fz9uv1avFWSHxfn5RMLQBEj0e7YNt1h+K2so6vGWKrmLHXJr8J5cgv6lZQ1PG9IYbUzF
	sDRkEXncWb4hWkJGDd+vebAOEczxIHSS12JA7fVi3ti50qIaiVhlt84nQ5vP6604FfA9sUH49pOEC
	42xO2HZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeF6-0000000AoCz-1jW5;
	Fri, 30 Oct 2026 04:29:28 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeF3-0000000AoCI-1AWO
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 04:29:27 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso152454a91.3
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2026 21:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334564; x=1793939364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpeEYAEKyyCPvuV7efERlE4nfg2Y+m/mO0FuoK2R5s8=;
        b=cFixfOuoYbdFnJSsyKviHqc/w51i7SaSF8y79mlZjWzYZUU7p0snW+NMNyjlo3LBA3
         N86b3h7U9HG8EpQDc4m6fDQBMTkFu35wSgLJWo7tD/3QJfZEKUPYLxPyF73g3/uYn1We
         30APEIhUv7tOsAx4faTnX+35U8rU5CAGLTA/P5n7kbaGnsqrPVJ7JcpEMexIYHdaBoeF
         hLpPqSi5lwkhvQGJQUjj1FgnZdhXVnl0jECZtgqYFmsONgbQibvfgH3WimznzFjQHbT6
         eittIkGDVXcFT6MncHKIuCbhEHHl7tfmvounSyDxNsQRYh0bwPMkpeLY1DYxUG3NQXZ2
         pDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334564; x=1793939364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpeEYAEKyyCPvuV7efERlE4nfg2Y+m/mO0FuoK2R5s8=;
        b=ZO15WaMJ47f86kqP66SpwdLOLDzptyk4dqf32UYRJZUsp6yr2iSJbXFJeJuWiLQqru
         z5uj9qoDg9nQUT3/09nT5i2RVSphHR69TTU+Qzq5DJhLhT0GBv2YgkirA5b3cZ4UC34I
         BDdc9uwSplOglPiA77clKpqjkxkOaEybQF7U2p8GF4alBnQUExfRuLGGh/AYfgMOgy8M
         YbgpbTrkGGccw/XtL8HrzbA+VvlE/jCnbyNwQ9VeXv1A4O4j7pMtxfGe6Jy2o3KoYkIX
         35mfb7mSIdsimDmKIQcN07ZTp596WYF+QAzjPpFgIfSkC18E0JiEvEYV8lTLmG6EYy3N
         u87w==
X-Forwarded-Encrypted: i=1; AKwUvBzZacVRUOAebGvwhSRWMouFA5PyiGJyy1WX3hmKNpjzgMY62TNuznNdt8pqpuCjIcyJ8AW/pldBbLkgI/gH@lists.infradead.org
X-Gm-Message-State: AFq9FYIajqjuZZ7Tc/CsEP7q30iBZGhsdmv6dw/XU5vxDDSAlluSN+iH
	ejTs3PmTY9COpCQ/BmuYsYMBo6837/BrjJZwh++Gtz/j+9pYg5UoVtQ=
X-Gm-Gg: AYBFou14RN6gMorX+df7PmFwt7VmSSrhvZBaetOXc2Jt14VqpG8epJlxvf6P5ve3fAs
	mWTy9xM8eroylNI3KaGwUnF3a85JPA2KYlAImUXq0FH3QHNLLt9ydCXTtVm0DDDNjM0NpeRlB14
	0HuMGoB6nR2lhkVI0lzJv+33JWbCyiaQRR0UxZO4wvwi72p62siHMsBY0qbGy9fNcbEEt2SCsnY
	HQfdvcBwK8Mk+VTywY5WU/tVSh3MNWL3Sb31OLOFOyLbyuWEWvLdI1HUqWIZEajm9bNlF6wqW0q
	bFZ8KBSzRyPa8r5U1g1o/tS9epNuONwA5HgYDwNl/xovwDf8+T4HGO5OKlpY8hwUl9lF0TW6Jtg
	Bl78Jt1cw1AoQ2jHZUgh34PXn1/PlOwiMbT3xwaxrzLJu2VzY+iIKlx5WPGPY/PMs47uv5n7vzI
	dK4eKZSAS6Qt4GJ8KpgswXayR3o75eeV5nhiOTZl+1bU/j/uOZ3BwC1aJfJZIl0CHsHyYGit/gp
	nTHhwjUyhnwC+coKcytpTd2uIDzEI+IK8XQ1GtlfhUp7G0kaYF1DklXpoaUYzBySWsRndUt+Gnd
	/Mi2CSsbZt8ww9owmUeM/+zCVz0EeIX7Rndc8bas+4cdnFCDPSCj8t7YxQsPPZVoetdp
X-Received: by 2002:a17:90b:268a:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3ae897ddd43mr857008a91.60.1793334563678;
        Thu, 29 Oct 2026 21:29:23 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8826a769sm606067a91.4.2026.10.29.21.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:29:23 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	dragon@radxa.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/20] drm/msm/dp: Cache eDP link capabilities after successful discovery
Date: Thu, 29 Oct 2026 21:29:00 -0700
Message-ID: <20261030042912.2745609-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009-msm-dp-hdr10-v2-11-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com> <20261009-msm-dp-hdr10-v2-11-1835d4966da3@radxa.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_212925_336963_32530AAD 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09-Oct-26 11:16, Xilin Wu wrote:
> Discover eDP capabilities from connector detect before the first
> modeset.

I tested this patch on its own (not the rest of the series) on an ASUS
Zenbook A16 (UX3607OA, Snapdragon X2 Elite), on v7.3 plus out-of-tree
Glymur platform/board patches, which include other msm DP changes.

Without it, msm chose the eDP output bpp before the panel's link caps
had been read, so the first modeset after boot ran the 2880x1800@120
OLED at 18 bpp until a DPMS off/on. With this patch the first modeset
after boot comes up at 24 bpp, 4 lanes at HBR2, with no link-training
retries, on two boots of two different builds.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
