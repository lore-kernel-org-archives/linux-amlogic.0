Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D92CCA47E
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHvya1UHugtad/tyX+PDoUg8pJ4GkTmhMubJ+xKJBJY=; b=ykXWHU28HFLp8X
	EhJJalr1qxRE6LVdM8LgPsyuP7jm2Y7cvaNasYxX4pceW5CjPazvK9WRsKmqQnEREyo4kaBSBLO+p
	MAzx4kIOb/fvtGZ3Ab5rHJ6lnOEBFAiZWTYMzRdlhmqyTqNAHtkldwga2ZOtnls23+yUg8KJlhhuj
	MJP+eiqUm/HKS1RQrLzTjWs6TsbMEHknHDoL1fmSCJ/2TGIU7AW+hhZT5cc/fnM8X0Xgadsr5cx0Y
	4nhhjISpiYlxf2GqzO1He1qc1HEYHQP1eU7I1bUPNQ1b1SJuJ03v0e75pBlaCrxNS+RtSZR9PM9YF
	5MNQugkLJXzo3ngA0RWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKPn-00HJ2C-Hk; Tue, 26 Jul 2022 13:15:59 +0000
Received: from out203-205-251-82.mail.qq.com ([203.205.251.82])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKPi-00HIyK-88
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 13:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658841350; bh=L1OKzS/6gJdq6B1s+pyUOL8qpdZ4pWPcZwWD57/I7Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e/9APrkkTvaNZkDiXLZfPt2xFv+AfaxsouTkK8RWcVzhkYkpdGuATh0cqSfBbMH4+
	 7zHej0zx/PNGaUx/bLiJ0eQ40Ug7354BDt70FD8zN/ZZH6KnJ9aMBxTII65FU2I4/G
	 uv68MgVPdJwgFaQcZsRxq6gO1snyVSyhZpIqB/QU=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 3EA1E4DA; Tue, 26 Jul 2022 21:15:42 +0800
X-QQ-mid: xmsmtpt1658841348ta7zqzl3y
Message-ID: <tencent_064DD25613660D1B06D4171C6370ED443608@qq.com>
X-QQ-XMAILINFO: MmPNY57tR1XncDXGozBu7nckUOHsBH/EavIJZnqZtUD/lfbmEekVUwxuXdIE+P
	 zVu5gKoDIcH/n5io/unx3LtJ2C9oaEy8EKiQKAUY/mPevRZ1gT7W4Eai9iF01Pe/5SgEbGRCxZBA
	 iFe3Xzgqr7Y9PuPFhlmewe/rL+DmNUSQaYRMiU0d13bgZHDpO2JU9facqiId0sm3wLQyfhwNwxGK
	 0smsMrhPXeMB62eCsQOZ+X86J5BznUvVEPlol9l64iygOxBuOcEkIZzZkFCt84SkGeOKGDanEbSm
	 jNvG9lJU0ulFV44lRmzjqGM1sGLkukWsuqGaYM1873MmRpRuBfTCTL8IK8xRiPpvNbf37f+voeAc
	 PsltSwadlVk0GZoou5L9SHzEgTG2g0ywAKPiUcCND/tLJo74FbSbQpoblEJwjgo2SEaVTnuEDMPz
	 xbB3zvtpd2heQVT/zA1vb2VjLHYYsB3uOaG8JzeAL2EsTfs0US/SuNYaux/maZPPoGpF1GKnTl5H
	 T++iFskvh1gNqhlmV41mdJcHchzWIMNle8au4DshWwxITJ0XyEcMMc+sWfqKTtXEBVQKLhxwpLg5
	 ntLmBjqPidxgsByuI2ncgQY8dqmA6CUKRatkliWLgKbd0U4S0FQB7n0wG2KMscSMbHpMrQ5EfmOE
	 bKoLuGOkqtQxo6nu3DiLcZFABWIDtZKn2h3NthQ9qcOiHCoYY9iqm4thlITUyiXSFgKBZtPjJLVg
	 XwXOIAhDWw6CXe7XqQ/w1kzyh4JWcJ6zF6OioTKxR31WfmeJmP8BxKmZCuEtpElud0HjCUrq50Rx
	 N8/Xsg8LHYEeH8r5NIsovplkwuf1PGTKAAhKL5CTXoaQWr/kqoChZ2Lekc4nDQ3aYHzbHTmPOCqU
	 PZyZtuWv/HC86DzGnrQfsWX/r65tmbBF4UoTiQ7MHA27OTMGnFjWL46dbi2+15AA==
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
Subject: [v6 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
Date: Tue, 26 Jul 2022 21:15:22 +0800
X-OQ-MSGID: <20220726131523.140581-4-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726131523.140581-1-zhangn1985@qq.com>
References: <20220726131523.140581-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_061554_656106_6B62BE78 
X-CRM114-Status: UNSURE (   6.28  )
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
