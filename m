Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FADC38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Jan 2023 21:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7NdMQDeKjleMQAYs+7pex3CTCBY41VszoGen6tn73Do=; b=4Z6BxWPsFjtztW
	GRT+hdrcl2FtMUZyKUEEZBrRKgVWM4EwvW0hIZEqxZ70wykvoZpr+fSCmhtpSYpRyqHCV5RkFfFN1
	5gY56ODSoGpZIk68CrUG9orXyYKfkGIC/92UhOqvg/9djLWQkgsNgow4BXGE3z+FlYcdBhwhTPU47
	1HHKW8B6jAOqewUqL+IloJKHdh54m8eaMQxxHjir+hFaXBEG+TCdnFG3JFkagZqhIaiAVMFJL+xc/
	zORYqgGMO6PlwfAIEklknYLaysWqXzZ1TI1Fv7jGurJ5fD9EwSdab1c4JytB7UsbAcQIqRYh3vTO0
	x+NKhUSvKkdSlP7BeOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMxn5-009LID-D0; Tue, 31 Jan 2023 21:03:43 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMxmv-009LFy-2t; Tue, 31 Jan 2023 21:03:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d14so15444852wrr.9;
        Tue, 31 Jan 2023 13:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRUNXSGS7rlhGuB49SDRG+lrGhsOIKZeHh4eRriR12g=;
        b=p07YQSj0WLysf5divFMPFqvl4Ttdg6e34EgMI4n7egBIhe6zSSChlrJDxmlCGB4MMz
         wIhVTceeOD8IEJU+PBOHgC53f4zNBTVYkLZamJCHC3z1d3WYfJ1u/JxPp7SDccQosiU+
         gux6SXkN1Vc/9XSOdtcrhyZJ/uiW3nLLAplgCYggMTeO6LYUuqssVq2KKxY3JyHU90Ub
         rgjHUuyEM2+Gsx0AqSgwgdyN9GvfPV4RfpxjzD8Cvg48xwD2CGmCk8ZZR1JMT6aABhfW
         P2zU1n1qCQbUQVBmH6wHuZSBrmBkBg7TqTlHvIRPK5q4HRFvsIFDJjkn88xxAMV+PkwF
         f9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gRUNXSGS7rlhGuB49SDRG+lrGhsOIKZeHh4eRriR12g=;
        b=KqQn+wMrJ9RDIh1LqooyH8OGpAVyWavmTkUaOrYiwF392G4bIw3BunRXYdqE4EcW0V
         95DUSAGeenXWyMcG61x5N4T8KdaUx0geoiagmV2onAhjWGPaltM8rcJW+eIY2yL257vM
         mQJORzm8iZm8YmmiFWeJmkMhNoarD3qJgOnsO70JdgY48fKjLPg0684J3iZ3OD/l/u5E
         f5OVXLXeer/f/8/IVjhvcpekczeD22WEhAyLJHAfXaZXNlHDCOUm5DVXFmwMr0jzP+mW
         ca+C8jjbkxzwMDlcadP5mgwhku9q4L/a+zcwhQ7mBk5edyTVWs621JtAp8QxowbY132b
         vFhQ==
X-Gm-Message-State: AO0yUKXKIGAjzI0nQDS7CF/8xGmdS6qxp4zBW8ypf984erAyRDUEvKqI
	GlBZJmyrmVbO5BczYvJFNO4=
X-Google-Smtp-Source: AK7set/F3m+pEBe1tR71tu2oLCZ4P4O2Nf/2y1a4r5IdlUn8aNbFNA8r3ht6SEIaBLCQ0M4jOZEIuA==
X-Received: by 2002:adf:e111:0:b0:2bf:d3c2:a36a with SMTP id t17-20020adfe111000000b002bfd3c2a36amr341635wrz.25.1675199009570;
        Tue, 31 Jan 2023 13:03:29 -0800 (PST)
Received: from ?IPV6:2a01:c23:b8ba:6a00:8d8f:fa1d:c162:c172? (dynamic-2a01-0c23-b8ba-6a00-8d8f-fa1d-c162-c172.c23.pool.telefonica.de. [2a01:c23:b8ba:6a00:8d8f:fa1d:c162:c172])
        by smtp.googlemail.com with ESMTPSA id m14-20020a5d6a0e000000b002bfd09f2ca6sm13691513wru.3.2023.01.31.13.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 13:03:28 -0800 (PST)
Message-ID: <23ecd290-56fb-699a-8722-f405b723b763@gmail.com>
Date: Tue, 31 Jan 2023 22:03:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Chris Healy <cphealy@gmail.com>
Subject: [PATCH net] net: phy: meson-gxl: use MMD access dummy stubs for GXL,
 internal PHY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_130333_158880_E86E0259 
X-CRM114-Status: UNSURE (   9.48  )
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

Jerome provided the information that also the GXL internal PHY doesn't
support MMD register access and EEE. MMD reads return 0xffff, what
results in e.g. completely wrong ethtool --show-eee output.
Therefore use the MMD dummy stubs.

Note: The Fixes tag references the commit that added the MMD dummy
access stubs.

Fixes: 5df7af85ecd8 ("net: phy: Add general dummy stubs for MMD register access")
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/meson-gxl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index c49062ad7..fbf5f2416 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -261,6 +261,8 @@ static struct phy_driver meson_gxl_phy[] = {
 		.handle_interrupt = meson_gxl_handle_interrupt,
 		.suspend        = genphy_suspend,
 		.resume         = genphy_resume,
+		.read_mmd	= genphy_read_mmd_unsupported,
+		.write_mmd	= genphy_write_mmd_unsupported,
 	}, {
 		PHY_ID_MATCH_EXACT(0x01803301),
 		.name		= "Meson G12A Internal PHY",
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
