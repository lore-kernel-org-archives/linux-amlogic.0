Return-Path: <SRS0=wynk=ZJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DA1C432C0
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:00:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FEC2084D
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:00:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E/3TtQ8V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QLF0FvhZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FEC2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a/TYteZV9fzqe9REiCKKs96oCkXGcbypkJQ/6vVwM2c=; b=E/3TtQ8Vatpgj1
	6yrEQ3GrAMb4T2VPqVNimmeNaBCx5voVnpBlXTqBTSIrMjbiOMuDXeAfI4eUGpz4MDJwSwt9poK5/
	CSThHE77Ze2eHE3OZDssi1q4KfRckNo5GeTIoXEWWkSKWZXpfrgBTTUezWrXm66JLEo3U4r31Xz25
	ExhaFb7o37o+Kwh1eirLjocl3E2jsL/bY+Qx/Ti7ZfEja5XcupTzh6hrsAomPLELirB7C5lnhZ06U
	2PWh51nLhIPG4wZuGQq2D6BtKB7XdC0MlyCfshVg5qr1JrgixTQKMWVCh5lIjXAuc7F4o2siyjNiA
	MRMSEfS2wFeytevfx1Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWL5t-0000ni-0Q; Sun, 17 Nov 2019 14:00:01 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWL5p-0000mM-H3; Sun, 17 Nov 2019 13:59:59 +0000
Received: by mail-wr1-x441.google.com with SMTP id l7so16351947wrp.6;
 Sun, 17 Nov 2019 05:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=05nE8+MHUGvDlOaHhFyY9hdfqx0IM0OvamCE7zybe74=;
 b=QLF0FvhZwFM+TBA7bz7hdl9LccI8q8cq5MvI1/15MaGDEIUxrPD03tnnFu9KImUmEj
 nSgwq80iTIDuKY+REyNzrYNtVd7Gm0GGeaYElnqlfeSfRB0hkL+p4tnfvyazduMrcTQx
 GFBV8yLqoovy5YzpuW47Yj8vkVQecKQyGvYbxTW8A8hJlW6DXJSPFBQ5Ku6reF8V7BuA
 w7LsBg/EUzcFYu8S3UCVcqDkviYcsJnlvx+/peBk4Szgq6YmXbD9rmqFh9NrsNDZ4uQs
 jYMx43vrlBQtiUECnbsW0PzNnnMdPXWXF+F+k/+XOs/VHHhtowFvWkkxhBfFEChhGmWT
 RTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=05nE8+MHUGvDlOaHhFyY9hdfqx0IM0OvamCE7zybe74=;
 b=tAZHXISHMOGCQhNRkOGwyKIViOiYOa02xwAGveRhHeqjVupQNM3K2YwLs7+yjmVQEL
 SdflmDgv8FuqlT12se/BmlBhcJM5wTaYO+dM1MutKgLxzBATOS4Ok6xlrxOPvYZr1aNq
 B/ZhzcLUL3PCwr5AATw/2hwRs72mN8Z/dQxyJNDw9Tj5s/LNQqM60U5csyc+3dzaXEx6
 +QMhzSGtHQxSe3jFLFtp/4/qu+BZI5f7RHzl13fFVIubdaKVPOuaJx3r1lqlmO2QOSnH
 8AaomsV4v/UBZMMzVKBqm4Qb/YtBehHoqG4q2e2lJcA8MAYPNsyN7hjlNUy3fuo8PDFv
 X/zg==
X-Gm-Message-State: APjAAAWQF1HxcoHx4BrP9CIqpipNwtkuSF0hFMYdQDLzP+s6thbLJhMH
 Vx9Xf3i7goUVANX0J6EA9kU=
X-Google-Smtp-Source: APXvYqwRI04F3xiORLf9hlO37+rwxbGZhusfuTQ8VMbNc7FjWCwkDlN4OVOZrqfhRfK7zqNf8PuzQw==
X-Received: by 2002:adf:ab41:: with SMTP id r1mr27076505wrc.281.1573999195527; 
 Sun, 17 Nov 2019 05:59:55 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id n65sm18004803wmf.28.2019.11.17.05.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 05:59:54 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v3 0/5] provide the XTAL clock via OF on Meson8/8b/8m2
Date: Sun, 17 Nov 2019 14:59:22 +0100
Message-Id: <20191117135927.135428-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_055957_590339_F4AF80D1 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

So far the HHI clock controller has been providing the XTAL clock on
Amlogic Meson8/Meson8b/Meson8m2 SoCs.
This is not correct because the XTAL is actually a crystal on the
boards and the SoC has a dedicated input for it.

This updates the dt-bindings of the HHI clock controller and defines
a fixed-clock in meson.dtsi (along with switching everything over to
use this clock).
The clock driver needs three updates to use this:
- patch #2 uses clk_hw_set_parent in the CPU clock notifier. This drops
  the explicit reference to CLKID_XTAL while at the same time making
  the code much easier (thanks to Neil for providing this new method
  as part of the G12A CPU clock bringup!)
- patch #3 ensures that the clock driver doesn't rely on it's internal
  XTAL clock while not losing support for older .dtbs that don't have
  the XTAL clock input yet
- with patch #4 the clock controller's own XTAL clock is not registered
  anymore when a clock input is provided via OF

This series is a functional no-op. It's main goal is to better represent
how the actual hardware looks like.


Changes since v2 at [1]:
- add .fw_name in addition to .name in patch #3 as suggested by Jerome
- dropped the dts patch so this whole series targets clk-meson
- moved patch #5 from another series to this one because once we drop
  .name = "xtal" the clocks need to be aware of the OF node

Changes since v1 at [0]:
- add Rob's Reviewed-by to the dt-bindings patch
- check that "xtal" clock is actually passed via OF instead of checking
  that there's any parent at all (which in the worst case may not be the
  xtal clock) as suggested by Jerome
  

[0] https://patchwork.kernel.org/cover/11155515/
[1] https://patchwork.kernel.org/cover/11214189/


Martin Blumenstingl (5):
  dt-bindings: clock: meson8b: add the clock inputs
  clk: meson: meson8b: use clk_hw_set_parent in the CPU clock notifier
  clk: meson: meson8b: change references to the XTAL clock to use
    [fw_]name
  clk: meson: meson8b: don't register the XTAL clock when provided via
    OF
  clk: meson: meson8b: use of_clk_hw_register to register the clocks

 .../bindings/clock/amlogic,meson8b-clkc.txt   |   5 +
 drivers/clk/meson/meson8b.c                   | 113 ++++++++++--------
 2 files changed, 67 insertions(+), 51 deletions(-)

-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
