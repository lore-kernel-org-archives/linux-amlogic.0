Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E66EB64DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 07:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ons1nPqq0MvFs6bpXWbnPVI/OtJDyyhckdiS/88RIP0=; b=FloxZMsc3TmVUL
	dph5ctfvj0wQIT2sptTGWX6sgQ3Sdd0/4SbQej8f4AywnzVtDYXgArpf+54iX6XZYTKXTVjh1jmrN
	hkM6zrTPKrXKX/38oirzND5pxA1RKNysw+6nTVPtn3drtMRALyBLjZUEz48K4KoZv5lh7PK+skG6M
	HrAjf/oiC4Zz3xkdG1ysUBNMJL5iW/UgGPBACvA3ArOZbCsJ1SbXH7hHNBdoa5utp+KWzXwQLCXlm
	0YaZQuqw81tvCwBtoYVkG33aIhejJUVQyTAUhK2AKvrtvWruKxaCrdlvxeaz1Y+ckXWqK1kOp+HoI
	T5SVoEH71FJ87J/Lyrbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwUe-00EyUX-1N;
	Wed, 05 Jul 2023 07:00:04 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwUa-00EyS3-1N;
	Wed, 05 Jul 2023 07:00:02 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DC4FF100073;
	Wed,  5 Jul 2023 09:59:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DC4FF100073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688540397;
	bh=w9TfBjympA65WIQ8B01PoVwkn2a+efXJwLYEf3bue0A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=HDzwTxugnu/x5f5fBNgZEOr7Rp8L6Ta8vQ0qvMkhvNJYmTTqN4/rcXoxM13nGc+Ep
	 H8mjFeYxWxeL8DWZzOVkudikWc/QSk7eiRBkuKlMn3ZsFMcm0cgdq1hM+CXbAE0y/0
	 eKm9XHm7YxowR0euNXYv9TXrNMpR30QdVocy/PboDbneknJKaVQ8lYwNhJDqpmJ4bC
	 lofQpZS5iLH9t9XuYVo/G/yztYnx78qB3mK5jl6PG+gidt87FYpVMoqjQHtMia6vxG
	 hbEfH/AW0exZd+r4cMLLWiheyo/vAuCoyzqWzn+Zi5nU94flLkqdmsEZWoLhxJausN
	 vrAi3CyEUMqFw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 09:59:57 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 09:59:56 +0300
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v2 0/2] support 512B ECC step size for Meson NAND
Date: Wed, 5 Jul 2023 09:54:32 +0300
Message-ID: <20230705065434.297040-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178437 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/05 05:56:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/05 05:56:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 01:35:00 #21564271
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_000000_819837_50175873 
X-CRM114-Status: GOOD (  14.03  )
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

Hello,

this patchset adds support for 512B ECC step size for Meson NAND. Current
implementation only supports 1024B. There are two patches:

1) Update for device tree bindings to replace 'const' type of field
   'nand-ecc-step-size' with 'enum' which contains 512 and 1024. Example
   is also updated.

2) Update for Meson driver - new enum value for 512B ECC and reworked
   ECC capabilities structure to support both 512B and 1024B ECC. By
   default this driver uses 1024B ECC, 512B could be enabled in device
   tree.

Changelog:
v1 -> v2:
 * Add default value of 1024 to the bindings patch (0001).
 * Remove "Acked-by: Rob Herring <robh@kernel.org>" from the bindings
   patch (0001) due to added default value.
 * Remove invalid calculation of OOB bytes, available for ECC engine
   from patch 0002. This logic is incorrect from the origins, so I don't
   touch it in this patchset. It will be fixed by another patch, as in
   fact, it doesn't affect this patchset.

Links:
v1:
https://lore.kernel.org/linux-mtd/20230628092937.538683-1-AVKrasnov@sberdevices.ru/

Arseniy Krasnov (2):
  dt-bindings: nand: meson: support for 512B ECC step size
  mtd: rawnand: meson: support for 512B ECC step size

 .../bindings/mtd/amlogic,meson-nand.yaml      |  4 +-
 drivers/mtd/nand/raw/meson_nand.c             | 45 ++++++++++++++-----
 2 files changed, 37 insertions(+), 12 deletions(-)

-- 
2.35.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
