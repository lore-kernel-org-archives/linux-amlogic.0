Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4456AC4167B
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Nov 2023 07:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z3i3EZgbXqipHR9ZfKjpZJxpqKqDn6T3H0GPYFgEZOQ=; b=tHCQQjdgWklshR
	BUqklZdDVpk6PQCSbT9LAY/uCvOs8k2B2TekDrSeAFvuSQbbfc9Dxe0TrbAkCLyytzLBMxGJxAGwQ
	E3u3oMY1B2C1URY5Y4AB2Vq8EBq+YeFzMlkyHa/rmncwpJc2AWNT4f1McItHh2w5Z8e2nXOzFNIhj
	Ze094fwGVjJTUFkw9IsS2FVLOZvVdbE04bSdp6r62kzF19DRDkvOuG7jEg1xEOdNGYXTrof4MQgmD
	W1zTi5OkgoZd75Xw0gYXqa+yhmCAWY7vPpDj1dkGbnkIov10VMifd+ngkm8Rn01EzFntPXEJGP678
	hFjBuxV6X7cWN13qLrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qySSL-008vFc-03;
	Thu, 02 Nov 2023 07:49:33 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qySSE-008vEG-2y;
	Thu, 02 Nov 2023 07:49:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB0E3147A5E;
	Thu,  2 Nov 2023 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1698911363; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding; bh=GoLjHDRTTW8k5/1bTK3z5jsye70DcJV8VXEiUmIhCQU=;
	b=f2TVScPohn6mMajkHmoB9lQPM9mD8PdGq8rL7/PE0KikPEz59iBRBdg5ySrvpx4WcQmNxP
	xabPeg/SfOcTsxa6TTivRdcH/TcRn25tA12YjRKKMB52OVkHKqrX1dUy7qO64mRA6udHx+
	RB9nptRE6s6h5E/IxWyYdaI+keRcSp/JipBi4crQL836fm/MpT8+ZIJ9VYETBwrqyEI3OP
	ZWBM6orm8F3VpxD8yoHtPZbG98jfcstnjCj9lQliF2DiGubC7jV5Pe5dnsLGS5VfKigBE3
	lE67obYwbdTbpkGW2Z+FHImn21kSGQ6rVCXemoulIDDgpyQ1NAfJ8YDP1lib6w==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/4] RFC: firmware: meson-sm: add chipid sysfs export
Date: Thu,  2 Nov 2023 10:49:12 +0300
Message-Id: <20231102074916.3280809-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_004927_514484_21CAEB19 
X-CRM114-Status: UNSURE (   6.60  )
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

The Amlogic Meson SoC Secure Monitor implements a call to retrieve an
unique SoC ID starting from the GX Family and all new families.
But GX-family chips (e.g. GXB, GXL and newer) supports also 128-bit
chip ID. 128-bit chip ID consists 32-bit SoC version and 96-bit OTP data.

This patchset introduces an exported sysfs string for the 128-bit chipid,
considering a check for the version of the returned value. If the chip
does not support version 2 of the call, it falls back to (where possible)
information from the meson-gx-socinfo driver to supplement the data from OTP.

Viacheslav Bocharov (4):
  firmware: meson-sm: change sprintf to scnprintf
  firmware: meson_sm: Add chipid number sysfs entry
  soc: amlogic: meson-gx-socinfo: export socinfo for use in other
    modules
  firmware: meson_sm: use meson_gx_socinfo for compatibility

 drivers/firmware/meson/meson_sm.c      | 72 +++++++++++++++++++++++++-
 drivers/soc/amlogic/meson-gx-socinfo.c | 34 +++++++-----
 2 files changed, 90 insertions(+), 16 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
