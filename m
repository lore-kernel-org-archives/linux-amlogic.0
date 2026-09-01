Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0001C61DD6
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2026 15:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSiD35ifYnoOD2hPHfWRwX08hvrjmormrF7xCq0/iwE=; b=sK0djTy5xBCp1e
	TN4wap330K2bAYfNquFCht4zjuoOyqwfudxVW8NSXJyPFBTFMGW4Ik9gQxs5PNCdRaee4UBiNpUU5
	fM2MzjUBUIMUCCHKN5Q+m1kFM73m/e95UBsjzGcA2H4QlvazJS8qB/NW47uBV1SXVHWeHfOXmyB7a
	DFRmV3xXiOo3g2iDTsBtMXvWkmae4y+AlE5wBMedoeVj/ioENQveJK7OE3+HizOGpFe/YyxnGXyNm
	2O58S+f0KnFqzSEL9hG+NQv7sX4gx1JvsRMZR/TP/3FUxBz1LRInqo1fVCEh3aZ1hBpsskdMZWbB7
	AVImrGw9J56+Q/c4GSRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QWq-0000000CWWC-3fK4;
	Tue, 01 Sep 2026 15:36:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QWq-0000000CWVq-0uBj
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Sep 2026 15:36:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 003FD43444;
	Tue,  1 Sep 2026 15:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A23F1F000E9;
	Tue,  1 Sep 2026 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276963;
	bh=FvNfgYX9wvzFhLGncRRS076q3d0iS4BWfTrVbSmUXIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hq5oE9hrA1XodAB/oBVXMcKjl9cq6hMf3f+JeptEKwCTYhP2m9zi1S9bZfZeLkWrR
	 hoqhKh3w2sSjFPAGlolsdrcSTqOJGAz8VQEP2qWvJwP08RVLVJAlZwm9fJvbwxIplf
	 os7oyt9ewT0UNmb6ejH9/L2QK1pGhvAknfeUJ8Y+cqXusxnZosttek3J4GwD1tpWT6
	 6FyRWa702CXka24aO5FF1VK+BiZ8AUFLp8JuFUxJSC4FoU2MH9AT+SzlXcAknNctT2
	 vkIrN/HdJT035yvQhIoEUNf2ASETqtWY0KPk+wRNH4kXY07Yu21km5LEw0beSOOJaP
	 lH4yMIExMMOlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/6] mfd: khadas-mcu: Use MFD_CELL_* macros for cell
 declarations
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-2-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
 <20260901-add-mcu-fan-khadas-vim4-v10-2-aecdb9955a30@aliel.fr>
Date: Tue, 01 Sep 2026 15:36:02 +0000
Message-Id: <20260901153603.6A23F1F000E9@smtp.kernel.org>
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

PiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAKPiBD
b252ZXJ0IGtoYWRhc19tY3VfZmFuX2NlbGxzW10gYW5kIGtoYWRhc19tY3VfY2VsbHNbXSB0byB1
c2UgdGhlCj4gTUZEX0NFTExfTkFNRSgpIGhlbHBlciBtYWNybyBpbnN0ZWFkIG9mIG9wZW4tY29k
aW5nIHRoZSBzdHJ1Y3QKPiBtZmRfY2VsbCBpbml0aWFsaXNlcnMuIFdoaWxlIGF0IGl0LCBtYWtl
IGJvdGggYXJyYXlzIGNvbnN0IHNpbmNlCj4gdGhleSBhcmUgbmV2ZXIgbW9kaWZpZWQgYWZ0ZXIg
aW5pdGlhbGlzYXRpb24uCj4gCj4gVGhpcyBpcyBhIHB1cmUgY2xlYW51cCB3aXRoIG5vIGZ1bmN0
aW9uYWwgY2hhbmdlLCBkb25lIGluCj4gcHJlcGFyYXRpb24gZm9yIGEgc3Vic2VxdWVudCBwYXRj
aCB3aGljaCB3aWxsIG5lZWQgdG8gYXR0YWNoCj4gcGxhdGZvcm1fZGF0YSB0byB0aGUgZmFuIGNl
bGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZA
YWxpZWwuZnI+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBp
c3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkwMS1hZGQtbWN1LWZhbi1raGFkYXMtdmltNC12
MTAtMC1hZWNkYjk5NTVhMzBAYWxpZWwuZnI/cGFydD0yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
