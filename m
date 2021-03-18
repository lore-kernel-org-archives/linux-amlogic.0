Return-Path: <SRS0=mN7q=IQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92697C4332D
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Mar 2021 11:03:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14CCC64F2A
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Mar 2021 11:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14CCC64F2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EkUUVva/IVxhsmbH20+b/bErEF2q38Z2Nq+wyNrj+k8=; b=fTW1OjoAPxw4+Pw9b2G1bY6+8Q
	ud2EFj361oH35ORhfjpnZKSoMcUW9IoabDBfdi81NhoaQ0B8eOJuoJX5tuezXV0vRYg656ugCIZ0u
	kGLjJNCvV66cJ0Cw0/zfuBhXeB7vup5xSklWnOxp7KOrCJnpMgAG/vThiH+1KrJnUHVXtcQ68H9GT
	/U2LPO5PsHFXMz1EaPDhoCg9B0X7q5jDtK/RHdTXlcQUY6W8m7z6YvSmPrEUQgVJ3fPSPJtUoenXR
	ix5/nHzJswVoVIjOklx9rpZwEqgWbxNpTar7nlMltJuaUJoOL0+ptQ6MSwx+WB0N7Jn5X3pdK2gp9
	p5JpujwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMqQk-0053kj-Q7; Thu, 18 Mar 2021 11:03:06 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMqQe-0053hr-8t; Thu, 18 Mar 2021 11:03:03 +0000
Received: by mail-qk1-x729.google.com with SMTP id n24so1473448qkh.9;
 Thu, 18 Mar 2021 04:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jFROpSYMFSugf/JDJSkj70mXo6rlQvepZUxoikhqvwU=;
 b=SrRsdV2GlRLy1OIZxZ55PGFGPinWJS8RY3CsYUJWNkI9f9akNLQFISG4is4tiwOiYy
 PbV0axfTUM+H6QPcymufLrlWEGjRIT34SnvPNBnpVeRisBnaKVJsbw/jmtv4MokTDjto
 u0mKdPs8zfJHAuB25N4C5U6Tc4vg7QAJJZrdtambLN0VZEpLhZ4JJpkadukGKuXEmmZR
 9En5GdChZ2P4AxCc0/1kK6eTgE3wkwOnVIsffA3P6QgkmRBljjgQAxEZJz59uFjnbXhy
 3XB7l+I7Qw5ljV58BjWdhaWJQGVvXDf8TWGjTCtrCxrclFC7w1K5Ysk1uWjxhjNFGIba
 kNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jFROpSYMFSugf/JDJSkj70mXo6rlQvepZUxoikhqvwU=;
 b=Z/o0jiTz/cOevP/RzX7Ch3CDW4mpTYPuNWyL/SthpO7Uzl0WQyr5uXlXa6va2YTueU
 bOJ820ya2LWicoTvOM+GxDqi6/aWUaNIxqo9SEADqiNGUPJ2JasNlpJoGrV6n3pBBchz
 ebUNtWmDSxRRuqIhZ/oAyU1mMnXRjqx65vmL8bcDlE9vAzr196CYeJR5vKflyz3Qz3fY
 i1vOy8s4UczAUl2yIIco8QiQiqyRIEiwQtile37GhPGefQHsTuv69mvgnfHIjaXn7FvO
 SR4M3H1FSQgU4bMP/6e2nwQgMOJ9AoLHsp3ARXYTQEZhJ8xDyKb4x/+QVKIAc26OxhJl
 1a1Q==
X-Gm-Message-State: AOAM533I3lwjWaHM/Xj1Q0NjqpEaMbq8QjmA78ZiqI6zdaZl6MB39xYN
 /a234B/B7xIvE4+qDPlFftpoCPdbkAMGc7kr
X-Google-Smtp-Source: ABdhPJwkDT7cMA31ljW5JM3vw1gfqLU0z9C/0DWpzWCJm9s9ksIWUez9Dg5OON90ZbpVrK8+ajYGSQ==
X-Received: by 2002:a37:7985:: with SMTP id u127mr3644083qkc.333.1616065379130; 
 Thu, 18 Mar 2021 04:02:59 -0700 (PDT)
Received: from localhost.localdomain ([156.146.54.246])
 by smtp.gmail.com with ESMTPSA id f2sm1407123qko.135.2021.03.18.04.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 04:02:58 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: narmstrong@baylibre.com, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: rdunlap@infradead.org,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] drm/meson: Fix few typo
Date: Thu, 18 Mar 2021 16:30:46 +0530
Message-Id: <20210318110046.14830-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_110300_607682_BE2906B8 
X-CRM114-Status: GOOD (  11.07  )
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


s/initialy/initially/
s/desined/designed/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 5e2236ec189f..3c55ed003359 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -45,7 +45,7 @@
  * The ENCI is designed for PAl or NTSC encoding and can go through the VDAC
  * directly for CVBS encoding or through the ENCI_DVI encoder for HDMI.
  * The ENCP is designed for Progressive encoding but can also generate
- * 1080i interlaced pixels, and was initialy desined to encode pixels for
+ * 1080i interlaced pixels, and was initially designed to encode pixels for
  * VDAC to output RGB ou YUV analog outputs.
  * It's output is only used through the ENCP_DVI encoder for HDMI.
  * The ENCL LVDS encoder is not implemented.
--
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
