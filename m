Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CD9CD5BDF
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2024 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=38FSz2W8wDa61kmi9SYWn6TV9FUMNGDESUCO3jFhSME=; b=MgTzXGjui4OsVC
	zgyLEU7qDXEFHF3lCVDKk8qo+M2AkrbsPb87Ig7LUG7uq1Wp6V+0ptMuKxfRXpcKGAbi4KehMpHCx
	zmw1ncAJJaDps+QbhUQNULFS94x4a6By6TEOeklAsxIFv9HV3AA1MG0fvRnB4IKANcJ3O39KG6fc3
	bC3aPjtgJsTmxQcyzRgKscfNnyI6W5hnHQTuQbpJJH6Im4i3mhV/OUwgfvPqRzj8OmS+82TdHCGXa
	u7NAQANm4ml2YO0eF08DB2wpseJf9dwGNqUbq/v/mpaSe6A6rKZGBF2YL3aQ4IWf/aRKox9uFbk4z
	GCQQCIICsbNYyJFBSNzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFcX-00000009BNo-0jYq;
	Thu, 05 Sep 2024 16:46:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smER8-00000008x6X-3YWP
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Sep 2024 15:32:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42bc19e94bdso7521695e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2024 08:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725550217; x=1726155017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c44aBewD5nNKnXHiVVyQvvOa0Q/o1oN1Be6LGdhiAcA=;
        b=ZdohiZEr1N34SKErBQHeOGU2IUyu4NCK+8TaKYHlXOj5a9rpEpEFivBk2z8hFHo6Fr
         cmVMTNxWo40dTVk2uqw2w5OxK1+GgEYiYuS46E1dsaibE+pNA6z1RICQ+NUuY8wiTh1H
         6u8euwHlCZ3tCiIxIJdyba/a5pMaCj4ZLNElFsMod/FQyb/xwuIKVQ1rShS4vJfWFQT8
         1CLPDPjY2pYBhh5Anlz2dh6sDeN5brehzWmuzJVYCmxUiXVUuRnwVKIsPI5ltVT+z+rh
         07AnYXQOvDBCmUA3g/ar+eSJeEB4HjgaS938qbyJBvWOdwQQ0XcTy9Uj2pX5c5pUcDGt
         WeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725550217; x=1726155017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c44aBewD5nNKnXHiVVyQvvOa0Q/o1oN1Be6LGdhiAcA=;
        b=qXXCuropwELlNzh9hK6V/3T8iVDphr09uVfI94PHKc3+4nQb9K3rRx8Ha+K+jdRe7k
         wf1Qu0eveEe74DaPDDzpSoEGcnCtNG1QGO7UfqR/porU6Pq4132csoZqeIa2F8LGja/J
         ctiVL1jUKiVGX1mpbqsicATVCKWK8F66m00Z0a6wDYZa3T1FJVXCoFvsMCUObT9cS7/n
         JIqwQEQTH2MZXrh568SKMuZdl78Z80svPDU5oCH07eeVQI48SY96rBYFCmGcHhjpY0zD
         Wb4fb3K26LzE+S9tMBzo6j9zdxPTRq2WZFuVT/YGf1EwiIB5f4Ix0mS6ikqpX81ENpSo
         DTnQ==
X-Gm-Message-State: AOJu0YwZEbv3EQYtqER6R+HtbT9R8HkGg6uw14EyB4vYlR+96piB2DSD
	PH2M6xbmrxEsGHHGLobWJuo22Bn6BJpmYPCSH/AhQfjSIYWkdSOB8alOafFH
X-Google-Smtp-Source: AGHT+IH4wkjbRPqjW5Aduf6wAghoMPGrGVk1s8rjg7vtruDqtHaRyu3G6+YSanEFGJ0VZhHE2/JwBg==
X-Received: by 2002:adf:f747:0:b0:376:27b7:da7d with SMTP id ffacd0b85a97d-376dd71ab0fmr5876522f8f.32.1725550216891;
        Thu, 05 Sep 2024 08:30:16 -0700 (PDT)
Received: from voyager.localdomain (178-118-65-79.access.telenet.be. [178.118.65.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e273eesm235844135e9.32.2024.09.05.08.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:30:16 -0700 (PDT)
From: Theo Debrouwere <theo.debrouwere@gmail.com>
X-Google-Original-From: Theo Debrouwere <theo.debrouwere@faytech.de>
Received: from tdebrouw by voyager.localdomain with local (Exim 4.97)
	(envelope-from <theo.debrouwere@gmail.com>)
	id 1smER5-00000000Lin-3D7o;
	Thu, 05 Sep 2024 17:30:15 +0200
To: linux-amlogic@lists.infradead.org
Cc: Theo Debrouwere <theo.debrouwere@faytech.de>
Subject: [PATCH 1/2] pinctrl: meson-g12a: add pwm_d option
Date: Thu,  5 Sep 2024 17:29:50 +0200
Message-ID: <20240905152951.83481-1-theo.debrouwere@faytech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_083018_918968_2E62E6CF 
X-CRM114-Status: GOOD (  10.47  )
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

Add missing PWM_D pin muxing for GPIOA_4.

Signed-off-by: Theo Debrouwere <theo.debrouwere@faytech.de>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 32830269a5b4..6d927abbf8d0 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -277,6 +277,7 @@ static const unsigned int pwm_c_x5_pins[]		= { GPIOX_5 };
 static const unsigned int pwm_c_x8_pins[]		= { GPIOX_8 };
 
 /* pwm_d */
+static const unsigned int pwm_d_a4_pins[]		= { GPIOA_4 };
 static const unsigned int pwm_d_x3_pins[]		= { GPIOX_3 };
 static const unsigned int pwm_d_x6_pins[]		= { GPIOX_6 };
 
@@ -773,6 +774,7 @@ static struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GROUP(mclk0_a,			1),
 	GROUP(mclk1_a,			2),
 	GROUP(pwm_f_a,			3),
+	GROUP(pwm_d_a4,			3),
 };
 
 /* uart_ao_a */
@@ -1066,7 +1068,7 @@ static const char * const pwm_c_groups[] = {
 };
 
 static const char * const pwm_d_groups[] = {
-	"pwm_d_x3", "pwm_d_x6",
+	"pwm_d_x3", "pwm_d_x6", "pwm_d_a4",
 };
 
 static const char * const pwm_e_groups[] = {
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
