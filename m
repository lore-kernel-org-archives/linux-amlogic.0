Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B30AC3F6B0
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oeg/Xl2zD8hXrbjqhqKobp++VN51SL8xaz6I+Q403gA=; b=cnCZBP7HTDdcU2
	tcnyeJHQOXtf4qW1gz48tP4O2jDFehwv1XE9n14q20Wgu5AQrg+GhOB1/AkWDv17wzY7oQ39Hq7G2
	ZrgIENlqG4rn9qyxZel5rCz2WKeNHLeHfCfbhhN4hSjCi3c+EEtexSuuW1aHhdjpW1LWnLnZNAO1r
	48HnvkgALNokK5gmy9O6u8kdoVk77DqOHAiy/zL5HIe4pJhBKERFemQiJzpVbBnpg3lNMiXLU5/VF
	hXRCCFOlA7fvxsS0iUqcE4Xjm9jWvhcT9TAPycu5a8K5BflZpOYHmNylr2UW3j7Fw4sR4UgRxiXbd
	pWHXS5TZYzzf5wXxKNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLgP-000Gxl-CU; Tue, 26 Jul 2022 14:37:13 +0000
Received: from out203-205-251-27.mail.qq.com ([203.205.251.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLgL-000Guf-Pa
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 14:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658846228; bh=SDiTUsa49Kj+XWBRd5vY//cGbS8xbDMXURqlfRjB/pY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X5x99KAiSgWrLRjrpn9RbhS3UcD2Cb9Dj5WTxT/Oknn+YBQ9Biu1sghpY/JAMmUZg
	 GXvZfS2sHXbQ14Lw5a9QykiHT4mLGCuq0zuEZY3jz+JZk91FBiIzH/nNiLzHwuimZw
	 n/IMmk4U2W5ZrPTUBZLJ2yaL8RO91VRCo9QjMhOI=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza35.qq.com (NewEsmtp) with SMTP
	id 940102AA; Tue, 26 Jul 2022 22:37:00 +0800
X-QQ-mid: xmsmtpt1658846226t4fvze76i
Message-ID: <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
X-QQ-XMAILINFO: M0yQCYO1Pk4B0TAKbVJqW4q58eSO8o5dOEIc+8UMgV+tN9UrNI+ckkf207QCxu
	 071YN2zqXmefRqAG3eDnyiJWg9PQpPamqKVIpSuCsbo320M86x0EJ1jHPPfhyRDdKNjPekAA/gP5
	 CB6+j2v69V9dOVRarp2wHgmmnoUHiPXXhfwsYjOOwBAN0pKb62AfwFIq4nRwllto/84ojTDVos32
	 WY2MH10uocjmUghpEEb+1U2DnWgmgYr7M+Jq6xn0y1w0jnf559iu3PP6m0/N6v++oBegmHnbC3i2
	 VAB2B5hXK0TBbrFMpUhH9QnsVqVHmmd8Ra3AbT8P+cXAwuSgTpO6Sq8R9xS1LneSPd8fly0QKSp8
	 h/kcIK/kzD5iTmiNMtyFvRGKKipy8zyVcH25xySqeZahq25szf2B//LeImBCnp0jtzgAdg36P32r
	 sgLtixcQ5qd2TSaXFPlimYz1CfZtGtzhxpF530nXKkO0KYW1acmsbnwFZwInasMIvXgqBE2rH7+H
	 s6jXPo0Vy0ArIsj7JAFJeOHXRA5lEt6Ay2U5Wyt1Z4hDFDLP7Hc2Q5aqVJqsxHNdsZ4Y6AdMPyh5
	 2uSbwwmBa0Ak3e7BRv5mW+tsdf7JxxKcSu6CUr2qMTeRc087JVxkPSWNyRKOQaIcp0yXMvRQljh2
	 D9jMolret7IsaGP3reSlBmZQSAvJHzO8kkUcy2dXoFB1Kq0+ScOp17A3uU7PzvuXeXaudw76tlmF
	 7UB/Qanvznm1jP9UHNWEyQi5wLh0WSOEy2KuZXb0+iimJDrPKNCPFl9xCYa+EtqTfc/rbh1eYrX0
	 G8sr6a9VhRMR0/1nBSEGjC+3ko9bpJja+tedBoUqXQRGXNm8kEGCoYmHJGJo+YWwUx5qzkwnfx2v
	 AFhZPTsrDZc2FurPe03Ezz81YWbxV4SIZMStyWzSJKyBN4WbOb/7+Oyh8xDgYSCfQkohpXAftj4I
	 pL7P9Wu14=
From: Zhang Ning <zhangn1985@qq.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com,
	martin.blumenstingl@googlemail.com,
	sean@mess.org,
	christianshewitt@gmail.com,
	linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
Date: Tue, 26 Jul 2022 22:36:48 +0800
X-OQ-MSGID: <20220726143649.142574-4-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726143649.142574-1-zhangn1985@qq.com>
References: <20220726143649.142574-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_073710_145595_F6342E17 
X-CRM114-Status: UNSURE (   6.50  )
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

Add manufactor bindings for Tmall
Add the board bindings for Magicbox M16S Tv Box

Signed-off-by: Zhang Ning <zhangn1985@qq.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml     | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 61a6cabb375b..a67af2adf6a5 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -125,6 +125,7 @@ properties:
               - libretech,aml-s912-pc
               - minix,neo-u9h
               - nexbox,a1
+              - tmall,magicbox-m16s
               - tronsmart,vega-s96
               - videostrong,gxm-kiii-pro
               - wetek,core2
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 0496773a3c4d..a06477405963 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1271,6 +1271,8 @@ patternProperties:
     description: Tianma Micro-electronics Co., Ltd.
   "^tlm,.*":
     description: Trusted Logic Mobility
+  "^tmall,.*":
+    description: Alibaba Tmall
   "^tmt,.*":
     description: Tecon Microprocessor Technologies, LLC.
   "^topeet,.*":
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
