Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A1CC19F29
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQVJ5WxRP3nDpI+S8aMTN1baZ8ntR4pcsNwy2MqoihU=; b=BF0RcEZfFd+UcQ
	cX7jENFHZow2odzG2SPTD8g5toaUfdILTL2NA5Z8L+bHYtuvljnMrzY3NXyEk9LuPWIT7rSyBssfG
	slPH6PjfrYLxby2hrAT6F5M2141UxgdxwOeePtih1w1rJM6YLSS+xkGyZAH5ZvHvQfSKnxahFMX5g
	fX7mHK+ANBJS2+kMopvwQpSy4e6kyor6eVdTMx2etkqrDW+vHFDgBLRRXQa0Hh3P8nM6zt/WP9qRU
	PLhZ7KfD5031wjNM4+l2Vj6cjLJMIhjIzGCdAUBpq0X+phABA3zaCtPQRZ76qy2U0CSFkB8NhHQ42
	zlf36PliCoRRDBiY/s2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLgO-000Gx2-Dr; Tue, 26 Jul 2022 14:37:12 +0000
Received: from out203-205-251-27.mail.qq.com ([203.205.251.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLgK-000GtY-Uo
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 14:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658846224; bh=EWEPpnkJzYXDEouSUCLZ+x2NT/waXn7X2RwOOX3umWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GAz+lI0iqM7cuU0gd/63bkH29WH+xh/LlSJo5Dk0NGAyczQgX2H5Q5GAFGdEVitlb
	 2LLnoOQ8rBC+UTQL6MPIYIWuC3/+7mhM+3O6tshYcfgA0NIGOxgEvYcJvSd1uapAbi
	 G0VApbf3lraL/+pFDVqzat+NHGJD0+aTTRLOBO/Y=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza35.qq.com (NewEsmtp) with SMTP
	id 940102AA; Tue, 26 Jul 2022 22:37:00 +0800
X-QQ-mid: xmsmtpt1658846222tpjjjskf9
Message-ID: <tencent_51A1BDDB4645BA6622B881C1E0EE22742C05@qq.com>
X-QQ-XMAILINFO: OYji31yNgomx/qW7SQirxwqmJ5Gz2Lbwucqzu57tvmYBg5nq53GAvsOk4mdpU3
	 w4whRCNP/kPmMOby3tY4hN49Mpbgh3hHW616RlrfL+a10Fr2nl33fvUm8FfviryoWMjWToFkHm3s
	 v7bpirNL4GvE++NLFskj+zdX70BwiMDyV/muKpzY7J63qVTH9ewAS3G9IJiF062qetwSnsQM0f+Z
	 oBCcIhkAQOT4HsnHp/cOwj2N54TcFF3yfedKiq+VxiopesHmopE2qfirTLBexRObiGe3DlHdLTIL
	 UttkGtVMk50PnxQQbz1t5Vq0LluY+wn1zKlrT7bmPJiUFm1o7c1FEqQ4UMENQuQJ5Q9jUrVvcEA2
	 24ydf4++Bo9UzXVFShF2Xpn3W+7kYAF9xnJgH72qoy1odIDYlKmT+xwQmHZL/TqKBwzp1dVbAgm6
	 ML6XJ5znCmNWChcZSQ0+DD2a7FNAp+wteXimN4glXsLB3+2qKPfvnkM/8arCNWcFiv0tZJLNfkOP
	 ce2EePjpLpFHdA6Ugb8JEq7AsOsYopwcJqM2Rqf3prJBbq9irZThAouC6zN0/PkRJQpmjDfTOSYT
	 FrWbGXMQZdvdiShYCV0JuEPiLiX+cWB+H4DHECq8OIKkc3/fRXejfryL1hEzApKUFKzdkpjDl9Tl
	 bRsi64I46eMYGD8FKscm71ig8FceKPAX2SYIG4x8W42OY4Q4+Hh8eCEFfHPpjtO16X0jiCveuDrz
	 mJrAPsThqe5d9debjSGwRzZoDILw3uZMgdfW+bKMiX8GvazYxLTOQYTsuK8sFESiVCIXuyrddG6J
	 kIddCPZFwgoOJcsmTk09iHxpcnh/S2OhSSGvdTHZo0Bm26T7LR9SL4orM+0LmeisKBc0wDELhNE3
	 7Q3W0ToQPRpwz62kIT8gQhE36wl9cLawcToGRnEBMzAOtapmEtG98ZYCUbXAJTLVZgZwDKmmdM
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
Subject: [v7 1/4] dt-bindings: media: rc: add keymap bindings for MagicBox M16S remote
Date: Tue, 26 Jul 2022 22:36:46 +0800
X-OQ-MSGID: <20220726143649.142574-2-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726143649.142574-1-zhangn1985@qq.com>
References: <20220726143649.142574-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_073709_312571_23BE67AB 
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
