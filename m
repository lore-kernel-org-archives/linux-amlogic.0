Return-Path: <SRS0=J82+=7V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A31C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 23:23:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D52932089D
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 23:23:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P3/zJqO4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItI77MPt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D52932089D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azVWgXd+L1MGJeYCyap3JLDmn9tbYVYC959rbYOZTXI=; b=P3/zJqO44sXcaB
	3OrIv6B2UEjzPCZV1ixsTvJTWp0t6zCBQyUXYupFqAWLXCAnjNrL5EkIvPG9NwCvDrF/Uk3RmQjN/
	/g6tRkmZIh/kx+k8/W8B92U1n+Eq5dO0kJeYlNfe3P9dXDdaw6j7W55c7qMFJo5CljlDEa9C9o+RK
	v4lWcmJeRO9lorigHHN/Zm0aNJIOPtEBjI7G+rXXatUonI6q3YBBK/WbBRC1IOQC12izSzGFMMpNc
	+hQYDKINHmGhHyI3LrwoZPCjiLZY3zjfTNZSoenjcKCJgZmjH2jdKU0A5EWooDLlzODtzm5WEvko9
	++ebOUBIKG8Zcs6L227w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiR75-0002nB-In; Mon, 08 Jun 2020 23:23:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQx3-0006Vl-PM; Mon, 08 Jun 2020 23:13:13 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F1C820897;
 Mon,  8 Jun 2020 23:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657989;
 bh=kmJ5BQn3b7/Tj0a78WgwZwTGYE27MlHWgm1yPvfpigU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ItI77MPtEp+Sm4XiSrpxJmrEpqBKIfIFIC+Obv0bYcLeGEObzAbnYktKuWuJD8i8F
 sre6XUYBQFpQ0/LGlKFW9rirOSMZfDB5To0FXV+tCs6XoeuuQLR5mEzvLPEvHbFcGS
 kDNlHkNkfy4uI0sU6T+9VfRzm5s86c7HdNbHOwQE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 048/606] arm64: dts: meson-g12b-ugoos-am6: fix usb
 vbus-supply
Date: Mon,  8 Jun 2020 19:02:53 -0400
Message-Id: <20200608231211.3363633-48-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161309_963666_AD1ED243 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>

commit 4e025fd91ba32a16ed8131158aa63cd37d141cbb upstream.

The USB supply used the wrong property, fixing:
meson-g12b-ugoos-am6.dt.yaml: usb@ffe09000: 'vbus-regulator' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'

Fixes: 2cd2310fca4c ("arm64: dts: meson-g12b-ugoos-am6: add initial device-tree")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Link: https://lore.kernel.org/r/20200326160857.11929-2-narmstrong@baylibre.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
index ccd0bced01e8..2e66d6418a59 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
@@ -545,7 +545,7 @@ &uart_AO {
 &usb {
 	status = "okay";
 	dr_mode = "host";
-	vbus-regulator = <&usb_pwr_en>;
+	vbus-supply = <&usb_pwr_en>;
 };
 
 &usb2_phy0 {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
