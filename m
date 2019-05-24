Return-Path: <SRS0=5BKV=TY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EF6C072B5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 09:16:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B2B420879
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 09:16:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qeZUPLUP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="S14lc7U+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B2B420879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZSwurZa1WLYhri2oQ6xUuGJweBSUexp7/Jf5BkrdYdU=; b=qeZ
	UPLUPco/NN57nkwHPq4j0v0oW8vZJWSj0vzPfjiy9mfb2qcUhrDPvH7gq86tG6kMVhSoA8ndUed8b
	8h6E1GNbP5Qq8/nbKbMTDpbGuORjTrN+fO6JWzZcIM4I9DasbOtnJ9IFwv86xozgZHDb4aUid2rD/
	h1UaAwBmlf3LGdOW/rJGdGZfUoW1uwh1wflQCE9B04O/JYRmUrE6tyNFjPDn1nZKCSEvMppCFa909
	f6ewlY9UXYlmOjNfyt7l4GyvN8rfhy1wsUM8hzrTisrv4WLeDwSkQwJAsEFnszdVzw/4MKZGKz/RC
	ODsok6naQaeGXRxE189Oqsj7BKICFkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hU6JQ-0003Ie-Ln; Fri, 24 May 2019 09:16:28 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU6JN-0003Hq-7z
 for linux-amlogic@lists.infradead.org; Fri, 24 May 2019 09:16:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id f204so8576805wme.0
 for <linux-amlogic@lists.infradead.org>; Fri, 24 May 2019 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=PT0AaQP061TOYcM2hXnRk+ed9dR7uRWzdoW54xfdMmU=;
 b=S14lc7U+KF5ITtN/juxsI4VUUpiAX5EFgZZHhY+92XixdwAcaaGuS3aFVdGLJey4ya
 0iwt9oHOhWEkC++aEDGPahApNIo+10e1G5C+c4RWoCXzYG7ZQ0uXKCeuhO5PczfkS0C5
 96Gry102lZ7RNTIllChSbxObTtRHoeCtyWLVw8T2UoHpkAWeriKLNn0+TZeL183YWqXB
 kf/qNMxQLcj9xY5h6GcH4V4rrK71oOFrjiJR/hx+21jurNlvhl/WRou+9+jVM8SixMtq
 PJx9SWSrvMHEKbT0EH84ve4cD9CLg6aNpykylVgqi8DQnwuFVdZVVpnZU3vIf2llXPUR
 AF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PT0AaQP061TOYcM2hXnRk+ed9dR7uRWzdoW54xfdMmU=;
 b=HYkOuBvnN8Y5lCkidxpPhAUFbpIn4Oq7vStoS9GDSBAlX+HCAXoaYQs3SBiYv2JF02
 CbU/YeUIoZAQzqoh/dTa1YlPaiXkBNuzZp011JYVXz1Ywf7lZLyL1Xx6400Wzl6KBCO/
 pknHiKkIXidVTVG8GI4c/4ZdOMdgSpdW3JHlULEyrSGRoCXB1itBF+yE9BOBpsQx9daS
 xlx0FnmaaPk+b+i+avx3srXGpbme/h9mZ3435fI3LSR0lJhxT+iMwaRJh5qm35mlhLR9
 80fJFDYEAhanwZKnat4dZN9pXdFUprSRTTYkdn/GZ6865rV5F6V/rWQ9cQrAc0bVa9n6
 faNQ==
X-Gm-Message-State: APjAAAVfIQoYteZBh3s4Vf3crxwC0u6KM5hZ3d3gyg5iv+t/1f6qSw1b
 UWjxiI+5BIa1ZaSFAESMqcCbtQ==
X-Google-Smtp-Source: APXvYqwdUQtjD//cAN8dDTVeReAe0AvEoQ2TL/mHEjeOW6pNZC/JiI26R2WDDxPurMjQS0K+blEyaA==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr14731074wmk.67.1558689379211; 
 Fri, 24 May 2019 02:16:19 -0700 (PDT)
Received: from pop-os.baylibre.local (mx306-1-88-173-34-203.fbx.proxad.net.
 [88.173.34.203])
 by smtp.googlemail.com with ESMTPSA id d26sm1822903wmb.4.2019.05.24.02.16.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 02:16:18 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: narmstrong@baylibre.com
Subject: [PATCH] clk: meson: g12a: fix hifi typo in mali parent_names
Date: Fri, 24 May 2019 11:15:32 +0200
Message-Id: <20190524091532.28973-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_021625_287849_41143EBB 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Replace hihi by hifi in the mali parent_names of the g12a SoC family.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Cc: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 739f64fdf1e3..e16fe882789e 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2369,7 +2369,7 @@ static struct clk_regmap g12a_hdmi = {
  */
 
 static const char * const g12a_mali_0_1_parent_names[] = {
-	IN_PREFIX "xtal", "gp0_pll", "hihi_pll", "fclk_div2p5",
+	IN_PREFIX "xtal", "gp0_pll", "hifi_pll", "fclk_div2p5",
 	"fclk_div3", "fclk_div4", "fclk_div5", "fclk_div7"
 };
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
