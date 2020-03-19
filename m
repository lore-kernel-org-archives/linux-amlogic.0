Return-Path: <SRS0=2SAA=5E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CD9C43332
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Mar 2020 20:35:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10BFE2072C
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Mar 2020 20:35:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a57DXoAN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="F6XgOmwh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10BFE2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kYF+VSzbhRB7X083DRp1nQ7Eai91j0TlmKHYblIDXtU=; b=a57DXoAN6m/wRj
	N651Ylzwp6CESpmpZdpaI6TjU7HAusfMo/IgedMr92anegDwaLi/wHyGpaXtIUUvqAgYn5DvhS9mN
	PggNCQ0QB/fhY5r4mKKDvxTpSqPkCkcUUKxGqJC6BqA1EqEYs+wDurJeUa6ArtMXrdiAeWF4Ah0KR
	lsbhvs+kFsjitfALta5DiQFnwY8DuFsydmww0XKx+zfO2MK2dHLyg+N3iWgsFj47XYIEET1uZVRlO
	ri9KrpIL6lfxFuj7iVtnlnEC+xvvKmJ9MtnX51fvEADshHo1rx+AKsBdwned9Ohkd4A0+xLjfvpiB
	T5owovxm4+Ao5gmILlgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF1se-00030d-Vn; Thu, 19 Mar 2020 20:35:05 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF1sc-0002Xx-36; Thu, 19 Mar 2020 20:35:03 +0000
Received: by mail-wm1-x344.google.com with SMTP id z13so4221629wml.0;
 Thu, 19 Mar 2020 13:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F9A5apcWfgHbzIqTxkzNkSW99c5Jwz5rXzLyR34TMAY=;
 b=F6XgOmwhJh/gwPXvcFQ3g35VhaqVS6H7wbZYGDdOZ/59xuk2dxFSNTlGYWF4EpX5SV
 Ibl1WkLnpvoi4S6W5lO50eCpeqljmiLyxcSl0OOrOi3f9o14+mVJrjSEc/0jLARtmzTw
 0PaNWhkJyZTJ2j3DnwzVbuqqJbnYgmQukFBanjDBkEfRu7Q7s9ioTHQ3AUokTwDCkBpX
 ssCSfhHL4HxNzZt1PJ6QER879pr2l7SHo+fnLSunY5bcj2xFJnT7iykt5ZfIX4IQJMrB
 Jjbv6CuhBup3i8Jkv4wwSgpFIBv/zsEFOl+ivz+aUs837Lt2f1EOiCty2OcbxtMR1xi5
 wLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F9A5apcWfgHbzIqTxkzNkSW99c5Jwz5rXzLyR34TMAY=;
 b=kINBo29j6A4hIbhqSHuy371KO32I0Kq8W2EXtCva+orexDFMC1TxwdpgloVXQ/L68o
 mXhhUeDKX3amX7JoM/r+uUUKPL6wQkAMKdtLsU4WDJbIJbkOhsCqiTlWT6ls2ey8tDyg
 b/nOC2AXdVf9tsmH85GmbmSc56soYSrbjMfcY/2EjbZE51akzzxpfTyJ80MTdV4uBB5p
 6SG6yq5NdfBA33PRmAgHIN9/4fasZRlvK3erCrKdYPn05bt/K7s0WZLfUXj70zFrnK5h
 gKJqnW6dLwjN+NST/IFdYzv97KOJKSst7jzYFyI6RWYWB4ZEBE6HQMYoeIOGrhVJmJeR
 pZnw==
X-Gm-Message-State: ANhLgQ2N+c9Hoqw2V8lT9PalCZchTeU0Sb3DHAfcRqQj9AgbME6bvZ5K
 UUzbG4A1RdsoCu4uhyUqhP0=
X-Google-Smtp-Source: ADFU+vue6L/D3vO5GpBh6ik04h+bVos1cH18QGewBBlQCMdLUaGmuiQ7UHEJrwRc08Fxtn+e7GR/OA==
X-Received: by 2002:a1c:bc84:: with SMTP id m126mr5722632wmf.171.1584650099865; 
 Thu, 19 Mar 2020 13:34:59 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r9sm4744968wma.47.2020.03.19.13.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:34:59 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] drm: lima: devfreq and cooling device support
Date: Thu, 19 Mar 2020 21:34:25 +0100
Message-Id: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_133502_164414_3D6F8F40 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, linux-pm@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, steven.price@arm.com,
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

Test results from a Meson8m2 board:
TEST #1: glmark2-es2-drm --off-screen in an infinite loop while cycling
         through all available frequencies using the userspace governor

     From  :   To
           : 182142857 318750000 425000000 510000000 637500000   time(ms)
  182142857:         0      1274      1274      1273      1279   5399468
  318750000:      1274         0      1274      1273      1272   5114700
  425000000:      1276      1274         0      1272      1271   5122008
  510000000:      1909      1273      1273         0       636   5274292
* 637500000:       640      1272      1272      1273         0   5186796
Total transition : 24834

TEST #2: glmark2-es2-drm --off-screen in an infinite loop with the
         simple_ondemand governor
     From  :   To
           : 182142857 318750000 425000000 510000000 637500000   time(ms)
  182142857:         0         0         0         0       203    318328
  318750000:        53         0         0         0        21     56044
  425000000:        27        18         0         0         2     34172
  510000000:        27         6        14         0         1     41348
* 637500000:        95        50        33        48         0   2085312


Changes since RFC v3 at [2]:
- fix devfreq init error handling and allow lima_devfreq_fini to be
  called multiple times (thanks Qiang)
- switch from atomic counter to a simple int which is only accessed
  under the devfreq spinlock (thanks Qiang)
- union lock areas in same function (thanks Qiang)
- select DEVFREQ_GOV_SIMPLE_ONDEMAND like panfrost does (thanks Qiang)
- move lima_devfreq struct to lima_devfreq.h (thanks Qiang)
- fix duplicate variable in lima_sched_pipe_task_done
- only call dev_pm_opp_of_remove_table if dev_pm_opp_of_add_table
  succeeded previously
- update copyright year to 2020
- rebased on top of drm-misc-next
- dropped RFC status

Changes since RFC v2 at [1]:
- added #cooling-cells to the dt-bindings (new patch #1)
- skip devfreq initialization when the operating-points-v2 property is
  absent
- call dev_pm_opp_set_regulators() so devfreq will actually manage the
  mali-supply regulator
- rebased on top of drm-misc-next-2020-02-21

Changes since RFC v1 at [0]:
- added lock to protect the statistics as these can be written
  concurrently for example when the GP and PP IRQ are firing at the
  same time. Thanks to Qiang Yu for the suggestion!
- updated the copyright notice of lima_devfreq.c to indicate that the
  code is derived from panfrost_devfreq.c. Thanks to  Chen-Yu Tsai  for
  the suggestion!
- I did not unify the code with panfrost yet because I don't know where
  to put the result. any suggestion is welcome though!


[0] https://patchwork.freedesktop.org/series/70967/
[1] https://patchwork.kernel.org/cover/11311293/
[2] https://patchwork.kernel.org/cover/11398365/


Martin Blumenstingl (2):
  dt-bindings: gpu: mali-utgard: Add the #cooling-cells property
  drm/lima: Add optional devfreq and cooling device support

 .../bindings/gpu/arm,mali-utgard.yaml         |   4 +
 drivers/gpu/drm/lima/Kconfig                  |   2 +
 drivers/gpu/drm/lima/Makefile                 |   3 +-
 drivers/gpu/drm/lima/lima_devfreq.c           | 234 ++++++++++++++++++
 drivers/gpu/drm/lima/lima_devfreq.h           |  41 +++
 drivers/gpu/drm/lima/lima_device.c            |   4 +
 drivers/gpu/drm/lima/lima_device.h            |   3 +
 drivers/gpu/drm/lima/lima_drv.c               |  14 +-
 drivers/gpu/drm/lima/lima_sched.c             |   7 +
 drivers/gpu/drm/lima/lima_sched.h             |   3 +
 10 files changed, 312 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h

-- 
2.25.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
