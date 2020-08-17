Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2537C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF7E2078A
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="koHyRFbS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4GqF5NO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EF7E2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uvisNztHjOltn6byE620YK+6UqGbUUkqwV+EYGQfbXY=; b=koHyRFbSF3hrEBPc0ngmgKFvNt
	fLWX5LIakZMuFZfJygwjkb+hDKjPCNmnCkQswXuuRldTMEuGDKgr1jA0bFi7PPdMAs76oMXlX7drj
	F2/OiMZxmRbGf44SUjGEyOWdLXOWsZzCmO/bPxU+heI/S7BSrHFzRmurDDdAajxt38YPBEj19SNxq
	puBa83fcFZpU//TzWSxHCSFoQ4nJ8w8ozUhcczbB522nAO7FoCOIRIkvEUMn/AGCZHF5Ok+a15fm+
	yeKq5UbLLODcG6M6+SYl1JQj3f51mq+XWScVMgMkd4uFaKr8pbJmagymzqlShbAzqxMYxLngfIJY3
	WQvSGDPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7cGp-000412-95; Mon, 17 Aug 2020 10:21:39 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7cGk-0003zL-FK; Mon, 17 Aug 2020 10:21:35 +0000
Received: by mail-pj1-x1044.google.com with SMTP id t6so7478673pjr.0;
 Mon, 17 Aug 2020 03:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xpoWiliSmrbipqeuKM+mM8kPpOwLpaoBEFDiLq2xgJY=;
 b=l4GqF5NOjVIChV2FDW6BmD8k8kUchapti9+rFjvlEp+PqHsX6f+jgFW6i6vQ214Wla
 AdGDGjdfHFzS1L4pveUXQaeqGmM0VztRVUklZK1zb4f8VCJ1IFyqnqtJBmQtzRvlGhSP
 2U3d0o013kf91U+VkcBzK4kz0h2z8pHzilaH4PRbbK68/1yXdq4UXS8lfxZ3E6v+Q9mE
 X//mAFOksJ/IdUS+q2vKX7LgtFmxTm3Cn6uipedKtxX1OhqM8taYuO9IFOBBO/xqk0ga
 NmsbMgRKkvLi3VgqMHbVu4XHxDglJHTG51m8tZxKE9b/RAPffr2I7CMZSo+wt8qX6VqH
 +9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xpoWiliSmrbipqeuKM+mM8kPpOwLpaoBEFDiLq2xgJY=;
 b=HyYi0OhWn0r6WN7XEgxDEQI64+EO+8oHKKarsDlkWF0KQKSIlNHiOv1Krt3qahe5VA
 xBi+IkKm+e+1UNjkwJUMMNLfLMtzRmCPnqxZ17O44Ug81DcHU1M6PpC1UircW8tvnZAG
 KQLwRWKgdMU/BZgVGp56OSlD77bJeav2uXQy9VvFauLD1xHE2Sjz1cDeEnR+nvzPuciP
 FUoa2stCnfIxC7ncld9ieSEokCOJM/D+Zk8APWUpltm06ZeO2ZVHwEvRazRceVm5aw2i
 7NtGhAc1nVMv9QIIIJCEiX1kvFCD4OxAgjsG9vyP52ByUSDRcjfk4dRZbmpvxlioTED9
 4q/w==
X-Gm-Message-State: AOAM533b/4kmjhism0e7a6m8iKmh1aCgMvjp5AC7xIwWjR34xuE+6okw
 oS8SBzNyUCcL1lGUnUwO88eoIU9BVfE=
X-Google-Smtp-Source: ABdhPJwZ8okcl7vz61PX8StuiQt4c10YNQqMN7HUFBmEFtzsUgfR/OjElvgZy+MCCRQRH7sZ7g4K5g==
X-Received: by 2002:a17:90a:4e42:: with SMTP id
 t2mr11723381pjl.121.1597659690866; 
 Mon, 17 Aug 2020 03:21:30 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
 by smtp.gmail.com with ESMTPSA id l67sm16773206pga.41.2020.08.17.03.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 03:21:30 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/3] Enable RTC on Odroid N2
Date: Mon, 17 Aug 2020 10:21:19 +0000
Message-Id: <20200817102122.434-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_062134_537507_A1C91411 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Inorder for test suspend/resume feature on Odroid N2
we need to enable RTC module on this device.

Changes v2
Fix the missing INT pinctrl for RTC.

Note: Now the rtcwake feature works occordingly,
But after resume I have observed a Kernel Opps
Hope some body able to repoduce this.

-Anand Moon

Anand Moon (3):
  arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
  arm64: dts: meson-g12b-odroid-n2: Disable virtual RTC driver
  arm64: defconfig: Enable RTC devices for Amlogic boards

 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts   | 17 +++++++++++++++++
 arch/arm64/configs/defconfig                    |  1 +
 2 files changed, 18 insertions(+)

-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
