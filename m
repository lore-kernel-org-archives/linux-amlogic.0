Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6C6C43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 05:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJwMXaJ9S0JkadrrjK6pFGiOc0OSH6jrBZidp9eucqg=; b=QaVO9d+7KNgNUC
	ptaby1kJqBIxqP1hycojkUJgq2kk9k6O6ohMwD+VSdMYZ6pIyy8K9o/JN7HVgREQ9U1GCFLYfLU4Q
	gTGy5z9UuSWvGdJUHHpB4Z+0BwKGdofJwDi4wGNXFp70v77fUSNIVW996EmGwb8zXy0uSPD5aWM1p
	wRYos/ArF7ee/aKwYX3y4LSSiOCt45+7zFhHHVsFoGR4l3ciR1ah1Nf4atIEVTE10LeAYGqzixYL5
	71reBBxCMyEj8WVuPXUJRkpES3zjYXi3ySnyqRh8be1n7G2Bn8jq/QHaAOBRb0UxQtoornQPZvC+9
	d9dHhLDy6do2OqkkFwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi49g-00000004E5A-2VEY;
	Fri, 10 Jul 2026 05:52:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi49d-00000004E4o-2IMl
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 05:52:06 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso7156315ad.3
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jul 2026 22:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783662725; cv=none;
        d=google.com; s=arc-20260327;
        b=GccpsZ4Lv2Y6yhSXGNDYXwMrP3f4lXmaAOqNmqTay2EpuRId/mVOy3ZSUj83WEdtGc
         in66Zr3Cg4ea2+ox4CoO9QupGtEc3kwJuePyf2SyBfoxdZwdiGnI26Ef/QhlSeDg1z3p
         pdVJ6qefCt5cUTB3jsUQUqAYO/zE1TXYBF11B0Jq7Lh8S4fxPvnRizrIF12rcYulN+lb
         AdoYDyw+Q+Z6hqi9eBXO2CHN8mI087ZcFlOCkPOu2bbWi/EL/W9TIeFS6a0p/cQZ50K9
         jcyDYdwP9fdeGOWlvB16W3cDzBdS5vDJUdN+8nrMoLYEmmbBfhx3JcMEOK2LRsCczzT7
         h3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nM5Txl5PUCIYtmpQVuxaJ2s6Fzf95yv2bzIgjxFh4kY=;
        fh=Pacr4fgt6qXv1Ym1BMkboUM9CD6Muj1kjc4VbVGxSHo=;
        b=XZ5aaXo8e8GDIPXqD4i/NzClxogK/PRAFX0VVrzkooAT1DVArFZMnZXsA3peCdNojT
         JA0rjbZ6DO08LJouWLFEuU3EnRFHdCz9fJhOItzulB1/2QNM1aRFjYullA5I/z/QcouI
         SfObTEMKRq4j58ZvcXW6s7z/LMWyVvI1JierOL5FVpfS2K5Qcw2xBXaro1Cl8ZUa/1ZA
         AksWSEQ1R1PGfT27ab2iDUBpEuaibEMinvVCSuEHmQQ9jSag6k2qtB/tgtojYYPaZuqc
         C8WYobLEKWBWnJ/SoVncuT2hLfAMxeYlkhxbXoAPbAd//DFTc6hXXs6aBCgQ45FqAnMs
         pR4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783662725; x=1784267525; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nM5Txl5PUCIYtmpQVuxaJ2s6Fzf95yv2bzIgjxFh4kY=;
        b=CpZzAcAsF2XYIEnm+wBt6LPy6LODZDqp6W8ckuJs/JQ/3D8r0UyMm+uDofSdoVC8Ms
         dBiZeR1ehujaDvgi+4gAo5/MLw3fm+wGVSz4WCeXzlIXc75M6qxXU8Phbr9SHvv1vXSb
         ht7+YAfzTYdI9vxfQ0ymHGjA66N3/YlSi/ly6S/CVJgoYOgYHcwQyhTWP9sgiEfGNIYT
         OvbRci1QPEQPw0A5qXEyJYrI1s+6a6lJt1TPW+GjFtrvDO+Gj4nrEkWoxZN+iZHpf3B/
         sNqmX4G1dmHrY6MSc7A6bu5a0n3mXm48vsT/kuuFxYfnSwhagMF/9QyddKKKpk2nERsw
         Fj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783662725; x=1784267525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nM5Txl5PUCIYtmpQVuxaJ2s6Fzf95yv2bzIgjxFh4kY=;
        b=WrQZ8Ix9qeraz299WVNu7b+TwdAGtttLH/dOJ9G3tM373bACHnUuA01kl4P/JCe2tE
         EpT9ApQcDeCMffB2bULKCPbk+oo7SaaIgFCxLEojZVhXxExjiWuZxftJDahV4aS5Y90Q
         kxOPv0Cu+A4L+BmvxeeLQdWrrCTxB80ry0o2KmjFW8Fm6ZCh/qt6N7Dk18as8xQCiyi7
         b94TsclBmK9ykNWO+ca446FpATjLNuQ/6u8IahNtr5BLlAbuUBRISfXVvi06zStKE5RV
         fefQgMIvTcLIzHkNTXf0clN/wZsX6MGLFRKTiFB5UU+/tWyqQ9CT0P+fuyp3x4qhkK0y
         /+hA==
X-Forwarded-Encrypted: i=1; AHgh+Rqkv2RK2KVPrXx2mUJCgbbJjmwagcAT1052fLK9ldRqk4vd91vZgU5yLMzJTn84v5g8qnl7o+eS4iHC/SU2@lists.infradead.org
X-Gm-Message-State: AOJu0YxgP6B/9kzseDf3Bs1hz/Ty85zyl22tHrmqIMfHteHHqaQ8HZ04
	J/rLgj2DXZBLwWVnjSEixv6dDnZBog8diCG7YYkwi5856OOR/qHWTRy2kp/ARMhmVR+e8R7gatO
	JIjJ9+sshoJjhJ7zgc/neM93zDxb6/dc=
X-Gm-Gg: AfdE7clcUK8lVfnZH0+5A5RqD6IvVzDZAt3BAyUU4d7hZ4Ft+UrrrMcGbnOXVqcDHRh
	uJM9BSXlSfgfPVxipk8SmZRd4ttllUfX97+XCWiFidgkbM54GQir8A4ejNoXruudmD0kGNEfPhE
	l7tFrlEUjhJxHUSbQsCJ5es1wDDLx8BvfNcST6AOWuLIHcvmtBeYtnNsHuKBZbqnddoA2uyWiVP
	bH/Mbto69hFIrpECm+NTjxfkpe/ML2Nq0DKO+AIu2Yz3RMPxPLlaj8AT901LqixWQHZyqkJNgG/
	DZ2j/bi17hVZnDDiQy4C/AdPO4KPhQ==
X-Received: by 2002:a17:902:cec2:b0:2ca:ea56:7a58 with SMTP id
 d9443c01a7336-2ccea58039amr108040895ad.37.1783662724844; Thu, 09 Jul 2026
 22:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org> <20260709-drm-no-more-plane-reset-v1-23-302d986fe5f0@kernel.org>
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-23-302d986fe5f0@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 10 Jul 2026 07:51:53 +0200
X-Gm-Features: AUfX_mw7meUv4qkFmsOwX-oOv3_0V3pYNleMU-cUI1ei3foVYgmTF1K4dDloyU0
Message-ID: <CAFBinCBZ4JxY=rRLM+m780VjceNgCKUObuwBDYzS-KJmuqsDeQ@mail.gmail.com>
Subject: Re: [PATCH 23/60] drm/meson: Convert to atomic_create_state
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, jbrunet@baylibre.com, khilman@baylibre.com, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_225205_605652_6C7D9FEC 
X-CRM114-Status: UNSURE (   7.32  )
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

T24gVGh1LCBKdWwgOSwgMjAyNiBhdCAxOjUx4oCvUE0gTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoZSBwbGFuZSBvbmx5IGluaXRpYWxpemVzIGEgcHJpc3Rp
bmUgc3RhdGUgaW4gaXRzIHJlc2V0IGhvb2sKPiB1c2luZyBkcm1fYXRvbWljX2hlbHBlcl9wbGFu
ZV9yZXNldCgpLCB3aGljaCBpcyBlcXVpdmFsZW50IHRvIHdoYXQKPiBhdG9taWNfY3JlYXRlX3N0
YXRlIGV4cGVjdHMuIENvbnZlcnQgdG8gaXQuClsuLi5dCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1l
IFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0
aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
