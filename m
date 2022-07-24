Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70049CCA48E
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jR74YRI0mqtYWiCVlmuWxm/ItF78fyY6FFU9W02aB5s=; b=MKhKrkxRxGCkD6
	YFO7k1u7xhQw5vDNoKo1h1BuRg0Nzj8NeQ8/70GQAAUov9wqhcAls8zN0jFVQBMrfOlu6z+4mEMtm
	yJN3hynwE+SuqsfDhQTOJZzYNLU2f3eEorm6YTTCtIDSeFqyu8cjV+SAxl5Tl7oAzVGKo4K2w47Ot
	VzN0HAbmEqSRch9fjsbpU25tcXe3jUfGy2DCc68EjBut/XCugY1VYyY1linC0hTYZfrZSEAO4HRkO
	1Z1Bub/r4nBN6RGgCCOJl7aO9kU91szAZ3xvNUFFyW9b0rDefnZSMDXflaATzVUo2+ju27+74VC0o
	rKNFZs3pX2cJ4XnUeQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcQy-006WJi-7w; Sun, 24 Jul 2022 14:18:16 +0000
Received: from out203-205-221-173.mail.qq.com ([203.205.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcQv-006WFN-CM
	for linux-amlogic@lists.infradead.org; Sun, 24 Jul 2022 14:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658672288; bh=HwPm1P5MGd+5ePBYlxQmryWZ6ALrW2k2UKDUNj8/Sqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KKNSyZpYvSwbxtMSscOtnZABoCXeJaoy0bKyKbvBfz1QqAHaQA+xGqlOU1Sa4BaXL
	 JawdsfcmIEZD0pCrheynKN95FXk+YUAoNIHkg4+wMJ12TJmbrukSExwuV6JsImyaff
	 flRTn7kCsmw8LdYNwL31SAyHirHWQ3dZ8cDrmhs0=
Received: from TS-551.. ([101.229.115.105])
	by newxmesmtplogicsvrszc13.qq.com (NewEsmtp) with SMTP
	id 48289623; Sun, 24 Jul 2022 22:18:02 +0800
X-QQ-mid: xmsmtpt1658672285t7ayqw671
Message-ID: <tencent_74E6429A6BE2B241C640EA42638CB01DC105@qq.com>
X-QQ-XMAILINFO: Nd3+k7TdeYPal1x1ETGdkkEt2Bl55Ux47eb/i3QYn3RvtC9/fQDm/tF5QnHw1S
	 85CgkUUxMGfMtiMAPhylxmfu1ZvBMz6WgL9WZ7ypJSTPKEqoeQu0Apn8tVM4lR+/pKnnWTFW8wHF
	 BuU0ykeTA6EB3nebm1BqgjZv5LyOtNeuheid8W2tYNrv/OydaoVi/6JE8DIitX577lAd/le6DzsT
	 axdwHRTIILM/2vi2tYou5YA1dBnn24y2mOkQWrU8sN6VgxXMd3JEeNNfy09pdXt+c4uNiwPxFcwv
	 jImL0RU8MiAFTQEoTOCADL7G5bgBPpYPJxKSJtZHz+zt8QDz/ZGZm2btUZbVq6AJbAoZ9PMfQHPc
	 oKh0MKI83iKEf0EQheol4VykswLsbQFxlrojKZ6FkfCHBh9QdKyVDqNx+vI7wfRxp9Gi8hsC2OiR
	 jqM8rkNAMtxgKkYC/B3WXGdVi9+1c5zuU4Z3aA2Ma/Tz0f/RPaSxUFQvC1IJeKzPgZ6xxDpMzhkz
	 J8SmTCKIc+k2hfJ0bZUghqRC64o2qM/UfXUKS0UCaUKZHp98s8CunT1mv0pE71wH7rb/xTj30LX2
	 dLiDbRnMy6her7FLY8Sx6YsUMRH1JoUgGNGsI4SbYkr4F+PqHZIRYPM0/S4R2UHFzTvxl1+rAc5E
	 FuR4cBG4tDW/Siw1tWME8kDeRkQ95jmK0jZx9M3+afsABRhmU61hFJYgGMvFCcceZtRThym2zJtP
	 50ZKuCadj/AyMBeh+om66jK6r9Pdl28D9bnmQbsB2o8KfAPtVZP+SCKOM1ozek6J7o5qdtVGS+58
	 2a/pjTkF56Sq/X0g1co1s27G2Vf+QuF6R4SDIZdHaeaF0vQ6RjSVSxbcMuI61Eb294h7j0zdA1V9
	 RKDXs1xNrDLzLEA02gxu5JVSC8VydkFf83IrCxlsUrhusN8TH//NVpXzRqM51hqzohAioTnE19
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
Subject: [v4 1/4] media: rc: add keymap for MagicBox M16S remote
Date: Sun, 24 Jul 2022 22:17:46 +0800
X-OQ-MSGID: <20220724141749.131724-2-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724141749.131724-1-zhangn1985@qq.com>
References: <20220724141749.131724-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_071813_773396_6D1D5825 
X-CRM114-Status: UNSURE (   6.13  )
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
Ths has mapped to KEY_MUTE.

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
