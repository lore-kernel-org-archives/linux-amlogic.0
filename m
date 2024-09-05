Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7F0C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2024 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1h/Ga2yT8n2waddMe4to+IJrZqw9YfO4+cj/zcYEi8c=; b=e6z+49fOt/ISKU
	D2AU/3SqltYkvnrF6Uf8wcZRwNZj+JE735ccCVRH1XKGtuBdmqLwY38xE6c/INbUd+30RfUGwcNaJ
	BE6ECd1mjvhI5sH5CiRGIeUBujaWWfZ3dKwBPvzsuJK5/zQ872KzMdI52wfHXOda89qPSKbCN3Sh/
	NELscLyDECWaJVPsbD4nEvt48CUMRwh2cQXLH6lcOjrHozK8igiH+PSAoX62BF6/uVk/0R8+AqStQ
	hE3PhvRXyWPDgPsoDzCRU4bbFoGM5rY31XqNHMDmcOKOUJMqI916qu92hiPlPBbwzrMuErdhbrHJ7
	MSjRTVXFdyms6fgnSHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFcY-00000009BO8-0osW;
	Thu, 05 Sep 2024 16:46:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smERA-00000008x7A-1jEw
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Sep 2024 15:32:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so7506095e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2024 08:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725550219; x=1726155019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uJjF8kpEzABU4bUekjtlqJ0GeY6zTFbBg+pbjD7Ahw=;
        b=kVcfyoCN30tbEtxxkXkXmC9VX2kqkv7PAOa5nCfmK2FsDjE/I8yrALBX5uMvZUrRob
         lLVHZAnHq1s5xJuj3TGl/cSnxcXGeSBg1DX748ugVANCyuWkAJapJuUtj04c4Brncqnx
         ErJZCP0kMiO5ds7sEL9ypwlX7VPAmkqeZj5zJvY+oBEyZrNYJsCWZjtzpA28WR0MWNHK
         d/Z2+dtjqbzIiK6ji0/duYdZUWGtJD1zPXIpV/GDW4HL6IYwFj29YWXBSey7YBH35nik
         Uj7UPxp/GdD0MLUtVFMpC4lAPyQ2v4USP5lmTXge+4Gq3RUmGRmLTE1Pj61pWdBcbgRo
         YpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725550219; x=1726155019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uJjF8kpEzABU4bUekjtlqJ0GeY6zTFbBg+pbjD7Ahw=;
        b=jbtvghxk7JYSfIvz9jDwZAuvBsfC+8dppPvNW/jS6lXVrwM5qvSEzLicR55y2vePcd
         cNA+j79HwQ/YAg9Utbb3CQJcB9HysWmCN4gdoDumRXHW8prtlqKdfryi569UJ7SmSFwq
         r22OeaKbsCLyMe8EmLTeqCxl+I9n90iP1FgLWAK0HKEPiefssD3JN0ikBg9LHPsB9LmV
         icKMpf16gyHQlLL2gdMFkrQiUquNWdg7z6vhjt9PlZIiZOPYL0puWR7dg3coE0pWQcrM
         /D5CoVSkdB1A+tERV1ODl1mTTKUxj7TwnJuf1Cbh2vFogOb/LDVjij74nvuCDxstYexE
         J7DQ==
X-Gm-Message-State: AOJu0YxnBC8B4VRHh5YeGC3D7/xq0OCa1/ofBqpmZ4sLsZhLN//EgYgz
	Je8t2PDB5u/BPbNlMer2dDj00OFbZaSMtDJBqPf88+jsA53qsgamxX0aHI0X
X-Google-Smtp-Source: AGHT+IGO4h0f60xK/pK7LiWPss/CeC3LUkNgDJF22yoyD08/aTerVn2qj+53PNf2SwufSjpsG7DKrg==
X-Received: by 2002:a05:600c:1c0d:b0:426:62df:bdf0 with SMTP id 5b1f17b1804b1-42c9544efe0mr45911135e9.10.1725550218908;
        Thu, 05 Sep 2024 08:30:18 -0700 (PDT)
Received: from voyager.localdomain (178-118-65-79.access.telenet.be. [178.118.65.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0adbsm235847015e9.15.2024.09.05.08.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:30:18 -0700 (PDT)
From: Theo Debrouwere <theo.debrouwere@gmail.com>
X-Google-Original-From: Theo Debrouwere <theo.debrouwere@faytech.de>
Received: from tdebrouw by voyager.localdomain with local (Exim 4.97)
	(envelope-from <theo.debrouwere@gmail.com>)
	id 1smER7-00000000Lit-22O6;
	Thu, 05 Sep 2024 17:30:17 +0200
To: linux-amlogic@lists.infradead.org
Cc: Theo Debrouwere <theo.debrouwere@faytech.de>
Subject: [PATCH 2/2] arm64: dts: meson-g12-common: add pwm_d option
Date: Thu,  5 Sep 2024 17:29:51 +0200
Message-ID: <20240905152951.83481-2-theo.debrouwere@faytech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240905152951.83481-1-theo.debrouwere@faytech.de>
References: <20240905152951.83481-1-theo.debrouwere@faytech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_083020_468203_7796064C 
X-CRM114-Status: UNSURE (   9.12  )
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

Add PWM_D pin muxing for GPIOA_4.

Signed-off-by: Theo Debrouwere <theo.debrouwere@faytech.de>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index b7baea4c33e3..0f7b6ed47ca2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -843,6 +843,14 @@ mux {
 						};
 					};
 
+					pwm_d_a4_pins: pwm-d-a4 {
+						mux {
+							groups = "pwm_d_a4";
+							function = "pwm_d";
+							bias-disable;
+						};
+					};
+
 					pwm_e_pins: pwm-e {
 						mux {
 							groups = "pwm_e";
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
