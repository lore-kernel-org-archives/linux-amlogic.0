Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138A5C7EE22
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 May 2023 21:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIsEDpp1WNByM4cTdHy4KOXMttUhfh1xfN5Jurk1rRI=; b=LgwCRLygAIwI0E
	ZZCDxcLXnrmBv+QXh61FyhHavmpCXO53wjuL0yQlTWmvmkTmpHQCnazFCWe2RhcGtGxN8vn45ndjE
	q/QBBVpBlL3kkstZSeoPwMvKa08epQYXXpEmTHNK+cu75AengiqCS0PQwXz1DTgljAEEExYzDc5rK
	c4Sxb4L5tY+aP1hf+DbhqbDDXJXW5Z0dyKx/rzmywZ21dF8GSrNlfb79JQAgbeyFSNkoKRMQb3B6P
	S2L6bQVw6h4f0y9J65bgdZtnYfTShuKij0dI6lt+xBhturKZCkUoCr4Uw1zrXObXYqXlBK5KD96w9
	9LICj5G4UaoVVRdGsfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyIwc-000FIl-1i;
	Sun, 14 May 2023 21:07:54 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyIwZ-000FIG-1E;
	Sun, 14 May 2023 21:07:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-96aae59bbd6so531600666b.3;
        Sun, 14 May 2023 14:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684098469; x=1686690469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGRlqZZ1fUgmAfqPUnrcmB1La/Dbz4hpapBH34ufLEM=;
        b=j9SB7JZ4fcPtUzc0hGWnK9o7DYoFK6+KkGYxxIIG8Q+CFJOm/wqTDMG1ZFAN2brK62
         hZl9axOllW02wTzPUeEFDT1/mKCEvM/71EG+Glnt1YrHu2RvVOKHtqikAipNiXTgQesT
         jOpFHL+j0Ij1+8URCXCd27zPk94msY7WZ/ogCnr3KKWHhnDgQ+Rw91VKtjAyJ4ir3uHH
         gwQFokiusma1KVMfFMRyD9j2AoOHMhXkqsaxg6/2Q8WlFwCucFA2KmMrY7RxNHe4AQoK
         DO5PEppU/Sko+kKF2Bpf1flLBOUKCWTILsinrjpdHKSC7aNnbYzGOBkHv7ftB5lxSFAD
         ySog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684098469; x=1686690469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGRlqZZ1fUgmAfqPUnrcmB1La/Dbz4hpapBH34ufLEM=;
        b=R3kl3f9OXh50q5yeuST9OTumX1zMl9/XAmrW+YCZLPxMdGjAtc2aN1n71+qQadCa+t
         KzhHMVqaTTZPeMwFynHbWBrwNdjFpancJJhoXZcG1h2o+BQ2sXHYoRvg3Iu5neFy6DN5
         2QWC7Y1r4RY0Q85lKTFTsUjQPRggofRZPEycq+vF7BbYmStM2nIPK8UXHc+bouUW5I1w
         CFyJ8ruIyBSas3pu8Tuq0VzYCWiGhoUu+6FkQ7LhdUTDDEY4zzkn+w0l3IJ0hjiYEc6H
         XmVrsERlAh6vyvLbA4xG+fYcCDjzjWSH/lZ+zDV2eWWZ0iFbw6RzsQcimpRwzzTIpShg
         HhJQ==
X-Gm-Message-State: AC+VfDwkIkdz+AK91cPBc2Zp6Z3LBao8wHEKAkJrf2StA/Wy5Z0wKPBt
	hJ49RrSNIs22CwBVdKiTPmPkZmoAW1DAwdmlMhk=
X-Google-Smtp-Source: ACHHUZ7uv9Nd45l1BKb9/qxM98WUnTOrEHYjmqjslOuPiaQ/DTjCTrcrh+nQfauFH/uP9FjF03hOLE1+0eK8wCzGyJ8=
X-Received: by 2002:a17:907:3e1b:b0:967:3963:dab8 with SMTP id
 hp27-20020a1709073e1b00b009673963dab8mr23009913ejc.7.1684098469409; Sun, 14
 May 2023 14:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230514201909.506090-1-martin.blumenstingl@googlemail.com> <2558ba71-4f51-e186-b51b-554a72f19e19@gmx.net>
In-Reply-To: <2558ba71-4f51-e186-b51b-554a72f19e19@gmx.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 14 May 2023 23:07:38 +0200
Message-ID: <CAFBinCApNjwgJ9vSjYqvZj5xn6vQzynFqB7KAvcT7KgB4fX+ig@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: meson8: correct uart_B and uart_C clock references
To: Hans-Frieder Vogt <hfdevel@gmx.net>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_140751_445005_5659F56C 
X-CRM114-Status: UNSURE (   7.94  )
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

T24gU3VuLCBNYXkgMTQsIDIwMjMgYXQgMTE6MDHigK9QTSBIYW5zLUZyaWVkZXIgVm9ndCA8aGZk
ZXZlbEBnbXgubmV0PiB3cm90ZToKWy4uLl0KPiA+ICAgJnVhcnRfQiB7Cj4gPiAgICAgICBjb21w
YXRpYmxlID0gImFtbG9naWMsbWVzb244LXVhcnQiOwo+ID4gLSAgICAgY2xvY2tzID0gPCZ4dGFs
PiwgPCZjbGtjIENMS0lEX1VBUlQwPiwgPCZjbGtjIENMS0lEX0NMSzgxPjsKPiA+ICsgICAgIGNs
b2NrcyA9IDwmeHRhbD4sIDwmY2xrYyBDTEtJRF9VQVJUMj4sIDwmY2xrYyBDTEtJRF9DTEs4MT47
Cj4gU2hvdWxkbid0IHRoZSBzZWNvbmQgY2xvY2sgcmVmZXJlbmNlIGZvciB1YXJ0X0IgcmF0aGVy
IGJlIENMS0lEX1VBUlQxLAo+IHNpbWlsYXIgdG8gbWVzb244Yj8KPiBTb3JyeSwgZGlkbid0IHNw
b3QgdGhpcyBlYXJsaWVyLgpZb3UncmUgdG90YWxseSByaWdodCAtIHRoYW5rIHlvdSBmb3Igc3Bv
dHRpbmcgdGhpcyEKSSdsbCBzZW5kIGEgZml4ZWQgdjMgc29vbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
