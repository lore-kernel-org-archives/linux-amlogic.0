Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C351CE7B09
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=64p89rUcIPrnbYnXLe/6VKfIU1QZKJUhSdUeEAFHzR4=; b=FFXeuL1OrsgUn0
	PT+e7zLn4XZQKO1S5TOglI3IsvSeUZfGBbWTW7R+rO61Iov2gIlIQzVZyfq50kl/TqLbSDX9PPaIn
	fx4C+k3X8qJoinoeBmVKlty4fVp4z3hiLSGj8meD8dQH3xCErBpgg/m0fFcjXjI9ZaYh7gDZq1gpE
	WpIIYDqU9WcnCn1linRh2rQIv47u5XNPeNRNC16R/t0O5AtpWEikNFTKtKQ/kbD3DqmUF80tePUvn
	qVN5zK0sN41rYTLAdFbYyTfo7BPBySByfWcTG2kATijTZGZ0bse7ERkq0WRZjrrKmvX/nImdCXgAp
	T4NkJ7rU6tB+WHq2JlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYqt-0000000CJXc-2pGB;
	Fri, 06 Sep 2024 13:18:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYqr-0000000CJWu-2zTc
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:18:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso15652695e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725628691; x=1726233491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cuoCSuGUr4RHBe0FvlKAKojWcSMGqvsurR/EVr5lVNM=;
        b=kWMBMcc755IkioW0AEmUsVvLgd9KDCSy2eQl1F47j7sktsWT+LE1LTgelwCSrdI3qI
         ENyrcNlwrOZETr5A8Mq+25BUkn97W7Qg//CXnGrKzXksCiWEHEJjUDHRHBGprmW7nSFb
         ShW0IbRvTyTVjv4rWigCh2U9GUkU0kDeH2Rt9oMiKLfApRSAcvIVpLzI8Dl0zsLZCU4r
         SxxuYmxYxkOHcUVOVNqjN7dXLewEbvicigRDrg751fnOOipgqcoCI1WPifjeTDFnTMai
         FW1hXN92CGdo4H5OKE40qL5K9WF64lVhXerw+c0uhVANEkn96R+n9PoJRy9ZlK1EhkHi
         Bx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725628691; x=1726233491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuoCSuGUr4RHBe0FvlKAKojWcSMGqvsurR/EVr5lVNM=;
        b=GBTlba6Scuf8VF8mzZ8FMV8fHJDG5hUPBzIV15IKt0ASVD0CiD+HBScQ2+h+//hCAk
         aZltQtnWS/+TLf9IPpbsGufbrY1udboZsku5CJ7c584HGsEeIWtJqJ/E3MyihYyHgK46
         f3w97j0mUweO5ZkVcDcNN6fMtu8McKCdzDloFL43wb3AS3BhcK9vhmqNQJ1S6DSTbh6Q
         BQmY68tWsWMftb3LRRSw9Z3mj5qx6VrMbSthswcmmpxkuxqQkDmi0lJFTBmv9XBrYwrs
         nTmp7I/SFUlQL5sLOdE7C93ypY9Z3s0WWq2N7mp4zagfcEMg2NQ28IZo1KO03Xii5Nn5
         eQNg==
X-Gm-Message-State: AOJu0Yzmtd1F5dCVgi3Ygd73t8jo8aWaLyISC5jMjl73TjTRfOspLG8J
	CWpxfgfnOT3lqTSivdCLVAgDJA4RHMRDppE01LQyrDUMjGY/B2hSUbqZbPA4
X-Google-Smtp-Source: AGHT+IHzuT3/ZNKvRhBNKQEzZJI3iDFbdvpP4U0IzpvVBIWHWNy3eE1hyFvdzdwON6iNQ/W9K85d6Q==
X-Received: by 2002:a05:600c:4508:b0:428:2502:75b5 with SMTP id 5b1f17b1804b1-42c9f97c81cmr17868755e9.11.1725628689961;
        Fri, 06 Sep 2024 06:18:09 -0700 (PDT)
Received: from voyager.localdomain (178-118-65-79.access.telenet.be. [178.118.65.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca05c6facsm20474575e9.9.2024.09.06.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:18:09 -0700 (PDT)
From: Theo Debrouwere <theo.debrouwere@gmail.com>
X-Google-Original-From: Theo Debrouwere <theo.debrouwere@faytech.de>
Received: from tdebrouw by voyager.localdomain with local (Exim 4.97)
	(envelope-from <theo.debrouwere@gmail.com>)
	id 1smYqm-00000002e1q-1lvk;
	Fri, 06 Sep 2024 15:18:08 +0200
To: linux-amlogic@lists.infradead.org
Cc: Theo Debrouwere <theo.debrouwere@faytech.de>
Subject: [PATCH 1/2] dt-bindings: clk: axg-audio: add missing sm1 pad bindings
Date: Fri,  6 Sep 2024 15:18:01 +0200
Message-ID: <20240906131802.630513-1-theo.debrouwere@faytech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_061813_770648_8B9EE6F0 
X-CRM114-Status: UNSURE (   8.58  )
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

Add the missing pad ids for the sm1 mclk pad divider & gate.

Signed-off-by: Theo Debrouwere <theo.debrouwere@faytech.de>
---
 include/dt-bindings/clock/axg-audio-clkc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
index 08c82c22fa5f..cebf16f7de94 100644
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -155,5 +155,9 @@
 #define AUD_CLKID_SYSCLK_B_DIV		175
 #define AUD_CLKID_SYSCLK_A_EN		176
 #define AUD_CLKID_SYSCLK_B_EN		177
+#define AUD_CLKID_TDM_MCLK_PAD0_SEL	178
+#define AUD_CLKID_TDM_MCLK_PAD0_DIV	179
+#define AUD_CLKID_TDM_MCLK_PAD1_SEL	180
+#define AUD_CLKID_TDM_MCLK_PAD1_DIV	181
 
 #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
