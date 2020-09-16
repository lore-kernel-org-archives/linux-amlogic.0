Return-Path: <SRS0=Xszf=CZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F56CC2BB84
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 15:02:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A375321941
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 15:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rWwG2OX0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wijQmT9v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A375321941
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JSmGcD7wY6ohFSDIipkuWJT34MX1eoRqszgykrzYrsA=; b=rWwG2OX0D3pqn3f8w2gNWgKmt6
	QnEtL0OlmLAaiO9bWc/4lElk3ybm6tj2v96QjfM3J1V13fQZHlTonTyZfCPjNCA4PvwFQdvO7HOD7
	/tOemepUxgOzfIme5ZoZD4zWdpyIt3D796NnVK5VBd9/GOsTvnc2yTlIkgDFo7m/l13QS2u77Wo6Z
	agdU+FyQvwOZxA1zLRwQm0LYqrFbUDOMLPuOvr7nZ4KzOax7kikamrg7W58y8EFEvuOA7z3aAAXM9
	JHo0ffB4y3FdCDnB74/t6e8nvl+yeKb9xYK8GaU6fXBS/o0FoHjsa2AVmrX1fdGzGWZataSufKd29
	50Ev8GqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIYwX-0002sX-OV; Wed, 16 Sep 2020 15:01:57 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIYwU-0002qU-Ei
 for linux-amlogic@lists.infradead.org; Wed, 16 Sep 2020 15:01:55 +0000
Received: by mail-wr1-x441.google.com with SMTP id z4so7302398wrr.4
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2020 08:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIu707qF3XC1wFSQ0JUGDpXqJcRkuCHBFIGNuiyznGk=;
 b=wijQmT9vsB6ZR+aWtfyqwpoZM80cItkpJVGHdMlmCQTeVLozm9Yboz64+dfnBsTDcb
 AQ05GRsBvv1zgg0nM+bVTnixJiEzOdxwjzDEWmRryfrOMR6vKJyM7TlG5B44gUPpkhYB
 cKkzrNChnol0O+vHwKZWC3u3pSpHaY1ytGp+4nMeT2bttuoRS2JN0lmVucAKbZ9mIDK9
 5lJJE0y6YIa/olkfyVVqXwQzQfCSyRzHaXYhTbRiYSQ1yT9l9KlUiYWgrq5vFr9bh4wr
 XmtQyuq7zY7Y59xieNCJKTY0ID76DPAvj4pRWxeyxFu1LbPWGBhJXQXR/0llRYDZiEuq
 5SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIu707qF3XC1wFSQ0JUGDpXqJcRkuCHBFIGNuiyznGk=;
 b=bCssXh/GL6OmdPy+uZsBXofSJrs9HnUXRPFFL4CRb6RJTndO/yjgVoZCMG9K2D2r59
 yZ+pW4HadoeCG6R0yX1IjOUvjAHhK141ocXvO13jT8EMWYWF4yQ5FqTzC7b3Yy4Od/eZ
 JiiUma4D7qBKOKfBcUbsHnGueimMaaxbxrVILce69fB0bPZxtfe03Y0Huv9OGnhutEk6
 AHOjX7163XXwuEzaaxhbfw9mS9/vzGWUSivLwsa42Bg1vB+QJOoWAi3Z/41K73Doo5Yh
 lirvShz/LWu13eTFOet7sSECpFznfi2IP3tABGq7pCYBd2bYvj2T1rK/jVtSSaOX3/fw
 yqAw==
X-Gm-Message-State: AOAM531R+/hUPJmygBn9yOU/bWxcZ305xQ2oq76m71pewPAesR2XDzWD
 eqRaxuni1wCUnSvJBFBxWHnjww==
X-Google-Smtp-Source: ABdhPJx8Y/UqOEW6k23Aim2WVavTxhbpjN+oKkic+uEsOX4V6GEuQI6WasgaF8S7gi1dWVdYZ6QyyQ==
X-Received: by 2002:adf:9e41:: with SMTP id v1mr29697264wre.60.1600268512806; 
 Wed, 16 Sep 2020 08:01:52 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 m3sm33275243wrs.83.2020.09.16.08.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 08:01:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH v2 0/3] drm/panfrost: add Amlogic integration quirks
Date: Wed, 16 Sep 2020 17:01:44 +0200
Message-Id: <20200916150147.25753-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_110154_582767_3A317738 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The T820, G31 & G52 GPUs integrated by Amlogic in the respective GXM, G12A/SM1 & G12B
SoCs needs a quirk in the PWR registers at the GPU reset time.

This serie adds the necessary quirks for the Amlogic integrated GPUs only.

Changes since v1 at [1]:
- removed the BROKEN_SH quirk after [2] was sent by robin
- rebased on top of [3] by steven and moved the vendor quirk in the proper quirk function
- added PWR_KEY unlock definition, and cleaned definition

[1] https://lkml.kernel.org/r/20200908151853.4837-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/cover.1600213517.git.robin.murphy@arm.com
[3] https://lkml.kernel.org/r/20200909122957.51667-1-steven.price@arm.com

Neil Armstrong (3):
  drm/panfrost: add support for vendor quirk
  drm/panfrost: add amlogic reset quirk callback
  drm/panfrost: add Amlogic GPU integration quirks

 drivers/gpu/drm/panfrost/panfrost_device.h |  3 +++
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 11 +++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 15 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  2 ++
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  4 ++++
 5 files changed, 35 insertions(+)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
