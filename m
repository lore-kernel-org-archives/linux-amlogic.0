Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B552C61DD3
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 12:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UoPOD4mPdNe0oljiHsm5qFWlOQHeyECl8trh8Yyyqs8=; b=s9mdP6uiNcZexG
	/PUR+ZG0BHPo3qr+Sv5O8BZp0Xr++buQkgkEnC0O7SeDCrxYVVmuTbEacizIdvy1r6JIJpVyNjfCZ
	ph2XmK+xtEULEfcERrjkhgc91+ptRVwSYULOeEbLk/YjkvgVtxkBYxBZpsQq7uxHxo9mKqFPd30Tv
	c7VY2n3DuFwif5yklxunN2zl6Qs67+Cxb+6E1Hrjgxf/lGrKaA5QCjCTvUXH9Nntj24uY+03TFvCV
	J/38yqTvZqe4kkVNJEqH062pOWS71ZwGludAzda3hHWfFS7ujI1uP/mwa2RcVSDEHZPV12DEeTtOa
	QHVZwbMHm2rJnrA2ZUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x271r-0000000HMjS-4BNf;
	Thu, 03 Sep 2026 12:58:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x271o-0000000HMiC-1epE
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 12:58:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso24630015e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2026 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788440330; x=1789045130; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUOhnrIRug8NhLOWvB+hNSnIHP5x1LfuWaznHtYn7Ag=;
        b=KfW0BCOUKBL0QhxB+zHqIFqWIcCwwGE+QIPrrP+7/GF3BbOatWZTTdSFOxrdbBg3GI
         saFFF6qNxKO7hSTFBCs1g4QGI3HdR79fnxUjEb2+2nMsGJC8tVduDQiuRooa9fA6R77k
         vzcH/6ybauoclfoZMIbNkuqcwNvAtGWSY3Xn2xld+wSQUTTiXctpRhs/67FRv+qAW8F2
         rHV9n6rPWRPNsj2vxcSWrVimWZVetTZ7U1PdRglllO2Qkfg19WASqbCsfOV073zFlHZv
         Ju2rCb+RsVn885Bsf1YfSLKMprww7cW/hZoeDt9j2qI3tzjSx/WAf1Eoqekd7+G6zrEQ
         msgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440330; x=1789045130;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUOhnrIRug8NhLOWvB+hNSnIHP5x1LfuWaznHtYn7Ag=;
        b=lWDGoeayetYMSpy/s1970ZwSyY+uvP5DQAuYw3p4F6OWMNKjqkdUxxk3BDPMNUBFt1
         TLLa4PAg+dM7H1OyLsRRO2xBXM6XzXG219bC/q5PWwNixumtEllt6TDaxe6gbIznedRZ
         AleIClCuTbWOIAT3wss2DTMrXSpcvExB0KxeREMJR+j8rfgAHCQqMTEPqUogqtLLqFf2
         JBSoFFORz+4A8dHxiiq4SPB9mKK4ElG80S2CuCkr2/QXzLLH/UxDV8rH/hVHHjQcM/tZ
         LBfbjd+5KVaE98/mCCT1EfcS65yRhh5aj+HqNG2H+ipQrk0ajAeLKviguPVwDeu4jHMc
         R9wA==
X-Forwarded-Encrypted: i=1; AKwUvByBALPLS3Yya7Ai6LtfyoilptK6V6YUqpoMnoEUJJ8fhA4V7goVyNjBnSZD7+l6Wq9eG9PajREhiaJrDPAa@lists.infradead.org
X-Gm-Message-State: AFuF++k+hfd20mUvpa2sEFShXwZYRbIdURDJGwCXazioKBcY6370wO12
	26I7cXbAlF4rlEWQn4GYMjqZqSa8Yta7+RIaa2zgnsnhV192FpCVEa/cse8yI5Pq0TE=
X-Gm-Gg: AYBFou1KMQesOXi9htc90kWDzeoUgNdiiSggvz1avLReB+9ce3c8kXorAoUYb2djSD8
	TGpVNCgRiL7BeDEGpiQ/3L/NxqjI+cQs3iJIh80bgIGSdjKsSWjbdKC0a6DBSH4x3b8zgQ6c91m
	DhwPiUBUUfkJvbb3MMkfookZwLb6MRPfG+/GpFMlSqCBDXbjfuT/clt+0T3lmzKEzutDUUoUBo7
	RbI39tR2xBagdwLOi5c2W77BJMvRjUom7H2g0u52MN8n3Rf/hzJ5kUOFWwn+XNL6rgQaacN/qTg
	TIHFPw5//dByNHPV/Gp7dMiE1flAXnpS2eyoNBBGfhE/Kox45ICCTz1HWkzyCYII4phKFAGAJ4U
	3hYvAl0bvfp1unP29090kRG6tOW50jyl+bEOPUi6wERNc//GwxM3RGAyJtC93MVS9nH0dz3x4yG
	b/RI/+FHRt4zdOMkYGRSMl0ySB7vsfWnY+Gj/EcZEjRWRBmQfNr3jJ4bS4v1TMat5KWzsGFJ4lI
	RmmoT8=
X-Received: by 2002:a05:600c:83c8:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49ce581779dmr225433345e9.4.1788440330042;
        Thu, 03 Sep 2026 05:58:50 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm67989285e9.7.2026.09.03.05.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:58:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: tanure@linux.com, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Jian Hu
 <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, Brian
 Masney <bmasney@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4
 supplies and keep the fabric clocks running
In-Reply-To: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
References: <20260829094758.23248-1-tanure@linux.com>
 <178818026093.2318126.3676223463693214854.b4-ty@b4>
 <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
Date: Thu, 03 Sep 2026 14:58:47 +0200
Message-ID: <1jecfa8pa0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_055852_449868_1576D173 
X-CRM114-Status: GOOD (  21.57  )
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

T24gamV1LiAwMyBzZXB0LiAyMDI2IGF0IDExOjA1LCBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51
eC5jb20+IHdyb3RlOgoKPiBPbiBNb24sIEF1ZyAzMSwgMjAyNiBhdCAxOjQ04oCvUE0gTmVpbCBB
cm1zdHJvbmcKPiA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IEhpLAo+
Pgo+PiBPbiBTYXQsIDI5IEF1ZyAyMDI2IDEwOjQ3OjU0ICswMTAwLCBMdWNhcyBUYW51cmUgd3Jv
dGU6Cj4+ID4gVGhlIEtoYWRhcyBWSU00IGhhcyBuZWVkZWQgY2xrX2lnbm9yZV91bnVzZWQgdG8g
Ym9vdCByZWxpYWJseS4gV2l0aG91dCBpdAo+PiA+IHRoZSBib2FyZCBoYW5ncyBhdCByYW5kb20s
IGxvc2VzIHN0b3JhZ2UgYW5kIGNvcnJ1cHRzIG1lbW9yeSwgYW5kIHRoZQo+PiA+IGZhaWx1cmVz
IG1vdmUgYXJvdW5kIGZyb20gYm9vdCB0byBib290Lgo+PiA+Cj4+ID4gU2l4IG9mIHRoZSBTb0Mn
cyBQV00gb3V0cHV0cyBkcml2ZSB0aGUgYm9hcmQncyB2b2x0YWdlIHJlZ3VsYXRvcnM6IHRoZQo+
PiA+IGFsd2F5cy1vbiBkb21haW4sIGJvdGggQ1BVIGNsdXN0ZXJzLCB0aGUgR1BVLCB0aGUgTlBV
IGFuZCB0aGUgRFJBTS4gTm9uZQo+PiA+IG9mIHRoZW0gd2VyZSBkZXNjcmliZWQsIHNvIExpbnV4
IHNhdyB0aGUgb3V0cHV0cyBhcyB1bnVzZWQgYW5kIHN3aXRjaGVkCj4+ID4gdGhlbSBvZmYgYWJv
dXQgYSBzZWNvbmQgaW50byBib290LiBUaGUgcmVndWxhdG9ycyB0aGVuIGRyaWZ0ZWQgYXdheSBm
cm9tCj4+ID4gdGhlIGxldmVscyB0aGUgYm9vdGxvYWRlciBoYWQgc2V0LCB3aGljaCBpcyB3aGVy
ZSB0aGUgY29ycnVwdGlvbiBhbmQgdGhlCj4+ID4gcmFuZG9tIGhhbmdzIGNhbWUgZnJvbS4KPj4g
PiBUaGFua3MgdG8gQ2h1YW4gTGl1IGZyb20gQW1sb2dpYyBmb3IgaGVscGluZyBtZSBpbmRldGlm
eSB3aGljaCBjbG9ja3MgYXJlCj4+ID4gY3JpdGljYWwuCj4+ID4KPj4gPiBbLi4uXQo+Pgo+PiBU
aGFua3MsIEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvYW1sb2dpYy9saW51eC5naXQgKHY3LjMvZml4ZXMpCj4+Cj4+IFsyLzRdIGFybTY0
OiBkdHM6IGFtbG9naWM6IHQ3OiBmaXggdGhlIHBpbiBncm91cHMgb2YgdHdvIFBXTSBvdXRwdXRz
Cj4+ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYW1sb2dpYy9jL2FlN2JlNWM1OGE4MTky
NTllNWViOThhM2FiZmE2MDg0MjQ3OGYyYWUKPj4gWzMvNF0gYXJtNjQ6IGR0czogYW1sb2dpYzog
dDc6IGtoYWRhcy12aW00OiBhZGQgdGhlIFBXTS1kcml2ZW4gc3VwcGxpZXMKPj4gICAgICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9hbWxvZ2ljL2MvMWU1YTUzYmQxNmFjNTAxZTY4NDYzZTg0MDIz
ZDFiZmY1NDNjYzY5Ngo+PiBbNC80XSBhcm02NDogZHRzOiBhbWxvZ2ljOiB0NzogZml4IHRoZSBw
aW4gZ3JvdXBzIG9mIHRoZSB2c3luYyBQV00KPj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9hbWxvZ2ljL2MvNDA2MjkyZmQ3NWY5NWFhMzAxMGZlYzk1YjViZWI1YThiN2UzYmEzYQo+Pgo+
PiBUaGVzZSBjaGFuZ2VzIGhhcyBiZWVuIGFwcGxpZWQgb24gdGhlIGludGVybWVkaWF0ZSBnaXQg
dHJlZSBbMV0uCj4+Cj4+IFRoZSB2Ny4zL2ZpeGVzIGJyYW5jaCB3aWxsIHRoZW4gYmUgc2VudCB2
aWEgYSBmb3JtYWwgUHVsbCBSZXF1ZXN0IHRvIHRoZSBMaW51eCBTb0MgbWFpbnRhaW5lcnMKPj4g
Zm9yIGluY2x1c2lvbiBpbiB0aGVpciBpbnRlcm1lZGlhdGUgZ2l0IGJyYW5jaGVzIGluIG9yZGVy
IHRvIGJlIHNlbnQgdG8gTGludXMgZHVyaW5nCj4+IHRoZSBuZXh0IG1lcmdlIHdpbmRvdywgb3Ig
c29vbmVyIGlmIGl0J3MgYSBzZXQgb2YgZml4ZXMuCj4+Cj4+IEluIHRoZSBjYXNlcyBvZiBmaXhl
cywgdGhvc2Ugd2lsbCBiZSBtZXJnZWQgaW4gdGhlIGN1cnJlbnQgcmVsZWFzZSBjYW5kaWRhdGUK
Pj4ga2VybmVsIGFuZCBhcyBzb29uIHRoZXkgYXBwZWFyIG9uIHRoZSBMaW51eCBtYXN0ZXIgYnJh
bmNoIHRoZXkgd2lsbCBiZQo+PiBiYWNrcG9ydGVkIHRvIHRoZSBwcmV2aW91cyBTdGFibGUgYW5k
IExvbmctU3RhYmxlIGtlcm5lbHMgWzJdLgo+Pgo+PiBUaGUgaW50ZXJtZWRpYXRlIGdpdCBicmFu
Y2hlcyBhcmUgbWVyZ2VkIGRhaWx5IGluIHRoZSBsaW51eC1uZXh0IHRyZWUgWzNdLAo+PiBwZW9w
bGUgYXJlIGVuY291cmFnZWQgdGVzdGluZyB0aGVzZSBwcmUtcmVsZWFzZSBrZXJuZWxzIGFuZCBy
ZXBvcnQgaXNzdWVzIG9uIHRoZQo+PiByZWxldmFudCBtYWlsaW5nLWxpc3RzLgo+Pgo+PiBJZiBw
cm9ibGVtcyBhcmUgZGlzY292ZXJlZCBvbiB0aG9zZSBjaGFuZ2VzLCBwbGVhc2Ugc3VibWl0IGEg
c2lnbmVkLW9mZi1ieSByZXZlcnQKPj4gcGF0Y2ggZm9sbG93ZWQgYnkgYSBjb3JyZWN0aXZlIGNo
YW5nZXNldC4KPj4KPj4gWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2FtbG9naWMvbGludXguZ2l0Cj4+IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0Cj4+IFszXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQu
Z2l0Cj4+Cj4+IC0tCj4+IE5laWwKPj4KPiBIaSwKPiBQbGVhc2UgZG9uJ3QgdGFrZSB0aGlzLiBJ
IHdpbGwgc3VibWl0IGEgYmV0dGVyIHZlcnNpb24uCj4gc3lzX2FtcGlwZV9uYW5kIHNob3VsZCBu
b3QgYmUgY3JpdGljYWwuCgpQbGVhc2Ugc3VibWl0IGEgZml4dXAgY2hhbmdlIG9uIHRvcCBvZiB3
aGF0IHlvdSd2ZSBhbHJlYWR5IHNlbnQsIHdpdGgKdGhlIHByb3BlciAnRml4ZXM6JyB0YWcuCgo+
Cj4gVGhhbmtzLAo+IEx1Y2FzCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
