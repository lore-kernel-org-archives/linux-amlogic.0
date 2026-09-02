Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08506C624D3
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2026 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUDxP4uOKHkZPmVDJmtECmnnEia0Jli2YNhX0wjrIsA=; b=pOy7YP2So0Icdj
	l1DXrZXTpqAGfbLo9ilWfPqbZnlBD+FigmYQSMry/gMppoewyyaso7c+ZTZLabww+WjHsGNB2nfYq
	rcOFLpZynMlJHdrA25shsRspSllzJZiVWPJaLdNYmZsI7O+uQjW1SJ9o5L7gaW683i9J3i7KmHmiy
	1qeUm71QK4wKHNLKBNjsXo3GmIIfkZQRy8qUdCKpeo3gOt1369YwiZpU/x4kr+IzAoMwFdFP9fKdB
	UsqD6UT0PW1EXciSM6LEYEoGXjW1OzMsn7GvaSm01xSKRbVdor7U6jTBplYz01hY7HkMLG/2Jpyy8
	MHZ01QAERpvDNFU0ussA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kfq-0000000Ekq2-2h6b;
	Wed, 02 Sep 2026 13:06:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kfp-0000000Ekpr-0w5F
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Sep 2026 13:06:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 021CA411B8;
	Wed,  2 Sep 2026 13:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693871F000E9;
	Wed,  2 Sep 2026 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354400;
	bh=0E+tufsgZSzpfaAINdE5zzKAF+s6JloqvT1VVMs47X4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E0288I+hHqc1Qieaqry5IKJHp/xjxWbn4EdOIFOFJiyGaUnEt8qWS4CTYtOqSxZxg
	 4h+boyX6Vey7bdG0KXLLwkFh8toPU3ZFsU4VwjYz82AYS509lfDAaXsX9ZMo52grGN
	 YSbW6rwXXJE4NxE/wNDqebU8NlKnfnO9V/3J732X2pDqdcbnwo+fZFoRveFMgbNgl/
	 7xj3Tw58//F6MsxIqN8PK/Aiv1f45d4i0k79To33udy+mmyoSTQ9zdoMtAdvqQZ26F
	 1kB2RBHQn78i16Vlm1EspH3n/BG01qZ+jWrv1UpYqCbT/H+9h9qyks6VVMilP8CeeR
	 Ne9J4m4SuqrFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 6/6] arm64: dts: amlogic: t7: khadas-vim4: Add i2c
 MCU fan node
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-6-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-6-5f1610d83bf0@aliel.fr>
Date: Wed, 02 Sep 2026 13:06:39 +0000
Message-Id: <20260902130640.693871F000E9@smtp.kernel.org>
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

PiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAKPiBF
bmFibGUgYW5kIGNvbmZpZ3VyZSBpMmMgTUNVIG5vZGUgdG8gZ2V0IGZhbiB3b3JraW5nIG9uIEto
YWRhcyBWSU00Lgo+IAo+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJv
bmdAbGluYXJvLm9yZz4KPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xh
dmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KClNhc2hpa28gaGFzIHJldmlld2VkIHRo
aXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTAyLWFk
ZC1tY3UtZmFuLWtoYWRhcy12aW00LXYxMS0wLTVmMTYxMGQ4M2JmMEBhbGllbC5mcj9wYXJ0PTYK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
