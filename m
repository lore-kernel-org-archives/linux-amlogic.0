Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0EEC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 04:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Jpn7oz+RnafsrZYE1iM7CSDmECS1GPUUDoDQz/f2Tg=; b=XYeg3xpZ8oMcou
	gz+nzZu51RVtDkEuuJuL0JXduqkloLrjHkGDf3GziJy6lG0ucID2+mpCbFw+b1Gs2ZkexSONycWKv
	at8DWtFEa1DDLe+nPAreZKH0aZwq4L02zRD2pyzV73bmREk8jVMStc1Uk8FXJt2MZLfD0r5QHpway
	NKjJYMz03RQBs7KpNnqgcaSeUtDiHVfNpIBr0kpVJMa/msO3MxnxYOdEkwtPx+6BUF4o2ZiEc6U0P
	HiMAJ2y1ftnHZHuvl2/BD1hSSUxwwwyxcvRfXAH0PEt/yOBVcG8aPMIIbmYYtaTcSKHY0gFmREKK1
	jZicYCsCAgfUMbj2mPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI1MI-002YhC-T4; Thu, 10 Feb 2022 04:47:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI1M6-002Ydp-9n; Thu, 10 Feb 2022 04:46:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so4441610wme.1; 
 Wed, 09 Feb 2022 20:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=vRozfgv8c4CSVg47eYADPpU+vSvhsWF/kMmMfWcmYYE=;
 b=nLYaz8y/oYtDmbRGVqujXFIxW76NS6aKCy3G5lxsRPiBFGjwbj379Zk2feZ75DC+N5
 iQAP6VL0m+GxPufKrEU0IT3U0M/kHFirStAtjTGTQX4hKXYunqwVxqKI717dU0bL9AQg
 05zCz0fafn/g1fSDGWfw247fiR3h2bl1nFgn8cVI86dFJSuNeLBHdJGDsWMt4iNQQlDO
 oWznqUkMk4utglAMob5GXrRnkjkhE+G3H6uxEt2zRHAiLWwIilcNGYHhIimj7+8SZ7oi
 BzPXUVz1odlwIO00mFOokMN4Jq3baEDtkTt/aavV2OlunblOH292AgJQ2H8n+4SXsl+A
 VxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vRozfgv8c4CSVg47eYADPpU+vSvhsWF/kMmMfWcmYYE=;
 b=DRKIcjzlmvkE26BuPO7U2DEs8jIzZ3QVbgLO82/htxvvGsbnFYkWgf6xMgNIxQ4LUj
 gqdzSNlCrpmSxz3s1UyXxFsu4D3k2vCDkYNJG/lVxIpXNgQ/RjcAKINCDx0Ats52f9GM
 0lEtsVqUgjZl6hdRAXeJAxuogCeFK04XEzTizMHYJNig09rWkvmWCiYRz/0cr3W/zXko
 KWomwnXHyXtKMjeE88lxTj2U6qzzyBjtHzeGs2ZldS8XQyJT6UE28nATa5+K4fsEd3ww
 xgr0sUDRt5Zh3aqkVUPpF+OlCwg/jp09tdA6Ok69kzSUlvBg2I6afr7ck0ym5YqUZMfU
 PvKQ==
X-Gm-Message-State: AOAM533pgJiuAXYF1szZhAfZtO5XQDMhkdv0yxnGvwJYdO77vf1KEwnv
 MVMmbqpLJ6NKi0UIQPvHcNM=
X-Google-Smtp-Source: ABdhPJweKEsPlbgk+HcEoXMNC4J0RLS0HDhL0yuHl2kaYSZgeB5vQc0hi4wUyqwPLuunLDtg6Jj+BA==
X-Received: by 2002:a1c:a791:: with SMTP id q139mr560008wme.176.1644468412353; 
 Wed, 09 Feb 2022 20:46:52 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h17sm323089wmm.15.2022.02.09.20.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:46:51 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Sam Nazarko <email@samnazarko.co.uk>, Chad Wagner <wagnerch42@gmail.com>
Subject: [PATCH 0/3] arm64: dts: meson: add support for OSMC Vero 4K+
Date: Thu, 10 Feb 2022 04:46:44 +0000
Message-Id: <20220210044647.14443-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_204654_375119_FD96A477 
X-CRM114-Status: GOOD (  10.73  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds support for the OSMC Vero 4K+ Set-Top Box device
based on the Amlogic GXL (S905D) chipset. The Vero 4k+ is notable
for being an original Linux (not Android) STB device, running its
own Debian-derived 'OSMC' distro. Big thanks to Chad Wagner for his
help with testing and device-tree fettling.

Christian Hewitt (3):
  dt-bindings: vendor-prefixes: add osmc prefix
  dt-bindings: arm: amlogic: add Vero 4K+ bindings
  arm64: dts: meson: add support for OSMC Vero 4K+

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s905d-vero4k-plus.dts   | 125 ++++++++++++++++++
 4 files changed, 129 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
