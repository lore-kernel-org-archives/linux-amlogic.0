Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B50CAC5BB
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Sep 2025 21:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzAOizBvsMvAyW1H5WD7Tz41vOdZQRDZf0qxz94aMBM=; b=0AP4ppeazw279y
	aPE1AJ/mKap6+Rjsi8Jp5H+uVy9hQez3f5zDYYTLd8rXWi4IXETKvys2Cr63WMUUTLKl4xFOmABrg
	L8bhYAuRXbvsIDsa/KRJj2ZJQC/hfZbO5K7fLYiwYz/QNDXW18pwLvEJ8ZqMtFim9jVcjVmRfT98J
	eFn9gWpppCuv6UJmh1s0LVSnv3J4v+pj2cmnJOwd5D+NYPrZSIm2QjXBIlK0FrU8OBHXHRxsz7d4F
	rzKrEYT6ZrazlVW42GS1ZgT01+7ixXQBaOY69nVzNu11LQjHuSXdaXrEYdHQDdUZxHxk8tlPBHcyd
	cSTwFdF0gi/NgEdJkyFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ygq-000000005vd-3Mn5;
	Sun, 28 Sep 2025 21:12:16 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ygp-000000005v6-0BVu
	for linux-amlogic@lists.infradead.org;
	Sun, 28 Sep 2025 21:12:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7811a5ec5b6so1740160b3a.1
        for <linux-amlogic@lists.infradead.org>; Sun, 28 Sep 2025 14:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759093933; x=1759698733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9Wr+oB+yImWWeNWztttdaO+JL7qll64cuGGoO1pokQ=;
        b=Vm4Xdosuc3E4qt8PzYKNbqtn4PkuWoCh3mCGhJqB2kd5SjLilLKFR4NLp4gbKuMinY
         zLMKTMBK91Ggc/oSiayw+ShZplmgQsFnQweravUuLge95fSgUHb02xOcPQl6nrIFyMvl
         n9rhZlUI/ydjh3j0F9oxc4y3Q/iWXds+CqobFAUycufs0CBOvwNcfHm3ivMTjLhVDRUc
         ce+wyNg/BdHwl7O9qt0ymRT0UXcKX9Ac+8C7zczSgf31A5I53440KpW8vSA2G4sRQq8F
         Mnv0RoInjre/5ltoL8NYORi6RAX4LD1YO0NweT70qXcju9cSWD2ZZgjZxl+QHUxPBh0n
         2Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759093933; x=1759698733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9Wr+oB+yImWWeNWztttdaO+JL7qll64cuGGoO1pokQ=;
        b=gNYPdeYNes7F77GeP9quJNhZTDbVjqPud0DHtAS0wBtlB1kP2+rcJFdE8bXKLdXWVE
         tg7L2tHl6nvpn6a2O2hPjacCJXRnzayE0Phpsz7zTk4yHt51QbA//4XYwZE9QiGJ0pMW
         IulQ4BwKyytZ9/PrR6PHfNSTIVQmwtoCkjiYF9vaPAB+BDdIxig9fWx9hyi79FM+vgJG
         gCCP3AJmXWULZFF2sREos//uA8fKMyv+GrYnDjPbdecaVNcYb+pi1w4DUzxyuO900VuF
         6NDTc1YkunI6enb3oMhbdQDvCCFvHGfnDbh+xzh3aKok9ZcDkBE9Jk2KnP71+1Em708f
         Jwhw==
X-Forwarded-Encrypted: i=1; AJvYcCUIJnrO742nWWffCffkp8RzdF7b9kkJXT222HyuJnKhK5ZXAVyOmnFfRYF9ZaDoaYkZkP/RyyuosdHP9uSb@lists.infradead.org
X-Gm-Message-State: AOJu0YyBG23wVC4Kg5Xrl13r9n0nboiMPUd+JjA/hyK6EIvRLhXkderk
	X37dLyZm2OWjCaKv57eRSRenXYXsv6fmaYsy4wJh1aAPWpvH++ntwzjykujY3h4xKrTNgYJAvTf
	vVXMc8OJFakfL3ujjw6izxva/cyyC4Vs=
X-Gm-Gg: ASbGnctTkn46VODIcfc4f4dA7ukE34E5bU9o+tSViTr4xmS2Wu/IA5D9TWLgq4CbiWS
	/EgKpuoRYFvM2bLYyhJbFVlxGZubLJP6AlGBt+3o3OBxM/OPjsuNNIK47Zhmr2gt9YtPFzjVk0E
	cboqes6CEXDUdjUhuuZbmEMRcDv6wddkYG4smwe9I1AuElFq/jLUN4li6fiQlW1xPBNPkY184ZU
	fbFR5lQ6itxuuaC1cenxAPAz7xJi50Ug/e4ax7vsIQJvA2KFmxcAxkmRBvoYQ==
X-Google-Smtp-Source: AGHT+IEzeCWoAcjeQc0mkokrPasLODpJyV0OvfwXH4nf4WOVTR25YxHcNFHmxB2wa/0TSLPGrvZCSjajqVhJuA6GrUs=
X-Received: by 2002:a17:902:ce01:b0:27d:6cb6:f7c2 with SMTP id
 d9443c01a7336-27ed6e0575amr147835175ad.17.1759093933080; Sun, 28 Sep 2025
 14:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250927125006.824293-1-christianshewitt@gmail.com> <20250927125006.824293-2-christianshewitt@gmail.com>
In-Reply-To: <20250927125006.824293-2-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 28 Sep 2025 23:12:02 +0200
X-Gm-Features: AS18NWD6fXr03inON1_wapYEKrdYX1AMtat52gOUZi0JEEmswI8favZ4PtmwBLQ
Message-ID: <CAFBinCDQc=2xrKbGunSKJjLhGd0bCGN+3oYd_bg0ySs+WHxZjA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add initial device-tree for Tanix
 TX9 Pro
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_141215_077576_A4B14F14 
X-CRM114-Status: UNSURE (   8.07  )
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

SGkgQ2hyaXN0aWFuLAoKdGhhbmsgeW91IGZvciB0aGUgcGF0Y2ghCgpPbiBTYXQsIFNlcCAyNywg
MjAyNSBhdCAyOjUw4oCvUE0gQ2hyaXN0aWFuIEhld2l0dAo8Y2hyaXN0aWFuc2hld2l0dEBnbWFp
bC5jb20+IHdyb3RlOgpbLi4uXQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1neG0tdHg5LXByby5kdHMKPiBAQCAtMCwwICsxLDkwIEBACj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKQo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKGMp
IDIwMTYgRW5kbGVzcyBDb21wdXRlcnMsIEluYy4KPiArICogQXV0aG9yOiBDYXJsbyBDYWlvbmUg
PGNhcmxvQGVuZGxlc3NtLmNvbT4KSXMgQ2FybG8gcmVhbGx5IHRoZSBhdXRob3I/CgoKQmVzdCBy
ZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
