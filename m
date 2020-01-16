Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F9AC33CB7
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 16:46:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1CC62081E
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 16:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IQVAFvvH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZP6c9Z8K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1CC62081E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXieoADJvJde6qpdDo8N1igwQ+qUdBBgFloL4H7Gn0k=; b=IQVAFvvHor/o1X
	mwt5SKKk/UvbddhShTVpkO8gl9RVmOnAWzXqTURLbx/r6FFK8+UggUSXk6YDjzZ44W2pg3qjSvjRq
	dR+sOCHCSyYjl8lpnVuBop4O6zj3jmt7zBjJzl4XAzNv0M+WpjnGc+XLKNq9KTe6SBBDc1QXOmahB
	A4KUbFbnNVeny3vgHdDBu9Arj+IBNidsY52kCbQXvIqBWj5jDlxEMa6T1ZFVzXXpj+TQKKGHGZHsD
	wS8U3h5HQxd6QFYeRjTfsKeFE8yxlqLdijCtTCfHVHSWqqwFhFf0uK1sbXpvo0df3JIRpi8TOivBs
	mJXWv6XLhN3ubB7vHu1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8Hi-00017d-O7; Thu, 16 Jan 2020 16:46:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8Gz-0000VY-IZ; Thu, 16 Jan 2020 16:45:40 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCA8921D7D;
 Thu, 16 Jan 2020 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193133;
 bh=iVaJF59sRje1+OIG8QjypzCfAKhVib/wLh/CAWkDX6E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZP6c9Z8KoTPlV5LvfDR+jehHip1oa2BKhSoZc5nzhmJY08JpToLxKfi56sTl27+Qg
 2HlR3U+1jHSnqq/fihAhzRjRy4oCCyRJzBZO7dYG2D566gBV+wXPaTeCn+BJmPh28/
 vIscQEZga3Odcbs6d2A0Ett4lVMVbPejPlARj7SM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 031/205] arm64: dts: meson-gxl-s905x-khadas-vim:
 fix gpio-keys-polled node
Date: Thu, 16 Jan 2020 11:40:06 -0500
Message-Id: <20200116164300.6705-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_084533_662719_254DD111 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Christian Hewitt <christianshewitt@gmail.com>

[ Upstream commit d5f6fa904ecbadbb8e9fa6302b0fc165bec0559a ]

Fix DTC warnings:

arch/arm/dts/meson-gxl-s905x-khadas-vim.dtb: Warning (avoid_unnecessary_addr_size):
   /gpio-keys-polled: unnecessary #address-cells/#size-cells
      without "ranges" or child "reg" property

Fixes: e15d2774b8c0 ("ARM64: dts: meson-gxl: add support for the Khadas VIM board")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 8d6f316a5c7b..440bc23c7342 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -33,11 +33,9 @@
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
-		button@0 {
+		power-button {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
