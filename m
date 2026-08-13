Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E150C5AC67
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Aug 2026 05:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7lOTzJM6hzlSSs/K9L5IGWhFJrB7KFtw3vMiKhpo1U=; b=LqNdD0YzkPhN9b
	BdecB8eVZS/ylxQtgwZAQr3QjhTOUjkuKNCxdxWLNsOCjzeXpVKoPKzjdV6F+gPSqeo7m9r1GX3zG
	vMJNCzv3mBM6s+MgXgFoUfMLNSl/Wlu1CYL+HmeF0j/bdzdhrkSEL2Ab6wHfofvKSUxkPOUWm3S7K
	axEN7iIiW5yVpJ9TKYGoTInq56+YNEYzsnJ3wjvZKINJF4zTr4RigydMrv35h0ZZH4krmLaV7A9Ox
	auJK2+KKszQFy+xq2C7pD75uqhCrZCAb3O2DZqc3IfXnlYSu24pQ0o0utfGmPeE7CvxMGlLTXzUaP
	NnID0RXOGXSJQQ5USM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNaU-0000000HO1R-0UEo;
	Thu, 13 Aug 2026 05:02:42 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNaR-0000000HO0y-1tf1
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Aug 2026 05:02:40 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1665509a91.0
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 22:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786597358; cv=none;
        d=google.com; s=arc-20260327;
        b=iCRUyXTGEWCQMRgsWVmJwWO5edfTkZPGLztPyk8eiQL/t+YruEwOwovHLgjm/V+bwz
         8NwNyhcQ52j1Yka1Z/8faYvBONR1I8T0Zz8TzU/qzMxYdDDsGQZM5m4DpSI53j5sCbMd
         U/uEKQZaDLtakbYEXYsZilTAZL+sqJuZaEwE1NbjHqhJ3m4zSX0DhjczF3ElEfbRLbnD
         yTRxYOKMrPKLQ7/WydJSN0r28GOsIwEC8L6C3UgKelcKwrauEFS0wnw6rDNG1zK5oq9v
         swrvevYnpIRgQ03MuP12J7RIs360vbI70PSTHZAnNXCX9wZqgwabSbxpVRrBOalKQNn8
         +u/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FPdVbJEJQfj1xWJ2K3M3PZX5UlvGIUA6xNdCdiePNfE=;
        fh=c6ctlW3rl33nBzg4uTZ3lOebxL0NIed0kRqSc8ZLrD8=;
        b=bCz9kqQDU7JdjbzGWXPRNafP8ewb/X54JeAYtmalzG4hb6bizcLdrebrMFeKd3zymG
         vklPk+58C5Z+7XaFf6QOiCU7vnjJNk9PO1cTIMPcH9CJrwq8Pwch4SkYcWlkDkgVpVQr
         nCTsROXmZLx55VKaopWd/phts84cZKtjfiwW2LLe/y/Z2THHopUFQEoCpfpQEvf+08vU
         1cu3nIUREJn5s6gJ9QPTZPLvh7tmxMYGceVQSOyfHYEPO3L76A8PiN3CHSqumxm16B23
         +jGwXBfx62KbO66kSZs1aHJjZ7r9InD2NwbYqXeI5jXS8h0nOXbVPC5teqxVZRv7bYdW
         dLXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786597358; x=1787202158; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FPdVbJEJQfj1xWJ2K3M3PZX5UlvGIUA6xNdCdiePNfE=;
        b=FsM5WNpFy6v1PMWBEhhMmwNQxVtcYqOyM8/rLMjYanDtXr0WLfBGSsnSx4PHrK69gT
         ZSk9kH0Ebdwd0TaIexbP7ENY/UdeM62nrvjP9MYOTW6gz8jBckN1uCw6AyEBMu1qS0hP
         6011DxbGCyRG/xoo53Mlo5cq/sUpIz5KnZrWTLHhPKQPs7SzMkS0yoeK03FaQaOpIwBG
         7dymVB1HSGevvqiru7+xOR9XrCaKTom4Zhesf3a0zhad39VyrWd3L57h8hxo4n1FkhHG
         uX/UTjRjMG+PVCsKTAZhEqnQkkqTdxoHi532Hl/TWWFtESFeBK/pmFn3U8Pu0Vb4uJYa
         QuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786597358; x=1787202158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPdVbJEJQfj1xWJ2K3M3PZX5UlvGIUA6xNdCdiePNfE=;
        b=XpVYCYXU8bK5bbPuT9LRrL2ggVJciEKutiY7EmQvNjHuiXoBx7BNf4tDpl5rERSKKW
         oB9fnjEiZ3w8v36WqEJ971T2jdgZdjwXn1BiPOgEmUjxhi1XC8kA9zxbUXi0PS+svUrh
         I2TYFrwdwtZ81X7DUlsCXaDdx/SXWTQ8IbK6sXGEZjHSmTi91RnLET2ng+YzIj15hJAC
         u6qFip7tEGTX3gpIpY1x3fUTqF+Hg4lUX5xtq4QBoDHhi4BPDi+NsDt7tZ4SXDeW/0b0
         JKE3jWa6f/vEvOquzeXRHiW3CVvW6ntKUQ0z4v5W2g2G01JdxNpydx4bOT84lDXV679R
         DfSg==
X-Forwarded-Encrypted: i=1; AHgh+RqqEC+j/E/S/+p6nOeCbP8KQx6ZVoeE6mZcx/0z+7ftepseTeMopbg3sfeIKBGs1pQwTfaQMWP1XopoAXIy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz31GfZL7DI8xezqkfURcQdq5XdRXaQWywrCET0eDNfEjSrscUz
	p0I+SX7UtF0OUMnlh9We0JRTdoIW3xCNi1QefpSDaCRrGKTOt99txr7zGTtrBPlYt/2qTa9r6Qz
	IbzJWZR32suGpIWPza6kNQEz7DCp3KBw76u+C
X-Gm-Gg: AR+sD11f5ya9rwgcchchCbPNoyJLsnuWBQC3Y4Q4MYVNNv630YkzVsIdaDZN/bHkf4k
	fCvq4zqDEl8UfqEtOvABL0xhMe1pMHUqyFL9Ezpb7n5JJ0UrYgsrx888l1C4e3eMxf9UTaYJ3x9
	TMHCco+DxaLBTWSeRbDpRnx4ioNLSM1ogNy8H8GYTd3inmcDHQwHbdmi/6qFjFSpGJ/4F4Xhxm0
	W4/JULt7ztu2DU/gj+PMVR7tV6cfP4UDroFspod45T6Spt4yQ3yiy6YkDK2fMqRpwulREjOwB5h
	ZE+EQxhjHr7LUzhvicyJlg/qCryI1TCWrq4QubqcoKLww7CHSGoeuhU2z2ZZyvK9vGrLjSRHIIV
	Pw0oQL0wwg4Bz2w32b+JdcvpDAyw3SWUIYnekpAXZHhrYHjydeNDw+4FuXSgKt1/v+bcQqQ25
X-Received: by 2002:a17:90b:4e8e:b0:38e:5b59:c2ff with SMTP id
 98e67ed59e1d1-3931dfd0888mr3861982a91.3.1786597358325; Wed, 12 Aug 2026
 22:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260812112023.42254-1-phucduc.bui@gmail.com> <20260812112023.42254-4-phucduc.bui@gmail.com>
 <20260812115606.6AA5D1F000E9@smtp.kernel.org>
In-Reply-To: <20260812115606.6AA5D1F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 13 Aug 2026 12:02:26 +0700
X-Gm-Features: AUfX_mxshKTDLRVYPf-YHvMsJCb8eL4BRjYK6eEFFCMEmoQ7q_lwa2Buu3dSHlo
Message-ID: <CAABR9nEQ6v26S65WrOx1VX-fx3aP+PfjDWfmtEahgn4Uc-Q3bw@mail.gmail.com>
Subject: Re: [PATCH 3/3] mmc: davinci: Handle optional IRQ return value correctly
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_220239_516830_2F64ED93 
X-CRM114-Status: UNSURE (   7.67  )
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

PiBOZXcgaXNzdWVzOgo+IC0gW01lZGl1bV0gRGlyZWN0IHJldHVybiBvbiBgcGxhdGZvcm1fZ2V0
X2lycV9vcHRpb25hbGAgZXJyb3IgYnlwYXNzZXMgY2xvY2sgY2xlYW51cCwgbGVha2luZyB0aGUg
Y2xvY2sgZW5hYmxlIHJlZmVyZW5jZS4KPgoKVGhpcyB3aWxsIGJlIGFkZHJlc3NlZCBpbiB2Mi4K
Cj4gUHJlLWV4aXN0aW5nIGlzc3VlczoKPiAtIFtIaWdoXSBUaGUgZHJpdmVyIG1hbnVhbGx5IGRp
c2FibGVzIHRoZSBoYXJkd2FyZSBjbG9jayBpbiB0aGUgcmVtb3ZlIGFuZCBwcm9iZSBlcnJvciBw
YXRocyB3aGlsZSBkZXZtLW1hbmFnZWQgSVJRcyBhcmUgc3RpbGwgYWN0aXZlLCByaXNraW5nIHVu
Y2xvY2tlZCByZWdpc3RlciBhY2Nlc3Nlcy4KPiAtIFtIaWdoXSBJZiBETUEgZGVzY3JpcHRvciBh
bGxvY2F0aW9uIGZhaWxzLCB0aGUgZHJpdmVyIGF0dGVtcHRzIFBJTyBmYWxsYmFjayBidXQgbGVh
dmVzIGBob3N0LT5kb19kbWFgIHNldCBhbmQgbGVha3MgdGhlIG1hcHBlZCBzY2F0dGVybGlzdC4K
PiAtIFtIaWdoXSBUaGUgc3lzdGVtIHN1c3BlbmQgcm91dGluZSBkaXNhYmxlcyB0aGUgTU1DIGNv
bnRyb2xsZXIgY2xvY2sgd2l0aG91dCBtYXNraW5nIHRoZSBTRElPIGludGVycnVwdCwgcmlza2lu
ZyB1bmNsb2NrZWQgcmVnaXN0ZXIgYWNjZXNzLgoKIFRoZXNlIGlzc3VlcyBhcmUgcHJlLWV4aXN0
aW5nLCBhbmQgSeKAmWQgcHJlZmVyIHRvIGtlZXAgdGhlIHNjb3BlIG9mCnRoaXMgcGF0Y2ggZm9j
dXNlZCBvbiB0aGUgaXNzdWUgYmVpbmcgYWRkcmVzc2VkIGJ5IHRoaXMgc2VyaWVzLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
