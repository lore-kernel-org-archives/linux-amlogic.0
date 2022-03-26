Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFC6C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Mar 2022 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M1nKE/f0u8HhgnG+IDaTu4HQwWBRnkrJL2UL3usiq/Y=; b=ZvkPk/ct0N9w4p
	81YG70kynGywRUGZ33vkYEq0/1Yr2AK2Q2U+ipnsbiS0RP6b46vE7HeU7WkJqDetzJP7WGYUYmg76
	0c6Rt33Xe/HUahOd7xi4G91k1iRPI+XjwXNM+701+gnKG7FkXDu69s0euaFxLD/mVOs0Al40GbeW3
	Xjr4f1N4GKD33tKTof18WyUv50+3KloA9zDbr11BUhsMEe9A33h64Dc5MJlrsyQ7eCMl0HNTFL+O5
	jFW77JqZSFsCpxJZchzSBmZOTkE8Vdz9P4VsUfuzt9SbtlZGYsqhj5quNIlimejjDJwjp3Rmhco5F
	PtaLjb6lH5EItna8VJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY1DY-003wNW-HK; Sat, 26 Mar 2022 07:52:12 +0000
Received: from mx.msync.work ([2001:41d0:d:357f:aaaa::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY1Ci-003w2A-2i; Sat, 26 Mar 2022 07:51:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1220F33EE6; Sat, 26 Mar 2022 07:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1648281078; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=TiDvYnT5mfWN3g8TG1br43NkSPHQzI9RByoHV2yGevI=;
 b=W2Ub67EitP90ajivdcsRYinSlcm0iniIo2lnqZT3Irr5gqwsE4cnSOVhdYPxPoTFl7faZn
 9TdtyOxibZJ/+os5JX319ZWMO6agBmL6rgcSeftjsRc7UV5hfXgsW8JRjH24Abs1w7oZqw
 8dvXlLQMnsKJiHwEm7ZZmO+M5i9dRK7BLI877l2K8FU0PO3ccTXvQvmAfukNfsRvqw1yPB
 7lmWF1aC42RCSKkxgmk6+ESRWkJKG2xr8yQkXwGRX6yjyj4CoWBjY2bL3o/apC+h1rRRsb
 37Oec8m50bq3q7FOJrY20SCPqZEcnRHODHbWChH1qI+l3wSRKc6nyE79wHMN9Q==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: meson: update dts for JetHub devices
Date: Sat, 26 Mar 2022 10:51:06 +0300
Message-Id: <20220326075110.1462301-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_005127_951570_AEF9832A 
X-CRM114-Status: UNSURE (   4.34  )
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

Update dts for JetHub H1:
- add bluetooth node for RTL8822CS uart port

Update dts for JetHub D1:
- add ZigBee serial alias (ttyAML2) for backward compatibility
- update voltage regulators and SDIO config to match board's reference design
- update max freq for WiFi SDIO

Vyacheslav Bocharov (4):
  arm64: meson: add dts bluetooth node for JetHub H1
  arm64: meson: dts: update serial alias in dts for JetHub D1
  arm64: meson: update SDIO voltage in dts for JetHub D1
  arm64: meson: update WiFi SDIO in dts for JetHub D1

 .../amlogic/meson-axg-jethome-jethub-j100.dts    | 16 ++++++++++++----
 .../meson-gxl-s905w-jethome-jethub-j80.dts       |  6 ++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
