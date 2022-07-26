Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EBFCCA489
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQVJ5WxRP3nDpI+S8aMTN1baZ8ntR4pcsNwy2MqoihU=; b=coPqtN1kmP56mG
	5tz/nkdaxxremif8bJ/6S+HpiJ4hS8tVaF2dgqooAk1uxlvPFQK66CCh4g0EFAQfl7qZzQlRmZn1e
	pDZ63lsFVwFbki6vjJ3OqGCXN0rnCYUoRPCxLiNMZLr15ciV7GcivwCJTIQJy0hGkClBn/iC8HWhX
	hRy7AI0eiBGIx7jCN5jmO1RqLc5rHnSlcbzgUVloiAmKbvawF/8zya2aia0jlONDFKD89hqP7XpJN
	jeR0H4InwM4qpKXTZ06Y87Y5hvps7v1S/6jGnlD909qj+FtD9hDxJg5NlcW/IlegkZ3Ot2ZsoKXl8
	WqkbhmNel8d4f2F1UhpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKPj-00HJ0D-Fp; Tue, 26 Jul 2022 13:15:55 +0000
Received: from out203-205-251-53.mail.qq.com ([203.205.251.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKPg-00HIxY-Ul
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 13:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658841346; bh=EWEPpnkJzYXDEouSUCLZ+x2NT/waXn7X2RwOOX3umWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WacEwwpNVkwnFKz9wuzWDsrGt5jY2nibIfC04YFljq22rapHvGa/Q6BmD0Vh40Y5y
	 CpjYjleK3QxL8lasvYuvC2KQ4pD6/bGxCJ79oqYu5j4P8FhDJoN4rDoJ6ICyjilM5H
	 X3aCNpPQXItQek2ju3U3/fGj1VicwitXJi73W5YI=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 3EA1E4DA; Tue, 26 Jul 2022 21:15:42 +0800
X-QQ-mid: xmsmtpt1658841344tu0101qua
Message-ID: <tencent_57D90453038881DBC5C9D86F3B860D917406@qq.com>
X-QQ-XMAILINFO: N4r4IakIsd1kDjW+p75ze0sw0vHSeLWbr+ytB5p0pVyQLIdzXiBSx4BXV9LBWy
	 +MBsXHD3LKTNNIUXvmlTnV73xV6y6DVYs4zfoeW9u0Xb7QuCsHHwVO17s2zWG/5E0B/G6LAMrFmS
	 T6vqQCAV7XXCA4KVb/xbFhc/s67wFIZxKf1TvZ8eu1XYn/ny8YHtTTM5uHJ5wZVwZ+7Ffa4bIJAK
	 7/9nSY4dO0cyWotod5ra5chMpRb8dGKR8i4+882pNdInvM3bUF9GLEK8RivCetG9qyUu44Hu2UtC
	 ApboAXoQMADC4kSQBbkrxr9x1I+6plV4vQkbn3tVocP6egxHHXluTMWzJgaNm4/xSH5GuQ78TZl2
	 AXSNQWU3TapcR8DbuBdBptIxzl6OpdZc8NF5emwi7kOi7UzcnoWNTxjLv4KkT2K84X0S9fqZmWeO
	 iSuPidf+YDvVz4AqAyrXHZ6sB3GPZBpqFUW6B1E48x7Vj4FXkNlrFPDdrTd1BGcK6acfUn+aYq47
	 V8noc5U8sbnqGemNPfJ9kSSZSFxx6UrmN5VjV9kHdw4KLmmjV6w6mFYYgILftzr3y4oocxSr87Q0
	 s6mo8KLfqlksWvjEww7BAlH6xsGYrS3/ePovwThihUePCw37fnUlHn6qYv1Jfgx7b0+GUQhpsvVZ
	 x2MbuhVhJeFcfu+uO6qKuUNwNpHxqT8U6CDtec1TMHjU8vF6k57ZUL7Htc2KnkPZsa4fumQH14zU
	 UYMIatu1kWRoUDEmUs63F9hUuSMHkpmrJuYXOrNXKZumZQj0q36dGeaHffvS/BUpGtSbIgGlInV1
	 c/3WZz9ypOI7pPQs+/2egxJr3OtbGfdOjcHoheCjxxjjCv5LmVHvcOUcrPPYEoOIYWs+e+sPlN/b
	 opLZDvXhD3NiAaY5jQHow+Qei3mgd8jcTNVauqbMF7kqEswfa7A98ntfuUV8O5hg==
From: Zhang Ning <zhangn1985@qq.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com,
	martin.blumenstingl@googlemail.com,
	sean@mess.org,
	linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v6 1/4] dt-bindings: media: rc: add keymap bindings for MagicBox M16S remote
Date: Tue, 26 Jul 2022 21:15:20 +0800
X-OQ-MSGID: <20220726131523.140581-2-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726131523.140581-1-zhangn1985@qq.com>
References: <20220726131523.140581-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_061553_311423_1C281F9E 
X-CRM114-Status: UNSURE (   6.14  )
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

MagicBox M16S Tv box shipped with a simple NEC remote.

Signed-off-by: Zhang Ning <zhangn1985@qq.com>
---
 Documentation/devicetree/bindings/media/rc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index d4c541c4b164..6491d1bdbac7 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -90,6 +90,7 @@ properties:
       - rc-kworld-plus-tv-analog
       - rc-leadtek-y04g0051
       - rc-lme2510
+      - rc-magicbox
       - rc-manli
       - rc-mecool-kii-pro
       - rc-mecool-kiii-pro
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
