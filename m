Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B082C369D5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Apr 2025 20:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=elfKp6/GaDrN2+IxDh8+AhQval1HdF5Ol9OWIs6D1mk=; b=JjnYf+/kKRooQN
	TOZfxQvTXNeK6iAqDeZVsTJUQkaFRHeluhHtHZtmZV+nzBTdBFHOJ54OywgC2Zk6y7XY6yB6Cb96z
	ZeaJINNCfOF/7o3qmzqyxaONlIiiFrjW4u445S1AdXA8Yf57BgDJkfr37OF7BOqlYO+Bqfwcg00qd
	ImAVLiXtDs1AeQw5mASugYW1jfVeFhuzpLSwUeuTpTlEds45m1nx7OWXz0QyQldilHaK1qj91gIbS
	UVwH/xNI3+mFkSfR+L1Zoq2JFIP2zn5Rj6Ih6VOonr4oPqYZ7gGZNu5bvJNM/IVgyL/C0QfNpUZSF
	rohkqF3tbCkkeEf149DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6xW3-000000054dm-3YcB;
	Mon, 21 Apr 2025 20:13:19 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6xW0-000000054bG-3XKF;
	Mon, 21 Apr 2025 20:13:18 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so5322959a12.1;
        Mon, 21 Apr 2025 13:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745266395; x=1745871195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pPtaoI6utTrKKW12z4v7ojubkyOrmx1+ChT5b/t83TQ=;
        b=iOSzg/teZ2v8xt0N10OmUfacP8nNij/t4+cVzidZCsUfIYh79PMJ+7IsatmGuFlSvc
         m+hGbLEkihqZLYtR/v0RhRC2FxDowHuh8qLr3tnvLNpvHaaxS7AlwT+/8eXK3r2leyRV
         Z/aVoLggzuB/dn/IllFlqRvf7cDWbk7RyClceA3gz1bKo4+B6qfGjyKv1ZJHcqeiyjAy
         eB3WhmQx8PrUwjNdWH80eFb1FdTPDlv8KbtVBfmMSkG1ylcMnAdEE+Ae8AQIGfKeLe1L
         CQp/GeLgDlMnYShVqFiAzOi5VxrhEyZkJBzCFwTjrtOM2jKe5sQvnB9s8BrYZEArERZS
         jf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745266395; x=1745871195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPtaoI6utTrKKW12z4v7ojubkyOrmx1+ChT5b/t83TQ=;
        b=YOD/kB2TgFzDgEWoThSMF/WvOXoFOCyvshdcovM8b49KxDWzC+hQa/dvmmcG0BLsCC
         zqqQxpO2EGLAtBfxKO6KEkC/Xnav8Gf9wDCMZXzs7pwjDrmbwSROE45BVEnYY5/Jw6QC
         6yRqcURxZVbJQeSBpuGV155gm7Wvy+aGtfkUlngSnqdOf3KFCFzA+D4bRcSeNRbRdrGG
         941g1LoZQTr76VzchZwGyAleLWLMsl92iqYQTFFtgLvh9mMHew/FQcwVHl1KywWH9U0t
         24LYz2k5GKX7aVbmwIKF3aacEbgpU8BUGx12XzLlucc0Qv8LreR6BcCq1X+eJwRqU4Fy
         KwTg==
X-Forwarded-Encrypted: i=1; AJvYcCUFQdj3VDw8TlIanf9cxMXpTYVowAYu9j7zag6kEp2YJKkgD9kmbWHg/TaanocNAjJeUMPUQxOqfxgQla8uLSQSLA==@lists.infradead.org, AJvYcCXlrhbJUZUGTtFnD1tPyUPTumD8sHH4mKd2qZnh1LXm5OlfkjqNlZ4dQACdTggSFfs6/iAawLrAk5LNFBnQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxkQvZRy2PAh9KDSwRvXOyDvbjByBL5C6Vsu0z8itW0AngrDISJ
	wcepBh8SrHVsUgS0vieblsodnDQJ5pZoB410b+FDqYQLxNzlQvmY
X-Gm-Gg: ASbGnctu2y92Kp9QUnfslRf8zQc702OUdQXwGRjH6aUkSCF6JPSY7Ix9JIwdKnM/dBP
	0LTMXxkMBcEeM8pzaMsDI9Qi8+DaNjJWTHzMKWbkeL05d/UVJhaH2LlqrysbLEVz1XQG8JUbJC1
	Khwqa1kjRz2EhDI/X1o/dTtRWj9VD8F89dirvZtPiWBmpFt1kWKlhriVQwXyenzIibPtTPCJXIp
	ASYejRjDcFYjnI1zILooB77mSi7xH937l3eaUWQ0BxqWOAqqPjL04TynB1HJKkpcWkHOx9iWY8b
	HvGswOpkZS+l375BmDrkZJlPBHY93pJGVwTt26ieaZizhcsL6QVusWT2EGskmfxPqKBI+uKiCTs
	lGV0eSRbaWEMSocBbb+luLHXr8ygMhCOtkWR/JU/cIuLT48s8qzxnwdRFVsrd3+MfdLgCuYxh8i
	0V
X-Google-Smtp-Source: AGHT+IEO+r+TuKnbuDISVGRChkpOQoNFOMRtWzn2WYKsN7WzPIYIE4fyTgA9Q7GUCV45qkxbPx0NaQ==
X-Received: by 2002:a05:6402:529a:b0:5ee:497:67d7 with SMTP id 4fb4d7f45d1cf-5f62861bb8amr11048893a12.34.1745266394376;
        Mon, 21 Apr 2025 13:13:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a503-5900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a503:5900::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f62557a547sm4955447a12.22.2025.04.21.13.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 13:13:13 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH RFC v2 0/2] drm/meson: vclk: revert and re-fix vclk calculations
Date: Mon, 21 Apr 2025 22:12:58 +0200
Message-ID: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_131316_922440_F4C12E24 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, neil.armstrong@linaro.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a successor of a previous patchset by Christian [0]

Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
@ 59.94 media. The patch does resolve a calculation issue. It also makes
all fractional rates invalid which is a bigger problem.

Patch 2 changes the whole drm/meson driver to use Hz as unit for clocks/
frequencies. And importantly it uses the relevant 64-bit maths helpers so
the code can still be compiled using for 32-bit ARM.
Maxime previously suggested using drm_hdmi_compute_mode_clock(). That's
still something to implement with future patches.

Neil, I'd like to hear your feedback on this approach.


[0] https://lore.kernel.org/linux-amlogic/20250110074458.3624094-1-christianshewitt@gmail.com/


Christian Hewitt (1):
  Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"

Martin Blumenstingl (1):
  drm/meson: use unsigned long long / Hz for frequency types

 drivers/gpu/drm/meson/meson_drv.c          |   2 +-
 drivers/gpu/drm/meson/meson_drv.h          |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  29 +--
 drivers/gpu/drm/meson/meson_vclk.c         | 195 +++++++++++----------
 drivers/gpu/drm/meson/meson_vclk.h         |  13 +-
 5 files changed, 126 insertions(+), 115 deletions(-)

-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
