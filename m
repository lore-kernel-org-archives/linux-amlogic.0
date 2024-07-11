Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CFAC3DA4D
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2024 20:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mZ+x1LxvwA8UKiPkLI1QspN7QIUrD0HpVaAl6XlNNFU=; b=bFuLT+cGWPptt8
	BP9WxE8IAr9I404528076MRnnL5K5O05e3Mb9Gnyzns9LC7HZYiXTT6q6vvrjh6YBOnKc6E64F9Ky
	Mnzqsn8XpR+UTQEhSGWUx0e4wMmu4IEWJnsq7A+B7Nuu/XlrtPGh55ftPxkyxmmCne+23wXJ2B21v
	/ZWsDX3jBy+q0nZmSnDajXCoFTX1nGa1f8XN2UDUx2O1y0oZPHfvq43OGmJJmi8zdCmJAJapp3Gi0
	wcaahk8dPxHW+wbmYCwQZBHcH9KpXGmtm2DGDumVSrSw00tLILaLlJ1mj0F9zzKhBxDDywOgu25k7
	JUqSwGNcVnPklLhTxENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS0EM-0000000FK3v-3isM;
	Thu, 11 Jul 2024 20:17:31 +0000
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS0EJ-0000000FK2N-1eX8
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jul 2024 20:17:29 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 46BKHCsT002183;
	Fri, 12 Jul 2024 05:17:12 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for Radxa ZERO 2 Pro
Date: Fri, 12 Jul 2024 05:16:50 +0900
Message-ID: <20240711201651.26191-1-naoki@radxa.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_131727_666427_E12C270E 
X-CRM114-Status: UNSURE (   5.95  )
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

Radxa ZERO 2 Pro is a ultra tiny high performance SBC[1] using the
Amlogic A311D chip.

[1] https://radxa.com/products/zeros/zero2pro

Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae1f5..66745b4f5eca 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -157,6 +157,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - radxa,zero-2pro
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
