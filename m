Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A4BC55822
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Aug 2026 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7BtXBs3P2sAqhFy4S7/DzdQezaA3+z/O/8E341Z4FU=; b=rSCrIrZrjwCFvj
	bQ4COXo7E3WUMA7uUvf7PcVo6hsblW+5E4emEP0fIvaQsoxVsmqNSsSiIks88NCe5x6OtMIjozEZV
	UQwt/aMQ1sdkGrPqS+gpbz9kZuh+lU2kZDeuyx5acu3+qOE5lL4mCvWv/Z/r1KcFRJXlPXmTpAZ5e
	kJX/C7oKNyOW5ZaZowDJT2R7RSYCfJwVnpU50UVYzr6ao2SoJro2+Keu4rk47cEIQ+8082kGLTZ3/
	9/3TGl5wMLQBSRyOYuBCogaHpIc6b8/iJ271Up9GbJpTXi8MzhSq2QlgXi33dfAqVic6n998++f5/
	snXa9KOc1Jl41ujfTeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWnj-00000003Vun-41AM;
	Wed, 05 Aug 2026 08:16:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWni-00000003VuN-0uBG
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Aug 2026 08:16:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4910E600AE;
	Wed,  5 Aug 2026 08:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2351F000E9;
	Wed,  5 Aug 2026 08:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917793;
	bh=G9Gi4+sJry7WTdexIjEbq8Fhzl/xRk/89sijuaG5frM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kGrgIcuJXVVwW51VdT9zNdUoIl7FNDSxWbf388pbstL42LpXS0ZKNzjhMma2mplOa
	 vOSBLHFwL5YrQLk5WwlBdGFcCJfHgIJCN+OttUVS8FWsw6gMMUT5MHT7rlI09C1WGl
	 LBQJtHkLS6EYSL5T7YpVQOClGDkU7Ew2EfEHElpiRD1FqIvMrzdR+F5lzxBdH0khdi
	 jUetfiB3bIPuxmHRuAq4TAYt11fQXgwyeeLW3E9VQuUOgOFz/4EKP7qQ6UbIM9DHn2
	 lRuZwLpZ5Rq+iFrwRlgFT+esiGNZ1ec8XZcmXcDdFkNZpTnM66/SBB09aQc+i2v2nR
	 ssa8BAHclPzvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/6] mfd: khadas-mcu: Use MFD_CELL_* macros for cell
 declarations
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-2-75df78710b9e@aliel.fr>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-2-75df78710b9e@aliel.fr>
Date: Wed, 05 Aug 2026 08:16:32 +0000
Message-Id: <20260805081632.8A2351F000E9@smtp.kernel.org>
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
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgwNS1hZGQtbWN1LWZhbi1raGFkYXMtdmltNC12
OS0wLTc1ZGY3ODcxMGI5ZUBhbGllbC5mcj9wYXJ0PTIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
