Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E7BC678DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jun 2025 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tigDahFyi8od1CaIDvYTYnRmcLG+oesh0tnXlqxzn0g=; b=qBtutmvfPQNWWH
	qn9iWsy4+6eTS6SXZd+fjchkSOTQHcgC9W93zBBaSlfkSHUd3tvsOatJbCh78bRKRWblourwES05q
	A9wm7sasA3bJ1vdvrg9tA+PNIhMPJd/rgmH4mlzpjgM6eCd/ozaLiIp6b/c7Vn4XQj36ubqW3gE8X
	+mWxQAKnotZVIFfak/gs0vO3HdezYx9P1JOHPUUOdj0vaDzmkmBZjTs1BPPmZChEw3cXIoj5nf0PM
	D3sZJCHOzDBzPqZVY3lSW/ynN6en4h10cIO8IGhr+luoqo2xFzmwnsUe48OUNaNTaEy4QhJIDfTPn
	nVF8mu2Ud41dSvLZhvNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyan-00000006sCd-03hB;
	Tue, 10 Jun 2025 13:00:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxul-00000006kLF-1dtg
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Jun 2025 12:17:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so61695265e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jun 2025 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557834; x=1750162634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF/JYDT+HfRIqV19ilVNVcOBNpam0ApFQn/xVxr2toE=;
        b=kN+Qc7XkKPQVwosw5fAP8SO91tluas08p689DCCM2WHtL4IPuCBJRBpZAO+meSFoWE
         CLHFv6v0QzXKUjvy7HlEUS2ZjFCKDPtsWhapDHoQwdrGI5aP+/cTCUs1gn/fgL5Ade9P
         l9vrvS9wucZP4GyBhEffqXvKhxbkyPG63cMMCIxrkSW7p3cjVP3biuWkAvnZAot3adSZ
         CUh/VHzCeegEO8Tq3eGv28OGdO++Ci3h3A05cmuzOxsqcZ7gP0IJqGMhMz4Ze5MSkJnO
         nXN3N+xZF/qd9QUIgM+YOFfiX1LM7wmefgTE3K8qiBwozX2gZKpcWZGu8Rb7z14KZq9+
         +ZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557834; x=1750162634;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XF/JYDT+HfRIqV19ilVNVcOBNpam0ApFQn/xVxr2toE=;
        b=a70ZeNlVsK2qAEAMf3AncIuAon70VYipmxQYFCSgSkj2WJKhki486aVwdUG/cjZunh
         QqDkz9znYCgIXaZ1ybtPN0wh4WRFkDPkPv3EQ6AANwetqR8PaJVrg7HnVA1C1ERLWVox
         dT27qJ8kvkYQ4KoBYlUxGbvDuJ8KCuE8cpO3m3LxqcPsidel06D/DtnzTIkWNS+uDxuV
         4eOz5OiYQCeooMEg27qCFf1u8U4wFdm7Vm1Ai023j2LglbgHLPOZXCElomCjjBc3a/aw
         +01PWG5q5odcuMSj/A5Xkg/9T4v58PP6RsB3yR7vdAS1j5piv/oIuwAmTihlKY7x58SQ
         2fYw==
X-Gm-Message-State: AOJu0YxHdPJy2UAIhSQZf1L24F5uyX4OhIho79kPfcyiwaKK1hfBOvDo
	8qcu/x2fQdlaFr4m1Jgc6ReDzOQonF9Ps+oRBXdmoH0+5ivYoffarHPouYyWrP2jSac6C5811zE
	PaN/az5M=
X-Gm-Gg: ASbGnct2/EJOg3WOSnFbQYD1e5NStNUNWMuOh8mW3f+V0YCAU8PbolkIzxCIIsVOsgr
	WcMti/VPsjpn9DSqo3wqSjTS94wsHoPQ9BVICPYnTyaJDxMWbvji/ajdxJZJmqBWZ402R05SwV7
	4p5jW1H0V9nDgoT6tgy38DcTSR0xtt0n3zk2C93uyasjbXPRxtAA0vtHRERFvB7rABk3h2vzeDb
	0Ofpmiu650Up03sTQbbUth9jA22B6170PBSbpzwjWXl5UdbT89WbqOAXXyMVTOYQwYbsm6rCJyn
	BAHpU9L06ZLOyM35RpW9/qrmXvuyXtKWPIRPgTcN4JWLZUStg3gsgQugt4lgUy0XBgGfSV0zOhI
	pH102VvU=
X-Google-Smtp-Source: AGHT+IHQU4XWWHJiWTg8y6CtfrBTe2VJBO0sJZQtUeiV78bAOi8lkD0/5F86KXtfRgGuN6NBeD7Q2g==
X-Received: by 2002:a05:600c:54e6:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-452015feff0mr108984005e9.4.1749557833882;
        Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
References: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] drm/meson: use vclk_freq instead of pixel_freq in
 debug print
Message-Id: <174955783340.1721274.6476762839589523329.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:13 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_051715_431467_842AF233 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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

Hi,

On Sat, 07 Jun 2025 00:10:31 +0200, Martin Blumenstingl wrote:
> meson_vclk_vic_supported_freq() has a debug print which includes the
> pixel freq. However, within the whole function the pixel freq is
> irrelevant, other than checking the end of the params array. Switch to
> printing the vclk_freq which is being compared / matched against the
> inputs to the function to avoid confusion when analyzing error reports
> from users.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: use vclk_freq instead of pixel_freq in debug print
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/faf2f8382088e8c74bd6eeb236c8c9190e61615e

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
