Return-Path: <SRS0=SZaW=RR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C92C10F06
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 14:02:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4C952184E
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 14:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Puer9df5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zBFdJD6U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4C952184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NamZuX+wtLM5QibJWLlJVnZFq3XUhCo+r9odPzEOxvI=; b=Puer9df53DkCCj
	8vSwJZOyW9wIwYG6RyDGyDJM3I005fCXbq4otRjwSv9v9gXWSEHqnG/1Wn22159FKkwdeh1BIZX+u
	ASpeJXYp5fhCJd+f89fxAU0tWzDI06afLFn91dRMEo9muRG68NUSa/VHOL7m9/cu6xhSc2vvRfSWF
	jil5W1AHsQFAFVFVB4XAqrJmr5fPD8vm8xgmBnZv0Fy0od2CYxd4bfeosML3/cPaQVUUnwJjIV9Ua
	JSHxEn4eS0V8ZMUTTKHj6BrwD0TpfEEbPdgeThM/3ucjaAim7/zm9GrBHUBlBuEuAWxE2v6gHWy+o
	5xLFqUz2pihYPqTjfwlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4Qvx-0000My-Qc; Thu, 14 Mar 2019 14:02:09 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4Qvj-0000FM-3V
 for linux-amlogic@lists.infradead.org; Thu, 14 Mar 2019 14:02:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id a188so2820542wmf.3
 for <linux-amlogic@lists.infradead.org>; Thu, 14 Mar 2019 07:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fjwsjwlHMsEm45LUtcBnXKn7bhdbIvWwPtmw07Gq+o=;
 b=zBFdJD6U1S/1wQSSjtxcxoMgff9/XaRbHJpkR0cpR11MMON5HlXDtQsHQJ/XgyUAXJ
 27JdlLZEA0r1GHJmhsP/C8C1lV84QhoOcQ9fTurPltKj+JXIs4crqJ38SBpAGQWLi4X9
 NynLUJsNRv6BEcV+Y8aw0LepVjdqkwwJVJO32betyXJBEeNTRv/yDGDftz8cyPqU9NiB
 31JtPMOOexeJKGC1QKGDTlPHLi6DVgy0AJuRX1dntLuRltCl8nQfpL2BXDnDyCerEqqf
 TLDBsQCJ6+wrs7UITo/jtfkxABmFZ7x5QPVC+eYC+O46e2UxZB/U8RKPbKXUKOn+eRy3
 NAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fjwsjwlHMsEm45LUtcBnXKn7bhdbIvWwPtmw07Gq+o=;
 b=Weo+VTng8OiAPbub6Fdl3v1pQgct1z5jaEiC+LVdY2sEwuLk+kNtU2UJ9cS3DyuR0S
 BON3grgCaWgftZOsSqRDKhNhRwvvCTOJa8TnjhBjsnwIwgNQc+UYYGHvEpr8KySleq9H
 pWqA0M05XsjmozBGc+rNkc+chPkj28NnOtMDlzwis9hfPiszG5x3TFx+EKuPYLPUsFAF
 IOBHB8f9b7uPS6gxyrzM2wllmyjJ4Tsis7T/3mYxH+3pJwLjEJu1E8jKYbhGACK3so1D
 CvQyWG4+AmWg+j/DZJNyr0bESSNwc1+MH6xQ7L136daAZ5hMMDz9IclqSTbaUD6ie3oY
 GizA==
X-Gm-Message-State: APjAAAX4h9VQYhDlogOliETYB8RRbblJqrwEg9iQyrPOfBPLh1OrzvjO
 xpIoz8M72FRA9I79J5SyfREZNQ==
X-Google-Smtp-Source: APXvYqx1rU5GXR97ju2BKBGDGkyugpcPMuy47xNmPlDB4DMFiw/eR9pGvI7gbkdn5flBQND+gOW5TA==
X-Received: by 2002:a1c:9ed5:: with SMTP id h204mr2795123wme.35.1552572113197; 
 Thu, 14 Mar 2019 07:01:53 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id y7sm2661051wmi.34.2019.03.14.07.01.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 Mar 2019 07:01:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH net-next 0/3] net: phy: add Amlogic g12a support
Date: Thu, 14 Mar 2019 15:01:32 +0100
Message-Id: <20190314140135.19184-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_070155_182517_19CAF1CD 
X-CRM114-Status: UNSURE (   8.99  )
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
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds the necessary bits to support network on the Amlogic
g12a SoC family.

Only the internal PHY and related MDIO mux needed to addressed. The GMAC
remains compatible with axg SoC family

This series has been tested on the u200 (S905D2) with both the internal
and external (Realtek) PHYs.

Jerome Brunet (3):
  dt-bindings: net: phy: add g12a mdio mux documentation
  net: phy: add amlogic g12a mdio mux support
  net: phy: meson-gxl: add g12a support

 .../bindings/net/mdio-mux-meson-g12a.txt      |  48 +++
 drivers/net/phy/Kconfig                       |  10 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mdio-mux-meson-g12a.c         | 371 ++++++++++++++++++
 drivers/net/phy/meson-gxl.c                   |  14 +
 5 files changed, 444 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
 create mode 100644 drivers/net/phy/mdio-mux-meson-g12a.c

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
