Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0307EC5DF8E
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 07:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QftukBSBQ3WMB8NcfcbwUH9i9LN1ZPm2Fq766HAk0As=; b=2etpuDQZVokprO
	0Z2UGWmugeWIwubUQJILq31K3YDya8rDMZi8nYHjAwZv8ufOmCCe2WEuKLqmOV5PwW2oscMuRhpAZ
	zerZk0qclrqP5ZXpTZ0csq7bzAvJwr8JQY05hk0/KWJBnrlUKKNkR4Oe2cxkmQQosDlbdwuSBbUCT
	z1+j6TGI2a9u5h+opQVu8NKU1PUz7wT7028lEap1A+Ok+NoMQ5Kj5qL8ie3X8I4ZT6fljJsrOHuVK
	x/A11oB6A6FwBjzHX7Y0uCRF6MaNjoCbXRtqm4Ok7g/tZaePuqVEAk2zDHuNqOAJFfc53ZRI1KQuL
	8sK2R2//CcX01HINnMSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxK1J-0000000Ck8P-0jJ5;
	Fri, 21 Aug 2026 07:50:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxK1I-0000000Ck7z-0Nqq
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 07:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D29660A73;
	Fri, 21 Aug 2026 07:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2D75C19425;
	Fri, 21 Aug 2026 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787298631;
	bh=tR0AdX527Cmy9X8GHIcvSa9gZoHO6qvprjxgfmzKfO0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YeAp+N9NAJXerE1KOak+A2bbK10ilYJPGJOEEr0J4G6CGMnAppx/6tDOwD7Msozs9
	 MQyXDHLiyHpTjgY0mnlnEDuLWpFstbYG9QUgC0FFggb3rZe3lsHNfqZLLJhmsTqD8q
	 u7K3Swk4kaVKSRQ96jGp6b8Beqc21VWvAzThfpW2swcDzMTLNLoLwwmI2JTEXKcNZe
	 n/J5kNe6WIjiN5tFWdkjpVQmHUFT3TtaV97g5A0XGQaQtCxOLnetJ1Zc+hIxocGt04
	 JQ+W6ooLd1dsDwCd4UyuE2XToyfnMldQcXHbCUhzB96Ycyf2cNFmL8Ac5N0wQ4awDg
	 rSig4lAJ6AZyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D94C5DF8C;
	Fri, 21 Aug 2026 07:50:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] thermal: Add support A9
Date: Fri, 21 Aug 2026 07:50:21 +0000
Message-Id: <20260821-a9-thermal-v3-0-0e7abf3941e3@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD4DiGoC/1XMSwqDMBSF4a3IHTclD5poR91H6SAmNxpQUxIJL
 eLeG6XQOjwH/m+BhNFjgmu1QMTskw9TGeJUgen11CHxtmzglEuqqCC6IXOPcdQDcZIbdBJ1wxy
 U4BnR+deO3R9l9z7NIb53O7Pt/TKC/jOZEUqsqqUVyrT6Ut/0OITOm7MJI2xQ5r+4ZuwQ8xIra
 40QLWNto4/xuq4f4VU40OMAAAA=
X-Change-ID: 20260703-a9-thermal-f62cef6ea91f
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787298628; l=1423;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=tR0AdX527Cmy9X8GHIcvSa9gZoHO6qvprjxgfmzKfO0=;
 b=8ssSs355jJ34Webn2x+NSp0s1xQgKrk1IrbDHbvXVqIKRtJgeGNrU+eIAwI8R8RoAdog8xHef
 aOd91L1si2ACJJaGP7Z92n2jHeetsTwYG8Wn1kUVdU8pNHHrKnZAtmP
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Document the thermal controller compatibles for the Amlogic A9 SoC
And add driver support for the Amlogic A9 thermal controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Binding: add restrictive conditions for clock, and remove remove "amlogic,hw-reset-temp" property.
- Driver: add private data reset_temp instead of get value from DTS.
- Link to v2: https://lore.kernel.org/r/20260811-a9-thermal-v2-0-7ddc33b11b9a@amlogic.com

Changes in v2:
- Fix the spelling mistakes (clock-names) and reset-temp properties is visible to old chips.
- Adjust the clock enable sequence in resume func and remove the clock disable in remove func.
- Add the judgment on the divisor zero.
- Add description of support for over-temperature reset for old chips in commit message.
- Link to v1: https://lore.kernel.org/r/20260730-a9-thermal-v1-0-d786d37cba58@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: thermal: amlogic: Add A9 thermal bindings
      thermal: amlogic: Add support for A9 thermal controller

 .../bindings/thermal/amlogic,thermal.yaml          |  27 ++++-
 drivers/thermal/amlogic_thermal.c                  | 113 ++++++++++++++++++++-
 2 files changed, 136 insertions(+), 4 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260703-a9-thermal-f62cef6ea91f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
