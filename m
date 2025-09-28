Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB02CAC5B5
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Sep 2025 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjPv/pnxrjm85+81Af4eOfzvj6vGcoi++vSweoKa4Q4=; b=hxkCCydoZQlQ/6
	EpGgP01+Tebqo8tThksFJiLyQkHP5z/YYqgtCSDDnxF6CzfXHfzSYMLliFkfxwg8IrMwHn73CW1B4
	Zerv6THBEkgtOWJa8RvXJEKFX4/POgXMsRDnYZ+KDpAbKbxK0rWzNn0UxLER9ZfIqQAqo8y4H8QAM
	l6B4KFw6rUXWN+La0OWGtyc+0k17meuFKOYEDhMCCNGgeOQD1aoydjlLlnIrLih3pTlPyAgt3fs//
	75cV4sce0l3CE4xaTtHzZRK63cB74bDl/LyBg93xdoUgbTgzER+q6/Qp5nWQvS28wGu8IijatWWOp
	Dfdyt/cVdgCGKQUXA9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2yRE-00000000417-0iuT;
	Sun, 28 Sep 2025 20:56:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2yR8-000000003zq-21fy
	for linux-amlogic@lists.infradead.org;
	Sun, 28 Sep 2025 20:56:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-27eceb38eb1so46611825ad.3
        for <linux-amlogic@lists.infradead.org>; Sun, 28 Sep 2025 13:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759092961; x=1759697761; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiGIGqDPqEAG/fx/GyBcjXyYsr3F4pTYCf0xPL9HStc=;
        b=QL/dHKwQm15FVRx0SFelBFgb9CQ/VEcR+vwWwvJVCd7dIunJQMqVsbJC0n9zeEV6po
         Wpmh082Pi3mpUFzbKgoFFy22DGGKqrZ1qu5Cce0YKFd4Qu7oLU3h3EcO7d4E7kGTsRt7
         LrixPuWclhSkQxXpvUBUgaeKyfAA7L6l1NDf3Yl9JQcNM5BaYc2AoZssnaHuhb/6VYxc
         YxGJpIwJBR7NqitsxYGu69xtkwjFpB/8JFwf4mhrvL7t1u25yHGzJXnG1+59xzO6qq3E
         RqoFNgaDYg/0IoQg6AuFjb5W86MiD1T9BUvONJLCRmoQt6skrxUW3CeekX68C1Iz692Q
         dhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759092961; x=1759697761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiGIGqDPqEAG/fx/GyBcjXyYsr3F4pTYCf0xPL9HStc=;
        b=Il2YlysYoDn+hIiwHt4UdwsKpwiNF0jQH5Z+ciwkJ9qIkIJAM702fLzKTxQyryVObn
         RGNOTTkuRNnslvk0Onoz8HD+sK83cjgva5X/NyEtaR3mcXp7Qyz7PQbe3FbucQ6gLE/m
         t0BiYZUwz8087C7lyMh4ERzU7V3pEmYt3ueAEM0aGBVQndebR8wS09+NcdMxhpR3jiP5
         dT6YwFRPYFgzcr3f929F7x1A92oVrCauIn+4lcaYl77SDoZyHNXdOF4xcIjzJEQrb4o/
         z6mmRWlOAALPjnZjSLnP9lJntESKHgGQilw6OTwB5oxs6IeOQHfJkgYnz2jUkQ8PmHUS
         nj8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEjMrOliTPYdH62hnPllLQ7M7i7K7c5N8a/WYYN+544b0MuMU9UZbzQ3J9iNtzC9SFwSTHVdPdyKSBmTqc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7QcujleTXtHBcFJ88acM2Vw2Ys4EF7DTOR5AAiwiwXmHDJuWr
	Y+KbT+pJ+MwlzcfVJfhc94+pVgJ/rDTT2ln4hqXT0kvoF3qkIRePuVWFrsGpfS9RSfDVwlUvcUI
	QDu6dc6LbuGWkVf60/i302KNtKV6HtsM=
X-Gm-Gg: ASbGnctcDHWkbOIzTZvun7WbaZgSkeznrpTZEHaRsNygi/DTbL2sONXa/P9bjQ33xTL
	Fjg5vPydDSMnup9Vc1ihA1Ob0cig5LxSInmzDTeqwQpQLhlyVvElos+mk3vPckda+IDD9dFVohd
	zXpgE1yLaFAPCLiuJKOH4MZ/u+xOy12b61fE98shuI2M/+hHvtPlfz4dDWE9gSmBsJWfbfoJM7n
	aLLlan2erL0wcBRxqnoOX8BqoU/Y/rsyaRWOOypuWj1UN4tkaM=
X-Google-Smtp-Source: AGHT+IF7c1Vuxskwry28TIxl0fMtYzqbtx+tBLSfDt71UAkuiIb3LaxfXzXjmqXnRcWpmOVNDKsjmYs5K4EhIxamz+w=
X-Received: by 2002:a17:903:22cc:b0:248:ff5a:b768 with SMTP id
 d9443c01a7336-27ed4a29f9amr152736995ad.10.1759092961471; Sun, 28 Sep 2025
 13:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
 <20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com> <CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
 <20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com> <1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
 <e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com> <9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
In-Reply-To: <9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 28 Sep 2025 22:55:50 +0200
X-Gm-Features: AS18NWCJbZWjP8ynFS6Veu9yFpZpvyV0QmDxpZo6qHFoQpkPGQRYQgKjOrmkB50
Message-ID: <CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_135602_540676_111051CA 
X-CRM114-Status: GOOD (  19.57  )
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

SGVsbG8sCgpPbiBTdW4sIFNlcCAyOCwgMjAyNSBhdCA4OjQx4oCvQU0gQ2h1YW4gTGl1IDxjaHVh
bi5saXVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Cj4KPiBPbiA5LzI4LzIwMjUgMjowNSBQTSwgQ2h1
YW4gTGl1IHdyb3RlOgo+ID4gSGkgSmVyb21lICYgTWFydGluOgo+ID4KPiA+IFNvcnJ5IGZvciB0
aGUgaW1wcmVjaXNlIGRlc2NyaXB0aW9uIG9mIHRoZSBnbGl0Y2gtZnJlZSBtdXggZWFybGllci4K
PiA+Cj4gPiBSZWNlbnRseSwgd2hpbGUgdHJvdWJsZXNob290aW5nIGEgQ1BVIGhhbmcgaXNzdWUg
Y2F1c2VkIGJ5IGdsaXRjaGVzLAo+ID4gSSByZWFsaXplZCB0aGVyZSB3YXMgYSBkaXNjcmVwYW5j
eSBmcm9tIG91ciBwcmV2aW91cyB1bmRlcnN0YW5kaW5nLAo+ID4gc28gSSdkIGxpa2UgdG8gY2xh
cmlmeSBpdCBoZXJlLgpbLi4uXQo+IEFuIGV4YW1wbGUgb2YgdGhlIGNsb2NrIHdhdmVmb3JtIGlz
IHNob3duIGJlbG93Ogo+Cj4KPiAgICAgICAgIF9fICAgIF9fICAgIF9fICAgIF9fICAgIF9fICAg
IF9fICAgIF9fICAgIF9fCj4gb3JpOiAg4oaRICB8X1/ihpEgIHxfX+KGkSAgfF9f4oaRICB8X1/i
hpEgIHxfX+KGkSAgfF9f4oaRICB8X1/ihpEgIHxfX+KGkQo+ICAgICAgICAgICAgICAgICAgICBe
Cj4gICAgICAgICAgICAgICAgICAgIDEgKiBjeWNsZSBvcmlnaW5hbCBjaGFubmVsLgo+ICAgICAg
ICAgXyAgIF8gICBfICAgXyAgIF8gICBfICAgXyAgIF8gICBfICAgXyAgIF8gICBfCj4gbmV3OiAg
4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaR
IHxf4oaRIHxf4oaRIHxf4oaRCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDUgKiBjeWNsZXMg
bmV3IGNoYW5uZWwuCj4gICAgICAgICBfXyAgICBfXyAgICAgICAgICAgICAgICAgICAgICAgIF8g
ICBfICAgXyAgIF8KPiBvdXQ6ICDihpEgIHxfX+KGkSAgfF9fX19fX19fX19fX19fX19fX19fX1/i
hpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEKPiAgICAgICAgICAgICAgIF4gICAgICAgICAgICAg
ICAgICAgICAgICBeCj4gICAgICAgICAgICAgICBzdGFydCBzd2l0Y2hpbmcgbXV4LiAgICAgc3dp
dGNoIHRvIG5ldyBjaGFubmVsLgpUaGFuayB5b3UgZm9yIHRoZSBkZXRhaWxlZCByZXBvcnQhClRo
aXMgaXMgaW5kZWVkIHByb2JsZW1hdGljIGJlaGF2aW9yLiBJIGd1ZXNzIHRoZSByZXN1bHQgaXMg
c29tZXdoYXQKcmFuZG9tOiBkZXBlbmRpbmcgb24gbG9hZCAocG93ZXIgZHJhdyksIHNpbGljb24g
bG90dGVyeSAocXVhbGl0eSksCnRlbXBlcmF0dXJlLCB2b2x0YWdlIHN1cHBseSwgLi4uIC0gb25l
IG1heSBvciBtYXkgbm90IHNlZSBjcmFzaGVzCmNhdXNlZCBieSB0aGlzLgoKQmFzZWQgb24gdGhl
IHByZXZpb3VzIGRpc2N1c3Npb24gb24gdGhpcyB0b3BpYywgbXkgc3VnZ2VzdGlvbiBpcyB0bwpz
cGxpdCB0aGUgb3JpZ2luYWwgcGF0Y2g6Ci0gb25lIHRvIGFkZCBDTEtfU0VUX1JBVEVfR0FURSB3
aGVyZSBuZWVkZWQgKEkgdGhpbmsgdGhlIG1lc29uOGIuYwpkcml2ZXIgYWxyZWFkeSBoYXMgdGhp
cyB3aGVyZSBuZWVkZWQpIHRvIGFjdHVhbGx5IGVuYWJsZSB0aGUKZ2xpdGNoLWZyZWUgbXV4IGJl
aGF2aW9yCi0gYW5vdGhlciBvbmUgd2l0aCB0aGUgQ0xLX09QU19QQVJFTlRfRU5BQkxFIGNoYW5n
ZSAobWVzb244Yi5jIHdvdWxkCmFsc28gbmVlZCB0byBiZSB1cGRhdGVkKSB0byBwcmV2ZW50IHRo
ZSBnbGl0Y2gtZnJlZSBtdXggZnJvbQp0ZW1wb3JhcmlseSBvdXRwdXR0aW5nIGFuIGVsZWN0cmlj
YWwgbG93IHNpZ25hbC4gSmVyb21lIGFsc28gYXNrZWQgdG8KZG9jdW1lbnQgdGhlIGJlaGF2aW9y
IHNvIHdlIGRvbid0IGZvcmdldCB3aHkgd2Ugc2V0IHRoaXMgZmxhZwoKQm90aCBwYXRjaGVzIHNo
b3VsZCBnZXQgdGhlIHByb3BlciAiRml4ZXMiIHRhZ3MuCkkgdGhpbmsgaXQgd291bGQgYWxzbyBi
ZSBncmVhdCBpZiB5b3UgY291bGQgaW5jbHVkZSB0aGUgd2F2ZWZvcm0KZXhhbXBsZSBpbiBhdCBs
ZWFzdCB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgaXQgaGVscHMgdW5kZXJzdGFuZCB0aGUKcHJvYmxl
bS4KCkxldCdzIGFsc28gZ2l2ZSBKZXJvbWUgc29tZSB0aW1lIHRvIGNvbW1lbnQgYmVmb3JlIHlv
dSBzZW5kIHBhdGNoZXMuCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
