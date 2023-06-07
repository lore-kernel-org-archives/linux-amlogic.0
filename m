Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AC4C7EE29
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 14:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C7Vo27MrJ8UwIQ9mhRsmiUY7wr4V1KlQEewiNn3zQR4=; b=XOuHYG55VI8WaT
	9OFyHfXaff1Ok3+OnCgluVl5/y3cMj6PsqWFrUZdy2Jt2Ivs+eQrBUshWLXTDI9hrezGx21uSvwBP
	3SBBzrIyqUOcsA3k6MNOmPQ8cHd/JfcFiWw4Z1Nq0Ss5FR9WaTkRXQuypZhMMm+AQhgyZV9L576Dm
	2JWXr4cf/Oui0NOAcTt7tMOC45uigLiBbzYA8A6Iao9jGZZf2Eapx+2PRYjkkWoGmX2RtwegbSi6X
	PSGBHS/XsPVEwxqVKcVV3bJBmwj01szs+cVMTXQH7L+3fQnhwG1Xc9DwNmAoGyynBnAINDJX0K+Vh
	SNFpQ3qWylRTUFwyKvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6uZf-006JU4-2z;
	Wed, 07 Jun 2023 14:55:47 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6uZa-006JQx-0Y;
	Wed, 07 Jun 2023 14:55:46 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 21CBA5FD6C;
	Wed,  7 Jun 2023 17:55:34 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686149734;
	bh=UYxiu6ewdp+Z+G0hkR1Ih5TEv7mk3kDcVza211h23bs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Y4ea4ubPl2EX/G3JwfBKtSLh9YDYgcegMecXoCSFyohMyMHANghdnQJ2RMue8Vm4x
	 NYArtsX9kHd194A73Jhg5A9eXPGzkk1IGt0D0tGjMjjg5+UhNMIkERg1+mHEl4XuI3
	 avna8yXBdJ16ZWYiPoJNwE2vhk+orOOYaKNJlQDVIQpLTPs5EAZQIsJd2LSPaJX4PE
	 EuQIdfDZBQ0zjBNDWJTuuIiCzD5CFVYB/ZCDG5NpFoCViAaxNPuy8ALrX7vC7CXfQL
	 /Sssye0DFy8tAqVBgijCPmbX+wmwq3xEVRoMoZ1KQVPJlSrPykNeA7aJTSLp6SayiR
	 3i80P0EU3uA/Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 17:55:31 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] Meson NAND: waiting w/o wired ready/busy pin
Date: Wed, 7 Jun 2023 17:50:23 +0300
Message-ID: <20230607145026.2899547-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 09:39:00 #21450961
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_075542_734402_664E9966 
X-CRM114-Status: UNSURE (   9.69  )
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

Main thing that this patchset adds is support for waiting for command
completion when there is no wired ready/busy pin. This is implemented
by using Meson specific command which operates without wired pin, but
supports interrupt driven waiting (default way for waiting without
hardware pin is 'nand_soft_waitrdy()' which uses software loop instead
of interrupt). To select which mode to use during driver initialization,
common NAND controller property is used - 'nand-rb'. It is described in
'nand-controller.yaml'. But for Meson, its description was missed in
'amlogic,meson-nand.yaml', so this patchset also adds support for it.

Patch for bindings was tested with dt_binding_check and dtbs_check.

Arseniy Krasnov (2):
  dt-bindings: nand: meson: Fix 'nand-rb' property
  mtd: rawnand: meson: waiting w/o wired ready/busy pin

 .../bindings/mtd/amlogic,meson-nand.yaml      |  7 ++
 drivers/mtd/nand/raw/meson_nand.c             | 82 ++++++++++++++++++-
 2 files changed, 85 insertions(+), 4 deletions(-)

-- 
2.35.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
