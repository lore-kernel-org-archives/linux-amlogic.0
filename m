Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDA2C0015E
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GWNWUZoBo/rdqpJAmr3VVCRLBVWu+jrXfSIME914cMM=; b=Bfhu4HZnyqW1d/
	ezA9deFPwcU+DoYVs7Q96vy8DA70zsMJmph7Lekjd9D3lh/L9zS+LP7/dby1Q54ClkngdikC83Y3K
	VTXPKbwa37lsRm2YVb9vXnzk2fhlJ+vB8AT7HaTkBEJ3NPTbBeHNZbjEYox8wQN/RJU6nl9ngDh0l
	V/lDYSasSVdXOW5LmqDLNflp+oZiXWkRCu1FYZWWj9n965mqamQMjhjHWlsEABn8j2sUvzd6gEuGZ
	O8yTKYTeDydXXgxgpiMABj0az65fOQ0H5z2HFIhTkAZFMdCTlPaFV3aHMDqk8hGstT5FGVR/xCX5Z
	s9IwL2BUnIjZmylifjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOez3-00AbDc-2F;
	Wed, 26 Jul 2023 13:55:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOez1-00AbCD-09;
	Wed, 26 Jul 2023 13:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xQ6C+IHXBibviCQrE5gbPRwFHUF9RPiG7diwiWsWGM0=; b=IqIyAurQAIOrC5xr2FaXV1Mn3I
	mdx7+lsswb2Zz0kKtL2zOpP6enUR0pQ81pZxv6gZFCOEuHnIovbnkG+Bpzos6sYFt0/yqNCQ796jC
	QgzNNio7X4IyTzHquI3SX2uOp/nuvCvE77V9RivyojzGBNrteSzIhX9cQ9Vjx3JNhadpT87sYauiM
	cpKrqNolx3BAyrrNVJssGouTOS3K5YgkpE0JoP/yf/+zppAt6a8qyvqzq1EGjlV+wribExt+2srw9
	/BKmZxhcNxFBh0ctWrjCbk3wUUltt2kG76BhUlUdvzI5tYt9lN6UpQmhPcu+9TvRJ3DriZh6sXEom
	3Ngli9Gw==;
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOcbK-005pD4-1N;
	Wed, 26 Jul 2023 11:22:44 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 26 Jul 2023
 19:22:07 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 0/4] Add watchdog support for Amlogic-T7 SoCs
Date: Wed, 26 Jul 2023 19:21:42 +0800
Message-ID: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_122242_601458_C388362A 
X-CRM114-Status: UNSURE (   6.93  )
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

Based on the original Amlogic-GXBB watchdog driver, support
for Amlogic-T7 watchdog is added.

Huqiang Qin (4):
  dt-bindings: watchdog: Add support for Amlogic-T7 SoCs
  watchdog: Add a new struct for Amlogic-GXBB driver
  watchdog: Add support for Amlogic-T7 SoCs
  arm64: dts: Add watchdog node for Amlogic-T7 SoCs

 .../watchdog/amlogic,meson-gxbb-wdt.yaml      |  1 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  6 ++++++
 drivers/watchdog/meson_gxbb_wdt.c             | 21 ++++++++++++++++---
 3 files changed, 25 insertions(+), 3 deletions(-)

-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
