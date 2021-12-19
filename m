Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1988EC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Dec 2021 15:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6YytcZccXFU4lgXLv3TeVBiNri2xwWJJnnjXx5bulGk=; b=gdhDwi1zEOovnU
	uMTmeRgDw0ExzLUlfDmohoHkbnPO96g5vhbTUJAo/zfsPTClRYlcn435OVNuwsdZuNnXdG5tAx03q
	0oIJphpto01k6Prua2DyCbbWHqjGB8xx+FlPtVY9sS9PXz7t3B6lpy+7QvyrztJ2SJgF8HpLEMex5
	NL848xH6PofazaLAaNuWoAdK42F5SOrH3ETYs2DjXse5Skv/nIyoYihlJS9L9YZ7N7LyOk2G6KgYs
	mpTX+Vmz/B3n6468+p4YtpuTG7xwHXsmDsR7yrM3FHdCUgnXsOeXcb740lgDgX42XAb1db0Jwzxgq
	3JeNJ54soGgHW9uwg2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myyDC-00GF61-Jk; Sun, 19 Dec 2021 15:34:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myyD9-00GF3D-Dj; Sun, 19 Dec 2021 15:34:56 +0000
Received: by mail-wr1-x433.google.com with SMTP id e5so14888569wrc.5;
 Sun, 19 Dec 2021 07:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8dfUL1c2VpDlpvRYp5J5tnSJmcolhRv7cYP/WcyTXpE=;
 b=P979BzXr3RvgooocRWemgZtMWBE1vmonRBBpWRWPBLJdnSm2YDpt5AWwBj942XdlRj
 CdHrU58tMcKYZps7MJsO/Tjhf7jIT3CD+1nmQMAYYUpBtLG6bI3rkD+FA1RnIvihJlh1
 KoZ0mvBbeJjBDttpkHy+yG1Ua4GCOI0xe6KeIlVXaphyFLTUVl80Z8hgQ8lECUy3d9to
 aRT68rBoHzyiFk3wVutHwzoCTuljfqHZhLK7E2AITRHyMtbf2whuAXUyfKo5sDK0KK8+
 nYeSCQhsX860SGCYBrkTJ5muXFaqNO/MqsDTpRSks60FCkFsPHRXTncZHeWvKjRZRvqa
 VUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8dfUL1c2VpDlpvRYp5J5tnSJmcolhRv7cYP/WcyTXpE=;
 b=ANOLodekooDVJ9R5lAfJs/azEjq7ZTW4BykINt/hVR7D7Cf5GJRqHJMBil6ufFxnU/
 xeWyk+dJ99+0v67dmtocJ9ZaZbdGsAWAgUlfuYmHq4wyqRYYh2gWWxiyMNJyQrX0hNDF
 sGUAYfKoH/ApKRfruS593spGndwjtVMa1LHuTp+C/eQL2naNdJ1kUri2uR6+0hJXMjTz
 WUmMPFe1MWJlcGBXKmf+Ym2tFgSejp2Agi4y44fYTEdFXqxkfvxm1PV24o5PjZ3Tycv2
 puKdqh5qhoEIBzhG+QT9NVJiIqaAmv+hen5YpFHAsSIIXpA4XIFlGwCs0gaXL8zB7/uo
 SYrw==
X-Gm-Message-State: AOAM53002+yIByN5dPGs/GbhBKjbUdlsSOBVtC6ba8zBLi43ubbskCtm
 H3F0KB6i+12nbzc6IFEckQk=
X-Google-Smtp-Source: ABdhPJwB7cEhF+bnXpjr5aVYXXD8l0Z47msYuTlJCyoYNFxn5ax7p6hw3dg5/wQrpgfhKAQvqdoASg==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr10007446wrg.118.1639928093752; 
 Sun, 19 Dec 2021 07:34:53 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-721d-8f00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:721d:8f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id d2sm9262020wrw.26.2021.12.19.07.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 07:34:53 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mmc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ulf.hansson@linaro.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/2] mmc: meson-mx-sdhc: two fixes
Date: Sun, 19 Dec 2021 16:34:40 +0100
Message-Id: <20211219153442.463863-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_073455_506797_86BF877D 
X-CRM114-Status: GOOD (  12.40  )
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

The first patch in this series fixes Broadcom SDIO wifi cards (using
the brcmfmac driver) on Meson8 SoCs. Meson8b with Realtek (RTL8723BS)
SDIO wifi is unaffected by this (it worked fine before). Testing was
done (on the S82 board) in private by a user who wants to remain
anonymous.

The second patch in this series is a minor cleanup which I found when
working on the first patch.

Changes since v1 [0]:
- Drop SD_IO_RW_DIRECT from the first patch since it has nothing to do
  with the actual problem. That command was carried over from the
  vendor driver. The patch description was also updated accordingly.
  Thanks to Ulf for spotting this!
- Add a comment to the manual_stop variable as suggested by Ulf


[0] https://patchwork.kernel.org/project/linux-amlogic/cover/20211212145956.1423755-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  mmc: meson-mx-sdhc: Set MANUAL_STOP for multi-block SDIO commands
  mmc: meson-mx-sdhc: Drop unused MESON_SDHC_NUM_BUILTIN_CLKS macro

 drivers/mmc/host/meson-mx-sdhc-clkc.c |  2 --
 drivers/mmc/host/meson-mx-sdhc-mmc.c  | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
