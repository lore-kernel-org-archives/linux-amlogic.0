Return-Path: <SRS0=RZf2=2R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8286FC2D0C6
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 17:38:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C26C20CC7
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 17:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UmwJvEpW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IzRk5AUh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C26C20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yAFV6xbpijREzpyKutEZuUGqw82EjgQPd+aTL6jnpJw=; b=UmwJvEpWAk0VAR
	WGcpumfI5lveRoNE3wWCn3/VyA3Pwuy6/97hF7dAWVGMvL+DEZENNjvlKvPm50nR4Z/OHeAd1STLE
	8WJ6wRUvLa/NxTafetw4f9uy+0UdLPqMGRQ3MP1Wdqw9zmv2x9dWYDXv8WaMDixzMXTLrRDP+3XUC
	SJLqIBMdX4MmDZFRk1RXx3emhEMdSSE1UXCcK39xnmhjFOuivFdaleL50TW+Z40sJYIBD3fCCFGvU
	vR8edlIOqTrDAYxVCs66ZkkEbWpEx2jHyJR97Wf/QfIR6sQq7eybpyHzdYG9cRfjhbnpNKt/oxXu6
	X6poPI0fxyRCl6+Mcaxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iktYe-0005hF-PY; Fri, 27 Dec 2019 17:37:52 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iktYb-0005fr-UN; Fri, 27 Dec 2019 17:37:51 +0000
Received: by mail-wr1-x442.google.com with SMTP id z3so26685061wru.3;
 Fri, 27 Dec 2019 09:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CgL35F0PbHIPU/xEH/yy9QoMVLs1tW/HJnhHgsc5otw=;
 b=IzRk5AUha85e7ZBCIOmBml/0x7GVSoZe86A4RuekbCtKw9koHk96jYDQzvksMlroIw
 QPo76Lk1FreaiJs+nJlxY+DGPDuAY+IqoHZrnEab+FZNodNyyzGPZuhhZGqNA0ygRsSn
 OvxTJQgLvEO58F9eoYgth4dX9kL9tvBf8pkR4nNOy4ygfr+6ypFaOskRNfV+HjgNjTP9
 SRXFGXA4FjuXIRfJOWUn34EHQSluO7zRj5sm7nGRHcDIecXkNdVEpdLeGYmaKErg5yfQ
 /IVeaOYZu4c7oWdEMsF8yE3bTmR5fv4KWbFol8SVD2OByfCJyKRmC/iD7pBQB5Vr/sho
 9vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CgL35F0PbHIPU/xEH/yy9QoMVLs1tW/HJnhHgsc5otw=;
 b=oCWC7X0cd8umoRZWhlEbyVSVdbgrz1WHoyeqUNWIzuzYV8H6EBLSbfHGFMjnHqChzb
 26AW/0+iwVMUPoUM8lXsVQ/JvL4a0DF43pAXJda7V20dZgVrUPiJT4vcRLjSoBZ9yGzm
 yuD5rUzE7yGiOVz+xOeTVdYCwKPxZ7gLREElAtvTTvMTH/sVgwAEinE7XmyveKTbcYDg
 1hxtIy57fUKohG+s1U6SjGK2bakFdsSwptyDQtEgu37QKUffmrauBnswgQBEoyYO1cJT
 7P4nLSKGQFW3/aqGI/a0DBswko0laRVhcm7pQC8raVOd0Z8dQlW5g28vMZeuReFs7/7l
 695A==
X-Gm-Message-State: APjAAAUaeyGjMJmemEs9xMciLHic+LNXcsoQYBTad7/vUDNKoCwv/vNA
 psUF/lnzkjk2VOTl9i8UOzc=
X-Google-Smtp-Source: APXvYqy2UYkwMWU2dPVz7z8FO3EUeuKP2Q67lEtRTqjhCkPr42la3j1A1wB8F6mXKYw58lhzPxwabg==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr41875477wrj.325.1577468265643; 
 Fri, 27 Dec 2019 09:37:45 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f1sm35001776wru.6.2019.12.27.09.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2019 09:37:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [RFC v2 0/1] drm: lima: devfreq and cooling device support
Date: Fri, 27 Dec 2019 18:37:06 +0100
Message-Id: <20191227173707.20413-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_093750_007123_F4FE0076 
X-CRM114-Status: GOOD (  14.78  )
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

I am seeking comments in two general areas:
- regarding the integration into the existing lima code
- for the actual devfreq code (I had to adapt the panfrost code
  slightly, because lima uses a bus and a GPU/core clock)

My own TODO list includes "more" testing on various Amlogic SoCs.
So far I have tested this on Meson8b and Meson8m2 (which both have a
GPU OPP table defined). However, I still need to test this on a GXL
board (which is currently missing the GPU OPP table).

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


Martin Blumenstingl (1):
  drm/lima: Add optional devfreq support

 drivers/gpu/drm/lima/Kconfig        |   1 +
 drivers/gpu/drm/lima/Makefile       |   3 +-
 drivers/gpu/drm/lima/lima_devfreq.c | 183 ++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_devfreq.h |  15 +++
 drivers/gpu/drm/lima/lima_device.c  |   4 +
 drivers/gpu/drm/lima/lima_device.h  |  17 +++
 drivers/gpu/drm/lima/lima_drv.c     |  14 ++-
 drivers/gpu/drm/lima/lima_sched.c   |   7 ++
 drivers/gpu/drm/lima/lima_sched.h   |   3 +
 9 files changed, 244 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
