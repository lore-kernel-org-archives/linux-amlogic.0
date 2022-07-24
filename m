Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8359ECCA48C
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHvya1UHugtad/tyX+PDoUg8pJ4GkTmhMubJ+xKJBJY=; b=LFSxCAROeFcE3R
	gh6TU3uMsLycagB4Cfm6cmGiq/Rj904CKOV78iNpaQXrQkIS9G96HKJEWrQNPyBQ2YqsJn4ExQHpD
	JVMOGB1r0e0LNrQ/AfBg3k4yF38PRamcCX9FlhdExA3oVinX+/kOG57YFyyGhEFHvbaCFq90vEizN
	R3hsmAbLs2rr7795VAn8JQgxnNqZipDH5glbfvcZqEZImSJ+aGxjWYKYJ2cYq+kFnNrG+w4myZe5Q
	VL/GMH0hi6TuQ2Wv/mT0rdgNnd32m0PuV1toa065bB1RvO0ow0uq/JqAqrbJndOrBtiT/TxzidNDj
	nC1SnwYBVG9c/+jKWB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcQy-006WK9-IL; Sun, 24 Jul 2022 14:18:16 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcQv-006WG0-V8
	for linux-amlogic@lists.infradead.org; Sun, 24 Jul 2022 14:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658672291; bh=L1OKzS/6gJdq6B1s+pyUOL8qpdZ4pWPcZwWD57/I7Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ogWtgC1fHoaCYZExRntimstLPouBGTTWK04s6zoRsbkl4VAYyCuRj1zDIrylxroxe
	 oFVtAlELowPE7pUAH7PlmqVcWar+r6lngRmHVoulPGWDWv3a5UIBrPkB5R/2jwobZL
	 nSHejgNHPs8pWnzzgjck4Hy1FwIHeo79ifFGmAQk=
Received: from TS-551.. ([101.229.115.105])
	by newxmesmtplogicsvrszc13.qq.com (NewEsmtp) with SMTP
	id 48289623; Sun, 24 Jul 2022 22:18:02 +0800
X-QQ-mid: xmsmtpt1658672289t5u02m7fl
Message-ID: <tencent_E282DB4F6C1EA4A527401A200D502E1CC609@qq.com>
X-QQ-XMAILINFO: NMGzQWUSIfvT64zCJXMjPgARHr0foPJA9mYz7wPb5fmMtYm91fepmgDW7YJSis
	 9E8zoe4xjJRKl/91HAF4QpHG5XeTaZR+pJDAJm4ULQ5JPkrrEcp6NLsIY0yXXOIqDfLEhmD7+p27
	 C/LF5T0kOfpPlHS+whePAp5ejMLykNzEoEFkJsW1wBNgqiF2HuaQff53ehILBwVk5pmJB4qmd6+g
	 O0ftnAtW+JQssKxkKXw5Jz1ShtP0sU+ZXWR+i3mQnWwF4pVDvWI7bNHQR19mvG4Dx7+h8qlxVd7H
	 zDTolJT6Rt7WxEkHOT3GWOlEJV8fbVb7v9DRro1b++RlLlxyo9dKOBOolSWezI3sRSoUmEcplwDG
	 vFG4SRAkw9ldPLwtjeioTnBeKayahBxOVCAz448y12zKjGOmyZuu1jnEeaJOXTUnLRoghSFZhurx
	 2jYvSe8nKmUaJ5gZXuIhFvFuxzwDAiB9qjvIEXGQ850TOseDlCh5nzhoxHwMbuUqWAKnie+w9bTz
	 tOR2iRz2v+28H0K3IYe1d5sbIdPR5yzc/OMdZcTVSoOkO0vgBfjjnl3yOGiOfZOj6rP3NB+T77Z0
	 msJublRaybuDDXWOrekTXB10NGiS86JQEUt7rOZubDcNL46/a/SE7eqF8+QWYWXZbutwJH382nZK
	 ZJMaoYZIWpW0T7F37mjIucu41w1cbfokNUiG9j5HubUbmZ42Hib45pxdHYZR5nUOjM1ZdAWuDAUR
	 eYkFBIEqfvPR0UDglnpbkC4owEdFEDSwZSMzDgtF7u0+PSf98X5Ekque6m5GhrmLrn0mpt8XrAuy
	 EWcXz6RtjguQS2/ElWX3Q+PwgP39RvggvlJxKctwbIAfanOKf2Cp6Vy9ha6frqmNGXso/WEnWsNM
	 ifrjToeWUjlsaYEg1yHPk+i7tm/+qOhjGgksPQqA9/0SF78eH9AihGGbZZGP9u/uYIDgRdfU4b0T
	 AKWObXv3mGCuxZaxsnaA==
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
Subject: [v4 3/4] dt-bindings: arm: add Magicbox M16S bindings
Date: Sun, 24 Jul 2022 22:17:48 +0800
X-OQ-MSGID: <20220724141749.131724-4-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724141749.131724-1-zhangn1985@qq.com>
References: <20220724141749.131724-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_071814_329209_2365E9C3 
X-CRM114-Status: UNSURE (   5.99  )
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
