Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E828CC2D0DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 18:52:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C409620882
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 18:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YBMgSiM6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dzubA5Q/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C409620882
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqhACY3LTdDVoZin3PjsrB/SzEycAOnWnoGEavMUi2A=; b=YBMgSiM6Xt95sR
	9t+BBeohDnHcjS8Rpv2NW/MwNZFH4ylLW13j5MieUYi1H1XPyCfqQOGhCTLQedSf11FhO9fqfsEu7
	lKgcnK7Ush98NtCwdeFyIsI/k8Yqrk4I3GcDikByp4Ee7l1O7UnLnNqQ/RX9WGqGDMpVLDd0TCZ6E
	w4Oszhan61Tb0GbPAKdZoPaC0uhDRKQ/yql83McScVw+uiSe/yOQfQJ3gV4hmwAGX4CQ4s0imAJKg
	1LLSYHXwMTsj+w6U1dutzHJEVe7tEbsEGlRTui9/fgV0tXM8MN8OWcRMTb+cAtklos2gJKsCBVTQc
	x9iuKj1qYlhxs1P7AXYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikYFL-0002Kt-NW; Thu, 26 Dec 2019 18:52:31 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikYFI-0002Iq-P4; Thu, 26 Dec 2019 18:52:30 +0000
Received: by mail-wm1-x341.google.com with SMTP id d73so6483058wmd.1;
 Thu, 26 Dec 2019 10:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x80gT8L6krNF+9q96em5zX1Sz/Pb6+ffOrcGcaNiV2I=;
 b=dzubA5Q/bP9JGW03rXEB2xgJBONTjnk90Gaqw8Xd75WRrxE36LVRreoijnawEFTUHf
 DDryavfjJzYHttwaFOOXcc21cuY+YRaaqxUdhqZvgpegkIwdfiGrTBQkkgFE5Hp/bhU6
 42kSNg0S6zBQJ7OLYQyb/yg8gEz1FeeRkbTbl/NQimD91lNBSe+x7kevSbOUk/iYZqvG
 ok7gvy8Voe8/bkeAfE300zF+P7tHlMPAWKVHDM0Dxnvnm8jl10Vu9OkfoAOeEyS2ciTC
 +gOYAV3PV9S8rdVLz18MtAjgpn553+JekUCetTU232Gin6YCs9D90bQs/lI3WDn3n9Tk
 OJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x80gT8L6krNF+9q96em5zX1Sz/Pb6+ffOrcGcaNiV2I=;
 b=oGCP3+sK7l55xSjvpXSZPzxs3X+XMMgI7hQ0HB91zR1HGLgZHXPnDVoUpLChXgLPdW
 Jx3NJeolT1t5wa/VY7A7ga/ySOjcpTxQ6yEF8/3/C/+vAAJvOs86JwR6+9yJZwU+z92L
 vOoc/2Vcgch4Fn+wiFh8Lv9hK42fDC5FJHs3ZWouD2kbjbciyvWsyAaWlc3LXIxag9PX
 FhkjRb/dnIvadYdzrlsLaT9VF/wcZyweRbSutgR+WEa/YoPZ6GyzfF/HfsEf21AyLeHw
 su1+iy/OBs4kStvLE8QW5nvg/aqGOUabkxmjvEMcUUwTzdc9xD/RoECmU+XEc2oenL5S
 FZNw==
X-Gm-Message-State: APjAAAU51boOgVU8WEHthGmM+lWZvHSHcYIP24ruRS0CBfqCxGO9+fD7
 5VturjsCPHoAdhKLKfTwCdXZIOq6xaY=
X-Google-Smtp-Source: APXvYqwfeeE+lgRXq7rAUrvNpPD8mvxCgXpVTGpP/coyh/iT0Qzihn8QPQBpi5ZQqw4Lx8FeiLoosQ==
X-Received: by 2002:a05:600c:2549:: with SMTP id
 e9mr15745082wma.6.1577386347215; 
 Thu, 26 Dec 2019 10:52:27 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j12sm32129352wrt.55.2019.12.26.10.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 10:52:26 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 1/2] net: phy: realtek: add logging for the RGMII TX delay
 configuration
Date: Thu, 26 Dec 2019 19:51:47 +0100
Message-Id: <20191226185148.3764251-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191226185148.3764251-1-martin.blumenstingl@googlemail.com>
References: <20191226185148.3764251-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_105228_813829_742860C4 
X-CRM114-Status: GOOD (  16.78  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RGMII requires a delay of 2ns between the data and the clock signal.
There are at least three ways this can happen. One possibility is by
having the PHY generate this delay.
This is a common source for problems (for example with slow TX speeds or
packet loss when sending data). The TX delay configuration of the
RTL8211F PHY can be set either by pin-strappping the RXD1 pin (HIGH
means enabled, LOW means disabled) or through configuring a paged
register. The setting from the RXD1 pin is also reflected in the
register.

Add debug logging to the TX delay configuration on RTL8211F so it's
easier to spot these issues (for example if the TX delay is enabled for
both, the RTL8211F PHY and the MAC).
This is especially helpful because there is no public datasheet for the
RTL8211F PHY available with all the RX/TX delay specifics.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/realtek.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index 476db5345e1a..879ca37c8508 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -171,7 +171,9 @@ static int rtl8211c_config_init(struct phy_device *phydev)
 
 static int rtl8211f_config_init(struct phy_device *phydev)
 {
+	struct device *dev = &phydev->mdio.dev;
 	u16 val;
+	int ret;
 
 	/* enable TX-delay for rgmii-{id,txid}, and disable it for rgmii and
 	 * rgmii-rxid. The RX-delay can be enabled by the external RXDLY pin.
@@ -189,7 +191,22 @@ static int rtl8211f_config_init(struct phy_device *phydev)
 		return 0;
 	}
 
-	return phy_modify_paged(phydev, 0xd08, 0x11, RTL8211F_TX_DELAY, val);
+	ret = phy_modify_paged_changed(phydev, 0xd08, 0x11, RTL8211F_TX_DELAY,
+				       val);
+	if (ret < 0) {
+		dev_err(dev, "Failed to update the TX delay register\n");
+		return ret;
+	} else if (ret) {
+		dev_dbg(dev,
+			"%s 2ns TX delay (and changing the value from pin-strapping RXD1 or the bootloader)\n",
+			val ? "Enabling" : "Disabling");
+	} else {
+		dev_dbg(dev,
+			"2ns TX delay was already %s (by pin-strapping RXD1 or bootloader configuration)\n",
+			val ? "enabled" : "disabled");
+	}
+
+	return 0;
 }
 
 static int rtl8211e_config_init(struct phy_device *phydev)
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
