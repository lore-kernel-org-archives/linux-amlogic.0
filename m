Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FA4C47DD9
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2024 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+cd3mScFqUYp5JvkE0oprAd2ehP4lmm8AjVZrafBHms=; b=hXEdgiunr9xFIa
	XXy9aSTPe74RSm3wLu4ZTxJVLD39B+6vZ/G3VbKRhqkvhAxi3h9Q4T62njSkokjTQDaRYVHygobb5
	AltjIBN0xxvBTrAKme4FLWveeSq8/6Bn7Dn13cWHg1Dz2Vxr861dlwMvJ7PAxavgC11/Na7zZwr3o
	Fl+GjZePmTDIXV1BZUCMuNhPbxaHNhIDLNIaor1wFW4S9bqNnmaAkj2uBZBTpR9G0qEbFjJBHaSy1
	pua6TbEjpwEngfThn0Y4RoMejh/EeA2xo51zKPC9N/axwZD+tyEorSsRcHFMacMSU5ip+LmD3MiMP
	rwjqG9KJJjQoPbSlIoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roPd5-0000000CqCs-05mY;
	Sun, 24 Mar 2024 15:19:23 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roPd2-0000000CqAR-2dhI
	for linux-amlogic@lists.infradead.org;
	Sun, 24 Mar 2024 15:19:21 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d4360ab3daso60260111fa.3
        for <linux-amlogic@lists.infradead.org>; Sun, 24 Mar 2024 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711293550; x=1711898350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ovYQFvlq3mePJe6rO637zUtVNkzpO6QrO028yw8E5bM=;
        b=ZvqBJxa5frY6klSJvTuuzIgwl0koYrBTG+fVDNwx5sMc8J4ngf2qv3FrLuabItOHqc
         uk7AdDCy4Px1NJIabew62/kFYyW6ouArc3gkIKb0BjfgfoZSn6zZ2fZ1pg605CuFmPzg
         VoqHHWi1o/E/GmOiXfhCTq+MhkwBjksOcwm78AVBfiBOHsyjaQ3QVHcH3777MSx2PWCi
         hm3F0tLnkgOH5rKLBOvC9r1mUER+gEraJf12iop686O5f4Poy5tvAG1+R19UTQGY+DIm
         fcfkD2zGRKsEQ03cMu4g9NppwWwjHgZ2cOnDIR+78CYA0DBBsD/vjIUEQbpObP0nww6g
         VlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711293550; x=1711898350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovYQFvlq3mePJe6rO637zUtVNkzpO6QrO028yw8E5bM=;
        b=xQikX1eKHaSJywhFrNmveTR1VRUOOlplMtrz+gQrnbxMwvlGyDsTOUDyNkeDiadgbG
         SCPqPghXMtoSMvOWVR9BKaYJTGsA98/wDNSqfAg0voFe2QJVbc6Xd9BvSJ1GM0eAsO/U
         pQtPgdPE3BOV3/nbgW477vXq6NyKVvbpvJehHoGOAoxoJliubhOHJpivmmkFZxJFe//y
         ezaxmst53BFi5JFzUYt0DAg6W22Y8UrweeLBmoSXngqykzZQZXWLRTt4lr3WTwTnw16O
         YEeWoMoLQiHfn2KC7GhlKIJhD8prsdRfrsvMCTpxr2phdwWazlfyuBuXOzu5oXA7yOZR
         MvXg==
X-Forwarded-Encrypted: i=1; AJvYcCUG+72UEgWw6reuLw/A0Dti50eeHyk8y56Um3znG0t4f59j3M2UHHDNjcJISrWYA/ljIJzXG33xIuxmzv0JOdTF+V9baEmqt2n0u3yJ+rFceBk=
X-Gm-Message-State: AOJu0Yz5BJwt9KaX6CRC/BPK4VNEtVS0Y7NSJC45n+J7ZExmTKhSC6C7
	ZZx32bW4DyANBM2CJ0XM6/Qdg1gBmU34ZjkvHI2vQTDRBAfhgC3l
X-Google-Smtp-Source: AGHT+IHvxG9SMUjnncSUNvSs9rktVG4jV639ZxavzgSpTs/MknCviYzx9CPubScE1BGDThkrdOLmYA==
X-Received: by 2002:a2e:bc1e:0:b0:2d2:eeda:c019 with SMTP id b30-20020a2ebc1e000000b002d2eedac019mr3566205ljf.28.1711293549955;
        Sun, 24 Mar 2024 08:19:09 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id o26-20020aa7c7da000000b0056bf34d656dsm1996114eds.29.2024.03.24.08.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 08:19:09 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/2] ARM: dts: fix Ethernet and random MAC's on WeTek Hub/Play2
Date: Sun, 24 Mar 2024 15:19:03 +0000
Message-Id: <20240324151905.3817732-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_081920_680488_2210EC5A 
X-CRM114-Status: UNSURE (   9.40  )
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

In submitting the original patches for WeTek Hub/Play2 I appear to have
squashed an experimental change to place the u-boot.dtsi file on the common
board dtsi, but this was incorrect and results in broken Ethernet. Patch 1
creates per-board u-boot.dtsi files to fix that. However, while the NIC is
now probed correctly the current p200.c board file doesn't find the MAC in
efuse and we get random MAC addresses. Patch 2 adds a fallback method for
generating a MAC from the CPU serial.

Changes from v1:
- Simplified p200.c changes
- Drop patch 3

Christian Hewitt (2):
  ARM: dts: fix Ethernet on WeTek Hub/Play2
  board: amlogic: add meson_generate_serial_ethaddr fallback to p200

 ...u-boot.dtsi => meson-gxbb-wetek-hub-u-boot.dtsi} |  0
 arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi     | 13 +++++++++++++
 board/amlogic/p200/p200.c                           |  2 ++
 3 files changed, 15 insertions(+)
 rename arch/arm/dts/{meson-gxbb-wetek-u-boot.dtsi => meson-gxbb-wetek-hub-u-boot.dtsi} (100%)
 create mode 100644 arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
