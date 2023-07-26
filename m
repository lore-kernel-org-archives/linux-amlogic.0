Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C838BC0015E
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 11:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4x0xLTUU2/nCDT5PbGxcQj5Xgx0AEgdLvswNTDgHU8=; b=TEw3v8+ezfnzSE
	JucXhE8+meMbFMK6CaoW9xQT5u4ytY8Zj5piYIFNh5vri65D5alZsPPUBPfTs6efhPUYNnKohGmEq
	Eu17MG2UHmEmN1QGH+griWV/T7252cjPFoYWtO0kzQVXRcrF5foJjcuw5Htqx++Hu2xI4mSgdJy0P
	zqBkRKi+PGf7UiYQtzDGlZKXfsj5PknAgTtInNNf3pSm9rxHrZMc616nP/SzCvkGaBv08qvdGinaU
	EfQsxElafOG2Yq/lH+rc44AsnctuPQxJOOx+s3lw0ZgHvieReTyhEJUN8QVegElaxrKLaiy2KWJ0u
	nsR33bi5CPCibPM2UmJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd6h-00AFew-1x;
	Wed, 26 Jul 2023 11:55:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd6g-00AFdj-0J;
	Wed, 26 Jul 2023 11:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=K0ynCD+/JwB68gob6lOamTCJX1Gw9qJZSlEwIL0zPvo=; b=IUwJd8sUPG2D01GrUueOQcbjf3
	+Z2+WYdql/pKYfDA7PRR4IF3Jcre34KNU0cjcFR3/Rc/ZcI1oOPn2ZSHBVAtbnSWJWB2iQwjhMFwN
	3p95GuYJ/6CvkoVtYUm30Np50u2npiBoPAXCziICHuFsLFvy8aEeS4qtEUC4mM8mtj/9uDMkqIp63
	8pMgKEqY+AmjKvQW1VLRTXzQ8ryUKCNyNjy/D5QMerdNKv3mZQAUrkN+m643VEn6JV/lC4Q7Bb9rw
	1Hye/YGvCh+H9Ui4ka/efi2Dl3xNqovjabGzAz6XGmHioghJTq2bJ56p9w1qOcdD/0DuBoMNX6Wna
	2M6V4Ieg==;
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOcbO-005pDe-2t;
	Wed, 26 Jul 2023 11:22:48 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 26 Jul 2023
 19:22:07 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 1/4] dt-bindings: watchdog: Add support for Amlogic-T7 SoCs
Date: Wed, 26 Jul 2023 19:21:43 +0800
Message-ID: <20230726112146.1127145-2-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
References: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_122247_245576_A8FA5771 
X-CRM114-Status: UNSURE (   6.68  )
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

Update dt-binding document for watchdog of Amlogic-T7 SoCs.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
index f5cc7aa1b93b..443e2e7ab467 100644
--- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - amlogic,meson-gxbb-wdt
+      - amlogic,t7-wdt
 
   reg:
     maxItems: 1
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
