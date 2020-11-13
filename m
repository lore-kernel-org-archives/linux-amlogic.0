Return-Path: <SRS0=eCnW=ET=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3DBC5519F
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 00:06:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75E49221E9
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 00:06:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xjUGHd9L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eRuvBfW/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75E49221E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fd3Gd5FfU20wywk9m2UafLDav1JwwRuGNFoNb/EkiGM=; b=xjUGHd9LUuJW6DQimwwoEeU03f
	h8zMR25ZhOSgrzh9+Qw7MdUy19uojANUUTGf5ejYl/nKLcH4DRBI4aFJYUYzi5mojVAzfRiGnIWnO
	y5uen4b02A3tmUnNf5+McmEfje6vcCuLBesaXDuWqpRRbbdO9ULeBmglT3f1rPlQl+zAsF0OIsFzV
	2PSBY5ToGSrG24keismGbq5XOrgxz/TpyDvh9sQfThFVf4qCOK7Z0McxBvRnQSooreEFkDOa4u/fM
	yejHcfOl0gxsb+JB2wf+IlldVKi2z166LOldJFzs1lrFZKkjxeyxKyKWa2UxpvKR6aGwnsLLm/Vul
	qbAQjMLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdMba-0000Wn-Sd; Fri, 13 Nov 2020 00:06:18 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdMbY-0000W7-MX
 for linux-amlogic@lists.infradead.org; Fri, 13 Nov 2020 00:06:17 +0000
Received: by mail-wr1-x441.google.com with SMTP id p1so7837097wrf.12
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Nov 2020 16:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SvCqmojrOXPepsO1Q95hNkBgZWVIPjMyxB/8gJJcRy8=;
 b=eRuvBfW/w0YfQpAsNIggfETPocDNMewqXmrdbtLfYLawNTApaaz3vjA7PFcQiYyjG9
 dBaxdtuJUg9MvD94wZ1pZgIO5iK27fR6W3rhtr0P6/If0yO5Ixg++OgCzU1y6YuiIYMb
 RvZT6p6bWEzkirTINIWVSbRKEhpBxs0wCRrXHX+6ENfirp6DHb/QAJGUPG835JL+Hirv
 r9f4IUXkJGDCv0hWhbNA0Pm+27sLmdQZC8z+QFlDozejv74Mg0tbyowPRl9pSAm0ZWhD
 TO/mORp1bpQJuaXWlt1mXhXvDxXodpShZoiDAEIPwxEytiZiaJpyvWvGhxxWN6pxeZM6
 a8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SvCqmojrOXPepsO1Q95hNkBgZWVIPjMyxB/8gJJcRy8=;
 b=c3Z7f+hn1wD67d8YUWr/VFH/PYJHmR67Fsm/RkSjTS0Emu4ICuKI550+E5WFMyqb0q
 7sxQG/N525sHueORH8V3GpYBZJcdSe/YULD4ILrgsHd8ZtrE3XwCOh7By8OuZ4rw2Lf2
 hDSk5CKEIMt9fzdX8LVRD9triM5jMHA5VaJxnAU8NiOXlfND78DCT4E4D664R1vo9r6Q
 xmeAf12+Fx8OSswx3aHMRGdNmTsFLnHNtNSHghWaDzYp28q3mOG6ccWlDSf6Y0ubBlDM
 fffTKA004P7K3L4kg69shnNDj4d36alwnuKbJ+dS4KYyaLZdfGcGbLUCjU+5oEG1jwcl
 4MfQ==
X-Gm-Message-State: AOAM532TIdc29AFRfz3QBC77Y+oU202zJNL4zKCRU7S4WejbRdQW3uSb
 9otjBE20PL8Q2mEDkeiRaJOICg==
X-Google-Smtp-Source: ABdhPJzAFcpXiDgVQFWzpsy/4A2RLg4B3ufujHE7pwk5uARBCcBmbVQ4mOIR9n0l9zMSEXD2xN1i9g==
X-Received: by 2002:a5d:654c:: with SMTP id z12mr2349004wrv.46.1605225975556; 
 Thu, 12 Nov 2020 16:06:15 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:5d3c:83d5:8524:33ca])
 by smtp.googlemail.com with ESMTPSA id t11sm2010114wrm.8.2020.11.12.16.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 16:06:14 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
Date: Fri, 13 Nov 2020 01:05:06 +0100
Message-Id: <20201113000508.14702-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201113000508.14702-1-aouledameur@baylibre.com>
References: <20201113000508.14702-1-aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_190616_763697_32130899 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use reset_control_rearm() call if an error occurs in case
phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
and the reset line may be triggered again by other devices.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework. Therefore, use of reset_control_reset() on shared reset line
should be balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
Important:
Please DO NOT merge before this patch [0] is merged, it adds 
reset_control_rearm() call to the reset framework API.

[0] https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylib
re.com/

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 43ec9bf24abf..e366c0b1e339 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -114,8 +114,10 @@ static int phy_meson_gxl_usb2_init(struct phy *phy)
 		return ret;
 
 	ret = clk_prepare_enable(priv->clk);
-	if (ret)
+	if (ret) {
+		reset_control_rearm(priv->reset);
 		return ret;
+	}
 
 	return 0;
 }
@@ -124,6 +126,7 @@ static int phy_meson_gxl_usb2_exit(struct phy *phy)
 {
 	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
 
+	reset_control_rearm(priv->reset);
 	clk_disable_unprepare(priv->clk);
 
 	return 0;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
