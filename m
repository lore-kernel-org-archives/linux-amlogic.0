Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CC9C3DA6E
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Dec 2023 08:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2qXTU3pjqKDnKOE6oRKyxVCo8SV/+Su13MuuUoom3Ks=; b=TaUyWicCFDEycK
	OarkoVlQhGKu/fRklfHtJmbB1ZxtUwmjsDzO2qqjjbml9ZEC9kxbmy/ppZda8SWiS+qN1oR+qZPFo
	VqGqvNKv7sT/FL0ELihDkemCXdk/lJprYeUkDeBH77kDWgz7tgYO8nvuN6K2y+wZKP86g66BBTZWm
	uH91cSCnVBjEiuTJ+xyTmqcXZJ1E3KR4uI7+VaaiKRb2t7BYRenKZFJTF3QGndIJ2wnVa1mHb6ehL
	yGjjfR0YTXrICV2x/ybFzkVLiinDHMFh+IW30LpvGJJTc/vnT+7VWmnJyl6yOmPfZLYRp2Yz7SJvu
	V8Iimij/laKSfYiOTDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsDE-00GcUu-1K;
	Wed, 20 Dec 2023 08:45:56 +0000
Received: from mail.bizloop.pl ([217.61.97.183])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsDB-00GcTA-0I
	for linux-amlogic@lists.infradead.org;
	Wed, 20 Dec 2023 08:45:54 +0000
Received: by mail.bizloop.pl (Postfix, from userid 1002)
	id 4A4C282CE4; Wed, 20 Dec 2023 09:36:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizloop.pl; s=mail;
	t=1703061401; bh=fAh84/03FbcPDOiro+kD9EaI9x3ZXWqpoFIQ90ndT2M=;
	h=Date:From:To:Subject:From;
	b=HA7UkwkoY1g6DhylVZw87kDk7gZeJopE3wxtPbdW6ID04fNWBkzbdahnI/+iOfG/S
	 gOc1JkZ5TWM0NclK8e6jp5Si5E/5nRmKRsfH9t5igS7SN3cIaArk3zw+i0Sat+cqEy
	 Rxdjc21J3fH0BigO89cIKk0iTFY/wcu9ntw0xBYcnAazkzdobMHh6Pbcp1Cm//Jmsj
	 ZR1MmS09suibxVjQWY0xSvwsgLQmdpAiN5lPg/4RWx9non/N6GaU5Jnbt6xItxm6zR
	 1i9nBUKvipVGvy1ByFgOTKOck0A9Mdm/66AWm0tZYozqEPpDaSqjaoRre6SdQDpcWs
	 bTZtn83aPjsXg==
Received: by mail.bizloop.pl for <linux-amlogic@lists.infradead.org>; Wed, 20 Dec 2023 08:36:17 GMT
Message-ID: <20231220084500-0.1.1a.3hx0.0.wimolmoq4a@bizloop.pl>
Date: Wed, 20 Dec 2023 08:36:17 GMT
From: "Adrian Mackiewicz" <adrian.mackiewicz@bizloop.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Nowe informacje na stronie www
X-Mailer: mail.bizloop.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_004553_265781_8F7E7C95 
X-CRM114-Status: UNSURE (   0.81  )
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

U3phbm93bmkgUGHFhHN0d28sCgp6YXN0YW5hd2lhbGkgc2nEmSBQYcWEc3R3byBuYWQgbm93xIUg
c3Ryb27EhSBpbnRlcm5ldG93xIUgZGxhIHN3b2plaiBmaXJteT8KClRlY2hub2xvZ2lhIGkgdHJl
bmR5IHcgcHJvamVrdG93YW5pdSBzdHJvbiBzdGFsZSBzacSZIHptaWVuaWFqxIUuIEFrdHVhbGl6
YWNqYSB3aXRyeW55IHBvendvbGkgV2FtIHV0cnp5bWHEhyBrcm9rIHogbmFqbm93c3p5bWkgcm96
d2nEhXphbmlhbWksIGNvIHogcGV3bm/Fm2NpxIUgcHJ6eWNpxIVnbmllIHV3YWfEmSBrbGllbnTD
s3cgaSB3eXLDs8W8bmkgV2FzIHfFm3LDs2Qga29ua3VyZW5jamkuCgpEemnEmWtpIG5vd3ltIHRl
Y2hub2xvZ2lvbSBvZmVydWplbXkgbGVwc3plIGRvxZt3aWFkY3plbmllIHXFvHl0a293bmlrYSwg
Y28gcHJ6ZWvFgmFkYSBzacSZIG5hIHp3acSZa3N6b27EhSBzYXR5c2Zha2NqxJkga2xpZW50w7N3
IGkgd2nEmWtzesSFIHNrxYJvbm5vxZvEhyBkbyBpbnRlcmFrY2ppIHogV2FzesSFIG1hcmvEhS4K
CldhcnRvIHJvendhxbx5xIcsIGphayBub3dvY3plc25lIHBvZGVqxZtjaWUgbW/FvGUgcG9kbmll
xZvEhyBQYcWEc3R3YSBvYmVjbm/Fm8SHIG9ubGluZSBuYSB3ecW8c3p5IHBvemlvbS4gTW/FvGVt
eSBwb3Jvem1hd2lhxIcgdyB0ZWogc3ByYXdpZT8KCgpQb3pkcmF3aWFtCkFkcmlhbiBNYWNraWV3
aWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
