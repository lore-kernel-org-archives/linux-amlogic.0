Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D093FC36010
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 13:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvxTZOMXTOwPEnuhkjfzOP03omezfAdLfQ6/wZdBk9I=; b=wF4QgadkOqwhTy
	LiJFA8uMo8IEhrRtbpWGb0EjEvl9xzq6a/VDOXYKAni6mJEWFfam1WhvmLZY/8gUmpNussICTaMtU
	NqPQMcHunbyr9klolP5sVCM1InCJKwTmJoGqNibLPn1j90ATk6BBxYV466n3FtQzIcopTIGFMPmQ3
	naEVPDhyoBxKHYmWCr9uRva3JcBT/QHD7eoSI0SI11umKSNlHN6uJGKdSsMfFjjMVTrZBA0/2TTdH
	yhPOGiEdhSGwvmD0P/jgDiw1d8NvYvN3EzTiXphbxiWZSsQ2wRwqBGEMoglsJeIfJ/+Ur5EWIHUSc
	uu71YuII+byEBxx30CZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3E8X-0000000DrKE-2jm6;
	Fri, 11 Apr 2025 13:09:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dii-0000000DmYO-17l0;
	Fri, 11 Apr 2025 12:42:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04620A4AB10;
	Fri, 11 Apr 2025 12:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 316AEC4CEF7;
	Fri, 11 Apr 2025 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375375;
	bh=HLUNHReE0cNLO6CqkVo6sXtk4KZJ2890NAAWXXyNoFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jGk+NyoWzuBHZPmQPPUNW+Duw3aCsOpaGF8vy8VkfiP5nE5iDiDNUoX5B7BkqRRXs
	 fK8ZCmshrQnClvb+0Daow2f4KVhuojCHmcCPYuQYjzSnSSAx7OZNgWxmvoJzP+Q2+K
	 GkJCQpXnSj/Mq8ZBS6ZpbR8CBz+S6A/Y3D228e+d4b6Wt7JAqxjZ7L08/zgezrF5ie
	 XEvhotfgHhmbKvmrpW1i5VGdUdXkCKPd3nqnqFq/KdLZ+IPcZ0BrmcpyRToXQ/BUPO
	 CBaDokiU8iP2Z4V80PXAM2f0MzzWGbdTTXH5NyaI/uAXIoFGLF17h7tDGn8FEsliKv
	 jILBuyyQQOhBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28423C369A8;
	Fri, 11 Apr 2025 12:42:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 20:42:49 +0800
Subject: [PATCH 7/7] arm64: dts: amlogic: S4: Add clk-measure controller
 node
MIME-Version: 1.0
Message-Id: <20250411-clk-measure-v1-7-cb46a78d019a@amlogic.com>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
In-Reply-To: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744375372; l=767;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=itRtutR2PIVs/kAFr6Titwp0GUUTkodKKnworvlokhM=;
 b=HkLHQwUO4HrZDuTx82Q4lLAZGwoF6OGZJQla3YnGfIsydsSWucE6PSmhvIS/JMYVod6KlvVBN
 spDHf+yEF9WAKvCoQ0EuQvZixoBqSExl9cfQuYZsHWI78avK2kycxxb
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_054256_405997_8367D3E0 
X-CRM114-Status: UNSURE (   7.56  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for S4 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 957577d986c0..9d99ed2994df 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -629,6 +629,11 @@ internal_ephy: ethernet-phy@8 {
 				};
 			};
 
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s4-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			spicc0: spi@50000 {
 				compatible = "amlogic,meson-g12a-spicc";
 				reg = <0x0 0x50000 0x0 0x44>;

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
