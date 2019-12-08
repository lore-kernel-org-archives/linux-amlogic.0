Return-Path: <SRS0=R+dC=Z6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CCDC2D0BE
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 17:19:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B5BF20409
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 17:19:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fkCE6KzR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ntEJWwp2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B5BF20409
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hgJAcd+XIDWddduJ38gzoM2nG+MVHBXVT9Tc8gfPNng=; b=fkCE6KzRSe2v47
	HqVlpqSYq6fxYx/Y4ShubHqbNILjHmB9pDKrmC1ld4AIg3427v6vDTDkiKw9VYB1Schq7e24ayReg
	EGcJk1LIxRArmBqPwTwP6CnWaHO40i9keCwAMWJGZYs3paFDjAZm2QIBbqMANUKbrTYxRoJ1HOsuJ
	8DngGKNouqAXxmE5HtF9jh+mie+MixPh2BC20bU7YdAmfD72DL9kk0+JfLaGLI4GFQMi2ymFfQAgC
	RdIGtW85ABniHD8BRaMRNRbTftFTr8fzMWcxi1X7W3N003+/nSIqC9rfT+nBJIVqFq/oiMHFUvvHX
	357EZk1/LqAR0QgtJXog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ie0D6-0002uH-MX; Sun, 08 Dec 2019 17:19:08 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie0D3-0002sb-Nz; Sun, 08 Dec 2019 17:19:07 +0000
Received: by mail-wm1-x343.google.com with SMTP id y23so13645450wma.0;
 Sun, 08 Dec 2019 09:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gu+8XaIloextUHW957Mh8GSvlNfk6Ho+2WvTpE6YLbI=;
 b=ntEJWwp25ChtTEmus7kaTseWRnnt4433csuQqPdH/cYACBb1MO4xJwO6wWHQSbA1zX
 fnvaiAiCgGo6ynY4RRumZL14YYOP3zCqSF4rsoFfG1tolFIeD7zxZmUrSvCozM1FYu24
 W6dBfwOmS1aJ9rdS0GUPN8FNgBc0R8OOKA60VHUzqem2s824NyrULJx866i9Ki4Qc/sr
 UtmZIGkGJvCe7lkSG7zeMxMcAEaaksaFIAjCP9+FuItI1MzF1rF3XUfTuG4dUaYTGTOl
 8BvS68O2VO0h1jM4/ypFZCnn/tkW44q/aSUi/ciFzL8FS7nu1DEJBpchEeiwDIRmeVI4
 q5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gu+8XaIloextUHW957Mh8GSvlNfk6Ho+2WvTpE6YLbI=;
 b=HC52utbGIP4ovMiQJNtKGDakIpWRBUxGgbuG+AmbAHy35D6e0VSpKOCC+rDgWL7kR7
 hLekuPbqvmG4+/wzPqfX8MjPavsJyMil3nnVWWibr8VRGyhQV0H7BYOGSPYa9+ZQyA3I
 dAhe0S3tRdpOjJyZYcOe1qEDHbXoZ2zDWj7pA3lZHjnidVnRmBnnhK477ooYPQlTn+bq
 kLHK2voV5fs6ETfGfQFYvBLvD5K2kkFKodfPG3c+vD9ztEZ6i+6Lz0FsKhhM9pR5BY8B
 3KpeckSUeP2KrjGYPUGImpm5RByE4WZ0nTqVtuWtUSMj/Flmj+zbucPJeKiZjZhrMszF
 dSFQ==
X-Gm-Message-State: APjAAAU90dJMAze+6kPaZNj4ztPF9hOlHzYvmEoeGwRqEWlz2Nof46Rr
 7hVskRRSsmNHmljlPo2uPfYJzoMt
X-Google-Smtp-Source: APXvYqwl5vSlTNtHmhBHy96IhpgjESZ2vDOODYVSQ2Xh9Rx4mQ3d3VrOlJuOKtGiQrnauWl4d2kqKA==
X-Received: by 2002:a7b:c0d8:: with SMTP id s24mr21854540wmh.30.1575825539428; 
 Sun, 08 Dec 2019 09:18:59 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371AD700428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371a:d700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g25sm11791383wmh.3.2019.12.08.09.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 09:18:58 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	narmstrong@baylibre.com
Subject: [PATCH v2 0/2] Meson VPU: fix CVBS output
Date: Sun,  8 Dec 2019 18:18:30 +0100
Message-Id: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_091905_785277_3C658A3B 
X-CRM114-Status: UNSURE (   6.96  )
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The goal of this series is to fix the CVBS output with the Meson VPU
driver. Prior to this series kmscube reported:
  failed to set mode: Invalid argument

Changes since v1 at [0]:
- add patch to remove duplicate code (to match patch #2 easier)
- use drm_mode_match without DRM_MODE_MATCH_ASPECT_RATIO as suggested
  by Neil


[0] https://patchwork.kernel.org/patch/11268161/


Martin Blumenstingl (2):
  drm: meson: venc: cvbs: deduplicate the meson_cvbs_mode lookup code
  drm: meson: venc: cvbs: fix CVBS mode matching

 drivers/gpu/drm/meson/meson_venc_cvbs.c | 48 ++++++++++++++-----------
 1 file changed, 27 insertions(+), 21 deletions(-)

-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
