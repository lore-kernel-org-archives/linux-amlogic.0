Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E078CCA47C
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 23:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZFqFb99cY/CsX8wugRHI5F8/KsahnIHZpnTo4oLQok=; b=bMhGUPRGFxFAHD
	nVnvAiI+wvkrMrf8hBaRNiC2oArH+/ij1WcG9hYUgt9or85UQSDejLx1KdbOwYk3p1j/yZZw3B2Kg
	bxAy8wrJ+VBRZRmWu0MsVV8Ks9CyLacUfq50furdsklaISPEtUPGuafhqDdtq57Kz8Ul6kjqZC7kv
	uX1xgVVQ2vTkGoA7pYHpneIxf0FHnbU7pGG1NeaftM/oQF72gYxcpFjNxZsRR1nez8v7nY/9HKTTY
	qrF8PYVLkzh9F9bwSEVqsgx1+SQE3WdN4xj3ghFVfxt8dOA0b/aOz0cip0YUXjD9jWeFpxoMxsxBj
	TZHthtI1fZU0Jgz+vZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFkqn-00G797-Bo; Sun, 24 Jul 2022 23:17:29 +0000
Received: from out203-205-221-242.mail.qq.com ([203.205.221.242])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFkqk-00G74C-7P
	for linux-amlogic@lists.infradead.org; Sun, 24 Jul 2022 23:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658704635; bh=J39Z1mCOc1zgflRoXQ1Oqew0bOU1Y6ajn8bnBVdrdx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xJKrXC/WRv38X9OF6X3Ou61RB1wpjrIkpXFoZirkUFf6CAjJeB+ennKBc+jfe1cHK
	 FsWYQ4ZhraudDCrl+hQcNVG4Xo7S4MMF9Xkn89twyq80ucf6lm7ShtKDuoxJcwNCkk
	 O2MwZXsPfkq+K7h2k21G32k24LCsQB5zT9A+gl0U=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
	id 44B2EEC3; Mon, 25 Jul 2022 07:17:11 +0800
X-QQ-mid: xmsmtpt1658704633ta4h90ky8
Message-ID: <tencent_3A0D41063A178C639FED0736A3D292134008@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeieS78pybFYrF+3ZbhuzDKohQMS1yIneQoknP595g5qCnlN6rHZow
	 +rvzWKx5P+KifTVv2RUsrtuPgX9Jo4QtnDu2Rg/T3/TYjvA3H70+1AcHaDDoKVyd+C89oZLiNuyn
	 XAOJuIyz/UeEKU37a/jygNXJC7VJFbtmCK9Vy8FIRACR9f1PptALxeUAUwL96a7jua0frg4EMVYX
	 zQxGZCGhWTKQR8bt0dP8nSCS9ixXK5A/pyoYR1dILZiOVXQIvZBmKL2J24xxjFHNkZXEyKjMUb49
	 ioc/1bJVp23TpiN72foE40/flfv8GBg2U/xr4CDHJZsmlRF+tCoOE0uyg+wZgB0/1f75336i0rVG
	 GA2CzRbRTEaKYWO9W+W7a+GMYTQRXJq6/c6iu9HB3CoW8gfwq3tshFMijN2kOBIlltQoFrq/IlDz
	 UtaXLsy9J0AeL4SeldQ8CkX8lb2C3gYwGPUTlP0GdhWeUIbdG61BiIC0+fz9t7mZwgK0fcV5GCB+
	 zoJSNYcbVQ+HDczS0mdX6NR0W7VGIjmc7cZmUuxFGYGCq93cguWvKprOGiWRW67MejWZLImi7SUK
	 VQA7KnF72XdXZBCAq+DN07+X4l4naPdeuKYytBT23BwnuoYSsFh+5JQapc6qUrd3zQeU83cTao7n
	 kk9mY6eE5d6vkN22oGcgRM0o0eOFJXoWJKYDa+keE+tOZhOfL/it+/9Ui6QbCfd5f3451ckr3Gaz
	 Xl4eUTn7mZFGCoTzNEjVG4Bk9pTpZPx/M3vJxFC8oH+XrEKLuIxQjlYgyHMEmzPDDFqQ4D/5plel
	 xBLa3GqNtGNiMoqn5sQtpATvGDx2o4KCgaPuhrXFYB9bVrwlPrcwm8salogJzNrZ/A9dQ9Hs10iX
	 oUoQP/fjgxvg5z5Vk86Dyrw/k1NhZmv0ygoXGsjTo6+XgQVt4AU/k=
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
Subject: [v5 1/4] media: rc: add keymap for MagicBox M16S remote
Date: Mon, 25 Jul 2022 07:17:01 +0800
X-OQ-MSGID: <20220724231704.132472-2-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724231704.132472-1-zhangn1985@qq.com>
References: <20220724231704.132472-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_161726_841036_C3864005 
X-CRM114-Status: UNSURE (   6.67  )
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
it has a key labeled "M", used as Magic key in vendor OS.
This has mapped to KEY_MUTE.

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
