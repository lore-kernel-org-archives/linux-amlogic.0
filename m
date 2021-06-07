Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6959C47082
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:58:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA69561208
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA69561208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHWVB2z7aEz14soCfRnoNFjkc1quBrtB3EWwLkjT5Hc=; b=1vQ0FRl/WSjEri
	Rm+aoKvhXg+XwWwjbcw418Vu98bXE+AOd2X4iXor1mVWd5BkbdS7WClNgYfryRCPrXjTW20Y7EGOP
	y1ivlpjVkVYT678GIjh+OWwi4Azc9l8tDXZImDR5YGXoxq/I7DmzfTKa1Z9fLxTMhD/acv4wVMrLR
	1edCyAV+y20bPBHrKBxGmSgdZZkCNi0tOrG/8InCyTuFfBxTyrdMTjVJhWUmPlEUAtokpjjwp6wV7
	6kKvYqZYwPvmByv3semVxSCDlQDGlPgcpz0Hp1/hc0P+1iu7Pn93448iyBfdpOgut46H8wAlKbl7y
	D4UnIckA5UW7123iyCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9DQ-001qyO-Nl; Mon, 07 Jun 2021 06:58:28 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9Ar-001pm9-S2
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 06:55:51 +0000
Received: by mail-wr1-f50.google.com with SMTP id a20so16304050wrc.0
 for <linux-amlogic@lists.infradead.org>; Sun, 06 Jun 2021 23:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SycGxNzUtV3DE7CamJrAD1Pvz+est/FKan8cUWbxD2I=;
 b=DpT2PnRxGVQiCgoJzyNAm/O4RoS9b2+QKEGKEaShOT3FSo0jeaMbyn69YZVT9nQtyl
 a6YFUTS8qVlw6ySBE+kkox9dYFvnUS/o1WOyZ1B7umwqHA1O+3+73GhCNRPtvtFs0mL/
 pM1A3TRy9Gi8Djqqn5ZWh5YcIsPTuWmiNoC0orAbuOf8IeCZi7GvrNgBGDnJEW9oTfXh
 yjM2DLkmQv+Q2QIBKkBXZoE4s/pyimnUfvVLbjqeN7XOc+1KLLy4H7KywVHwquvsg7eC
 xEdbUfp5iCu33yZMrqj0U0untSq5SR+m8ggFdQGpcPcFna+yfo9/5aVubHdh+TO1zz/b
 fGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SycGxNzUtV3DE7CamJrAD1Pvz+est/FKan8cUWbxD2I=;
 b=J062K/YTIxiU/vy5UTFeCb7saGXzHbtbPuZ/xCibytL4rgW8OoP4afeAbmgCeyaCwC
 y679Ktpqxqxyc4bdnadTa7ZuMaKUlksregLzK6YGvOXJm/9+Ay3kNcZ0kIWXWMfRvHtt
 4iQspGjNk3qj3vkU7y+jfaYuMMqdU3i4D8dWTxN3uz6gB+vkeYV/GxpgYVF20qqiolrV
 PdvSCwP9wVTpOKWiDrDbB2qQJCoB+ePAB8dFkoe+JyVljNhkmXDxi3ii5fYyuHlbkDyG
 UHjQwDVinM+CK9oSqskLiWUddV17vp0QdKm2HD8a2CPunYYkvznfo/Y+yA/ls1iUCe8H
 gcrw==
X-Gm-Message-State: AOAM530G6DhZQynFk5pIG6SF/GdmrGKt6r+7vuFuv4Zsr5HQIb+/h3Cj
 0g0Uo5lVYxY7HavPiD06qXXnew==
X-Google-Smtp-Source: ABdhPJzl8JaHo/BdUqNgiULQZx1Xi+Byjam5NvSMdsRJ/THVQ/xFGkrNM27ZzIUIO3fErWTHrcrpkw==
X-Received: by 2002:adf:fc90:: with SMTP id g16mr15475997wrr.183.1623048887766; 
 Sun, 06 Jun 2021 23:54:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:7c1f:1c9f:555e:7398])
 by smtp.gmail.com with ESMTPSA id
 l5sm16145742wmi.46.2021.06.06.23.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 23:54:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 4/7] arm64: dts: meson-sm1-odroid-hc4: disable unused USB
 PHY0
Date: Mon,  7 Jun 2021 08:54:32 +0200
Message-Id: <20210607065435.577334-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607065435.577334-1-narmstrong@baylibre.com>
References: <20210607065435.577334-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; h=from:subject;
 bh=YH7kXwU8dyNUaEMmy8cCWl++SIsJdk3eEHxEskLlOOg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgvcJA4vy8KzbqrA8Ny8bFa1T80r9/Vp8WK95/9XrM
 T2gvNXyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYL3CQAAKCRB33NvayMhJ0cnKD/
 0YeznbdfUMuRyrzsZojSnjNrCjwARL6cJxclh8do9fq2Z5qvM+PE+zLigW0PFyOIONtoIARLtJZUiT
 kxfrDdPM3AJz1EGXIOLr0SWpRPVdIQeqvGka+pMOoKweoC8Yc76x/Wh3fE3KkMHDbqebujk0CSWcGs
 NsQLmY//wu0Mf0jD8HtRU71FJzxx3qsyBLcRJ+4bDGRpzNXj0s/RQ5I0n63gZC74WhgaQgTmVh1HRd
 LG4SUblh7UuJZ9Uayk6qo/9hZdEAsRbmrhqR7dvicz/vJyPtCtDmNX3N6PL192C0dLDvlRvoLxOlGU
 wcmDFeXbSijydebbS21a2I3bmBNGs5V+kj6jVqz8+pJVSeZBRYqxcM6h/WaPHo9z/Wn+jameRVhuf7
 pd2ayBrMBsoe+C74TcP1zcTBIT+vWYV/txH8JyGiZJwJo1eaCiBea5hz52BwmXrcA2scf8EF3WXx0n
 YCXYStKvvXmB0FpgprL8uCD+bfxiu/Ujr/44fVoPqiL2ZnA+k+GoCjzDvg2WqX+GbDNRdpdiYlM1B+
 +8Kw0xziuWovWWyaEvJgMCShvj2AkDTyl5kzjIeCIEQ9eMTvSssDFfGT/BzIlokOiikGdeE5RqfbfS
 aZBj8w9zeqzs65KUd+AhuhTOLbmrAofGV4l4iGCF2uTt8t2ygmm1aksNyd0g==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_235549_932049_58AF748E 
X-CRM114-Status: GOOD (  10.82  )
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

As described in the HC4 schematics, only the USB port B is used,
port A is left unconnected. Thus disable PHY0 and remove it from PHYs list.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index bf15700c4b15..0a34b658f994 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -91,6 +91,10 @@ &sd_emmc_c {
 };
 
 &usb {
-	phys = <&usb2_phy0>, <&usb2_phy1>;
-	phy-names = "usb2-phy0", "usb2-phy1";
+	phys = <&usb2_phy1>;
+	phy-names = "usb2-phy1";
+};
+
+&usb2_phy0 {
+	status = "disabled";
 };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
