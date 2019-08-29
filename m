Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24265C3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:29:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D832073F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:29:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o4mtcv21";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rK63TRNt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8D832073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzNYQYebtK6rOrjMP2zwQoqn6eRlNbguoW9CdaI7qHg=; b=o4mtcv219/spA1
	RF+1GcqLc2kUSVINZW+QleOHazz0o4PjTeV5OGW6tBD0uctby8/2O2xS6aXuNRU8dNVUnDo/wjrck
	D/s3dSxRveYtuznG46x5YYx6m806nl1s2M5kMxBDdxriKfau/EUQ6km5r/8Dpbn/ZJz3wEGVvVW4S
	KAUXgUDRFN8YaLiPqzqQWvcOcYcECBj/p2o9SYxoApz7bKTnJza2oBlwuK41DI7VhLuW5tTScRe65
	/u6a7um7zutXX6z0oBapR95Ll7kzrvdhFIGj7+mDQ4IUkmDS0LPWhs2YvNNLEPprDssOIIPcUjsWq
	F9OzP98HO7uDsYe9GmhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MMn-0001Sa-OC; Thu, 29 Aug 2019 15:29:42 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MH9-0007SH-48
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 15:23:56 +0000
Received: by mail-wm1-x343.google.com with SMTP id t17so4169185wmi.2
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fj/LO7/D7tssJ3to73Z9MGIPwyIiTagd9paTVbTbFLY=;
 b=rK63TRNtrq6CEarF4++/it4urtORDVjn0BExYKp022HdoDVPWrGEfG+f7RTp87ybaf
 dyYEDEj3E1mXX16W2lxXtghN6ZYRMrJX8HSaYN8OuYvUoSY7mvrYzqLD9fkMmDiwMI+C
 mmauM5+hK22brenu2p81TiLbiQ7rFU3j2gkJMeNo+RdI2+Qh+zKLCK3z8vHeG+8PP20M
 0VhkNtV+lFhy9BwEuvjLqmgfHuZbz7GvW091pjg/3CM+5qNAyYQ9YUuwrXe5eY8BEz3I
 ZOTLrk0UV54Pf21OsyyJUppJ8LDAhRPdr7sq/uT4G5vZkmCD6UzQyoUDyQlDWs0+3a8u
 Eu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fj/LO7/D7tssJ3to73Z9MGIPwyIiTagd9paTVbTbFLY=;
 b=oUq87eb1oKXxgwPpgmxvCw9GGSPMVz/wZjdedD+HAHVrdSi07uF+zG+nuAF6DeaoTa
 MIs1V9x51tbQdnnQikAcj7ZkM1odHxutVer44JLzLzUxkGwK9BT95W14Z+0SMRWOzPJm
 /i9Rmwn+GrX0XAR8GezedcjBkrWafjNaslD9gtxxRVcJ6vM+Juir1D3qsJkQ6+xgr89B
 apn2oxTbdMIo2EmY4ZvuLf7unD7mXWeNvDi2jkYCp/Wbv6Y+IKhnWE5NGSYlq4wzjssq
 tsTNNHHyd5BfdFYsAW0hXBL/EonFKdqOlltiTy7PRgxZyj1N6xQ1uuEnIq6cJBRnR7wu
 Qkpg==
X-Gm-Message-State: APjAAAVTEbmJ4Dz7MgFo23M6jo8y89/jqQezzuBWRWf9RnhQHBY4yj68
 SDE/fJ72JOhxiS9nlJP17owN0Q==
X-Google-Smtp-Source: APXvYqzoShKlKTer46VXGXNQxBH/E4Wn+9taYruGKsP8S+VHedlYb9VuGCuIYT/XjoXMQlbFGSW3jA==
X-Received: by 2002:a1c:7c10:: with SMTP id x16mr749460wmc.110.1567092229816; 
 Thu, 29 Aug 2019 08:23:49 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm4866871wre.27.2019.08.29.08.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:23:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 07/15] arm64: dts: meson-gxbb-p20x: add keep-power-in-suspend
 property in SDIO node
Date: Thu, 29 Aug 2019 17:23:34 +0200
Message-Id: <20190829152342.27794-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829152342.27794-1-narmstrong@baylibre.com>
References: <20190829152342.27794-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082353_473747_69742CE9 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The WiFi firmware requires that the power is kept enabled while in
suspend mode. Add the keep-power-in-suspend property in the SDIO node
to specify that the power must be kept when entering in a system wide
suspend state.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index 89f7b41b0e9e..e803a466fe4e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -170,6 +170,9 @@
 	non-removable;
 	disable-wp;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	mmc-pwrseq = <&sdio_pwrseq>;
 
 	vmmc-supply = <&vddao_3v3>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
