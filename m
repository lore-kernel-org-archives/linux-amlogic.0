Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486AAC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Dec 2021 14:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ojQvmlVNFn8hLXQ6DBpPJ4x6uRndLQ0TP8ENtShn7bg=; b=RhWRy41z4LTiRm
	MFcdv1dlfGlZj1r+nW767Cw2Wt1LqvFUsfqkisWvak0PS2bUzH2dCzgfk1XxGN1hqoMRnzlO9Dsn0
	pfd02hzf23GALqS333aSWDyc2sdyd3dvdG10wgY/uSTr+K04SqzDT8DT/X7Dl6a6eVNwYoXM5oIUS
	N2mrKshiHl9/rnN84TUCtExKe6QJvgnxG+v/Gj4IofUdv2S/Se5XmwST2Dd5rh3Mz4gH2gPeQ6XG9
	oyVh5zHdAq9y3woRB6L7PMYiNIHLogrr8LkU6dSUrePvKcXckAfh12V16aAPOhUubPMd8NrqgQkWK
	LMojkOOqVGbjJrRjfU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myafo-00DzJg-Bu; Sat, 18 Dec 2021 14:26:56 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myafl-00DzIH-A1
 for linux-amlogic@lists.infradead.org; Sat, 18 Dec 2021 14:26:54 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4JGSpX40zKzQlMN;
 Sat, 18 Dec 2021 15:26:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1639837602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=G+pS6Uh7yL4/lq0yE+5W2746dwwezo3sk1nW6Pyjog0=;
 b=noencTNj7BsdaR5u4CouoNzAbe2v8Mtk473FNa3bFqlo7mxUtyFNvgvATa0AbMxQFDlusR
 Tdp8AllaM/mOTs/Hc+bm72yA2aiJ9jgWbEFq+/CIkgccnVfdd5OpbsjrEL8CyuzaQ7qiHJ
 H9TYn60lcdctc1X/P1wmg3MsYRWmtoZnVc7CurBYvOAs0+Z/8bZDLiYIdSKQ9RIzAk+AJi
 jpEi9O+cI0CLItmFYxGAurMjm+duU4Gi8/SJBPrBC93NLnC3Z42Xezh9FauzSByJCYD99+
 VTRIaXcsALl1WCBA8b/ms3czTdfWQ7lMuul5I5NtotvO0kqEcfwpwsQALjo0AQ==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 1/1] arm64: dts: meson-g12b-odroid-n2: move assigned-clocks
Date: Sat, 18 Dec 2021 15:26:32 +0100
Message-Id: <20211218142632.15293-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_062653_547552_9441F297 
X-CRM114-Status: UNSURE (   8.05  )
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

dtschema expects a 'clocks' property if 'assigned-clocks' is used, but
'sound' node does not.
So move the MPLL[0-2] clock settings &clkc_audio which actually use them.
This fixes the dtschema warning:
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi    | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 9c05c83453f5..85257507206c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -252,14 +252,6 @@ sound {
 				"U19 INR", "ACODEC LORP",
 				"Lineout", "U19 OUTL",
 				"Lineout", "U19 OUTR";
-
-		assigned-clocks = <&clkc CLKID_MPLL2>,
-				  <&clkc CLKID_MPLL0>,
-				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
-		assigned-clock-rates = <294912000>,
-				       <270950400>,
-				       <393216000>;
 		status = "okay";
 
 		dai-link-0 {
@@ -365,6 +357,13 @@ &cecb_AO {
 };
 
 &clkc_audio {
+	assigned-clocks = <&clkc CLKID_MPLL2>,
+				<&clkc CLKID_MPLL0>,
+				<&clkc CLKID_MPLL1>;
+	assigned-clock-parents = <0>, <0>, <0>;
+	assigned-clock-rates = <294912000>,
+					<270950400>,
+					<393216000>;
 	status = "okay";
 };
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
