Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3519C32751
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:43:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 897FB216B7
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gXtmMvcP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KQy8WXqz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 897FB216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMsv25dmAxMZWuYx1aQwBlrKnt71GOl82aiosRsVRTM=; b=gXtmMvcPF0FJNY
	/kvSArRA9TOtWZS6+1e4yuG9IY5MVahgX4mrazwHvHnGHqOppyixIw1CKJAaGLH+9FecLRia5pQ9s
	b8Sy/TeZuy3cfoZ4ReV7KDPzGCyLHsZG38EPSLTrGIpGUJ3YOEURPB6VKz2InzDN7neUiXitSvD6o
	vWU47ZgQIOepLTMwJBqp5EU4RoAxchkECQ0YU+VqAzGwmxEYhOD+HD35PgfZcWeqsIeXzgrHMGs70
	BNPnzT0m6xrvnXkrCj3wBBad5KuUQBLcwYWPC5gOWf+B4foyPHR0yUWnMShn3eKuCVvmuMevS2bNr
	h9S8k0sfCXBKpTLx3GSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hudH4-00025L-GQ; Mon, 05 Aug 2019 13:43:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hudGr-0001rY-Fb
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 13:43:32 +0000
Received: by mail-wm1-x344.google.com with SMTP id v19so73092609wmj.5
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGMV7QhC8DNNZSd4DygDFTwAShSfi/80pVWOD2ZlzJ4=;
 b=KQy8WXqzt+GT9Ms3PweAVyKX7a6Hz4OupUPGYZHWgTfDcqep0bpg+Ae519mvu3I1hg
 e7D3VkMTXiDn6NYIBOHYnO98ca4Un2PjNk4qlQGrPJmMjCssBy4fnjw1zMBLLVi4o03t
 UoSPskgV31NkcygwDhsvZJLmfTwD1XQOCdxLp6plgpCUgL3Bgqh68dfiHOCZ8/6dBoN+
 kvHN3X/WTRCXQX552Cg9EIV5FM80awl2WLwGgAnRA+3tTtMRBYQ+GSuZknWw76zvdVFo
 4L4qGFV/M2HNbRXP+0ZYaAWfuLPYsR8W/ACFQaq6f8r3IqsnmGp58pjlpV28OaAKLLCz
 XrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGMV7QhC8DNNZSd4DygDFTwAShSfi/80pVWOD2ZlzJ4=;
 b=EByj1XobbAlpemZrTReub/TyiVQGsNAkGQ6+o4r04hFPl/humFrAgF4DGmfh+TPGQs
 +N2hhZN06DAFAfglZ3R+QlxbRgMxmiV6Yy1uLJVtDzQKIrMUyoXirvjqm3A1cPEmOYzs
 V67zdvEWgQU7sPHs50553AVlk8MtXyI99SssNYBSGsMG/dW3wQcB6jWkJTAqPM3LimR6
 8mEXxZwTtvuFlEJPNuk+CFlXnIU5c+LHZ7STUMCJzjj1uvWDOcVp74Vq0gdrss6PPpXH
 4mnmhERkka7hW+Zmkbr/YpApvr/7gEvxvoYjcqkMYgYJq7utMEVh9PkpL3jPutBb2y9P
 VNgQ==
X-Gm-Message-State: APjAAAVZbgqGTwH8FCh6sFcr8wKLWz4Y6qKy6BrqUeDHU8qyQE9Mevim
 hNka1wre3f3b5F0E2XdHM2iBaA==
X-Google-Smtp-Source: APXvYqwwWryXK9vXOEQg9N4QQcQMr9Yj0vLdZlzKaPKS8EdfFo7G7Jmuqo5lcERdhsA70RGznVFIiw==
X-Received: by 2002:a1c:cfc7:: with SMTP id f190mr17881896wmg.85.1565012608012; 
 Mon, 05 Aug 2019 06:43:28 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t3sm67835842wmi.6.2019.08.05.06.43.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:43:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH 3/3] MAINTAINERS: Update with Amlogic DRM bindings converted
 as YAML
Date: Mon,  5 Aug 2019 15:43:19 +0200
Message-Id: <20190805134319.737-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805134319.737-1-narmstrong@baylibre.com>
References: <20190805134319.737-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_064329_539833_CBE36491 
X-CRM114-Status: UNSURE (   8.33  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The amlogic,meson-dw-hdmi.txt and amlogic,meson-vpu.txt has been
converted to YAML schemas, update MAINTAINERS to match them again.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6426db5198f0..c55c18531cd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5318,8 +5318,8 @@ L:	linux-amlogic@lists.infradead.org
 W:	http://linux-meson.com/
 S:	Supported
 F:	drivers/gpu/drm/meson/
-F:	Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
-F:	Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
+F:	Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+F:	Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
 F:	Documentation/gpu/meson.rst
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
