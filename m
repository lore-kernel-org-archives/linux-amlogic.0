Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE6CC282EC
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Mar 2025 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l3JGuSMH2e6fS8ggK8kUBOj7UIxM4ENUpbQ4PoGLEcg=; b=mh91dfvgc9OrdO
	31AX2Fjr1cJp+WCuW1a9o3SXfsr6jXlyUzkMmDZ587JCV2jXCrZN1QQ4xqCgwEie71Kw7KzgnHHt5
	vbq4AwAJzHUZMc0gaJ6jalIlYWyEFiILUK741IppQgZPd62MTdne57fsmTW/Hy6LjzYTnu11h+glC
	GrlaAeuwnosKpq1kBJ4Pbn6wv5KBNbM3Z0DgDFIf7g6seGAWbnWOslxnIVgoLSblJ10O3ZmEw9m2t
	bVc8BHu1lyu4t1Lli0l7i+p/wI3i+9zRIIymKHk3G9hNdO6SHZZvSwjsYu823c/5PY5eRe0FeRGf4
	Zq2Ulvw7pbdKVkmcy2NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Cx-0000000Ebs3-2WZZ;
	Fri, 14 Mar 2025 15:44:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt77T-0000000Eb1K-1WgY
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Mar 2025 15:38:45 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so15083375e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Mar 2025 08:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741966722; x=1742571522; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LeEMYqbmicsul3qU4d5IDEMo6LV7yC33fMjpXDjlS2s=;
        b=0Lqq5KdKEC2LnTOCqQnLXRzCSAm4lZvbEnXmDxd2eEOBG/G9slVVzdUG0XjoktvG5c
         XmWmavjpkvJP2GqPqJZysBIzqu8IaCSjsfCuMnTokyvRZvDApBwkhMcFlCHOLskPc+aB
         f3i92K/Bda1gP8roYYGNdpHPdbSyizVFjOY2Y5Oucwagk6+a+hpN01A1/c5w2cmfiPAF
         7BlM2Yp/79N54BnlevEmhelVI5S3clz8ZySlLu+tRvY8s6LmBJfGutzC92eYT9LUA+sm
         FQm4yvqrolPH1SL/5Rtcj7DHbcIcdTiGEcp+yvoaxCgIlO7UaJKPfBEP0Z+AiXvBmzby
         8aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966722; x=1742571522;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LeEMYqbmicsul3qU4d5IDEMo6LV7yC33fMjpXDjlS2s=;
        b=mbWHrP3srRTRmEuqVy4Oc3lWWTH5u8hhl5uZAoXfMCXGwIThnuWRWR8iMGoghVyJ55
         iF1gA3HSq4Ql9g2TNjiMEO6J4rQxZfdsQ8FFuc633QobPCOmSTzkE6x5KKhILbcvuh1K
         R3fMlTeb3e7h++lNkXot661u97f74dMaMcbOnFfn+QhfuszbfPHZ+Y7vcCMgxqM8/7RJ
         QJlnGCLr/gGg0Mf1KreKDzzZs9CGi47P/hliU/zSVZg63P9Y5I2eX/nAt9vrFmLPJWft
         uUn5BtaGDDBQ8xGCulgjREPtwWymBaQq9t97MeBjoQIParHwbTAFNfzzvSx9vKVIFzxS
         sejg==
X-Forwarded-Encrypted: i=1; AJvYcCWMwGMVOF+cakifGlk/WfceBKJm0mjp5AdDfsayds7N7UlODu94Z/PqvOfneIBJ/f3smzzrEsFiw2dU08EH@lists.infradead.org
X-Gm-Message-State: AOJu0YwlNmN7WYfaHERwqtZl5F7Z5CrU/3PmdvrqB1c3qcgLg7MCKc3V
	R4NwewWawI2MISENpnG2HcyF6KZmVj0wZxk8Qnhqr1P2U7OW9dUAf1X8kGDcgB8=
X-Gm-Gg: ASbGncshVRlAsDKIwZHsr3bEUjKrJk3hv8IHrNytbgOVSqswLqumo3v6MOSnvQ3d9s1
	F230+eeoVGmzGZ8onyipxmvsVQjhlJ+xgzxzd70qaNzXbafcHd050JCShUIGhV4yXMECW/Gjkog
	J6qus/fFn2rrKNImGUg0h4cBGLlc7VIx02yNeoQ5KKC69sevHBC2+Wo7a4AsJHbJpG3veuiPRqm
	B5qCxT/IqkXAp1P8NKKTQSQwz62btuB5KayUY/Q9TVeWCW3fd7Pxve3e0hQsDOmkx4jNypZYuWv
	1ICkcyM9vqr7z/hypy41xXdmTG2G3r2uABX+TKMW0M0AuybkpaXyxTo=
X-Google-Smtp-Source: AGHT+IGnOW2YjUm1Rmj4hdNqilcrYnIrbU1aqNglsvX+Xgv5Pf5f5UvgVexK6+9yLyoYvtOwNplwUA==
X-Received: by 2002:a05:600c:4f87:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-43d1f235e45mr39117645e9.10.1741966721718;
        Fri, 14 Mar 2025 08:38:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6eea:2dc0:eafb:9b35])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d1ffc3e72sm20529385e9.18.2025.03.14.08.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:38:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: 'Stephen Boyd' <sboyd@kernel.org>
Cc: 'Neil Armstrong' <neil.armstrong@linaro.org>, 'Kevin Hilman'
 <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL]: clk: meson: amlogic clock updates for v6.15
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Mar 2025 16:38:39 +0100
Message-ID: <1jr02z39mo.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_083843_691772_484A61FB 
X-CRM114-Status: UNSURE (   4.85  )
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


Hi Stephen,

Here are the Amlogic clock changes for v6.15.
Nothing out of ordinary this time around, just a few fixups.

Please pull.
Cheers

Jerome

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.15-1

for you to fetch changes up to b3c221e752c4e46fd86d6e15153fa8c38bc3f250:

  clk: amlogic: a1: fix a typo (2025-03-14 16:20:23 +0100)

----------------------------------------------------------------
Amlogic clock changes for v6.15

* fix mmc A clock gate definition on g12 SoCs
* proprely set cpu cluster A on g12b
* fix 32k clock definition on gxbb
* correct documentation typo on a1

----------------------------------------------------------------
Jerome Brunet (4):
      clk: amlogic: g12a: fix mmc A peripheral clock
      clk: amlogic: g12b: fix cluster A parent data
      clk: amlogic: gxbb: drop incorrect flag on 32k clock
      clk: amlogic: gxbb: drop non existing 32k clock parent

Jian Hu (1):
      clk: amlogic: a1: fix a typo

 drivers/clk/meson/a1-pll.c |  2 +-
 drivers/clk/meson/g12a.c   | 38 +++++++++++++++++++++++++-------------
 drivers/clk/meson/gxbb.c   | 14 +++++++-------
 3 files changed, 33 insertions(+), 21 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
