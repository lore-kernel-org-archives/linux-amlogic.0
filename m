Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBB1C4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 14:43:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF5B92082E
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 14:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X7qEzOyS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QNvrF6HQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF5B92082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aFstTMg79CXG6PKOez0h1drRw/83O/OvGgMby+WGsgg=; b=X7qEzOySWJUTL9
	xTkBBRPTipCOxaT/K68T32ouZx7mRzEmGCzW1RBXa8+Y9nFr6PG0hnv2P7+atsmmdQAK1yVytmAvr
	TGviNk8c9bhCXy8EU9Dyu/rlJupkEp3bEGd2tSzci7qoRS5LuHQkwLFyQM4ZZF97ax2TNRU01vMLo
	yfzfeeVFoxLqjMlvpACYHlVmxZya0z1M3xPXDm8SuTOQtn0TFNrBfCHLrpxwdaEj5LWylwk8XLFxb
	dRlST4lJ90nrE+kKXAmqmyvPeukLdeUJdchiaAbFmE+UYhvXqWbUHCX1wN/68K3F/8H1A5LcvEdkA
	1hEuLsfnc/GmWN2uVaRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC3ao-00080W-Py; Thu, 04 Apr 2019 14:43:50 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC3al-0007zp-OC
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 14:43:49 +0000
Received: by mail-wm1-x343.google.com with SMTP id w15so3719629wmc.3
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 07:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+5EPK1jLpp1DksFX6bDHdB7cQlJWLKrS9nTZJnBqEYc=;
 b=QNvrF6HQaCAuJc0hO6t/mmraaYs2X3kCub+Sy87sKJCIWIgsJZxOdejgqtEAMmGAfq
 9BBjUQbsnuvfPMiBrqZiRlSEexTz5bpxz9jhv1FwqNAFuRceZee6a4+GofKw3gh8pHzG
 jRajnK/Si04AuLxvJGjtizm/oLL/VHqQPmMY7iZ0Ua7jio4NhstOH5GAuUaPpNRgJ8Tz
 frX9Z64X8aZZ9bONK/oS0lJXXLF4qWBmRUECfvIjrZAz9VeQo15q7a53kS0cWiv9IJbW
 lRHL5l7NOhNXx1zMbZVifFHruSTKIJfCMy7maLUyIy+rMVUjiF4op2pP/TiSVF7w02/r
 aVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+5EPK1jLpp1DksFX6bDHdB7cQlJWLKrS9nTZJnBqEYc=;
 b=mlkwsACXX4mRuCf4ddAdqu0q70OpZRrfcP/jw13MAz6oqrW2FMGyg4Y+Us9QgDOS62
 fB+OqwySYDFvbepIMUI79SQALzMBHwPPP2cBokwnNRqe5aAkpDzEAxypJCV7eZb9qJYy
 Rhx+Z3TIgo0+pGdL8erTK68rudnShUzR5KpbZzcF1+PMvi0uvI4Tzf9X1qxvnH0xuv07
 GUDUTr7KjPZuFRaIQLembpFjjAL769yAOGHKMk5ci8u82V9YgBDE9sGGQtw4IZ/UC8ho
 WTybedu9QB/el/cP/e5lalHXb7+WXtaYLW24zkDi4VJuoG6agXfaU9iaUqwPkKRctnTo
 4dQg==
X-Gm-Message-State: APjAAAUnAMdPvHnIMR5tZSEMWIJ3N18bG1haQHiwzT+m8zrohW2F1HTD
 y8MPX9SysZhw/zREO4oX7uN3ZbqxLqBVuQ==
X-Google-Smtp-Source: APXvYqw0RJ8pMlQrVgU8wXu8DYAVveOzRKB24ciGiiHemHod/LoGVdeX5yWbja/mtWVROS4xOeWn4A==
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr4631387wme.26.1554389025446; 
 Thu, 04 Apr 2019 07:43:45 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id g12sm17848575wrw.40.2019.04.04.07.43.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 04 Apr 2019 07:43:44 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sean@poorly.run,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "Documentation/gpu/meson: Remove link to
 meson_canvas.c"
Date: Thu,  4 Apr 2019 16:43:42 +0200
Message-Id: <20190404144342.15238-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_074347_922201_3218B7C4 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: maxime.ripard@bootlin.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This reverts commit a3f98bb22cbfaaf67717e156f79e2bfeb42d4cac.

Patch "Documentation/gpu/meson: Remove link to meson_canvas.c" was
incorrectly applied on the wrong branch not containing the fixed
commit 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/gpu/meson.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/gpu/meson.rst b/Documentation/gpu/meson.rst
index b9e2f9aa3bd8..479f6f51a13b 100644
--- a/Documentation/gpu/meson.rst
+++ b/Documentation/gpu/meson.rst
@@ -42,6 +42,12 @@ Video Encoder
 .. kernel-doc:: drivers/gpu/drm/meson/meson_venc.c
    :doc: Video Encoder
 
+Video Canvas Management
+=======================
+
+.. kernel-doc:: drivers/gpu/drm/meson/meson_canvas.c
+   :doc: Canvas
+
 Video Clocks
 ============
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
