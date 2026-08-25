Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75884C61CE3
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2026 06:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uZqmlrXvlwD5tsmT3Yy6N/+cxXWxcXa3n0dTBXFMkrA=; b=mfMgx7aP3mDT+F
	DE5KOCjbZDJTHI9OcKCwAyeQkFKyfN3zB075cFLM4sbK6/PfqK6oNQRUSqyukBMudaah532gD/20w
	C3v4tss3Jy59cWRIgwvpiUWA52YuGgZVfCvUbiP/fUSK4aeiwQCtj/jq1tUnVZzMRraG+eSGVWSEd
	Gac64nJ0+bPUcPb79WyfImgH2l/UCFU0ykhTDGcXmQH/RhM/JmI9z7gJ1aso5K38VDwI2HOq8scim
	fHFCVs07Go94tJ7Plkah2Y0Ft1urP7vmbqb/IHCeQvJAsGWrw6LoDhCB4TyrhykUD4h9RRV+P8uuf
	XZ7mjc+FFwNuObSeCCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykeC-00000000EFZ-1GQ5;
	Tue, 25 Aug 2026 06:28:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykeB-00000000EFF-196u
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Aug 2026 06:28:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 738CC439EC;
	Tue, 25 Aug 2026 06:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4849FC2BCF4;
	Tue, 25 Aug 2026 06:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787639314;
	bh=wtn1I+ai2TfN4YtsNfLA2KMBghSMbAH01BL0yp3zDvE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FEZr7Sv3d+5cr0PQIx41y23gXoYErknC6jxzIMTwt3foltbh+YZAA4dSmtvwt+FP9
	 Urbn3TciHGLehE375EgAQMT/Fcs28RrkcR18ju2ei+T0+ufCUei1Kc7cJzuDS2FhZx
	 +3HX2r8XV7MnWdxuw9iVJ2uiJVT2pEOUGvOrP3g34AbIwqlU+BrkWhfbGE2BSQFzaz
	 gQA7PpU/RqQFllqS1//afMxDfAlz3AUnh3lNg/nvyjyGNJWmMwshLcnyIC2M/keutz
	 mEUzTnkeDT65e9eCsbLVn4hvVpAiu/IF0r3k5yvh6cBuDNhPZxGRyD4I4AV5dJDXaO
	 cYqL4AfDTJkPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF4FC61DB6;
	Tue, 25 Aug 2026 06:28:34 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/2] thermal: Add support A9
Date: Tue, 25 Aug 2026 06:28:28 +0000
Message-Id: <20260825-a9-thermal-v4-0-d8fc9859cf22@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAw2jWoC/2XMSwqDMBSF4a1Ixk1Jcq0xHXUfpYM8bjTgo0SRF
 nHvjVKo0uE58P0zGTAGHMg1m0nEKQyh79LITxmxte4qpMGlTQQTBZMMqFZ0rDG2uqG+EBZ9gVp
 xTxJ4RvThtcXuj7TrMIx9fG/tia/vNwNsn5k4ZdTJsnAgrdGX8qbbpq+CPdu+JWtoEj9ccn7AI
 mHpnAUwnBul/zHssDhiSJih1MaDyjnCES/L8gEOipaQIAEAAA==
X-Change-ID: 20260703-a9-thermal-f62cef6ea91f
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787639310; l=1596;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=wtn1I+ai2TfN4YtsNfLA2KMBghSMbAH01BL0yp3zDvE=;
 b=F5+QWQZl4PmucrgygUs+YLg5rrOp+WvqSGZix8VgOu8ehFtrOeF6XCsABxyDJUapkpv9En1pg
 jN30zNiglk+CB37pANMJqMad75efyfP4iaHscftoGikgpJgMXZ6x1b8
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
Changes in v4:
- Fix type error in comit mesage, and set factor valid value. 
- Link to v3: https://lore.kernel.org/r/20260821-a9-thermal-v3-0-0e7abf3941e3@amlogic.com

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
