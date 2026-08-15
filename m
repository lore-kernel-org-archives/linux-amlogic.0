Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65641C5AD5A
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Aug 2026 03:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaYc20OczWtVyWxVEw7EatqJh8bQGRJEPuo59rM7Vrk=; b=wAmuKXiKkzxzIS
	wtm3WVqL2C2FNSFl174jiURUBM2ePuu3Ct54rF0oGSi8Niek4vv28UedlevMaicrmxOfQ8zDITC2t
	GYFrqwyEc++MZh28lxF8rY0sTZpyeTDMN2SbskeGBBgeT9BBDCYFhoZNRzWnTwW77RcHPfcYn9sni
	7jqC6GKFkwpHrdt65DxkfTXgyS1oivMnz8co/jRWEOFyvHrJTIH/fWImsX9l7ILAP270S29MQkDLi
	JeSEbZyaRx5eQk5f6ZsBkT7/l5G0sry1Rm+d27cRHG2Hi8R0YjZVzmb47ar6Pa7Hv3GPsw9vipvTx
	v+b/jPcHiXBClhPqZ05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv4wU-00000003RXU-3JXw;
	Sat, 15 Aug 2026 03:20:18 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv4wS-00000003RX9-3Yfr
	for linux-amlogic@lists.infradead.org;
	Sat, 15 Aug 2026 03:20:17 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ccf2360620so17603045ad.3
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 20:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786764016; cv=none;
        d=google.com; s=arc-20260327;
        b=PBvK6XT6VgZU0lRCSHGXSuvk4xMK0MKYoJhU53xCcHl7n8BDfRSvcCkshy2rAkQ9Cf
         13OaKk9OicLY82CStjGqLldL8DYXCoVgoTrtj6sFxyRDOA7HSkLjtGGc6gseoO/sS2QS
         6LxkRMEX0N3RrOsKDClsnv0qQghQN1neCt0W9QB2W2HwfdouLgj2jqy/Cr+1/Ca2CkEO
         pKNcpAdchL9F2hhZth1tyqwau1oGR7UTYH/R/+mDfKTskzDiVNeFivwTi2wMScOoN/U+
         eYdkO/758v+wskpNkMc4RBWTBcJcH1QqUzoYuFPjx7dfgilWQD3+/8Za/qeLWyeo8sP+
         pAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qvk4YjvniYtak+kXTfBaCRVIW+L/iNNu37Gor4R2CX4=;
        fh=YMTKb2rOTtj9jVGAILFDplwircGzyL3dxaMRKfV/+So=;
        b=UHlmHEgkcXE7zarbYn68UjrIM2/ttmI6DvODVh0N0h3e9H4FsuEiEO1n4CP8JmJhHP
         aF1KVFmuSQFDli+LpdJ6loRgbfDUCF9RBND9lW1BOeWt6ud2icDx5As9YrSRsG7z90LE
         g3RB585NEpO40fns5YLMjlTBsmup699+IlwEBCB+VfNlsEm1/2MPuB5c2uUgb61TzHNR
         fkY4C9jbrFCH4XJDFu0VAqpe+/UDXDRPpIOVJD/XQDQsHmpEwyZbPEIzMDk/SMakxnY1
         dEhp75m1yLgj7qF6D3joh08uazvWGw/2TIP11FWXxgtcU0ghQ+mACDLnyElUfHNE/8t3
         unOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786764016; x=1787368816; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qvk4YjvniYtak+kXTfBaCRVIW+L/iNNu37Gor4R2CX4=;
        b=mnQOPm6FXwmQkbsWHoStWbwJnSGn8lGu4CghW4y/CXeBVLINNNfJ73caqx4fWFMVOx
         yp372hiJoEuIjAsAE75QKxYR5gl3Ny5ngFCyO/5bGPwrM6sgD8vWOt4YutmlOr1WkqfC
         Iac2cxHhpWco7Xstv0CXzTbkHWfbg8azz1rjUXgTx7Sg/UwUEZaaG0xvLRbrBLkpySA8
         hNdyEz2G+kcH8/jc6IQKf63EEI0kbOwdLQTyKKGcFkHQtfzpZe973BrD2uO1QbqXoXoC
         rHx2pRvJoz6t3aHwlU5+mD8rSWpOthSMvZ/OsnH8KD0kxkF7cHE46Po9xAjKvNFJcMcK
         kZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786764016; x=1787368816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvk4YjvniYtak+kXTfBaCRVIW+L/iNNu37Gor4R2CX4=;
        b=fDYpyK8KRhLQg3Lmpk67bJiYIUFCtnXWcsl2NuN1ThQ+cxarIZRKENI9i56UQCFNN9
         I+kFrsGcsBOqp9B5ABxMFki2MmacGcrLeVNDguAfotuFQmP4BJ1PjSsZyHfP8TrL/0/F
         A1HxbLjHsREmIZxcBUx0cmwCe2ligPH3P2Gz7DMeE1cSoH8dbDWnw6envltJLV9Kcmqv
         lJE/WJW9y0aaSDqrRQQTN5/QqcE40kmlEwq0tNKQFasMM5n666GTd2/yS6rAdWPHNwCO
         Sm4n/D1D6shfSRka2wxChxYUxx0Z7GMDCasm8PxEHpo+iZLxwD9QuMXn7e1dmZRzEYL0
         fTFg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2ZlTgyBI7mZp3TzhECb3jVUXSSDxEfvwbR/AcNgDObfgq/U0vHOVegq0icYe7i8j2gBYB4+rGWNLYj9KA@lists.infradead.org
X-Gm-Message-State: AOJu0YxeKIaYMr4PyrOQc1M+YNJyyWiSmgkZ+cCSOUXmwenSGwyLnVme
	gAuEXgJqafk3xVUCWWkRCxRr+j7FUlvCF12KNuaZ/bph+mwSbuSIo4Jk67Nl+3lx1M0f0XCROq0
	MdZm4eW1KhFxYa1yJdsEvfYzqV9Md5es=
X-Gm-Gg: AR+sD12HEtUcDkla8MuLWFyTzxXHBwKoJmrUM60UOtcsSlM+TAANy5QIBIkpPar61eL
	IPaqVOnKouuDW3hSH+AMySSDl08NZbqSWEvOqHgA7asb75g1YzpMtnOL5oi4H7mAmbycWsJAGhY
	L2lz7ou9FLuQAYHtpavTrlWuM56Vm51qJfWXik+j5LE8/QANwOPZShaUrKE7aobuJutpBvrw7gY
	0uRvSblyD79WlENVqtS2uza6aM6DjQX/6ACN/M5ymPtwC4hbIvqqnuNpcw44BWGiPp8ZlM/9C2e
	n1TmUqxwQCrzVfvgk0Pq1WNKvoPDoPnUXdDT5CVO080W+LQzQphXZIo8o3YQeQ20OxIwJJNEam8
	QV1VR24hGR2lHP1kPmkhMd1TgkQDD+2WcjPakLpbCwNIB7QcO/K4rNK65FOxbGh1vDqVOE605Hd
	EaxLFWgSwPmAtRyvI=
X-Received: by 2002:a17:903:22ca:b0:2b2:67ca:5ff9 with SMTP id
 d9443c01a7336-2d3b06e91c4mr122984055ad.0.1786764015675; Fri, 14 Aug 2026
 20:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260814094211.25151-1-phucduc.bui@gmail.com> <20260814094211.25151-2-phucduc.bui@gmail.com>
 <20260814095120.235F21F000E9@smtp.kernel.org> <1jqzk1lz2g.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jqzk1lz2g.fsf@starbuckisacylon.baylibre.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 15 Aug 2026 10:20:04 +0700
X-Gm-Features: AUfX_mzRbh4hmvosuiLVlY3i6x4JnG5NEbKO-sUOdCn6SPRkXPqPXV4-RyM6Qsw
Message-ID: <CAABR9nHrxzkK+dR5ca9PxY5Psxm3NVsbpAwAfx=_FyH3q5zodw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card-utils: Drop redundant probe
 error messages
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
	neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_202016_890169_7C03D32D 
X-CRM114-Status: GOOD (  11.16  )
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

SGkgSmVyb21lLAoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LgoKPiA+IFByZS1leGlzdGluZyBp
c3N1ZXM6Cj4gPiAtIFtIaWdoXSBQcmVleGlzdGluZyBkYW5nbGluZyBwb2ludGVyIGRlcmVmZXJl
bmNlIChVc2UtQWZ0ZXItRnJlZSkgYW5kCj4gPiBkb3VibGUtZnJlZSBpbiB0aGUgYG1lc29uX2Nh
cmRfcmVhbGxvY2F0ZV9saW5rcygpYCBlcnJvciBwYXRoLgo+ID4gLS0KPiA+Cj4KPiBZZWFoLCB0
aGF0IHdhcyBwaWNrZWQgdXAgYmVmb3JlIGFuZCBpdCBpcyByZWxhdGVkIHRvIHRoZSB1c2Ugb2Yg
ZGV2bV8uCj4gSXQgaXMgb24gbXkgVE9ETyBsaXN0Cj4KClBsZWFzZSB0YWtlIGNhcmUgb2YgdGhh
dCB3aGVuIHlvdSBoYXZlIGEgY2hhbmNlLgpGb3Igbm93LCBJ4oCZbSBmb2N1c2luZyBvbmx5IG9u
IHRoZSBpc3N1ZXMgSeKAmXZlIGlkZW50aWZpZWQuCgpCZXN0IHJlZ2FyZHMsClBodWMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
