Return-Path: <SRS0=Q90K=3E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A59DC33CB1
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 11:31:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6D92077B
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 11:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V4crJHHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6D92077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8K0gLzgZnmtFiXc8b8zDFnTLIfn8M3WpVL5U0NHKly4=; b=V4crJHHokMH/DH
	Z08rv+T1BTeBPJyEP1B0Tsx9NsMICoKwt7zfnvI7c8LsN/4X9FEdngx3ncB/Qeq0udkZwFqMG7IFg
	8LTIxHcw/+ijTobtG7mOZBQpYq2VVYc7wsToZyNZ2Yr47TAHbP0+6893PoKFeJafXBBWTtLSURM+U
	kCgBnQZMgpvVtL7ps5b8uJTSFwEo8aZqyLW7FyQDCz3GdPRxSVBsF8tHGe1wvKuuWDYCQjsIPi019
	XNzBY9kW5ZCzisyHGKEs9CKezIk5nWlLEJ4oJTDLKlpH/+3TrMzjGkEQnPS3wox/qr9wfAxFOhx8C
	jqpwswfZkuueLpikkLfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irgtG-0002Nc-VN; Wed, 15 Jan 2020 11:31:14 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irgsi-0001nW-66; Wed, 15 Jan 2020 11:30:45 +0000
Received: from droid13.amlogic.com (116.236.93.172) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Wed, 15 Jan 2020
 19:31:02 +0800
From: Jianxin Pan <jianxin.pan@amlogic.com>
To: Kevin Hilman <khilman@baylibre.com>, <linux-amlogic@lists.infradead.org>
Subject: [PATCH v6 0/4] arm64: meson: add support for A1 Power Domains
Date: Wed, 15 Jan 2020 19:30:27 +0800
Message-ID: <1579087831-94965-1-git-send-email-jianxin.pan@amlogic.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [116.236.93.172]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_033040_232628_95B30A6B 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset introduces a "Secure Power Doamin Controller". In A1/C1, power
controller registers such as PWRCTRL_FOCRSTN, PWRCTRL_PWR_OFF, PWRCTRL_MEM_PD
and PWRCTRL_ISO_EN, are in the secure domain, and should be accessed from ATF
by smc.

The secure-pwrc will not be probed before the secure watchdog patchset is merged 
at [6], which adds of_platform_default_populate() in meson_sm_probe(). 

Changes since v5 at [4]:                                                         
 - Move sec-pwrc to child node of secure-monitor according to Rob's suggestion
   at [5]

Changes since v4 at [3]:                                                         
 - add SM_A1_ prefix for PWRC_SET/GET
 - rename variable and update comments

Changes since v3 at [2]:                                                         
 - remove phandle to secure-monitor node

Changes since v2 at [1]:
- update domain id
- include dt-bindings in dts

Changes since v1 at [0]:
- use APIs from sm driver
- rename pwrc_secure_get_power as Kevin suggested
- add comments for always on domains
- replace arch_initcall_sync with builtin_platform_driver
- fix coding style

[0]  https://lore.kernel.org/linux-amlogic/1568895064-4116-1-git-send-email-jianxin.pan@amlogic.com
[1]  https://lore.kernel.org/linux-amlogic/1570695678-42623-1-git-send-email-jianxin.pan@amlogic.com
[2]  https://lore.kernel.org/linux-amlogic/1571391167-79679-1-git-send-email-jianxin.pan@amlogic.com
[3]  https://lore.kernel.org/linux-amlogic/1572868028-73076-1-git-send-email-jianxin.pan@amlogic.com
[4]  https://lore.kernel.org/linux-amlogic/1573532930-39505-2-git-send-email-jianxin.pan@amlogic.com
[5]  https://lore.kernel.org/linux-amlogic/07f0ed9d-0b1a-d84f-de8b-1967e56bbd21@amlogic.com/
[6]  https://lore.kernel.org/linux-amlogic/1578973527-4759-3-git-send-email-xingyu.chen@amlogic.com

Jianxin Pan (4):
  firmware: meson_sm: Add secure power domain support
  dt-bindings: power: add Amlogic secure power domains bindings
  soc: amlogic: Add support for Secure power domains controller
  arm64: dts: meson: a1: add secure power domain controller

 .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  40 ++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   6 +
 drivers/firmware/meson/meson_sm.c                  |   2 +
 drivers/soc/amlogic/Kconfig                        |  13 ++
 drivers/soc/amlogic/Makefile                       |   1 +
 drivers/soc/amlogic/meson-secure-pwrc.c            | 204 +++++++++++++++++++++
 include/dt-bindings/power/meson-a1-power.h         |  32 ++++
 include/linux/firmware/meson/meson_sm.h            |   2 +
 8 files changed, 300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
 create mode 100644 drivers/soc/amlogic/meson-secure-pwrc.c
 create mode 100644 include/dt-bindings/power/meson-a1-power.h

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
