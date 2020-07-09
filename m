Return-Path: <SRS0=70lv=AU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DB7C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jul 2020 17:13:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3F32077D
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jul 2020 17:13:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fYIBRTpa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="psrvWtL3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D3F32077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fMkNzwjDEbnobtAuWRzxnJbhrKWXpfJd5PG1JC5fYLY=; b=fYIBRTpa84TTlaMQ+3VXNV4FAA
	J3H21zweGRTUY7s+yldF96LJkf53DMvWBsVw6JDsYCs/HAD7HT4Un7I9BsOEPQW9bhd7Ummh3zW7z
	xoWKmFOgCQ/2Zndq+icQOxkp0shsQj3gsK6uyMzwgo97L38OwUFH4rxVTjDWt4VVUdG5BNPlQjkWS
	CX/R+aXNDjnpPfP8Q9101T/EiqUX2JIIMHqyWwdRR0YOvNWsgzqlv4+ju+VeclgjyaAC19rRKagJN
	2YGhQCmAIHpUsb3qAUaM2xWIdx2UdjG6ktpdwhuwx+8RLyqZIruU/ENOM1pCO5L+S4VwgumvrTked
	YLGBvEZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jta6r-0002dH-7X; Thu, 09 Jul 2020 17:13:21 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jta6m-0002bt-Ph
 for linux-amlogic@lists.infradead.org; Thu, 09 Jul 2020 17:13:17 +0000
Received: by mail-pl1-x643.google.com with SMTP id p1so1092942pls.4
 for <linux-amlogic@lists.infradead.org>; Thu, 09 Jul 2020 10:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=pfpb/z5b3L/Lj0y2YF+uSIN83sOzywBGAuV7OC+yJOg=;
 b=psrvWtL3TnIcCzapAOqm2wt1NphzXp/1AF00UgQotNBnZGFd+LzHmTRaEn8jnZlXAp
 oTyM0OF3oltOq8CRGBzR6mIhAB+FN6/QF6SKYxPoIag1C8tC6R/c6xQ1i83oNuDB3AAE
 xqD57YL0eU/UIC2KHkQj5iHh2gpjA8pcwpe0l5Ltoq8kQvjC6t9TLoVS/wAqAFngUWCT
 GGJGhZRL5vjkTlyebNhEherhVNhBHs1OX9/7jS8C8CrWxwK8GwtaTdXa7cjkvhFMCsJx
 n+AtEzD2qGerXu1pQGUqg5/qZwF46GIM6VEYQn+HytR0QVCAEp6LbIVChXFee28e3iBF
 QhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=pfpb/z5b3L/Lj0y2YF+uSIN83sOzywBGAuV7OC+yJOg=;
 b=rGsVr7dsCa+Kn7FZJq1+mAVQWe+kytpNrFS8yJba+ax17Zz77/0MTSxghfmu5Vl8oK
 ewDJzjqXPR+BCR/gV/pNXx7gbILrc8mONg8tESlPWjln1qU+l5xr2P2AZS7XGYvgKY09
 YWscnqpOTOq18PPQ6RcpRLJq9XAhQ59w4sNZLPN2vXy+CYxI/2VmfuOeLqPZPHE6+sVg
 7mUryd+DK3u69cWufRMMAorMZSpRXmU95fKHgS2MqicErxaMqHVW1hBBNudLBugnKKyE
 KEp5rg/i8kxQ+vIWhSjkw+dLWyQTFsYsWwQLA96Ug/orJh5ntr98RO1npWcqFyQEzD/k
 KYUA==
X-Gm-Message-State: AOAM532UvH3qvy/ILmLmMYjDco08C52bC53xcMpDNAfIAvQ5b20SmyFd
 Fz0tBRyuyIfPPYh9ihIacw+oHg==
X-Google-Smtp-Source: ABdhPJyKI1mE0UddQzxYCmTawYbD3IEyLzlBCCcsLGnQ1m4t2FwgoMIwW83KNuT9FOa3yQ5Iq3YYOg==
X-Received: by 2002:a17:90a:22ab:: with SMTP id
 s40mr1003909pjc.27.1594314792926; 
 Thu, 09 Jul 2020 10:13:12 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id s22sm3206133pgv.43.2020.07.09.10.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 10:13:12 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] Amlogic fixes for v5.8-rc
Date: Thu, 09 Jul 2020 10:13:11 -0700
Message-ID: <7hk0zc1ujc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_131316_843676_6B8479BC 
X-CRM114-Status: UNSURE (   6.95  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes

for you to fetch changes up to 54320dcaa2522db3222c02d68b52cfed32a2e95b:

  ARM: dts: meson: Align L2 cache-controller nodename with dtschema (2020-06-29 16:08:00 -0700)

----------------------------------------------------------------
Amlogic fixes for v5.8-rc
- misc DT fixes, and SoC ID fixes

----------------------------------------------------------------
Christian Hewitt (1):
      soc: amlogic: meson-gx-socinfo: Fix S905X3 and S905D3 ID's

Jerome Brunet (1):
      arm64: dts: meson: add missing gxl rng clock

Krzysztof Kozlowski (1):
      ARM: dts: meson: Align L2 cache-controller nodename with dtschema

Neil Armstrong (1):
      arm64: dts: meson-gxl-s805x: reduce initial Mali450 core frequency

 arch/arm/boot/dts/meson.dtsi                                 |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts         |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi             | 24 ++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                   |  5 +++++
 drivers/soc/amlogic/meson-gx-socinfo.c                       |  8 +++++---
 6 files changed, 37 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
