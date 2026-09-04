Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA63C61DD6
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2026 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7X4z0bVP3mEWJL/kibPk7s5/5DtdsutVEYlkZIIpJk=; b=gF2KSU6lG1Ixhp
	X50svBpC4TJQlNyLwY4oykk0iBisHPBpINt3AVcQsTvYtTVJjMcGM1MSSNlGUcLdBjIpqIOfmGrff
	HvXBaD/lhQq6f+GyoJ4UQYduffmEv8vt9PWMZM/umKJbwqsIsrs7jkn9W9Lj3ILXsGw21r4OPooy4
	AT95l7Tvg4s9WQ3dWmJ9RXqJGhEo4DA1kDR6S8WpYq/JhT/oDxll11TBolLX17GxDIzeEJoBM947Z
	5n+2OxaZvAV8gPl+P76xq/Z3yw9u7CFlAt3bGs2bQnKvLPdETAWhtIGtiF6dyQwhPSw4rbwDzWR/M
	ZnN7yWR6YXgT8mhlCZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RUb-00000001jRT-0zPS;
	Fri, 04 Sep 2026 10:49:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RUZ-00000001jRB-3NEi
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Sep 2026 10:49:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77E7B417B1;
	Fri,  4 Sep 2026 10:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200601F00A3D;
	Fri,  4 Sep 2026 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518995;
	bh=wDTE8UxQ7qPiJOIV9b5Xg9RyGrr0Xnn94bLszWT7Td4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VO3ivyyFORFscHhmSU4XS9sWYRw0+5Ux50e+QuE/kFn3QWxnnVA8SZU0IQigsK3aT
	 r8NbuWZfCEsh+NsHyf2YFt5peO73HJrG3BnLsJrkbImPOPPdDEdMQ5E2OIUCfCiWmg
	 od1NH56kR59isTUlogfmzxAB3xTt1p8toHT48/y07LbvrhAaa8uhboIy4PoxAX0vP+
	 3KvOruYmKMTnLjMSsgOpnKi58PIG22rZxJcB4dhXQYRj6soToYjx+/lUg5dbQtRFTN
	 6Een3HgAixKhDzd9VC3uXCIsWDCYiYjNssc8BRvPRgi4VlIgQ66KrSf4ZmJHXVKpho
	 mcv/9ye2BzJmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] rtc: fix typos in comments
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: neil.armstrong@linaro.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org
In-Reply-To: <20260904104758.23905-1-hemanth.selam@gmail.com>
References: <20260904104758.23905-1-hemanth.selam@gmail.com>
Date: Fri, 04 Sep 2026 10:49:54 +0000
Message-Id: <20260904104955.200601F00A3D@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBGaXggdHlwb3MgaW4gY29tbWVudHMsIHJlcG9ydGVkIGJ5IHNjcmlwdHMvY2hlY2twYXRjaC5w
bCB1c2luZyB0aGUKPiBtaXNzcGVsbGluZyBsaXN0IGluIHNjcmlwdHMvc3BlbGxpbmcudHh0LiAg
T25seSB0b3VjaGVzIGNvbW1lbnRzLCBubyBjb2RlCj4gY2hhbmdlcy4KPiAKPiBBc3Npc3RlZC1i
eTogQ3Vyc29yOmNsYXVkZS1vcHVzLTUKPiBTaWduZWQtb2ZmLWJ5OiBIZW1hbnRoIFNlbGFtIDxo
ZW1hbnRoLnNlbGFtQGdtYWlsLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2gg
YW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTA0MTA0NzU4LjIzOTA1
LTEtaGVtYW50aC5zZWxhbUBnbWFpbC5jb20/cGFydD0xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
