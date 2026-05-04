Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73EDCD342C
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2026 11:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wrk9/COGFarVqiVO+tSK26UyJnHL/CAMWJoIsoYiTI8=; b=TsJo7KUUxkjAUp
	3rEP7lp+nNrljBRx7tikvKgrUrKzmgnHEkNzEP+MUbGmwQrgb0J/DlL9i5Bp71cAz7a8R29gMDB1N
	Yfto1KWOJCniy3QbnLSs/Rf2R5+SUjVJpbkACwYzjfdeYrk6HmVWPbT5MCLM3MI6Ci+k2cvj6K/0E
	qUwZAW1NfNFSDdh8C92CtfRbb+uI0Zr+oWZHYQWiK6/vKYFhT0WorWiGsUgkjbqx+jJlORFyLeZ08
	+2ComAwCC+z2ULSExl8E/+q7ZdnavxhM2HgJz0oaSl33qipAEVeEaxlet+Fiwt/Cep3Nq/VTMY/fK
	/U94agQUS6hlCcg4ffaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrFt-0000000D166-3abe;
	Mon, 04 May 2026 11:14:29 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrFq-0000000D14C-1VUR
	for linux-amlogic@lists.infradead.org;
	Mon, 04 May 2026 11:14:28 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8f984bddf4eso391550385a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 04 May 2026 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777893264; x=1778498064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIoXQIVw/Vuj4jbZ/QrXIRnsUY3etOFhZ4gnsuho/XY=;
        b=jfezJUbOj5MZom7zde98uv0DWDihqkzrngMZu3kG5j5FMPPWpEs1A8X36v6xnUNjaE
         of1HtQ3+ZsEqpzCmPBfC8uMyuIonOzkTM2Ih2VqUe36ayoB7ptMM32AIWTw2gpCPZVrr
         8vdgRNy9NHnmn9jpvEYETf06B1pbM9CUcvttiocvSwpzBT63RVPEEQqynJe4hp8Ga0x9
         VwKeYwdEOrRukgVDU4MkDlBXEWjQs9Os2c4zS2DxEDA9+owW61EIxgJIqrUM2kxprYrF
         rCGWNSU4r7E8dcGs38yBogNfzFsFQYgNpsVJBhDPTdufvWEom53DcCesiyeFgEKbtyea
         HJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777893264; x=1778498064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIoXQIVw/Vuj4jbZ/QrXIRnsUY3etOFhZ4gnsuho/XY=;
        b=VkbRPdTuR5lyp1XjwEW45Sx3R95kJs+kux7qMnfJwZ1eo0PWvGfWeHkRpFXjv8mviT
         HvD/cHBrJG6woLiQZGdng+SiM3Zi8EqqhPT4huXFp4VJwTr5EsVAvlW0fQrlPO7i3DGj
         T2YwHGDhAVwDdRi0KyxCNOVbPdOYT80/VJ40Ws3PFeGx9UYy+C/hbJpqYTJeg0L40DIh
         NKY5utAHSE0EisoerT4NHB1CGneRF/kuC8QxU7WKCVlTIwo1rk2qcNPg+91k4wC4Wd/i
         5kwoBLvcP8GkGbWMMmY3TWtk4LJf5sI+keNNGYHQ9rzj3LYvylBcAZxSNWixfRxN/6Bb
         Ew3A==
X-Forwarded-Encrypted: i=1; AFNElJ+MxqZKrB6tymwhrXCOKuAlRRn+3fx2c7YXH5n3X2BQaJ2mADZIJWv5TwXSDWJXIZZVd4SDl4h0AZE1hIvA@lists.infradead.org
X-Gm-Message-State: AOJu0YzRF+UPsPkU4x/C0cDzySpAl7s5EqeqTlpXT3cbYNxhLe+SL9oj
	p2lUglZG6fhYr7VxyM/OQiWESBuzN1ZiDOyr0Cq2oC6B3FQdJYa7hcpu
X-Gm-Gg: AeBDieuTDDv/z2tbiVf7OHWF1jm6VdzwDPkndLD09PZtVrkMytkrlHi9nMButliPjto
	eEYcxbQa6ea2qOq/GosJhhEpq441TAS0EtCv0tzFyMRakARNEYZeja+U2iK5u0UjdB9OPIIX5wr
	rXLLqu3WxMt6ISUM60rL6iVEtke6coKq5ZhdlNr7tVFwfxhFOXb4v69E4L7tDOKb0eiMdA3imgM
	H6fwU/rOKxXG8oNqtrThJVrmZFcIAz+/8B87/FbePawocToi4yoqgFpksxhRvqUI9jQgbL+Xdoa
	ZSndBvQ6VvYzouSZZ5EnqvH/JXMqR7hBKZeo9895Hb/Y2P2nNv99OL5kMVXceHJU8LNb5dg4eGZ
	e8ckQQBi5tUAW5VqNQTcueP3E3MdX5b2tQ7kbVIzFzPWW+y3+UDP69JRts3dzdJiIlaGQGPpbCA
	eJrJ8s2niJATyiNpJAPyB4nNRW9LsAAFKaVUoMWIebvFMqx+57nHfKDkQAXLxwfHb3xU9UaQlqb
	cesjA==
X-Received: by 2002:a05:620a:230b:10b0:902:df55:8ee1 with SMTP id af79cd13be357-902df558f8bmr29755685a.8.1777893264457;
        Mon, 04 May 2026 04:14:24 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:b95a:c81a:e3b:6e2c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9027c2baea8sm214559385a.45.2026.05.04.04.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:14:24 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Mon,  4 May 2026 07:12:19 -0400
Message-Id: <20260504111219.7797-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_041426_772578_D1AF8E61 
X-CRM114-Status: GOOD (  10.10  )
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

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index 89e0f8624e5b..a6074de15118 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -16,7 +16,7 @@
 #define SIZE_SEI	(8 * SZ_1K)
 
 /*
- * Offset added by the firmware which must be substracted
+ * Offset added by the firmware which must be subtracted
  * from the workspace phyaddr
  */
 #define WORKSPACE_BUF_OFFSET	0x1000000
diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 76e9ca7191ab..ab4374e3b2ef 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -12,7 +12,7 @@
 #include "vdec_helpers.h"
 
 #define SIZE_WORKSPACE		SZ_128K
-/* Offset substracted by the firmware from the workspace paddr */
+/* Offset subtracted by the firmware from the workspace paddr */
 #define WORKSPACE_OFFSET	(5 * SZ_1K)
 
 /* map firmware registers to known MPEG1/2 functions */
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
