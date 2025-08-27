Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAA6CA0EFF
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Aug 2025 17:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jo4gg6DOL/DeiGz+KFtwMvRu6+Bw/iZ0JqFv4V3ULZM=; b=ARY5giatJwsIKr
	J+JCyNrEh8p7EA4Eo05WgR+wq09KUE2dwWuyZWkQoGlV0HSE2cIerMgCL787/DmKbQkFEjMfrs6Nc
	q5lFqBVVJXUa036G4T9bLDL742QYfwBnoES90Pu5QHE8GqKRyUout3n9kIuQKbRHjZbWPJFqv0qh5
	2P8kDDep5cHVsQAGYkewx5PQc7e+zIKgVccsvI0YSarxGPjzk/oPxGdtlSI73bUICtcATczpmoxbk
	1m0owhJpzlDQ/0d7a4RZ/33Sr2OkLeABfTlZPwOTZ/6sdyf+fJOXLRgGP3NoMfAvL+jEPE/8SbGm1
	R8iUjQ3wNEYxLNTotOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urKIc-0000000GMkw-0n1U;
	Wed, 27 Aug 2025 17:51:06 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHsH-0000000Fsux-288B
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Aug 2025 15:15:47 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24611734e50so164775ad.1
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Aug 2025 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756307744; x=1756912544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGPhYDWt388RttmicU0o24RVsxY/twdNMb4O/vzImCs=;
        b=V9X9qsxjyxEgU+s095f8lLyBcJkNf+UksyYjpwVCIgEFsskUAtKamvLVfm/u7CtiAn
         SogDGquoILFchTEqXO6vHTPmU95nDKxfdBhmMeeaR5HbOR+H6ZibwL88QmppKRLqLW3+
         17UkZqvq3g3Grux3ulbuhamBsveIeLp6PMtOX9zwV0ZFg7sq0Nd0OmAW3Crku9DfFPt3
         Bh4oUFDW9ZjTc4fanvMe84rR/XbmncbkIvrITtKxuQ112PY9BFaCaZLxnda5s+ws2Sx6
         KxKa0sWDUNhm46Jk+f2IlnrY//iOg7og9h4qAlJ/UnQ6E6u/gp+OQ1oHAV/Ks04ZEGe2
         ZIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756307744; x=1756912544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGPhYDWt388RttmicU0o24RVsxY/twdNMb4O/vzImCs=;
        b=A8D65uUi3PyDLZkhCAke03o5hOYBIA3fBXCVtMDguiSa2u7W2VzPbTeci6wP235yZb
         KeiKila/SbYqWc3G/Pex12D8Fu4q9LCZkT449kKmkuBD19QWvBc2f7/d7WkQ9/15oa0Q
         /ctRTF2wAwUQ6doe+ndjAYjjA2kIqB7gmSk5YfFop6ObGL3v+d+zdNxBXdBR2jgFSWuk
         3zHHhMzazwggIxRUEc1CSamBjJLE4yQgytL+GZXUKwv5siR3Yx7L5UkAbHmuGxnpu6uv
         M9VUqxC1rPPz0zaYyNRaLV1k8DyA0NkP3TzNOHFn5NmWFpgjhXefajD7o5zuJftivJ55
         /UnA==
X-Forwarded-Encrypted: i=1; AJvYcCUsTBpkfn1RP14gJktw3MTEIo5ZYmIySJDrJLXJiCepHx+FWlnv4hyOCum0hIPbmK5WrHmpiItPHSULcVvt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1yRmUpTkOZLTVhNkFJ38frK78jeiIgWqFdkkKVjhgR7sYDyD/
	QtQSqRthiwze/+vUpN+u+VChOuI+no8KfmlzwKXPrYBUi4+Ktv0mlCsrQPewZqM4uVSYDAOh6/W
	sBPOwiz/F7CDtoS/fe6bY0McZYGQin2vMJfGLdFgf
X-Gm-Gg: ASbGncu8xWJ2zanPo/ZWcowewuP5S/BpVevR9G6txcveUyeuQ0VR2BJVxUqjpiMIeMk
	+56QqeU9QT3uHvEM0ghrKBx4Y/ecBZrNZo04iuF6+5qxNK5QKTw7mC8mC3ikayATz6Lho7B9Y+3
	bU8J5OEyHPBAC1ei51PrcTqm8IomANQTwXyLKnnQz32AwLzcG/1/oWOuNpgk8xrAvdos+J/vmWD
	sPFnLZGsr2hqgZ9bDdB0kwmZlTfKlbtmFgcktckbdQ=
X-Google-Smtp-Source: AGHT+IExi0QgPJP/5AblrVahQdACSVklatzIIhzDoM8PROF9H/mRXxhxpv9GhjknP28Wz6ljzGsei6gbP7f3oTXJLVM=
X-Received: by 2002:a17:902:ec87:b0:246:a8ac:1a36 with SMTP id
 d9443c01a7336-2485ba5311amr9397575ad.2.1756307741849; Wed, 27 Aug 2025
 08:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755096883.git.robin.murphy@arm.com> <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
 <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com> <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
 <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
In-Reply-To: <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
From: Ian Rogers <irogers@google.com>
Date: Wed, 27 Aug 2025 08:15:29 -0700
X-Gm-Features: Ac12FXwUZ4TrRSXyzgr8XTQRkesJ87wwMtoKHvx086ZRlV4GbvgOq2WSyedNfZ4
Message-ID: <CAP-5=fU0-QDMP-VG3O1qBvJ8uzHHYCQ8j1Vrzy9a0YUk=UMvHw@mail.gmail.com>
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Mark Rutland <mark.rutland@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, 
	will@kernel.org, acme@kernel.org, namhyung@kernel.org, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org, 
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_081545_566275_0BF146C2 
X-CRM114-Status: GOOD (  32.10  )
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

T24gV2VkLCBBdWcgMjcsIDIwMjUgYXQgMToxOOKAr0FNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRs
YW5kQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMjYsIDIwMjUgYXQgMTE6NDg6NDhB
TSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiA+IE9uIFR1ZSwgQXVnIDI2LCAyMDI1IGF0IDg6
MzLigK9BTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90ZToKPiA+ID4K
PiA+ID4gT24gMjAyNS0wOC0yNiAyOjAzIHBtLCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+ID4g
PiBPbiBXZWQsIEF1ZyAxMywgMjAyNSBhdCAwNjowMTowNFBNICswMTAwLCBSb2JpbiBNdXJwaHkg
d3JvdGU6Cj4gPiA+ID4+IEl0IG1heSBoYXZlIGJlZW4gZGlmZmVyZW50IGxvbmcgYWdvLCBidXQg
dG9kYXkgaXQgc2VlbXMgd3JvbmcgZm9yIHRoZXNlCj4gPiA+ID4+IGRyaXZlcnMgdG8gc2tpcCBj
b3VudGluZyBkaXNhYmxlZCBzaWJsaW5nIGV2ZW50cyBpbiBncm91cCB2YWxpZGF0aW9uLAo+ID4g
PiA+PiBnaXZlbiB0aGF0IHBlcmZfZXZlbnRfZW5hYmxlKCkgY291bGQgbWFrZSB0aGVtIHNjaGVk
dWxhYmxlIGFnYWluLCBhbmQKPiA+ID4gPj4gdGh1cyBpbmNyZWFzZSB0aGUgZWZmZWN0aXZlIHNp
emUgb2YgdGhlIGdyb3VwIGxhdGVyLiBDb252ZXJzZWx5LCBpZiBhCj4gPiA+ID4+IHNpYmxpbmcg
ZXZlbnQgaXMgdHJ1bHkgZGVhZCB0aGVuIGl0IHN0YW5kcyB0byByZWFzb24gdGhhdCB0aGUgd2hv
bGUKPiA+ID4gPj4gZ3JvdXAgaXMgZGVhZCwgc28gaXQncyBub3Qgd29ydGggZ29pbmcgdG8gYW55
IHNwZWNpYWwgZWZmb3J0IHRvIHRyeSB0bwo+ID4gPiA+PiBzcXVlZXplIGluIGEgbmV3IGV2ZW50
IHRoYXQncyBuZXZlciBnb2luZyB0byBydW4gYW55d2F5LiBUaHVzLCB3ZSBjYW4KPiA+ID4gPj4g
c2ltcGx5IHJlbW92ZSBhbGwgdGhlc2UgY2hlY2tzLgo+ID4gPiA+Cj4gPiA+ID4gU28gY3VycmVu
dGx5IHlvdSBjYW4gZG8gc29ydCBvZiBhIG1hbnVhbCBldmVudCByb3RhdGlvbiBpbnNpZGUgYW4K
PiA+ID4gPiBvdmVyLXNpemVkIGdyb3VwIGFuZCBoYXZlIGl0IHdvcmsuCj4gPiA+ID4KPiA+ID4g
PiBJJ20gbm90IHN1cmUgaWYgYW55Ym9keSBhY3R1YWxseSBkb2VzIHRoaXMsIGJ1dCBpdHMgcG9z
c2libGUuCj4gPiA+ID4KPiA+ID4gPiBFZy4gb24gYSBQTVUgdGhhdCBzdXBwb3J0cyBvbmx5IDQg
Y291bnRlcnMsIGNyZWF0ZSBhIGdyb3VwIG9mIDUgYW5kCj4gPiA+ID4gcGVyaW9kaWNhbGx5IGN5
Y2xlIHdoaWNoIG9mIHRoZSA1IGV2ZW50cyBpcyBvZmYuCj4gPgo+ID4gSSdtIG5vdCBzdXJlIHRo
aXMgaXMgdHJ1ZSwgSSB0aG91Z2h0IHRoaXMgd291bGQgZmFpbCBpbiB0aGUKPiA+IHBlcmZfZXZl
bnRfb3BlbiB3aGVuIGFkZGluZyB0aGUgNXRoIGV2ZW50IGFuZCB0aGVyZSBiZWluZyBpbnN1ZmZp
Y2llbnQKPiA+IGNvdW50ZXJzIGZvciB0aGUgZ3JvdXAuCj4KPiBXZSdyZSB0YWxraW5nIHNwZWNp
ZmljYWxseSBhYm91dCBjYXNlcyB3aGVyZSB0aGUgbG9naWMgaW4gYSBwbXUncwo+IHBtdTo6ZXZl
bnRfaW5pdCgpIGNhbGxiYWNrIGRvZXNuJ3QgY291bnQgZXZlbnRzIGluIHNwZWNpZmljIHN0YXRl
cywgYW5kCj4gaGVuY2UgdGhlIDV0aCBldmVuIGRvZXNuJ3QgZ2V0IHJlamVjdGVkIHdoZW4gaXQg
aXMgaW5pdGlhbGlzZWQuCj4KPiBGb3IgZXhhbXBsZSwgaW4gYXJjaC94ODYvZXZlbnRzL2NvcmUu
YywgdmFsaWRhdGVfZ3JvdXAoKSB1c2VzCj4gY29sbGVjdF9ldmVudHMoKSwgd2hpY2ggaGFzOgo+
Cj4gICAgICAgICBmb3JfZWFjaF9zaWJsaW5nX2V2ZW50KGV2ZW50LCBsZWFkZXIpIHsKPiAgICAg
ICAgICAgICAgICAgaWYgKCFpc194ODZfZXZlbnQoZXZlbnQpIHx8IGV2ZW50LT5zdGF0ZSA8PSBQ
RVJGX0VWRU5UX1NUQVRFX09GRikKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
Pgo+ICAgICAgICAgICAgICAgICBpZiAoY29sbGVjdF9ldmVudChjcHVjLCBldmVudCwgbWF4X2Nv
dW50LCBuKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+ICAg
ICAgICAgICAgICAgICBuKys7Cj4gICAgICAgICB9Cj4KPiAuLi4gYW5kIHNvIHdoZXJlIGFuIGV2
ZW50J3Mgc3RhdGUgaXMgPD0gUEVSRl9FVkVOVF9TVEFURV9PRkYgYXQgaW5pdAo+IHRpbWUsIHRo
YXQgZXZlbnQgaXMgbm90IGNvdW50ZWQgdG8gc2VlIGlmIGl0IGZpdHMgaW50byBIVyBjb3VudGVy
cy4KCkhtbS4uIFRoaW5raW5nIG91dCBsb3VkLiBTbyBpdCBsb29rZWQgbGlrZSBwZXJmIHdpdGgg
d2VhayBncm91cHMgY291bGQKYmUgYnJva2VuIHRoZW46CmBgYAokIHN1ZG8gcGVyZiBzdGF0IC12
diAtZSAne2luc3RydWN0aW9ucyxjeWNsZXN9OlcnIHRydWUKLi4uCnBlcmZfZXZlbnRfYXR0cjoK
IHR5cGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAgKFBFUkZfVFlQRV9IQVJEV0FSRSkK
IHNpemUgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEzNgogY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMHg0MDAwMDAwMDEKKGNwdV9jb3JlL1BFUkZfQ09VTlRfSFdfSU5TVFJV
Q1RJT05TLykKIHNhbXBsZV90eXBlICAgICAgICAgICAgICAgICAgICAgIElERU5USUZJRVIKIHJl
YWRfZm9ybWF0ICAgICAgICAgICAgICAgICAgICAgIFRPVEFMX1RJTUVfRU5BQkxFRHxUT1RBTF9U
SU1FX1JVTk5JTkd8SUR8R1JPVVAKIGRpc2FibGVkICAgICAgICAgICAgICAgICAgICAgICAgIDEK
IGluaGVyaXQgICAgICAgICAgICAgICAgICAgICAgICAgIDEKIGVuYWJsZV9vbl9leGVjICAgICAg
ICAgICAgICAgICAgIDEKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCnN5c19wZXJmX2V2ZW50X29wZW46IHBpZCAzMzM3NzY0ICBjcHUg
LTEgIGdyb3VwX2ZkIC0xICBmbGFncyAweDggPSA1Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpwZXJmX2V2ZW50X2F0dHI6CiB0eXBl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwIChQRVJGX1RZUEVfSEFSRFdBUkUpCiBzaXpl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxMzYKIGNvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDB4NDAwMDAwMDAwCihjcHVfY29yZS9QRVJGX0NPVU5UX0hXX0NQVV9DWUNMRVMv
KQogc2FtcGxlX3R5cGUgICAgICAgICAgICAgICAgICAgICAgSURFTlRJRklFUgogcmVhZF9mb3Jt
YXQgICAgICAgICAgICAgICAgICAgICAgVE9UQUxfVElNRV9FTkFCTEVEfFRPVEFMX1RJTUVfUlVO
TklOR3xJRHxHUk9VUAogaW5oZXJpdCAgICAgICAgICAgICAgICAgICAgICAgICAgMQotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc3lz
X3BlcmZfZXZlbnRfb3BlbjogcGlkIDMzMzc3NjQgIGNwdSAtMSAgZ3JvdXBfZmQgNSAgZmxhZ3Mg
MHg4ID0gNwouLi4KYGBgCk5vdGUsIHRoZSBncm91cCBsZWFkZXIgKGluc3RydWN0aW9ucykgaXMg
ZGlzYWJsZWQgYmVjYXVzZSBvZjoKaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC90cmVlL3Rvb2xzL3BlcmYv
dXRpbC9zdGF0LmM/aD1wZXJmLXRvb2xzLW5leHQjbjc2MQpgYGAKLyoKKiBEaXNhYmxpbmcgYWxs
IGNvdW50ZXJzIGluaXRpYWxseSwgdGhleSB3aWxsIGJlIGVuYWJsZWQKKiBlaXRoZXIgbWFudWFs
bHkgYnkgdXMgb3IgYnkga2VybmVsIHZpYSBlbmFibGVfb25fZXhlYwoqIHNldCBsYXRlci4KKi8K
aWYgKGV2c2VsX19pc19ncm91cF9sZWFkZXIoZXZzZWwpKSB7CiAgICAgICAgYXR0ci0+ZGlzYWJs
ZWQgPSAxOwpgYGAKYnV0IHRoZSBjaGVja2luZyBvZiBiZWluZyBkaXNhYmxlZCAoUEVSRl9FVkVO
VF9TVEFURV9PRkYpIGlzIG9ubHkgZG9uZQpvbiBzaWJsaW5ncyBpbiB0aGUgY29kZSB5b3Ugc2hv
dyBhYm92ZS4gU28geWVzLCB5b3UgY2FuIGRpc2FibGUgdGhlCmdyb3VwIGV2ZW50cyB0byBhbGxv
dyB0aGUgcGVyZl9ldmVudF9vcGVuIHRvIHN1Y2NlZWQgYnV0IG5vdCBvbiB0aGUKbGVhZGVyIHdo
aWNoIGlzIGFsd2F5cyBjaGVja2VkIChubyBQRVJGX0VWRU5UX1NUQVRFX09GRiBjaGVjayk6Cmh0
dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXJmL3Bl
cmYtdG9vbHMtbmV4dC5naXQvdHJlZS9hcmNoL3g4Ni9ldmVudHMvY29yZS5jP2g9cGVyZi10b29s
cy1uZXh0I24xMjA0CmBgYAppZiAoaXNfeDg2X2V2ZW50KGxlYWRlcikpIHsKICAgICAgICBpZiAo
Y29sbGVjdF9ldmVudChjcHVjLCBsZWFkZXIsIG1heF9jb3VudCwgbikpCiAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKYGBgCgpUaGFua3MsCklhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
