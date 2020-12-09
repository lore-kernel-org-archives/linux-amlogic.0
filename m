Return-Path: <SRS0=MYre=FN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74508C4361B
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Dec 2020 07:47:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2774F23B86
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Dec 2020 07:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2774F23B86
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FBDyQLzpINnPtj/BBQkbiLO55CSIKgxbQIdZtgS0XY0=; b=c1OVzbiNdjydYd2er48QnB0fxf
	NhUgZe9btOtbMkwOUMgWytwW9QauxAihyyaijwIHk7zil3fN2rHXwF2jilmYsqJ93hMfWywpHQraG
	0p0CxTIEHFSBX21r6avUAxHG7OWPJ7R2dCtRpXvA2t2TEvj1pnv0XTJ7WYh6Mz/Q34PTbtqA4R33t
	GR/Ob4AeP5lOsa98nPO/otDWztUPdY1PCy2ISJO8n0fuFcIQVXTwhzHNN/tPEoGk6ye8CaRXFqtzH
	dvBDqlsMCCZJtjhnlnJYkLO+if3KlFRv9EhiBQ451JnrZj3iEfIpAVCC/JxTsR0Rscepy3N7UHsuH
	vs+1XCHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmuC1-0003l4-4F; Wed, 09 Dec 2020 07:47:21 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmuBy-0003jz-W6
 for linux-amlogic@lists.infradead.org; Wed, 09 Dec 2020 07:47:19 +0000
Received: by mail-ed1-x542.google.com with SMTP id k4so511591edl.0
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Dec 2020 23:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vUdxfkrGNNo1FQF9h31XnihJ3y4Ce36/DE99SxLOEN4=;
 b=bGrV5DiIZKcVT0Gqqw7i2bRWbLWwLyR6mnhe+fZmJTZ8Y51HGfViIKPBFFw9tSAWao
 L1U+AxUyCuqECRICZCdgrhQRLagai+A/HFjKWITuhjeTOHRDW6dY+yh8h0oYpDYFuN9R
 VBCkUMm8w6zj9TA2WYPhzssQ78984Y/AshzOl4n6fj/Poq08iKKzCl3q+xRYtbmOk8y6
 gAHj4R2I0ZO5b3oR40rap/7WLxnccrLAP6eGEjAxQWhcjayaqVFi9Q8WLCjh2C8zN6OZ
 HHAWmsyhyXz1ht5VeMymEP78/7NBuMRWwHB+Z2Q/ZKyK0CTbswU67a0eGqOYapsMWlsw
 1QlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vUdxfkrGNNo1FQF9h31XnihJ3y4Ce36/DE99SxLOEN4=;
 b=XSFyngppx6t7pxqWYWhyIyo4j9nY3PXZt5yVRy3T3fBnjgrATQZfn9GNf6HzBC+Fy/
 PBD3GRIwkELYmHg68JUjpVlW1tiMbUgvsfK+tmDlHs8kAWjhHI06IcnO3UMS/fvEWNuA
 NyLtpWOsM/pNjzGASlLaAcW4M0mZkXv5t2sEMTSsjyf/aIpxI6HMO7aeKtJFW0DU7EFY
 9T4GO7SEMiT6rARgb2dBVCHpYrrEYhgTmuS5VtiDRleQ/+87/glb5QrPQzHmVnoMoa9o
 z7ySF0ExkD9CdG4+2/RDnnURjicBWhjXGSD4GgQ/a3pCtwj5J3pTIT7Hsui083vXJ0MR
 jgkw==
X-Gm-Message-State: AOAM532uQRnLIEoRN+uG6uDhPuoJPDhZI4E9/5q7jRKhUmE3ycnfz99E
 SVmvQf1B4/o4YaZYgXy1prw=
X-Google-Smtp-Source: ABdhPJzRUVwqvvYMGn7Q5wEQjFknCl0J9KFE+fWL45OvQrRbCU6SJw0LKaabiA09tJ4CdpmT2J/TQQ==
X-Received: by 2002:a05:6402:1d15:: with SMTP id
 dg21mr828807edb.280.1607500033479; 
 Tue, 08 Dec 2020 23:47:13 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2db8:be00:8188:da9:1e3d:a30d])
 by smtp.gmail.com with ESMTPSA id eb14sm723692edb.20.2020.12.08.23.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 23:47:12 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] media: MAINTAINERS: correct entry in Amlogic GE2D driver
 section
Date: Wed,  9 Dec 2020 08:46:58 +0100
Message-Id: <20201209074658.11557-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_024719_045686_E74A94F1 
X-CRM114-Status: GOOD (  12.19  )
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
Cc: Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Commit aa821b2b9269 ("media: MAINTAINERS: Add myself as maintainer of the
Amlogic GE2D driver") introduced a new MAINTAINERS section, but the file
entry points to the wrong location.

Hence, ./scripts/get_maintainer.pl --self-test=patterns warns:

  warning: no file matches    F:    drivers/media/meson/ge2d/

Adjust the entry to the actual location of the driver.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies on next-20201208, not on current master

Neil, please ack.
Hans, Mauro, please pick this minor non-urgent fix-up for your -next tree.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b20babb9f7b..d66bf50fc640 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11520,7 +11520,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
-F:	drivers/media/meson/ge2d/
+F:	drivers/media/platform/meson/ge2d/
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
