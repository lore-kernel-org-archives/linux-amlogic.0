Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CC3C3ABC3
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 May 2025 06:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InADtsbyYZATV1zsvATHUuAW+f9R4gLkfC6dhZvuQLM=; b=mwXDmzaMHb1c82
	wOHcWmRRQYYh60Bh8bdWvToyGCi/A/5jDJr8ueKMoqxlnvXVDNl2mdz9caUTdWQq8tm0WW7CKKn0j
	nnOmB86YkI68R/ZW7uv+8TTpnU7/RaQPZLOeT5EFhbLPKUShvK674AMUvpU5pDvmgNW9dSETErKWj
	tktyi/U1yH/BpUyHHLTX5Y2QHvprqYTANS4I5sQpqaKHXUfR1s2wr7PofGL3QmDdmLTHHHV+IVTNj
	eG/H4IuskAOtLqjAQGLM9yRUvv22FwaQHCywiD5jklQPui4lspWTitcaf9z2jxWr4f5YKmpVBQ11q
	uBC8tZlB7uFa4RPbchfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBqJ-0000000AhAI-1lAH;
	Tue, 06 May 2025 06:31:51 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCB7M-0000000AVur-2COx;
	Tue, 06 May 2025 05:45:25 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so4735121a12.0;
        Mon, 05 May 2025 22:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746510323; x=1747115123; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzOZk3IAQIFbUw4Ne76D3ImIMW3ziYe4M2KihJqGVRI=;
        b=hO3B+TAJUeM4C+QGPJ2+Ao4m2JNz1lPiswFGbeuLAOjrmjNBq9jWXuUEYgWd6cJjDn
         n3CYTy522lH03KY8kFRcN9+IGFobSaB/nCHnwykm5U2O5s0fubHgVOR8KDkE2Oe+5OR8
         AfH0nEuz4UoP3yLDcjRWr+PccoS4tKaxsB9QyZVR5NOlx2oc22lUY5XpqulS+f7NBlkh
         mdA9+DKeh1jJjHuuva8hcf9qxKRyBtAYR5OlfMWxpmKYu+A71+XtfhQSdjIaBIcmOA54
         uw5YuhcB94viUzPIxp8VLtzwvqObkxsRevXBp5JDR95F9/B08sKCBCspcTj6fSIi2wg9
         rvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510323; x=1747115123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzOZk3IAQIFbUw4Ne76D3ImIMW3ziYe4M2KihJqGVRI=;
        b=DE6RyUXna4JRhnxO913wkbBO/K4gejz2GMv/myuP99Rvys+n4i6riin14f4bdgH1Uq
         zovzNP5w5ItX6RkBvVvo80aOOHO+suJQYey8NjwDdanB4/OUM70xRf8NDgonQlphfqhm
         oNr63mRxswAghhREKfsAlKQ98LmPKHWwd6NBDuAreHWvlRofCEYwLzlCUVamTb6GpJJO
         ZPr295hpRthASJuDHpTw9sRtLayQ0v1Jq5+C3KpprWhGYnaiZyB4TrOmYZLmggM7dlCz
         0G/xcwOmjxvahS59AKT5YjLmVJ5n79Or9ij/5zxinDVdgievE+c4Wkq60ur34cCDTdjr
         F/zg==
X-Forwarded-Encrypted: i=1; AJvYcCUGNqAQLmsFXFkA5FBcYlSSgma5sc7sv3bSSKbtXAHA6MME2un0e2ByJQeDtcZg3I6k+EE4MAcduILQXG+eZ9rbHg==@lists.infradead.org, AJvYcCVGmLOsXdHZqF2pWpAzexTRhai6pDZOzxBhEtPPff4cfr4p9pZUbPxmZIZDkWDxhjmA4p4wGGtk0+qmIGOK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4hifOspRAZVWPHAE82m8CMc029fgAONkPuDhoIArmp3kHx7dT
	CNlzS0X7q+UM/UEhskOWKm5s013MmAnLI4P5GAj8MhC66d580QLy1qcyvzVSFs2c0NZ9WU6JJhg
	KADJezcZiKfoGXctaLOYv3yYf9YY=
X-Gm-Gg: ASbGncuabNfTWq0UAAghWhmKYg5YS3CYOBLxAieOijgHAU9Z9BJvc7TeDTgiy2vo3hV
	pO7noDNpdHVVRd+LfL2WOndgJVmK/A3CHta0v65ZArlv+49U1fQg6oHwGijfL2qM5ootWu5QpDH
	ZoXJr+KRoWmhFxfbaB+Hled4zyMH+kno5WNH2g
X-Google-Smtp-Source: AGHT+IG9+XTY5gsqEu/5VO21buM3ao3qt5hN1Shgf6am5MZstz3wz0os2aGjV9duIeZ0pFO63t5UT9LAAOodm+H5DxI=
X-Received: by 2002:a17:902:fc8d:b0:216:3d72:1712 with SMTP id
 d9443c01a7336-22e365af0demr27207085ad.48.1746510323601; Mon, 05 May 2025
 22:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net> <20250428-fernsehfee-v2-4-293b98a43a91@posteo.net>
In-Reply-To: <20250428-fernsehfee-v2-4-293b98a43a91@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:45:12 +0200
X-Gm-Features: ATxdqUHExb0y3TB0sGh-a9qJlHSjuGqizCi_ElK5QBzZ7JwOhNsd0f26AUxqkpg
Message-ID: <CAFBinCBLvy=jBBZY2XKnmWJAxhne=8VCMJnWjmA=nUBWM4p2fg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_224524_562068_0271D6CB 
X-CRM114-Status: GOOD (  16.46  )
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

T24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMTI6NDTigK9QTSBKLiBOZXVzY2jDpGZlciB2aWEgQjQg
UmVsYXkKPGRldm51bGwrai5uZS5wb3N0ZW8ubmV0QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJv
bTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0Pgo+Cj4gVGhlIGZlcm5zZWhmZWUz
IGJvYXJkIHVzZXMgYSBSaWNvaCBSTjVUNjE4IFBNSUMgdG8gZ2VuZXJhdGUgdmFyaW91cwo+IHZv
bHRhZ2VzLiBCb2FyZCBzY2hlbWF0aWNzIGFyZSBub3QgYXZhaWxhYmxlLCBidXQgdGhlIHJlZ3Vs
YXRvciB2b2x0YWdlcwo+IGZvdW5kIGluIC9zeXMva2VybmVsL2RlYnVnL3JlZ3VsYXRvci9yZWd1
bGF0b3Jfc3VtbWFyeSBtYXRjaCB0aG9zZSBpbgo+IG1lc29uOG0yLW14aWlpLXBsdXMuZHRzOgo+
Cj4gIERDREMxICAgICAgICAgICAgICAgMCAgICAwICAgICAgMCB1bmtub3duICAxMTAwbVYgICAg
IDBtQSAgICAgMG1WICAgICAwbVYKPiAgRENEQzIgICAgICAgICAgICAgICAwICAgIDAgICAgICAw
IHVua25vd24gIDExNTBtViAgICAgMG1BICAgICAwbVYgICAgIDBtVgo+ICBEQ0RDMyAgICAgICAg
ICAgICAgIDAgICAgMCAgICAgIDAgdW5rbm93biAgMTUwMG1WICAgICAwbUEgICAgIDBtViAgICAg
MG1WCj4gIExETzEgICAgICAgICAgICAgICAgMCAgICAwICAgICAgMCB1bmtub3duICAyOTAwbVYg
ICAgIDBtQSAgICAgMG1WICAgICAwbVYKPiAgTERPMiAgICAgICAgICAgICAgICAwICAgIDAgICAg
ICAwIHVua25vd24gIDE4MDBtViAgICAgMG1BICAgICAwbVYgICAgIDBtVgo+ICBMRE8zICAgICAg
ICAgICAgICAgIDAgICAgMCAgICAgIDAgdW5rbm93biAgMTgwMG1WICAgICAwbUEgICAgIDBtViAg
ICAgMG1WCj4gIExETzQgICAgICAgICAgICAgICAgMCAgICAwICAgICAgMCB1bmtub3duICAyODUw
bVYgICAgIDBtQSAgICAgMG1WICAgICAwbVYKPiAgTERPNSAgICAgICAgICAgICAgICAwICAgIDAg
ICAgICAwIHVua25vd24gIDE4MDBtViAgICAgMG1BICAgICAwbVYgICAgIDBtVgo+ICBMRE9SVEMx
ICAgICAgICAgICAgIDAgICAgMCAgICAgIDAgdW5rbm93biAgMjcwMG1WICAgICAwbUEgICAgIDBt
ViAgICAgMG1WCj4gIExET1JUQzIgICAgICAgICAgICAgMCAgICAwICAgICAgMCB1bmtub3duICAg
OTAwbVYgICAgIDBtQSAgICAgMG1WICAgICAwbVYKPgo+IFRoaXMgcGF0Y2ggdGFrZXMgdGhlIGZv
bGxvd2luZyBhcHByb2FjaDoKPgo+ICAtIENvcHkgUk41VDYxOCByZWd1bGF0b3Igbm9kZXMgZnJv
bSBtZXNvbjhtMi1teGlpaS1wbHVzLmR0cwo+ICAtIFJlbW92ZSBzb21lIG9mIHRoZSByZWd1bGF0
b3IgbmFtZXMsIHdoaWNoIGRvIG5vdCBzZWVtIHRvIGFwcGx5Cj4gIC0gVmVyaWZ5IHJlZ3VsYXRv
ciBzdXBwbHkgcmVsYXRpb25zIGJ5IHN0YXJ0aW5nIHdpdGhvdXQgYW55IHJlbGF0aW9ucwo+ICAg
IChhbmQgd2l0aG91dCByZWd1bGF0b3ItYWx3YXlzLW9uKSBhbmQgc2VlaW5nIHdoYXQgYnJlYWtz
IHdoZW4gdGhlCj4gICAga2VybmVsIHR1cm5zIG9mZiAidW51c2VkIiByZWd1bGF0b3JzLgo+Cj4g
VGhpcyByZXN1bHRzIGluIHRoZSBmb2xsb3dpbmcgb2JzZXJ2YXRpb25zOgo+Cj4gIC0gV2hlbiBM
RE8xIGlzIHR1cm5lZCBvZmYsIHRoZSBib2FyZCByZXNldHMKPiAgLSBXaGVuIERDREMxLCBEQ0RD
MiwgRENEQzMsIExETzIsIG9yIExETzUgYXJlIHR1cm5lZCBvZmYsIHRoZSBib2FyZCAoYXMKPiAg
ICBvYnNlcnZlZCB0aHJvdWdoIHRoZSBzZXJpYWwgcG9ydCkgc3RvcHMgcnVubmluZywgc28gdGhl
c2UgbXVzdCBzdGF5IG9uCj4gICAgYXQgYWxsIHRpbWVzLgo+ICAtIExETzQgKFZDQzJWOCkgYXBw
ZWFycyB0byBiZSB1bnVzZWQgb24gdGhpcyBib2FyZC4KPiAgLSBMRE8zIChWQ0MxVjhfVVNCKSBt
dXN0IHN0YXkgb24gaW4gb3JkZXIgZm9yIFVTQiB0byB3b3JrLCBib3RoIHRoZQo+ICAgIGV4dGVy
bmFsIFVTQiBwb3J0cyBhbmQgdGhlIGludGVybmFsIFVTQiB3aWZpIG1vZHVsZS4KPgo+IFRoZSBj
cHUtc3VwcGx5IGFuZCBtYWxpLXN1cHBseSByZWxhdGlvbnMgYXJlIGFsc28gY29waWVkIGZyb20K
PiBtZXNvbjhtMi1teGlpaS1wbHVzLmR0cwo+Cj4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6Rm
ZXIgPGoubmVAcG9zdGVvLm5ldD4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpUaGFua3MgZm9yIHRoZSBkZXRhaWxl
ZCBzdW1tYXJ5IQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
