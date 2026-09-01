Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E64CC61DD6
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2026 15:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KwhQ/4kAWhYb8At85CD1O6BxXgTQLLhvHx8O5NMsYw=; b=PKoo2Jz8abZ3qz
	6SvBIhZF6MS1HBevV1GHqz0xbCF2rYdIQR+SDbIcAIiMkyxoECBgkRavUAI52vqz3U0Vg7PMMCdiH
	mfZgS5AHriI1t/tjqwsy9xm/Ly1795+yg54FlZCpkdZ+rXDO0vXALCvSGINmOvID6RjcEAugwf4jc
	LRkak+W3kRqe0raJ3MAKtlcO7nBs65crt+tNFmlFaKfdx3LfYI/116TruzrRBnAyT25DD21LH04rz
	nOR7311K5sIr3r0+TG+5IOKbR8tf09fcTPMvD9k4CxNx2ikgKqVJTTvc8k6MrwbsUZr7oqGhzxEBH
	IPgR9aqF48rNW6Fz8uaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QVY-0000000CWN3-2rpg;
	Tue, 01 Sep 2026 15:34:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QVX-0000000CWMA-18dQ
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Sep 2026 15:34:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF4B143437;
	Tue,  1 Sep 2026 15:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404A91F00A3A;
	Tue,  1 Sep 2026 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276882;
	bh=KB8SxKkAeyAktpBpzb38bUsu/Wbr0BEuYRmjC0NujWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kfVfVesFBINvfWGomE3Fo5JIAJTaoXgWIJFwcO1ra3CZ9JKCVMdJoy2C8zIKuuvZj
	 C9/BlYqMgMv2TSZGb8peA6qqTDQ1kNkW1lA9DFvvXY3x00Gr8Qu8A9v/6hLa8cBkia
	 kNt5Zaxd/HiW0UGcRyx3tt1QdEvHKh15CaBBXHeKxtpo3FoLVh6qpv6lI1GxrZ8BmB
	 f5ekwSrs+etl0fLOu6ibWEtaeSJxhX2N+8AWLGDJ2q5pHe9q9r/WlZIqVmrrhqc6uv
	 5zpE465tEbtDVXB+aDwFrFRI5A/SU8lNShsjlFsjhApkb1bLcHSlfBZVsetfIZGO1u
	 v8R2GzQHBGb3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/6] arm64: dts: amlogic: t7: Add i2c controller
 node
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-5-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
 <20260901-add-mcu-fan-khadas-vim4-v10-5-aecdb9955a30@aliel.fr>
Date: Tue, 01 Sep 2026 15:34:41 +0000
Message-Id: <20260901153442.404A91F00A3A@smtp.kernel.org>
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

PiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAKPiBB
ZGQgdGhlIFQ3IGkyYyBjb250cm9sbGVyIG5vZGUgdXNlZCBieSB0aGUgS2hhZGFzIFZJTTQKPiBm
b3IgTUNVIGNvbW11bmljYXRpb24uCj4gCj4gVXNlIGFtbG9naWMsbWVzb24tYXhnLWkyYyBhcyBm
YWxsYmFjayBjb21wYXRpYmxlLgo+IAo+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVp
bC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5n
bCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBS
b25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KClNhc2hpa28gaGFzIHJl
dmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYwOTAxLWFkZC1tY3UtZmFuLWtoYWRhcy12aW00LXYxMC0wLWFlY2RiOTk1NWEzMEBhbGllbC5m
cj9wYXJ0PTUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
