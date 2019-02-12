Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A84DC282CE
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 16:29:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A50217FA
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 16:29:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n7yIaMk3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EYNMnV5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05A50217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jLjfyzcPIOkTZTVQmY5gog+Nhsa+Rdk4x9SZ4qsqNWU=; b=n7yIaMk3RnE1a8
	oDiZjYWNayMSZS+dBvFkn3YqKTVlu0HNOkKM/inhRTbrXgSN17hhbpl0DqKvSEqTgxp3MlsOBm2+K
	RC1ZyQJwUi4IX5+XvySr1yweIZNb0jGql2U1//X7XANjBz47RhA7UqiZIDxuwNVLfc3DVfbzixjSb
	aEUrF1+ScqXXg2M/ovO6e2s/WLISRewlV2HC1N0LDpknSLEqgO5LjcnPDQeKIxkL3k/u6++cCCuDr
	bqDb48NLPiy+0z2ZSKfbTmClZMZA+DcK5Yue2c6rzGkeTQeqjwjQQ9xavXC65h4tnH5e9qxPFAsW8
	8hwhbY7mAeEIgGU1btwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtavk-000728-N5; Tue, 12 Feb 2019 16:29:08 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtavg-0006zq-Fu
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 16:29:06 +0000
Received: by mail-wr1-x444.google.com with SMTP id l9so3329147wrt.13
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4mSsCon6GBdcpXgNWgQbQrrv5VNk+/N3Jshnb+5ts0=;
 b=EYNMnV5sNrocF3iwg2e/cigLaHz3u46sUAY2IMLd1kQVCvsVlT6E1M+TCyeRlzi1Ee
 OGPR82Olaayvqjshmjzf8ljY+Be0a8XlYfZ2ELHT8r3VXpz+Ba7WLEzi8YYoyG8rmuz2
 e+tJHdsBUwZ3b69w5lYtBDDWorao1ykUkIo0llc0QrvEzXs5fnsQ+rbD1jO7sMdLyfQa
 U1gBOpgpGerIn/P3REMsGP8CWFBFDSzH/hGtWW6Scs56p8ROIcK4ZYlLp46O3oObx8pK
 b2Zr9YbGy0iMfmor00avHsafnOTazaf7om+PG91NshuDn3x6gfr+bbwpiwKRuOA/0DCQ
 szwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4mSsCon6GBdcpXgNWgQbQrrv5VNk+/N3Jshnb+5ts0=;
 b=ml8XiPQljHEmWI67DgkDUN3khSsbNCKBsq7IPA+8seFYeG2B0vMqHCh88MGyEPObZ1
 LHWcK/viZj+o8XwOSbOryxCIToaM3oUvzYI235vMNgBGm9QxHeFBhveL9TdIZuDQIzZR
 UdeE1hwlcBoSXKRW2DF5fyjCOPJBkq9U6wUpTkcrsqjlIFIa/tgn0epVcc4JOuWnQdf+
 eJee5fdOZe21NbuozgsQqXwU9NJTx0wJpkPrSLjZr4WDFChZ50ESJqgdcVD7uM7e9HDA
 fknxKcf0vLgXEJWF2lCPjpg621r61p3/8VCmuKDnWlb2CcgAh1pAOmwovTNuZXhM/bNA
 qCZQ==
X-Gm-Message-State: AHQUAuZEkH/Tt4AplIc45fndPbgqXLGEdsggVKQzIkgidlN8Am86y2iK
 Ktn6Lr0013VVtvHjAueqVU0xOg==
X-Google-Smtp-Source: AHgI3IaQ2zjXoLynNNuxjOAdM0y1ZygLbnhTGP/eGVeg5u2m9LLrFped1p8aXSRHPDTmLhkLU8B9Jw==
X-Received: by 2002:adf:8068:: with SMTP id 95mr3563270wrk.181.1549988941394; 
 Tue, 12 Feb 2019 08:29:01 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z1sm7800876wrw.28.2019.02.12.08.29.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Feb 2019 08:29:00 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 0/2] clk: meson: Add G12A AO Clock + Reset Controller
Date: Tue, 12 Feb 2019 17:28:57 +0100
Message-Id: <20190212162859.20743-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_082904_592126_4A46488D 
X-CRM114-Status: GOOD (  10.75  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset add support for the Amlogic G12A SoC family Always-On
clock and reset controller.

This adds support for clocks on the Always-On domain like :
- Always-On UARTS & I2C Controllers
- CEC Controllers
- SARADC source and bus clock
- Infrared Decoder/Encoder bus clock
- USB 32K reference clock

This also adds resets lines for :
- Always-On UARTS & I2C Controllers
- SARADC, Infrared Decoder/Encoder

This patchset depends on the ("clk: meson: rework drivers dependencies")
from Jerome Brunet at [1].

Changes from v1 at [2]:
- Moved unused bindings ID out of the dt-bindings header
- Added comment about CLK_IGNORE_UNUSED

[1] https://lkml.kernel.org/r/20190201125841.26785-1-jbrunet@baylibre.com
[2] https://lkml.kernel.org/r/20190204091331.9298-1-narmstrong@baylibre.com

Neil Armstrong (2):
  dt-bindings: clk: add G12A AO Clock and Reset Bindings
  clk: meson: Add G12A AO Clock + Reset Controller

 .../bindings/clock/amlogic,gxbb-aoclkc.txt    |   1 +
 drivers/clk/meson/Kconfig                     |   2 +
 drivers/clk/meson/Makefile                    |   2 +-
 drivers/clk/meson/g12a-aoclk.c                | 454 ++++++++++++++++++
 drivers/clk/meson/g12a-aoclk.h                |  34 ++
 include/dt-bindings/clock/g12a-aoclkc.h       |  34 ++
 include/dt-bindings/reset/g12a-aoclkc.h       |  18 +
 7 files changed, 544 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/meson/g12a-aoclk.c
 create mode 100644 drivers/clk/meson/g12a-aoclk.h
 create mode 100644 include/dt-bindings/clock/g12a-aoclkc.h
 create mode 100644 include/dt-bindings/reset/g12a-aoclkc.h

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
