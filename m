Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67334CCA48C
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 23:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHvya1UHugtad/tyX+PDoUg8pJ4GkTmhMubJ+xKJBJY=; b=NKM1aaq5wHEheI
	lNqH1ODWqbceW5ueGxXPv3w52MvBF1ZMg/37geXIJY5k0rT9w+KeIL1HUmT7lCkubko+by42QyAbC
	PJUCXMb1BYisq1IkhW989I8FP3CBCk57DWOfm0t3iba9kOKufgLadtPfiKvcVHnOYEaZh9axYSV7M
	soxgeDdwczsafeLAaQkFlYHXERLLJygecNDZcGj1ysNtc8juMD97trxusECSnbv54SMA29LGOvwvQ
	nBM8qt+E0uDEVx9rSIPMDYOKVvJ3aGWlVujTdV6uehrHfU/b/7UJXEqrgx9llc/AHe2+hgx/5mal0
	nmAIqjxAC6yrNNc+KioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFkqr-00G7B4-Jx; Sun, 24 Jul 2022 23:17:33 +0000
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFkqm-00G750-Uv
	for linux-amlogic@lists.infradead.org; Sun, 24 Jul 2022 23:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658704639; bh=L1OKzS/6gJdq6B1s+pyUOL8qpdZ4pWPcZwWD57/I7Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aKcMHKKr89pvMidpyqSGVJyB2DNOtXUoN1YKvrks73Coald6ssayCqxiEUPJpK+fq
	 weTxxp2v2rMNJkL5ItdhlpXArpH534MQl8AR2qTSpvxRivuBYAIdjiOhaLcfkNR+u6
	 s7xjdYmjnHwQeH75VZpDIufUvCQ9Niw1Spij3zgw=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
	id 44B2EEC3; Mon, 25 Jul 2022 07:17:11 +0800
X-QQ-mid: xmsmtpt1658704637tkm6cmfhb
Message-ID: <tencent_529DC7E641BA7022B2C1C7C0E7427C2CB805@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j80DVVCKg9tfcXd06+TlTodnvuvb2gIWrwi1pDNXZADJzdje/jft
	 4HmgJTX7s5Mdt+bPpPlrK94j5g9fiA0d90qfbpJc32x4nzz3n0Y0mdL+R8O6w7jdQbKOt+Opsidp
	 9San3fW+8CoRIrCZY0BOUpP0exNwMHRvrJsHtBgTWxiFSWbtRp1RtcrneNH/j+WWfjYaxQPOmpaj
	 3J+Lc8JwpsOdxtCA1lVuc4xXzj8mEaNDeMBYeKQOhKqxv9rj+VAuod3wlQZ0rMDv52mi9N0PRAxm
	 VcME0PIX7s0qBcDLGccyzwvGtLmYSnYzVst0ojBpPLPVZ7tw6XJfyg+mcjtwkSNB5EeEqttgDRzC
	 DiFPnes/8yUnFgHlU++NByR0dxnbpjGwDqaCNyJnoyT13xeMEQuT56YhxRnof2jgEly1o7/o7mpt
	 DPQdZBqf9re8zt/xGthExoIqzegxPvkNBcgM1v/sjnhtRHfx5Qk1AAfGRJHV2sDug566TSsuTVNn
	 5p+XWQLEtnUct8+l3/c0RYSRQWBO/RsPp5BWVCJrrsZc5fH/L3pF2/MajKywLRf/MVv60VsM48+B
	 TuAHXvX2ITFYb4V1dy2Q6L2xuKWGU0apfL7R8f5aZvUCfWmaeUrrDWiyxEJNNvLvS4TeN9iYZz1w
	 x9kZiwviBPSSRLZdFGvxtRxShXVbGjmLuL117b+Es/2yqzkv+PY5A7KZIDXo3VC+TLXwgOnWhrMa
	 cutsMDJx+bIz2eOv6+9WQdj0IBMF5fIzeaGk/DRc3yZFa6OyusqslgAPbIf4tAkEw05+a/c0c3k3
	 Kz3xNxEhseU58Hn8hAXZlsX6IIQ0fbxQMR9AjB88kyzvMcMMkQmO58UDO1IxvAZnbBW5l0N7PAZH
	 5yMmyEzQK9VIvKwe5nogrf5XZvCZHHocsnrXuG8rg9SMtWp3PQ6oPe4M9nzbXB1LCHdMdoE9gJ
From: Zhang Ning <zhangn1985@qq.com>
To: martin.blumenstingl@googlemail.com,
	narmstrong@baylibre.com,
	linux-amlogic@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	sean@mess.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v5 3/4] dt-bindings: arm: add Magicbox M16S bindings
Date: Mon, 25 Jul 2022 07:17:03 +0800
X-OQ-MSGID: <20220724231704.132472-4-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724231704.132472-1-zhangn1985@qq.com>
References: <20220724231704.132472-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_161729_508206_3F68CA64 
X-CRM114-Status: UNSURE (   6.31  )
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

Add the board binding for Magicbox M16S Tv Box

Signed-off-by: Zhang Ning <zhangn1985@qq.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 61a6cabb375b..3eac16a4de68 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -123,6 +123,7 @@ properties:
               - khadas,vim2
               - kingnovel,r-box-pro
               - libretech,aml-s912-pc
+              - magicbox,m16s
               - minix,neo-u9h
               - nexbox,a1
               - tronsmart,vega-s96
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
