Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BC5CE7A81
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2024 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lBlNgfn3VGJF10TkH/lzlY4cKwq3fGi8QyekNIhtAZk=; b=buEHzZVKxKq1CW
	C/ItrneNGcidBBTu3OcsguRrmK29tX8QJ2B8GXP3esgIUVRH3YKqOs13I2uGsEDTYcQoN328yVfnY
	D9eRpEKjL7imtiox40IPS3k04YG5u0QUvspG8ilEsj7lOA4kWIpqVH/1d3D4k5Yc03+IWPxrxpuvY
	traJz59wJ8aFrHzSAwpTVvNMsHJFkZNXF9HLtTFbfi9gshsKXFVPHMymSWtQxLq75ZA5TZDwdTKbQ
	GRGOAZ5cCY2j4Z3J6bhP01KXdmwIICSb1hr4Mo3N9u2dmtLTqbPNcXLZmn3I1TgTrSZRJ6CO8B1oz
	hUFhSd9PfhplreAPB9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smH3k-00000009PmP-0HQ1;
	Thu, 05 Sep 2024 18:18:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smH3h-00000009Plr-2Pg5
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Sep 2024 18:18:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42bbbff40bbso9049025e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2024 11:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725560295; x=1726165095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/BGyhSwzHWDltk1nAZT9l220LAyDFCsZ9sT7oqzkobE=;
        b=JcHzW4BLushxow6QtOVp/DO74lCJ/OaVYf5/bO9vfpIKfW3haEznEMco/6/J62m74W
         ajp810NZuW6lUPoHjtm5abJhjsjgJXj6Bx/tAJ77Q0cIyKPvMld5dtGeVSKDl+btHtCl
         PqGHfaYuQTJi20NqNiiSH1AnNTzwF+I41i9+p98tHOhlEo6RvH4DOZE/R09JCm/fj3QF
         O+I77Hr8D6WnL2bFECEa8dVlS4xFhcH+PJA3EG0Qu8aAQWUmVFvINZpRjewerGkXiw3p
         0ao2mlfiapoluo3F5xCQjHqvQBDh4g7PDllFwzFtpXPui5cmJqs5cmaom+fkhiv5cSZF
         F86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725560295; x=1726165095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BGyhSwzHWDltk1nAZT9l220LAyDFCsZ9sT7oqzkobE=;
        b=vwJahb0ks2pTdTTq6wk6OtVwO0zDORoWXJ0A+y9pZEu7oaRiKoAlM9CRV5WHIeA1Nr
         azAOM+FLkKQfY/FFuAgEFGfcHI2XHybgGgWAFqHz661oIJUGSi6W7nRTbVGBkJKutRPA
         o1wegvX5Z6bytPzjneagoujr/CZS2VDsmyNsTz8PQQtvDKnVpvS14foYCuWg+By41hEC
         9sjF7hJWrqeg15QWhKArQnEbRtz04kF/M6so1GTfAYKAvoi/kcqYnZz3XN0AxV/6LtvO
         3lEfaN1zft+z/+3EHGFwwJSiYKXkXD2T6+uo0k1wkfC/sdl+gYLIHqmY/AVUwkDKQEj0
         Z+Eg==
X-Gm-Message-State: AOJu0Yxwo5pajff7zygzBtVHmJQqP/0t2rz9crcxVFwcBmSwveoKEQ/7
	TDyqSxOLDatyaKAGtYgu4diKPpBAKpaXvCqmL1B81dC+2eR6bTcZ2OdecNvj
X-Google-Smtp-Source: AGHT+IFpi1mY9J1mFdXjcGrZOxlIugt9ggwbfVzTvEyACJcEj+SqJzUtdy+ogHq127aM8fGkb/ev6A==
X-Received: by 2002:a05:6000:4581:b0:374:ca92:5e44 with SMTP id ffacd0b85a97d-378895d6239mr9015f8f.32.1725560295266;
        Thu, 05 Sep 2024 11:18:15 -0700 (PDT)
Received: from voyager.localdomain (178-118-65-79.access.telenet.be. [178.118.65.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c8e4f1b3sm12250308f8f.27.2024.09.05.11.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 11:18:14 -0700 (PDT)
From: Theo Debrouwere <theo.debrouwere@gmail.com>
X-Google-Original-From: Theo Debrouwere <theo.debrouwere@faytech.de>
Received: from tdebrouw by voyager.localdomain with local (Exim 4.97)
	(envelope-from <theo.debrouwere@gmail.com>)
	id 1smH3e-00000000OUu-0QUg;
	Thu, 05 Sep 2024 20:18:14 +0200
To: linux-amlogic@lists.infradead.org
Cc: Theo Debrouwere <theo.debrouwere@faytech.de>
Subject: [PATCH] arm64: dts: meson-g12-common: fix uart-ao-a typo
Date: Thu,  5 Sep 2024 20:18:03 +0200
Message-ID: <20240905181803.94127-1-theo.debrouwere@faytech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_111817_636209_8D93F995 
X-CRM114-Status: UNSURE (   9.80  )
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

Change uart-a-ao into uart-ao-a, to use the same naming convention as
the other uart devices.

Signed-off-by: Theo Debrouwere <theo.debrouwere@faytech.de>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0f7b6ed47ca2..1e803b1b24cd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1921,7 +1921,7 @@ mux {
 					};
 				};
 
-				uart_ao_a_pins: uart-a-ao {
+				uart_ao_a_pins: uart-ao-a {
 					mux {
 						groups = "uart_ao_a_tx",
 							 "uart_ao_a_rx";
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
