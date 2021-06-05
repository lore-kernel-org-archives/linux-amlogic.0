Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB317C4743D
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:49:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0BD5613DE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0BD5613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jlhYaEGTRXTpns5dy/CIKswVU19DIcdWGILSExzoLSA=; b=TW7+Npgiuce2Rc
	y0k9sUIKp1bJkyGcks4MBQH5SdpbP2HfgH6wy53cL8qBLCZ+GwcADBs0OiHB9ib4bUK7qArYjyMG+
	qWu+cvMCpAFtOMET2gN2f9qHqgqpMf0z+plrWeH1A5KmkRgiFUFxi7L4BheEWzEXdVO822p5mqY/q
	y6YYcgPDKZZBzDrnLazXvL4OXmG/o0Fwd0n8z05zQSVYgwQp9KiZ6Q9fXv2EKyf97GuMLQr4vDPUL
	2Be3g4TIse3pt/+SfuvZpcLOYtzHtiRNPYm+9Vu4jEm7DIfrrbbcOohmxKiEzNb7meoaz6VukvOH4
	WzxQU+5XOg87EQBa9Pgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpMNe-00Fs3q-Sk; Sat, 05 Jun 2021 02:49:46 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpMNR-00Fs2D-PJ; Sat, 05 Jun 2021 02:49:35 +0000
Received: by mail-pg1-x52a.google.com with SMTP id r1so9302142pgk.8;
 Fri, 04 Jun 2021 19:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mRLzIEsUR/L5fTfNptj18L/QHNRpPol1gX/tfrGQ/rY=;
 b=vMtZvGvWgJh+MLhz7vq0Y74RYOtTWMAPvRvxDTrqQDs2+ZT9w5fR8TUG5ng3JsD9JK
 leWctDXqLGvy/VP4wbzyZIxUmXXKT8QpRYc52m6kbmuvEGU6C1LbXp/IHo5RE67FBmPA
 gDt1Bi6AxX6d8Sn5LBVfvamQZ3JZz7/wa2zQ7tLHp6dtViirrKblqdHttO7/kr4g/11T
 h4nvD0y7ffLByCi+FwT1fxmyt4m1CB+t27VSQr6tN9m31QdGouIVjeszX4z+6ugaKk9u
 AnSBUKKxdzTXx4scqzGSjI9lXpo6a6yeiwrNF1RcigZ5cn/Rq6rGTMYm0vU1sfsHTgJ3
 fHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mRLzIEsUR/L5fTfNptj18L/QHNRpPol1gX/tfrGQ/rY=;
 b=cENC8zylCebkof/I3dO8Z6vhKlGDJU84XpU2Ev7rAPmRGxDVe8O1FcvNNdiMZxLjFh
 smjtGC1NzU2QD35sAG89fj9FeyffGf24wPCVxoe4JN8NMwvXpUoCMOGYc4hAphY4tBkM
 ySSGL58KSm0vkYJhZHFTY3+EKS3Q3SYjzfX+/Wp0r7XY3u+/0K7SbqNjjCutY5ohGTiP
 qSs05zGPqwHQjJK3rZiXkFzljHaTzGHX7V6LiBQsnEVfoNC8WPbbjpTz7YOQzvUaa3h3
 cEer6wAeK36S/dXBrDa2jQaIXCry3bxqVHcHaQ29dyECYUtubU7vXw4kUSpdD9BxlcWG
 OiRw==
X-Gm-Message-State: AOAM533moxrBB2JGrxLa4meRZiTbWELVV5IzG78LO3mvgf8dYCitM1HQ
 CHKhCRx0WalRy6GBSJNBatA=
X-Google-Smtp-Source: ABdhPJxm9uoxknYZibq9O6eZFPQl4/Jall6FyznwGPG2SrqNbe8NsGSDieW5gBEdxzRGZLWc0futSg==
X-Received: by 2002:a63:5a5d:: with SMTP id k29mr7676812pgm.215.1622861372959; 
 Fri, 04 Jun 2021 19:49:32 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id y138sm2938553pfc.11.2021.06.04.19.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 19:49:32 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH] arm64: dts: meson: vim1: add i2c aliases
Date: Sat,  5 Jun 2021 10:49:26 +0800
Message-Id: <20210605024926.410043-1-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_194933_852574_9387C212 
X-CRM114-Status: UNSURE (   8.11  )
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

From: Nick Xie <nick@khadas.com>

Add i2c aliases for Khadas VIM1.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index f116a9d91633..d175d6cae535 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -32,6 +32,8 @@ aliases {
 		serial2 = &uart_B;
 		serial3 = &uart_C;
 		serial4 = &uart_AO_B;
+		i2c0 = &i2c_A;
+		i2c1 = &i2c_B;
 		ethernet0 = &ethmac;
 	};
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
