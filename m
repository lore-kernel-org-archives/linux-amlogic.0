Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4796C07545
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Oct 2023 08:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9EqFpyjjjZetfNQBqX5a4IFmtnOLtP4Pp419e8eM+nA=; b=t2MqJBzGbmk0Mk
	+w3muABU07n4iSDvAWxcQnK7cmZQu1SCPK0oy6rh24rUTtqfIRHjT9QFrLMbmhuJmCt6NP/4NH7Mq
	lRZXSH/JtAxJaFKu4CmRmA9KoyMJ/agzqbnSczK0bNS2RE/5K1buKvObQho+Hm0X84QnzyQKWgDK+
	Iphj+xdSr/oWmTI4Kjt2CgKGyZIsIOX2lI7KE/E7La+v2RtoyOVknJoAs6vvwn64YZVoRF/Bo5kOp
	F//Ydc7+8rxO38Za6PpNjv62GFP7DK4uWoxB212v/uMQmlj+Mt/Jx9DjGIlitsRxOCdXVkiEUKty7
	Hc2P6opGqu3lyTHTLuOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCVR-0099py-2t;
	Tue, 24 Oct 2023 08:11:17 +0000
Received: from mail.citycodes.pl ([158.255.215.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCVO-0099ob-1r
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Oct 2023 08:11:15 +0000
Received: by mail.citycodes.pl (Postfix, from userid 1001)
	id 5A1E321575; Tue, 24 Oct 2023 10:10:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=citycodes.pl; s=mail;
	t=1698135073; bh=fClkhHu/p6gIm8tbpvFwCqGX3kXIMdqjiuDdSiYGEkk=;
	h=Date:From:To:Subject:From;
	b=Xrb33jEHrMNt7nY0B4ylVZ/RaXJRvBj1lbSaU0o+pNc2Iqa4/w6C61dSuXPttjKGh
	 +9V2FW1W8HVSyXhrhitiwfNPo05avCkP4XfyqHSyh0QOhWyDdXvzM+d990huyoyzQa
	 XG7PreoYkXeOw6stJsieVfvCsVjczwpYigvG0wrpEF+iNyZsXm2RkH3BdnND8ZqtpA
	 c2VXBleZTTdwUHKoFzZpGsvxOZ2NJb47oj+Cw3FRCuE7yN+6Xc/Bnh/2nUsFB8EosG
	 Cly2j4LcDw0Y1RGDePYUXM/3G2xQeK6LFVL5xfmude03QFMsH4s21e1Mogc5xVFmMZ
	 5AAwybTvHrSoA==
Received: by mail.citycodes.pl for <linux-amlogic@lists.infradead.org>; Tue, 24 Oct 2023 08:10:35 GMT
Message-ID: <20231024084500-0.1.8a.l877.0.3hw6v6jn8w@citycodes.pl>
Date: Tue, 24 Oct 2023 08:10:35 GMT
From: "Kamil Lasek" <kamil.lasek@citycodes.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.citycodes.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_011114_748685_5AA2C2D6 
X-CRM114-Status: UNSURE (   0.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5ZmlrYWNqxIUgd3N0
xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkthbWlsIExhc2VrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
