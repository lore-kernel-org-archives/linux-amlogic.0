Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FCCC282C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:24:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 709092075B
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EMxg8sTM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="o9dUh1Wu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 709092075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jptWYRNcyhmJBTnWHmmQ/crWaRCIoWbnHDUM6f1ROZA=; b=EMxg8sTMIGpOy5
	ME3zKzVW49RiDL7elEnp8QzNOjiQbqc3xugKzNWDjapgzi/a9/eRTLMI4tyDDZUUGtqfb7vNnWXu+
	MBSNIET2aF4l3+HTru/sioPdGP8Va+05ShlCvrxcznrn8zrNqPFOgB2hU5RAwe3AcOpUEZNIg5o5Z
	Nr8C/4ZGw3MmpIgLvDOwNtHPHq9yZyZ+2u45kr1hWx1BPk9Dk/21U323tknE+b2wDtYMHCQW7CNtb
	RxqnYGU3NJiokpqOGrd7W5Ky17pH5+zLM0J1ANZXGXAZ/UJ/kf11JUXNnAjQwHUezUYXlzRiO3eGY
	QnjEb/7/39TcD5C+GpJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtYzF-0003ro-1g; Tue, 12 Feb 2019 14:24:37 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtYyS-00035X-3Y
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 14:23:54 +0000
Received: by mail-wr1-x441.google.com with SMTP id f14so2921952wrg.1
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 06:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZG3De299oLFFk5dERNO5JVx+5pMyQTogB9vh2Bdbvnw=;
 b=o9dUh1Wuu24ngMSSyOBxY02FUnv3Fdp8Gl6X2n+1tetyTCMSSHivsSd9WAha1CXsAf
 Oe6+A8J/7HLJ1a7ayNLe28Ujgr37+GFay8S9/aJ9CkkLaZ/SZNomKyh1Rg4AEt1kgRbU
 YLLluatgf7y2J7yIE2wQZHjWT5PXQiimgZBtxe7a+DsUc4BzwT7KBa8U0SXL98mcy2f9
 Z9/zeEx86QX+xZ75QIvPxg3RsS7/ui4WJTi/m4hpn5w/5cABXhEOhQX9L/3GL2sk4WMn
 zS7pAmw+mT+lM+Nvpn8G2ICTRJeoCOunaT1+IZ6mvmcV7ZIK3UKQRmy8Qe/JpQa3SaW4
 YVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZG3De299oLFFk5dERNO5JVx+5pMyQTogB9vh2Bdbvnw=;
 b=SJlA3oiPuLxsOOE9YmNaKT+s4FCKfpc6rcLUoZS3hcrY1m6LDDFtlUfUtR2j/7853F
 UlIAOHvAdlNt+FwbxeqiWlQwunIIRuEZB1sc5rTt/KGf+G8hthsxqFz8k5iEcMppRaw4
 VGtN8mtInXjJNjQ0x6Hx9zUmPgmOY6Dyprzx8xhPLfyVGmDXhoKM+UNOzHlGQ6rTP8NM
 70eoL1J8R++HZYIauQDWVnpCWH3EzCC2sM3XM3oxtNJp3HRqsWnzchgQjMJlQY/gt6GE
 Ud4sSpwqRAZAoibiyAt9qYSzS3W/MtNEw4iNuKh5FStYESKbDqzyU9AMrchBclcLC0Bv
 92jw==
X-Gm-Message-State: AHQUAuajbhRH1BTnb6tW+D9EYERrgLy0szUUYQBC662ZHddCla7u5bMu
 xS6jXBY6zYmxgjTNL7sEVGenpg==
X-Google-Smtp-Source: AHgI3IbCXBU8Yp+zJ34yAUx1SNdEn3jRMsPv1Fy9to0JPtp1vVW0scNwQdvOLfil0egE64Imk+RufA==
X-Received: by 2002:adf:e641:: with SMTP id b1mr3007847wrn.213.1549981426490; 
 Tue, 12 Feb 2019 06:23:46 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y22sm39043216wrd.45.2019.02.12.06.23.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Feb 2019 06:23:45 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/3] arm64: meson: Add SoC ID detection for G12A
Date: Tue, 12 Feb 2019 15:23:41 +0100
Message-Id: <20190212142344.13634-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_062348_148723_97B3CE08 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset :
- Fixes the package id detection for S905 variants and AXG packages
- Adds new SoC IDs and Packages IDs for G12A/G12B
- Adds Add AO Secure node for G12A dtsi

Neil Armstrong (3):
  soc: amlogic: gx-socinfo: Add mask for each SoC packages
  soc: amlogic: gx-socinfo: Add new SoC IDs and Packages IDs
  arm64: dts: meson-g12a: Add AO Secure node

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi |  6 ++++
 drivers/soc/amlogic/meson-gx-socinfo.c      | 37 ++++++++++++---------
 2 files changed, 28 insertions(+), 15 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
