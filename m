Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83BDC54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 20:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JrdRAmmvm6MagsOtSaBiDA2fve+xKvNBHbPLk+6FpvA=; b=frtBCnwdJtQp1L
	LWrUCo/o/TABcmLFgLh+e2nZ0URzNOoGReimlMSfjyV8I/rwkSOeMGENU8fG6+tvRiVUcr7gHPqWN
	KBtpldymW4KVrE5JiXj7i3aGZlLPdRAO16WmcVOuAiVbDLFbwYEshd1e3jfVPL2W+8di0EGK9u2Ox
	yfvA7nlwcDRks2kTrSsv67StSmsISxmHu+rZuvlcWYkwhDDfPozElcQtQrzaxWA68sUreG43Ip9r6
	YAWMcUOKYyli0q3UvBYoQEkytRkPsa0bcVVi/Rsu6yLydTaKHneMZEUkqL4rXld+/NpV4uaSe0kbL
	r/ZtNlOXggKfGEUiL5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMaNz-005HvE-38; Mon, 30 Jan 2023 20:04:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMaNo-005HpQ-Pf; Mon, 30 Jan 2023 20:04:05 +0000
Received: by mail-pl1-x633.google.com with SMTP id jh15so3791339plb.8;
        Mon, 30 Jan 2023 12:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJ4P0/7Fp0wCRDTr6k9aNwM0pDSN8y8lOMVT0a0hr+M=;
        b=GMguhGR/5KzGoCcT+asTn+uaWzS2OXmm62BHl7SR+mlawkTkIqPq7ROdAN3adybGQ0
         PrnLmLD0QfXMrw4ppvxnvNifH4X/RlAKxdtMWFzawFYe915XuvuzImHj4WGauXGNCqH4
         wPhNBQsRWtsjsAG+GUh43c00/8Mcysrcdc/hnWsgwXAPTWYYZaYovUhsjuf/h0A6Ip5f
         Z/h3P7k0K9TFNFtQBcM+JEmr57M/XORBaP9Nk26e2TgydY6ZoGZUXxbZQyWPyOKBtTKK
         kHFMNfOJFQ8aOKCtWOZXwWE3ZEZqRHdA2RS9c3kAB1fDdsse0Ew6Kj0MaJiQ7jVUjsju
         A85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJ4P0/7Fp0wCRDTr6k9aNwM0pDSN8y8lOMVT0a0hr+M=;
        b=Vf1s3n28WWl3Li+UR25kXsxBO4axWrHglBoQnXL+8OufItGmqJ68Y3cnOw8QfROXMY
         0tx5S4eMwjUNoWqAX5iFkqI4iKnyIE+5Um6hiWDC7qp33TXAU2FfN3nhU43AYhOykgpz
         576qszLAUJ23s3Bn2vfkf3P0C6Xivgfs7RtqjurxBhkpKXc8wxcD6E2a5VTIIxT3GDmO
         QZz/KPzO9VZ7+u7ZGog2e2z+fkxl7yubYC6cuze+LBilEMKagDqO68faxQ7hhTRTmX3B
         HIHeKHEspOWAP8U2E8/q4oOY7L137btbUjXhc6DL/UF+LaBDK09ty8wUP3YwTvjYJ+qY
         GmIQ==
X-Gm-Message-State: AO0yUKUUWm46+doO9uULGepkvMnax3u7uFsV11Z4NA3V+s1Sa6+E+DxJ
	DXXuh1MadVAlzNab/sPJabM=
X-Google-Smtp-Source: AK7set/WTkUIa6Te+NDPxbvH6Wa2PH2/VOn6lWITCpx9lMT062pLD5IOdnoFxxeGfBW4aB267/9ELQ==
X-Received: by 2002:a05:6a20:54a6:b0:bd:b81:2bc3 with SMTP id i38-20020a056a2054a600b000bd0b812bc3mr5689786pzk.2.1675109042023;
        Mon, 30 Jan 2023 12:04:02 -0800 (PST)
Received: from localhost.localdomain.com (2603-8001-4200-6311-92a0-3d53-9224-b276.res6.spectrum.com. [2603:8001:4200:6311:92a0:3d53:9224:b276])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090a55c700b002300fe83a4fsm98684pjm.20.2023.01.30.12.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 12:04:01 -0800 (PST)
From: Chris Healy <cphealy@gmail.com>
To: cphealy@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jeremy.wang@amlogic.com
Cc: Chris Healy <healych@amazon.com>
Subject: [PATCH v2] net: phy: meson-gxl: Add generic dummy stubs for MMD register access
Date: Mon, 30 Jan 2023 12:03:52 -0800
Message-Id: <20230130200352.462548-1-cphealy@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_120404_854850_49E169D6 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Chris Healy <healych@amazon.com>

The Meson G12A Internal PHY does not support standard IEEE MMD extended
register access, therefore add generic dummy stubs to fail the read and
write MMD calls. This is necessary to prevent the core PHY code from
erroneously believing that EEE is supported by this PHY even though this
PHY does not support EEE, as MMD register access returns all FFFFs.

Fixes: 5c3407abb338 ("net: phy: meson-gxl: add g12a support")
Signed-off-by: Chris Healy <healych@amazon.com>
---

Change in v2:
* Add fixes tag

 drivers/net/phy/meson-gxl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index c49062ad72c6..5e41658b1e2f 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -271,6 +271,8 @@ static struct phy_driver meson_gxl_phy[] = {
 		.handle_interrupt = meson_gxl_handle_interrupt,
 		.suspend        = genphy_suspend,
 		.resume         = genphy_resume,
+		.read_mmd	= genphy_read_mmd_unsupported,
+		.write_mmd	= genphy_write_mmd_unsupported,
 	},
 };
 
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
