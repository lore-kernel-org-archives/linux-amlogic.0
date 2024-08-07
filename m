Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B41C52D6F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2024 09:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ud5yIxIuJ0uhHOJ/Bq5pZSenCAOvpEKB1fZ/oxs63fM=; b=1/caqfxkV6twZw
	L9aTC4+Hy328OBIaqbje7fL3t1GADKZbD5+X3NUWc/ip5V53xUKwvIFOrZWaScnA18kp8D569W36P
	dsA9quJFZpz/YVv6oM1/lCpCRTezYqUtBYS6NDB0SUYWeHmOSVewJ/6y0nfUXw52AfB3y8J81nC42
	qniApDkC/TFDCVuSZMlblqdup3kM3Qi/HyfV/SzAdxDyv43CiwGnyco/o9Qe8P6hE2DxH7ujNlZ8B
	lH+mBM92M7mDLhnko2D+CXipxwaslnYaFPvW6pk0JOCBj1IOmFCHrvPAW2jh5bCEDydtu4JNi4xfs
	1NnU9wDiI7dWrG5QtRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbd1t-00000004Yxb-1DoB;
	Wed, 07 Aug 2024 09:32:25 +0000
Received: from smtp-74.smtpout.orange.fr ([80.12.242.74] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbd0j-00000004Ybi-3bEO
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Aug 2024 09:31:20 +0000
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bd0dsp4BgEfqMbd0dsKOjo; Wed, 07 Aug 2024 11:31:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723023068;
	bh=2qDpc338vFqtRKWlFJJWiHrZKzxO9fZfTIrYjI9ogs4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=a5qUT5lDdKymjqBOdI/vLqm1Z1CwtzAfHwkQ3nhOaGVORDnH+eSSynlNTrpH5yQN6
	 mClMWt1l2e70ZaoEUP6hsdtHpfyygX3SA3jJndvEOiRat8EWn+wlicqc67P3zFC6uM
	 /UA8zVl20HNeHkqFaL56mZVas2HFuR+qZBkwxtwJGA5fxCDwuHe++h/kUnvYqaTM+C
	 0O6k9INFiyhAzMe5X7dy4Bf1XXOsNr5XDCSn4tGSlXKBEZHzpI7FUQSqikBsDlJMGQ
	 /X+qCpabcVQ1V4ka495o4/mEO7kTfidjVBgnojXu+49WKlAEC3R5Htw/XMCakTllzn
	 VwTmW+jj1U//Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 07 Aug 2024 11:31:08 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: linus.walleij@linaro.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] pinctrl: meson: Constify some structure
Date: Wed,  7 Aug 2024 11:30:54 +0200
Message-ID: <cover.1723022467.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_023114_478981_E791F022 
X-CRM114-Status: UNSURE (   9.74  )
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

These 3 patches constify some structures in order to move some data to a
read-only section, so increase overall security.

It is splitted in 3 to ease review.
Patch 1: struct meson_pmx_group and meson_pmx_func
patch 2: struct meson_bank
patch 3: struct meson_pmx_bank

All patches are only compile tested.

In order to compile them, I update Kconfig to add some "| COMPILE_TEST"
on depends line.
Should it be useful, I can send a patch to add it, but I don't think it
would be that useful.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  10818	  11696	      0	  22514	   57f2	drivers/pinctrl/meson/pinctrl-amlogic-c3.o
  17198	  17680	      0	  34878	   883e	drivers/pinctrl/meson/pinctrl-amlogic-t7.o
  14161	  11200	      0	  25361	   6311	drivers/pinctrl/meson/pinctrl-meson8b.o
  17348	  12512	      0	  29860	   74a4	drivers/pinctrl/meson/pinctrl-meson8.o
   3070	    324	      0	   3394	    d42	drivers/pinctrl/meson/pinctrl-meson8-pmx.o
   9317	   9648	      0	  18965	   4a15	drivers/pinctrl/meson/pinctrl-meson-a1.o
  12115	  11664	      0	  23779	   5ce3	drivers/pinctrl/meson/pinctrl-meson-axg.o
   2470	    120	      0	   2590	    a1e	drivers/pinctrl/meson/pinctrl-meson-axg-pmx.o
  15125	  15224	      0	  30349	   768d	drivers/pinctrl/meson/pinctrl-meson-g12a.o
  13800	  10160	      0	  23960	   5d98	drivers/pinctrl/meson/pinctrl-meson-gxbb.o
  13040	   9648	      0	  22688	   58a0	drivers/pinctrl/meson/pinctrl-meson-gxl.o
  20507	   1132	     48	  21687	   54b7	drivers/pinctrl/meson/pinctrl-meson.o
  12212	  12880	      0	  25092	   6204	drivers/pinctrl/meson/pinctrl-meson-s4.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  22114	    384	      0	  22498	   57e2	drivers/pinctrl/meson/pinctrl-amlogic-c3.o
  34510	    384	      0	  34894	   884e	drivers/pinctrl/meson/pinctrl-amlogic-t7.o
  24945	    440	      0	  25385	   6329	drivers/pinctrl/meson/pinctrl-meson8b.o
  29412	    440	      0	  29852	   749c	drivers/pinctrl/meson/pinctrl-meson8.o
   3070	    324	      0	   3394	    d42	drivers/pinctrl/meson/pinctrl-meson8-pmx.o
  18597	    384	      0	  18981	   4a25	drivers/pinctrl/meson/pinctrl-meson-a1.o
  23315	    496	      0	  23811	   5d03	drivers/pinctrl/meson/pinctrl-meson-axg.o
   2470	    120	      0	   2590	    a1e	drivers/pinctrl/meson/pinctrl-meson-axg-pmx.o
  29877	    504	      0	  30381	   76ad	drivers/pinctrl/meson/pinctrl-meson-g12a.o
  23496	    456	      0	  23952	   5d90	drivers/pinctrl/meson/pinctrl-meson-gxbb.o
  22224	    456	      0	  22680	   5898	drivers/pinctrl/meson/pinctrl-meson-gxl.o
  20507	   1132	     48	  21687	   54b7	drivers/pinctrl/meson/pinctrl-meson.o
  24692	    384	      0	  25076	   61f4	drivers/pinctrl/meson/pinctrl-meson-s4.o

Christophe JAILLET (3):
  pinctrl: meson: Constify struct meson_pmx_group and meson_pmx_func
  pinctrl: meson: Constify struct meson_bank
  pinctrl: meson: Constify struct meson_pmx_bank

 drivers/pinctrl/meson/pinctrl-amlogic-c3.c    |  8 +++---
 drivers/pinctrl/meson/pinctrl-amlogic-t7.c    |  8 +++---
 drivers/pinctrl/meson/pinctrl-meson-a1.c      |  8 +++---
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h |  2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg.c     | 16 ++++++------
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 16 ++++++------
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c    | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson-gxl.c     | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson-s4.c      |  8 +++---
 drivers/pinctrl/meson/pinctrl-meson.c         | 25 ++++++++++---------
 drivers/pinctrl/meson/pinctrl-meson.h         |  6 ++---
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c    |  6 ++---
 drivers/pinctrl/meson/pinctrl-meson8.c        | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson8b.c       | 12 ++++-----
 15 files changed, 82 insertions(+), 81 deletions(-)

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
