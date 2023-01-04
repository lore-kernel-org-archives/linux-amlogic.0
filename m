Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D5FC4708E
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jan 2023 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RO0Ohgv7KmqVWf0mECr0fX80agGA5wubbRkw3dV02CM=; b=s1Capvb0obzjUG
	EyjMUCvJSjJ2k0KsDC/ZuurgiuC+WVpw7Un+ucI+SL5yUT/TwpPtkYOuy/1C2AWkwXsXlPGuBQXzt
	OvIxrEqptXnaw6l4y3ZNP2TYplLAes73FaRGBXUcUTmx3BQOd34tqJRaj/ZrXgjmT9WqVyvA6eDjJ
	g4CsMWfEyXOYJwo+oJZd54PUXVXEr8/095GYXLkNI91PbCt0XktzA14RxVaZ0hrMOgFAwiLC+v3/x
	a6Y7ctaMY8Ojy85JSxieOqFPkbCXWaN38f9biVCnQWUriKljd51nB8s/lvWRvlU+YPMDhWOP6bxBX
	iGkYCQUo5RRStx00/wdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5MO-009xhs-MM; Wed, 04 Jan 2023 15:07:20 +0000
Received: from djehouty.pomail.fr ([2001:910:13cf:ffff::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4QA-009Zmv-0B; Wed, 04 Jan 2023 14:07:12 +0000
Received: from nout.ra.nemunai.re (unknown [IPv6:2a01:e0a:518:830::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by djehouty.pomail.fr (Postfix) with ESMTPS id 321DD3F5D7;
	Wed,  4 Jan 2023 15:06:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nemunai.re; s=thot;
	t=1672841216; bh=pPjqT0TJPFTYpkFFu4UrXAwFJVrT2wNcYyFtiBLsFw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YRNmdDVyrSmfTlZKYgHo/j3SZ0mzO1C9ayf3BPHQ5iMDToRpH2b9/vfy/aTXA92q3
	 YDewiJh2nmisw7gT4tkAhx/jp6nP+GFdcgkmKaeJWdJJ5GncTzYGKzPpzjygsIbc0S
	 puP2iZkz9BImXOUleJ/pa7CqzTy2eLG41jHBUT4YFPb+8LFlVBY18DGlsDJHm39R9R
	 8SXZjfBlKVjNhaXPghW/OKUGfMdyboK18/TJ07xiuiYRx1DUXS7PB8wTSXsLzxKbRb
	 szKhQB3ZGSM2fzN6uZ6y6eZBWzwKMWfKhfIzYzaTHDT80V+wzLNotSwNUADQKDHmFp
	 WXyMoh1wpoLgXRe2shqKrDl1pgeINqGrM4bud8pLpiE2j7u0EUjmlnojw2kEi2Yb6t
	 W0vTQc7cJZTgdt+MSZd4xikh9Vqj7aZ+cW445nzrSgeZvZAVFP6wmayPCYwPbQ8EUG
	 XC35W9IUXNuobQy4TUYET5XPS5XT57E+P0ZNVvnsn22Fk8K+C29zGY2faBHI0hAzV2
	 tvXjVr0os8CX1OFU+u5lOvAs+iD3fTuBciHheD330qZmiUklQumQ14cRX447TKYklS
	 FGjdYzytt9+fKFmD+8noL9/h3I61iVWYpSRoYs6tdex+TRP/jH6XhK8YtoBA99y4Ao
	 HUVpEom9kevDY02kmLX/hFvw=
Received: from khonsou.ra.nemunai.re (unknown [IPv6:2a01:e0a:518:830:24ba:f302:d390:49c2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nemunaire)
	by nout.ra.nemunai.re (Postfix) with ESMTPSA id 19C7D20BFB;
	Wed,  4 Jan 2023 14:06:55 +0000 (-00)
From: Pierre-Olivier Mercier <nemunaire@nemunai.re>
To: neil.armstrong@linaro.org,
	martin.blumenstingl@googlemail.com
Cc: khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Pierre-Olivier Mercier <nemunaire@nemunai.re>
Subject: [PATCH] Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0"
Date: Wed,  4 Jan 2023 15:06:08 +0100
Message-Id: <20230104140608.28432-1-nemunaire@nemunai.re>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <Y6okoXpwF/LZewhv@nemunai.re>
References: <Y6okoXpwF/LZewhv@nemunai.re>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_060710_821391_95A3DA7E 
X-CRM114-Status: UNSURE (   9.83  )
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

This reverts commit 703e84d6615a4a95fb504c8f2e4c9426b86f3930.

USB device enumeration was not working on Odroid HC4 as both USB2 PHYs
need to be enabled. This is inherited from the GLX USB design [0].

[0]: https://lore.kernel.org/all/20170814224542.18257-1-martin.blumenstingl@googlemail.com/T/
Link: https://lore.kernel.org/all/Y6okoXpwF%2FLZewhv@nemunai.re/
Signed-off-by: Pierre-Olivier Mercier <nemunaire@nemunai.re>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index e3486f60645a..a1f0c38ccadd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -131,10 +131,6 @@ flash@0 {
 };
 
 &usb {
-	phys = <&usb2_phy1>;
-	phy-names = "usb2-phy1";
-};
-
-&usb2_phy0 {
-	status = "disabled";
+	phys = <&usb2_phy0>, <&usb2_phy1>;
+	phy-names = "usb2-phy0", "usb2-phy1";
 };
-- 
2.38.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
