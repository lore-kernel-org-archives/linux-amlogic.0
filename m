Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220EDC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 08:51:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E47622133D
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 08:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NzVhpb+V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="H3XUO09m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E47622133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EzGGaBRLtR+lb/iu7rLkjq4e7pecvjXOXtgdmnB3jNw=; b=NzVhpb+V0vQFde
	RhIc8texDbBNv+ayrge5iwSTvtQw3Z1fQy0hCOBnDfpjkpJDdikkzl4r6IalTdSO6KWgP+hEmB53U
	8I2AVfdWC1WCZGozumNk6p7BwkWeXlvabeIxdXOplIbu/ZV+r8r0aaf7Q/0DsOnvEk+PQpskV1iD9
	wsXnWjl/zuURCyPzpKjxYnG63Bt4prgL54eTUByE/RqibEuvRHOZfMzfIQ+6VDaIKFmqh/2nGU8Q+
	TDKZOfCj3A/OjMhP819VNlh1MEDRiKXxSl0m2vnIZlFLAWMie0yzziGm/7kg9IvQ7z/fm+BnzDQY0
	uiEyIVMwYXeeUdCNFIWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6ASf-0007nr-2L; Tue, 19 Mar 2019 08:51:05 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6ASS-0007bT-Mj
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 08:50:54 +0000
Received: by mail-wr1-x443.google.com with SMTP id o1so674166wrs.13
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 01:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mTg1vloqFMMJ8QwUD+aqjv6FfZlYnVseq+YEtYp0RWo=;
 b=H3XUO09mg8XnByAzQhDw7fx5uCElfq64oTB9iOi2WRFCLioc8X3uVvLVxIoIzdV6XY
 XmCN65foiQLWLsVqHtCrifVByU75br9d0ieAlPk0umaHhBWFTJUFh5M+HdgCzFP4od6W
 mHBWQkZpT4vnEP3D+yJNbc7JaJn6RFIfHp2pFtW6SLw8D4vEV8gnJaCNe4KMQG9I+4bc
 lRImh5ljKNXNdJ8dH6WwR9xuZ/0TB1BfObQxOR6Wsbw0Oe14q2m82PMGBWDG4Jp8Fa80
 Pq7cRn0KYWH2bcdkjBhcmeKvzZBRJQ4I9poBGnddwgTrpe+Fld4zbRtade+/NI0Yu8Dy
 XiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mTg1vloqFMMJ8QwUD+aqjv6FfZlYnVseq+YEtYp0RWo=;
 b=CLvmgAW6449kKqa8kXNS/SuFXNDUx2QdjG2E9f2mqa8D7S55pB2k1DynZaEnPO+zf5
 AZUr5FdgDmfT0jB1QnJz1lJTwwzNd/tBe3B9nTJY+gQ9D6l1ogo4Lg1/xzNyOOrPbk9h
 /DXHyRKGv41ll9AeebLWAsGqsIWz7RCxA+yZqg5AdqIATHduAMl+cvKfCx8MW7rWXxVV
 87G8zmXgOl0kAz2uCcCn1XJXbNe7vQqVccdw/QXu/NEsI6uruxg5+E/iNaWBCOWb136d
 mGqohNT8L9pvvooX1Dhp3a7lOhyMtUQayuCu5J2AD6CbKBgtP0+93kQ8xLKoO8HNfgRW
 QjSQ==
X-Gm-Message-State: APjAAAVsREwaQEgXMy8E1+EoM3YBIqbvMxkITLa/sAWgGHUQKfgs3Cb0
 yTrFD9vA+sX8joHmFyB70RBRvg==
X-Google-Smtp-Source: APXvYqx2PL0gMKAR/SMA+Wmdxf8KEE1HQO+g1Z6xi11rQwmzHNtsTNIVTDdaYlUSNImb9hXzjTHe3g==
X-Received: by 2002:adf:dd8c:: with SMTP id x12mr7204479wrl.262.1552985451124; 
 Tue, 19 Mar 2019 01:50:51 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id n4sm9411047wrx.39.2019.03.19.01.50.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 01:50:50 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] clk: meson: add video decoder clocks for G12A
Date: Tue, 19 Mar 2019 09:50:42 +0100
Message-Id: <20190319085044.8581-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_015052_788592_BD05AA99 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As to not conflict with the IDs, this patch series is based on Neil's
last unmerged patch series: "clk: meson: add support for PCIE PLL"

Clocks are mostly the same as meson-gx, except for VDEC_HEVC which is
now split in two, HEVC and HEVCF.

Maxime Jourdan (2):
  dt-bindings: clk: g12a-clkc: add VDEC clock IDs
  clk: meson-g12a: add video decoder clocks

 drivers/clk/meson/g12a.c              | 160 ++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |   8 +-
 include/dt-bindings/clock/g12a-clkc.h |   3 +
 3 files changed, 170 insertions(+), 1 deletion(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
