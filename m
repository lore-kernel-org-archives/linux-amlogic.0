Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4993CC369A8
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDniQ1TDR5rj9UmTvnw2fYd61h3bxTk/7ETque0nv6Q=; b=4eGGSPVKD5HFLu
	2LeSPBFTumjxewh0p9z3Xsj5RnSfmPN/SnMEgtOSUYybDf8VQBAqulZwO19F4ifwETt/Mvtkbq0OM
	Geti7/aJVIJt/vmMlBZC+D+sB4tvSGyQNoTYm2btDhAGE0JO19KxApMk8Ux8BQaVRDZXTuLX3Ig1p
	rG80ViZwibP/iF2uPkZ/7SlONIZvmpBtDPqEdbcR/TtCZBzepyX1+7Tjq3Z2ABg+DxlogD/I6husk
	B/c3I9leM+CW3GvHXzceEgJEfwYZ8Q+v4oGUzCADg3XCJ0FaUVFcoBnQ8PCYlkdd1TKThZ7p2h1GK
	dflD1oQPZA6HUzrp03nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dxp-0000000DpXL-0jp4;
	Fri, 11 Apr 2025 12:58:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dih-0000000DmYL-3ozH;
	Fri, 11 Apr 2025 12:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1115A68463;
	Fri, 11 Apr 2025 12:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E405C4CEEA;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375374;
	bh=7uMNt1krg1bqV29C3TK9qHsnV2Y5y0mXablLbhELmf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fd6/KRVS1TsaHEbnpAnf2soFDA4rUrqM0Q0vmotIVDvTB4KjZ63xavZ8TxtPzIXaD
	 pLOVISMd4vD/uk8+MGGoJn5v3/fo9cI5zVh6eZrJ1w0j42vw4AhvML69eSITqcE+hj
	 azHSd3GN5rQu46YHxrBSMsza8nxOE53KOxyjazmyzFo6b+MFJsMk4m6CudeYgWVFxK
	 ojAZUlaR5GMARpJ+bWnXOCdB3UfgZpq8D+svNL64uLJED8T3SxzT7o8eYQfSTKkNBw
	 HOUkPDniEFYWK0pLgRsDAxwH1BT2pVAxBxmK3YMWDzYL5p3xqVHsBYB7pKu9NAFm6Z
	 xOT1KQ7fgIrdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3E0C369AC;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 20:42:44 +0800
Subject: [PATCH 2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
MIME-Version: 1.0
Message-Id: <20250411-clk-measure-v1-2-cb46a78d019a@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744375372; l=828;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=R+VgfvEaPoAKSQB5hn3wQA0opSipq/Yo223lp8X4HAc=;
 b=7xdBRMtyfW2OTwf09OOs3HozL9VTvwFUEDptXFUHha3noZ/r6nUSO8mWRz+q8JXRYnEpxc1Bx
 IHf08TbR3j7Buz5fiFIKwY5dqELdrl7Ap98uMszISFjBMdF9fsaIloU
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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

C3 adds support for clk-measure.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 77c281153010..275afe7fe374 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -22,6 +22,7 @@ properties:
       - amlogic,meson-axg-clk-measure
       - amlogic,meson-g12a-clk-measure
       - amlogic,meson-sm1-clk-measure
+      - amlogic,c3-clk-measure
 
   reg:
     maxItems: 1

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
