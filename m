Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEF3C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 18:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jwtwmHycZNzAoj4n3qfq3JttA5v3Wt8juQUxXlmkvbE=; b=fxC26iOLE9kE7a
	n6dJFqQgSrGT5Rd3f60MwMF7+UkXwcywZ7MpHuJ8mZnC8yIlW441LYOFDzw3gXzTw8Jy8As2/SPB/
	PEdZAI0I6DdxcnPjdaCqg0YJ+iMCCf/kAhDO9rIQuDIVq5iJxbRG+URb3YsNBQas0n3sMGu9g+bHu
	YR40yQeIJ2a51brp4FHYibCKXZbSEPCC+v4CKuXUQ5X4nEMxAYeZ2q/W8ccHQseMa+QhB6irlTTwi
	vzkPCOFs9vGdkz3PBDMXJxLaXQs2hu68bUVL24+lTKpDuFm1+L5cf2RZyNIXVMBk6evAtgWtEt4bG
	3d5gKg8j9EBE09ox2zqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1uIf-00HCuI-N3; Mon, 27 Dec 2021 18:00:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1uId-00HCtD-BA; Mon, 27 Dec 2021 18:00:44 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q16so33675637wrg.7;
 Mon, 27 Dec 2021 10:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aavwzcZWj4+sjoB+pDrepWQ/BeCGF4ESyuF/2vgNuHQ=;
 b=XIy2t1vDQbwF8aH7sDa/Nfr34EonTBRdPgq56QvT39ehRdEhLCgLjPdJ5GyhNCGbTb
 7Jwi80gtFEKYSyvLHaYqiPQn1nIODW7VmWQ/HzuEktNL5OtMuT4++g3XcEBs3tcw8370
 3619XynsXB4mwdHv7Yoa20aWm/C5lWhwUCEMaG8bKIZy0BKkek2CbZMRyNx7g8/WCmtx
 NXkNR9tOayalgiJmSRx0AyU5X55mDYQ9PQZHRvQ7Cm95mi21mPpB3XnXFJvFJfmmbxTK
 a82ucJpJpHJoOeU5xKoWpt35MQBXtvbm4Qdr+PBy5AYYAT/Cbin8FOrcNeiVV6pQo93u
 v61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aavwzcZWj4+sjoB+pDrepWQ/BeCGF4ESyuF/2vgNuHQ=;
 b=jxT7wdiW93VrdVZhtnJXIQGDGANf2tKtEFlhyVq84O4jw9dJ+ERo2Gv1Bf1ahRqSXH
 qGbAc9VJJWtQnm6Bz2CctsATq/OVWcihIjJa0twtsHpTFrHGPnVFb83R3/KlG7i9fbOs
 1iAufxFEcNr8gc3eibk1GlozYhYB7PfTWS79g9oo6DJtZTRf/SKd28Uk/LRt4rga3k8A
 oIQI+KJBb2QaAx8RmYiHD+uUzbgDh2IeYmt+6IfL+id80Jd+bSVzrSigqBx452fO1CI2
 1bcO7NTIdNV5GvANsuJTcIKAI+mUYzbb/SQpBqRpkO84XEhS2Jy9Tqyu73Adw0kiN5U4
 hrxA==
X-Gm-Message-State: AOAM533wZkIUpBq2N4m6whyHBizDeyuE305HKWZbT1pPTSoJK1yln0BL
 iGS10PrzIuJjv1gQMt6YbNzHYVad1rU=
X-Google-Smtp-Source: ABdhPJyqv+WAs0c3T64zNqLQYnP29+hAfW9DYvGP+jcqOM0y7V9VWCWzZf8wl9DojymgW0VPvDXE4A==
X-Received: by 2002:a05:6000:1088:: with SMTP id
 y8mr13847516wrw.53.1640628040361; 
 Mon, 27 Dec 2021 10:00:40 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c4b2-f800-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c4b2:f800:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o11sm18572946wmq.15.2021.12.27.10.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 10:00:40 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/3] ARM: dts: meson: fix UART device-tree schema validation
Date: Mon, 27 Dec 2021 19:00:23 +0100
Message-Id: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_100043_408942_E7EA7213 
X-CRM114-Status: UNSURE (   8.62  )
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

Hello,

here are three UART device-tree schema related fixes for the 32-bit
ARM SoCs.
These patches don't fix any functionality which is why linux-stable
is not Cc'ed on them.


Martin Blumenstingl (3):
  ARM: dts: meson: Fix the UART compatible strings
  ARM: dts: meson8: Fix the UART device-tree schema validation
  ARM: dts: meson8b: Fix the UART device-tree schema validation

 arch/arm/boot/dts/meson.dtsi   |  8 ++++----
 arch/arm/boot/dts/meson8.dtsi  | 24 ++++++++++++------------
 arch/arm/boot/dts/meson8b.dtsi | 24 ++++++++++++------------
 3 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
