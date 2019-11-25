Return-Path: <SRS0=QOxW=ZR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877F5C432C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Nov 2019 12:33:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4841B2082F
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Nov 2019 12:33:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uvh3A7P4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4841B2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zWET97btoke8Kzlyf+7f53ExWUVT5iD8O9EsN7aXF1s=; b=uvh3A7P499LtsI
	AtRQUPJNWXB6YW7kRuMIt2I0u2oWjSDcNXr8fVsCVXAliRVX9NVFzt8u+Xo0RA2Qw/LU+Dc41bAm3
	yMGRsrJA1zRhpzL3qyvfGhsZQzZdx9ot+yQ2XKPAiKjYU5j3ubR7PeQVelF9MCWnoW68GdY8be3lt
	XKRYrxbcW2ZR8lPoMy+06k9kPhg029E/V6OqjdBkn3qDxOIaMvdDh8QBYGXU40sG1Uesb8ODS4xM2
	EQ+bxCWsDFSsVvxjAbyQSyAN3TRUc+P9p9ghyJwe67FEcbTw+cZcb+GDC7oqnGdrrVonhFtVu1Te1
	Jm5Ec9YXGyXgbuMccgYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZDYo-0003kn-JB; Mon, 25 Nov 2019 12:33:46 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZDYm-0003jd-1b; Mon, 25 Nov 2019 12:33:45 +0000
Received: from droid12-sz.software.amlogic (10.28.8.22) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10;
 Mon, 25 Nov 2019 20:34:07 +0800
From: Xingyu Chen <xingyu.chen@amlogic.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/2] add meson secure watchdog driver
Date: Mon, 25 Nov 2019 20:33:36 +0800
Message-ID: <1574685218-31164-1-git-send-email-xingyu.chen@amlogic.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.28.8.22]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_043344_088412_AD2E7E54 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>, linux-watchdog@vger.kernel.org,
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org,
 Jian Hu <jian.hu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The watchdog controller on the Meson-A/C series SoCs is moved to secure world,
We have to call SMC instruction to trap the ATF for watchdog operation. These
operations are different from previous SoCs, so we introduce a new watchdog
driver to support this kind of SoCs.

Chnages since v3 at [2]:
- add SM_A1_ prefix for WATCHDOG_OPS
- remove phandle to secure-monitor node
- remove watchdog node from dts, and register wdt device by platform_device_register_simple()
- remove dt-binding for meson secure watchdog
- use the msec as unit of timeout parameter which is passed to fw side

Changes since v2 at [1]:
- remove useless dependency in Kconfig
- return zero when getting left time value fails

Changes since v1 at [0]:
- add a new dependency in Kconfig
- simplify/add the return operation
- remove useless ping operation when setting the timeout
- fix some return values
- fix the license statement

[0]:https://lore.kernel.org/linux-amlogic/1570874721-36077-1-git-send-email-xingyu.chen@amlogic.com
[1]:https://lore.kernel.org/linux-amlogic/1571387622-35132-1-git-send-email-xingyu.chen@amlogic.com
[2]:https://lore.kernel.org/linux-amlogic/1571983984-11771-1-git-send-email-xingyu.chen@amlogic.com

Xingyu Chen (2):
  firmware: meson_sm: add new SMC ID support for accessing secure
    watchdog
  watchdog: add meson secure watchdog driver

 drivers/firmware/meson/meson_sm.c       |   1 +
 drivers/watchdog/Kconfig                |  16 +++
 drivers/watchdog/Makefile               |   1 +
 drivers/watchdog/meson_sec_wdt.c        | 207 ++++++++++++++++++++++++++++++++
 include/linux/firmware/meson/meson_sm.h |   1 +
 5 files changed, 226 insertions(+)
 create mode 100644 drivers/watchdog/meson_sec_wdt.c

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
