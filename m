Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD18C43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16BBA2081B
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DB6fklaL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vZ1Jf+42"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16BBA2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/1al9i0wReskcuvpfQ08GXlsejtEAYuoM4OEs7qzjZU=; b=DB6fklaLxTb7Q5
	7SNAcA3L0zWTEm5/CIsYbjxyjWHJReeKhWqzPd1cMdXor2e2s9dUCl3zjjYyOLALVQ/w35+boquBM
	S/3JlfQ7gzjGFPvP5RTANnt8+i8RbmdYqyXxmJ2UTZhfG1OqkxeZnZFzSi+xDizP1SIllaJaSLnXd
	UaDTn03dN+LcRp3sSjl4m2+vQMJz25KJyJvYHQPlWDQttlw5Z/BmpbnIJrdkkG4bk9XbAtLbrOYIP
	nCLFNPiKt9tjhX6Z+FSIQXvsorIB+VduqOIeWVoXmNDsWiXERtWaMvdGgyca0QAHV//bksP5InFRg
	/mlYv5fd5BAQW3CyUBeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1tbV-0005ff-Ma; Thu, 07 Mar 2019 14:02:33 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1tar-0004iN-C4
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 14:01:59 +0000
Received: by mail-wr1-x441.google.com with SMTP id w6so17551916wrs.4
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 06:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/OY+0phA8UpFX5vYMRqFcrzCII/hw5auEsrx9gW+lk8=;
 b=vZ1Jf+42eBeGkGkdC2HCb9PkWCpqRAS7vN/jPqRhlOy3lrbB5ISvd95kyrOW+0DIxG
 V7BVx8U13CgTAovZncs2SwK3m+82XrtW8V5R2PswqpKQa5d7sXXlOkutUCEJS5sLxBD5
 kqEvCHIhr62QJpAm9gk+06lWZIo/etb9pHv4W+ZpaNshKaMTGKPPTUJr2rGmx/YmgMa4
 ih+H7kPU0ynj9asKTDGoqj+AmlwtExoxdUHWYa3BA0fz2PNUHXYeo6bVebVnbinJ2OON
 n7NvNxeFZAkmJWlvk/4a306Ep86StormdpsNDpb4r5eF2UBMJ/lZxnicPP2/+fSZTbCd
 Yh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/OY+0phA8UpFX5vYMRqFcrzCII/hw5auEsrx9gW+lk8=;
 b=qQ3ICAWjCsiLDw82+HDr5VWSJBFNmf6wudK3kVA3odV08MNNN8FDIlIrqLSQnZ5LG1
 Xa8cwbRsM6MrYGjZoXtvGrc6cnxKm1T/IT/hef6yQxr+PZFQnVuKR8VrPqKQI+X8KrfU
 jrC0TCrPKLJp6KMJY8vHwJdrNIALoCCY0TH85wWdE2E6JLYfKNk+hJi+oOL7moSEzyOM
 9AcXIuVRJUsc9/gtY+NRPzyXC3L6MaBNHq3zN5JvKHp4xsf58YbVLjZKY6OlYlqA5nyy
 j4vbA7qYTeKPrD43OfpX/76XNjfVTRkvYNMkQchPWbk84kmM6/GFQwlL6/JNw4oX+FEn
 HueQ==
X-Gm-Message-State: APjAAAVmpx1lpEnFlrwePT9DplliKYsu9yjlRPPQ9MKOocqiRMTFs37E
 yq1eTLmC3rb07ZW3TWJ/9HhUtQ==
X-Google-Smtp-Source: APXvYqzziAutuhS7emt8QtI+La2FPbkArnKXU5544NmybfrdOSJxOwGq1zxHUQJdpywmuuqvIHsq5A==
X-Received: by 2002:adf:e3d1:: with SMTP id k17mr6926799wrm.143.1551967311465; 
 Thu, 07 Mar 2019 06:01:51 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h137sm9892098wmg.41.2019.03.07.06.01.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 06:01:50 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 0/3] arm64: meson: Add SoC ID detection for G12A
Date: Thu,  7 Mar 2019 15:01:44 +0100
Message-Id: <20190307140147.22047-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_060153_454850_109CBAA5 
X-CRM114-Status: UNSURE (   7.50  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset :
- Fixes the package id detection for S905 variants and AXG packages
- Adds new SoC IDs and Packages IDs for G12A/G12B, and S805X/Y
- Adds Add AO Secure node for G12A dtsi

Changes since v1:
- Added G12B S922X package ID
- Added G12A S905D2 package ID
- Fixed patch 2 commit message

Neil Armstrong (3):
  soc: amlogic: gx-socinfo: Add mask for each SoC packages
  soc: amlogic: gx-socinfo: Add new SoC IDs and Packages IDs
  arm64: dts: meson-g12a: Add AO Secure node

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi |  6 ++++
 drivers/soc/amlogic/meson-gx-socinfo.c      | 39 +++++++++++++--------
 2 files changed, 30 insertions(+), 15 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
