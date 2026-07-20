Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6C1C44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DU7JM/gY60YYoQw7CZY0677e5gB6xh2z14LOPZmcYCg=; b=ZM796bB7vO/JTs
	+RjeD/P2nPOS0m3sVxsZY32rd7pHnW7twiJMitsSTIUBH6XIQephe511S/DpbmTelL6LzXpk1uWCW
	tKBazxlS8nfcuOHwC6SNN3nrSwjvExqohKH1ANVkTzpvD+EtaNxvkkF+PVBDWX3L231HS7nrUBb1Y
	yVVe1FuKuY2bOUVFrotm5VAMSfpHLaNPx4Z387EmjMDvrUGLWudyYuv9WrJtYJClc2gd+GVYOJEDK
	MaDc64RPQ/qOw4IwWDcDYzl3Gy4/CiG6FGmCtqCabB4S0Qi4omP67Jyc3pVB4buh6Kijzpggzq3wo
	mHIKQ2/niFx5RTuAwkng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpps-00000007Ajh-3y4X;
	Mon, 20 Jul 2026 15:23:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlppr-00000007AjL-37JC
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:23:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A18740837;
	Mon, 20 Jul 2026 15:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD361F000E9;
	Mon, 20 Jul 2026 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784560995;
	bh=u/TzgPAs2za9gu29wuRvJUqQEDI0bNBGgGFMN+dtimk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sxc4libiZtfIzG7ljO3F1/ZwZBd16RLtLmKVBuwDu0zp6Dl2kqzFAMiv5nlaOzmFi
	 4BwO5iLImD5TI/Y29zjOXVy9y1BYf6RDEHsSh2dCVJqXLCn5aOmpAVRTLvtPhnTyMX
	 bVTtluCtLqzS/fYwsarP3coch7HZSj9VVggu90WCKAxOe4v/Q17oKukVKZC/WJFMR2
	 ojxL4MJ+oUw1s2uNzozCtPLOeT9hemblI+zR1ewF9d9zSWqIzj4mcriHfDKdnco4Gi
	 Okah8FeZU6iRoicSLkVzFCdG3sZs8ayb+2QMjh9q71r/lyku21LB2hKQWHXNNx1/jY
	 E0gvGnJ0T04hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/16] PCI: dwc: intel-gw: Use cached PCIe capability
 offset
To: "Hans Zhang" <18255117159@163.com>
Cc: linux-amlogic@lists.infradead.org, imx@lists.linux.dev, neil.armstrong@linaro.org, Frank.Li@kernel.org, linux-pci@vger.kernel.org
In-Reply-To: <20260720150619.24733-10-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-10-18255117159@163.com>
Date: Mon, 20 Jul 2026 15:23:14 +0000
Message-Id: <20260720152314.AAD361F000E9@smtp.kernel.org>
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

PiBkd19wY2llX2hvc3RfaW5pdCgpIGNhbGxzIC5pbml0IGJlZm9yZSBjYWNoaW5nIHRoZSBvZmZz
ZXQsIHNvIGluc2lkZQo+IC5pbml0IHdlIG11c3QgY2FsbCBkd19wY2llX2dldF9wY2llX2NhcCgp
IHRvIG9idGFpbiB0aGUgb2Zmc2V0IChoYXJkd2FyZQo+IGlzIGFscmVhZHkgZW5hYmxlZCkuIFRo
ZSBoZWxwZXIgd2lsbCBjYWNoZSB0aGUgcmVzdWx0IGZvciBsYXRlciB1c2UuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSGFucyBaaGFuZyA8MTgyNTUxMTcxNTlAMTYzLmNvbT4KClNhc2hpa28gaGFzIHJl
dmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYwNzIwMTUwNjE5LjI0NzMzLTEtMTgyNTUxMTcxNTlAMTYzLmNvbT9wYXJ0PTkKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
