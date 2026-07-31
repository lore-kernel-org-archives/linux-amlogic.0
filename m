Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA89C5516D
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2026 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sgAwa0c1PLms+UQrFPXdzPeKBjk5oi8afAtlhMuwaPs=; b=1vnatWBKz/A24c
	rMuatcn1n5K77NTszMHJFCugJegofNVuMR3n41I3SqbMtNL/x44gBiaugKu9AI1fUB9WATm6wispT
	Q542YyrJCHZ/DVM6UJn6IBNIlealpcPo6Yr272iJupJ0bid4JfIR7etbrc2LNSRKoX6E+NXyZb233
	x6zALdKQrwior6RR7KN84XkMjdD7DvU5AJD76iGqhkQPqFlnd5IuCdTUHmmgrlbr5hy8fD3lV5o17
	KTw1h6ccXKYafpIPXjUpq7vVeDuz7q+pqXnSYSRrTr2koi2bgbm4AJ5BFEzg+3oJ8r4Om98Q0RcdK
	P8KuaxfNDq7oU3vBtdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjEG-0000000C8VF-350E;
	Fri, 31 Jul 2026 09:08:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjEE-0000000C8UP-3taI
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jul 2026 09:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F0524143D;
	Fri, 31 Jul 2026 09:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB6AAC2BCB9;
	Fri, 31 Jul 2026 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785488910;
	bh=bvV/rM0nI+620wZ/+v/nwmaJtEmXb5qVlKP3MmQr9lY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VJc0ovEu96/XGt43BVnIUuZZ9Qee2/eqG3NAova1Or4Two9pujpckvPV8bdXgRjLZ
	 wbHDtsCpvkeDJKshfAeUGzrTnuwhm5czFve1E+2e8n1bAyQXz4cp6HXuqU3tKOsZt+
	 u43CP4PQ82My1HPMUNem3bWI2JI1CrLgjOg2YZUFGaE/vycOWdbH373z/93OW8kOsr
	 br3IeBDKv7m2DSZpf9Pro2EuCrcJVd9pcW28zHaBfJA9jmbd58D806RTkXGRYPgjLV
	 CjYrdx7Afg4v9V1XFbBe3+ORXS0Dixv3PCBIufCRTo67/JFsrHGcdvrZtR9IXv+wW0
	 I9sfwRkeLwB9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EC7C54F54;
	Fri, 31 Jul 2026 09:08:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/4] spi: add support for Amlogic A9
Date: Fri, 31 Jul 2026 09:08:24 +0000
Message-Id: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAhmbGoC/1WMwQrCMBAFf6XkbGST2IZ48j/EQxo37YJtSiJBK
 f1304JYj/N4MzNLGAkTO1czi5gpURgLqEPFXG/HDjndCzMJsgEtam4NTxOljnthHMIJlK2Blfs
 U0dNrS11vhXtKzxDfWzmLdf1G9C+SBQcuEdFq3aIw/mKHR+jIHV0Y2JrJcqdKtVNlUY13yghoW
 o3yX12W5QOVxzoh3QAAAA==
X-Change-ID: 20260715-a9-spisg-f19ce0403a50
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785488907; l=1506;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=bvV/rM0nI+620wZ/+v/nwmaJtEmXb5qVlKP3MmQr9lY=;
 b=SdQy3BS98tF3sFP+q+xnLU/GSSdFyQs9HgENdgmZKFHmierrxjzMQG3KiuhF7b9VSJjSn5r+V
 BrYZZ8CRcO/A/v5412XiLu9mRtVN7bIZIPTwft0onk1U7zrLxL6zaod
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

Add bindings for A9 with some features, and driver for A9 base on A4.

Fix the incorrect keep_ss of the last descriptor.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Re-wrap binding commit msg and drop "amlogic,word-gap" property.
- Handle the hardware word gap through the existing word_delay mechanism in the transfer path instead.
- Link to v2: https://lore.kernel.org/r/20260723-a9-spisg-v2-0-9fc39106b7e2@amlogic.com

Changes in v2:
- Move the added properties defined to top-level and then reestrict them  in bindings.
- Fix some pre-exiting bug reported by Sashiko AI review that as a separate submission.
- Limit the value that will be writed to CFG_CS_HOLD.
- Link to v1: https://lore.kernel.org/r/20260717-a9-spisg-v1-0-2eeea77be19f@amlogic.com

---
Sunny Luo (1):
      spi: amlogic: spisg: Fix the incorrect keep_ss of the last descriptor

Xianwei Zhao (3):
      spi: dt-bindings: amlogic: spisg: Document A9-specific properties
      spi: amlogic: spisg: Fix transfer size limit and timeout handling
      spi: amlogic: spisg: Add support for A9 controller features

 .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  | 30 ++++++-
 drivers/spi/spi-amlogic-spisg.c                    | 99 +++++++++++++++++++---
 2 files changed, 111 insertions(+), 18 deletions(-)
---
base-commit: d0b5dd16226814e5c73ba8daf88d3d91c990a38f
change-id: 20260715-a9-spisg-f19ce0403a50

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
