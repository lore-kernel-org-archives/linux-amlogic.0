Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE69C04A6A
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Aug 2023 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WEETmikKOgAIM8b4krho5rKWXitlomkiWqyMQJ/zQf4=; b=A6y0aOGUUCWJfV
	T5giv2rFWiuwAvjq1y1TnjbAEAxWtVdC2HiffT4OxznkyGjVSrDqW8GE3S81nqzX4BZkHfO7mnxj6
	Vz3A8+ufpFmSV7WMKmAt6lK+LWFyAjIDhIy3+UQ9bEFo/D389kKKFYWNfIA0BeTRj2q9iQANK+L7b
	Jkpdi/H3LWIkSp2SQV2BhN+ZWXmz+IvSYbqeJdXib2fwb91QUA4QKuhLFhaQ/FfOGZszXcMm1tzdx
	7ds/NK0ZgBb8t/NsV414yItRpOeadllxVS5M4XkhXXN6LL7qLlUrkl76M/pFkE+bTixN/amfIhjtC
	Md+ilzX5Cj1oTKS4fVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS1GZ-00DBMt-2C;
	Fri, 04 Aug 2023 20:19:19 +0000
Received: from mail-pl1-x661.google.com ([2607:f8b0:4864:20::661])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS1GW-00DBLR-2R
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Aug 2023 20:19:17 +0000
Received: by mail-pl1-x661.google.com with SMTP id d9443c01a7336-1bb775625e2so17508755ad.1
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Aug 2023 13:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691180354; x=1691785154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQFjBf7YtxXmJlSdHAu4ArmD+GnCH3KaGA7nl8cwkTs=;
        b=UtRNJsHxz1UB+ekhwkbt9C6Dtk5h5XbMoumFtaOzkQEv7IxKftbaDFQN+lTKl/AbZq
         bbotrbh+PtwAHlsbd7VATsfzrz4K1LmfvsCb3eTyJ03K6PP/cWp9eLArYWEztxFf9mZu
         qakKdMsiXit6f/0Nrst3iazklcxEc0oshWrHoAkQBb9D9X+VIECWWFqTVMAfKzLyijTz
         HQaJGrX0+fu0JdVokc6FczhJrI7skr833dGmXo9fTWsYTy7aaCN3wihbZeuCJfUgouab
         kiyKrKRSQ5MPhOmof8V8SGYdOb1EbVdrzpXF7MfbtyK1eh6+GIxlxUO2eZm3Kc5enz2s
         HEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691180354; x=1691785154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQFjBf7YtxXmJlSdHAu4ArmD+GnCH3KaGA7nl8cwkTs=;
        b=BAbhokugSwbMoV2iqZdMR48LBcP3NHFk7zD5iyyXTxi58+463ZlrKbJz0lqWCf4v01
         8reWIEtlHjnHe306YNWYQkd/4F65j1cN9fJVLpqzCPxBvoKtqlOo0kmXcOW8Y91iQeRX
         T1bjhqL/4+CAS6T/0MpR4WhWSf1lAi/71Vu6uy8XrnWNNINJiCvDXmouYvm9g5MnD8DO
         DfzSC+x/yUr2cWhFCFJR8B1jFbnSOmOIbH+cDfgidxb8jfbIPQT+50SkHaYptY4rb1LF
         Jkh+Ggasslq89mtAvPdFz2hWx678EOh/dXOqO3kmnoBwZphiSnndIRJ4GOBYh+SiJV5X
         V3Pw==
X-Gm-Message-State: AOJu0YxzKtUnBFw3l7iss70D8JaPSVkdXSCKCzNmQq/T2KfRbnlUjgQb
	l+dw+OkFPWojmE+1Ip5ZTcqq5poyTvS4wd6HDBMbMAEgrrx/
X-Google-Smtp-Source: AGHT+IG8HYHsBb1cwD/a6m826Y9iwPZnuIAKjiIHJsIkwHtJraIeAGfz9scoH18va3RFBbCIMIdNo+4mCugP
X-Received: by 2002:a17:902:f551:b0:1bb:c7bc:ceb8 with SMTP id h17-20020a170902f55100b001bbc7bcceb8mr768160plf.22.1691180354378;
        Fri, 04 Aug 2023 13:19:14 -0700 (PDT)
Received: from dxue-amd-5700g.libretech.co ([72.76.64.93])
        by smtp-relay.gmail.com with ESMTPS id q7-20020a170902a3c700b001b9dbb0e802sm377270plb.137.2023.08.04.13.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 13:19:14 -0700 (PDT)
X-Relaying-Domain: libre.computer
From: Da Xue <da@libre.computer>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	Luke Lu <luke.lu@libre.computer>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [PATCH v2] net: phy: meson-gxl: implement meson_gxl_phy_resume()
Date: Fri,  4 Aug 2023 16:19:02 -0400
Message-Id: <20230804201903.1303713-1-da@libre.computer>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_131916_801379_98925937 
X-CRM114-Status: GOOD (  12.45  )
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

After suspend and resume, the meson GXL internal PHY config needs to be initialized again or the carrier cannot be found.

Signed-off-by: Luke Lu <luke.lu@libre.computer>
Reviewed-by: Da Xue <da@libre.computer>
---
 drivers/net/phy/meson-gxl.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index bb9b33b6b..2df516ed4 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -132,6 +132,18 @@ static int meson_gxl_config_init(struct phy_device *phydev)
 	return 0;
 }
 
+static int meson_gxl_phy_resume(struct phy_device *phydev)
+{
+	int ret;
+
+	genphy_resume();
+	ret = meson_gxl_config_init(phydev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /* This function is provided to cope with the possible failures of this phy
  * during aneg process. When aneg fails, the PHY reports that aneg is done
  * but the value found in MII_LPA is wrong:
@@ -196,7 +208,7 @@ static struct phy_driver meson_gxl_phy[] = {
 		.config_intr	= smsc_phy_config_intr,
 		.handle_interrupt = smsc_phy_handle_interrupt,
 		.suspend        = genphy_suspend,
-		.resume         = genphy_resume,
+		.resume         = meson_gxl_phy_resume,
 		.read_mmd	= genphy_read_mmd_unsupported,
 		.write_mmd	= genphy_write_mmd_unsupported,
 	}, {
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
