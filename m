Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F108610F6FC6
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Apr 2026 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XHiuokuDE2JTmDaiJGbxouAN0baRxLv4uHLZWXs3xE=; b=Ve4GRGhrc+Gnk9
	41Su4MmMQ/j+wv1IiM0i4UzXOH1rlefwyF8az/q2TmrAy5+FyIkkIi1GD16J2WKSeyh8g5DQ62BFe
	dpwo+9x5PIbKkfa1qBW7QSqTNr5QW5FtGTV2eN33etI9gyJ5YXNqqBlS4egitaxvurfn6AUtgdCOi
	BVXAffUWxeRQUermPrFEf+GRQDtKm6mxMtBoEPSqcGQft4J1e1L2wtFRv//Lgb/w2eTdfThVs+caq
	HyLMsBV/dZqmO4a146m8G6ad5PWIjfJFsIAE7dOrvLodGNNY6v66tnKfDfLqhWmi22i7oOTQsz45P
	bSqzkv7bX5c0gzlZidvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7x4R-0000000FYTo-0a62;
	Wed, 01 Apr 2026 15:01:27 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZnO-0000000G6uG-0gfV
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 22:31:55 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso75211a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Feb 2026 14:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770676313; cv=none;
        d=google.com; s=arc-20240605;
        b=d6WSddRY4qXhAikfZk8gMsGYUDaSbBm9kpA+ERPZLH8w+VR8jTPrwe2XmE1QFH4i0E
         DplIwDEfx4+POhVF4fGGBXwjys4UmueEx3G6b2aQGCjRjhnYiH75AlNn5YdPmZVzBW8n
         k7m5jfAY5LzMBtpDawaUAIiLclL/CwQYpjxhQ7PwPmaHXTG3lMat6KLKpG1tFTAwup7Q
         zGZTmWfNTmux2RPdof/8Hz2/mRjOmkl0PF24gCVMWnVZAPCe8mzcuXB7u6moqK9F6vFc
         lNw2lV+FsXAqaB3Ku/9xQE8DAgEDnz7Ym7/kIGFwQIiS0Kbmx2pT7OeUAoEx3MHPRcqk
         1MFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d08/Nt43bjOjQktFsYenGbHQUA7+zLDH0pYMagY5598=;
        fh=EOIF/nTrZbs9GZsgfuzMCcfHvbqYtErLfFejICPUiBU=;
        b=U1RLsJG3dy0YKbW6xj3tsvk3N8ZROJAwtuxjctlT6iIExjs8PMFqDr1rUf9SRvcWoX
         9KDtu+c+q1YFjMfy9rXOQEt5VFGRKUsNtH5Ko6pV8MUhIjA4jObOebFifTjv+UreuEAY
         7ti3NXR5+T14jErzFkeVIpJO8Y41Pq0JFTpeJ8NSRgaDJhBIwf/B+z10bROSfhbJSpzm
         DkmhVp4tX+IpxtYmfaoNGVQ0YVBVR5E0B/Q+w9GhS5kOq78DRzVKaIml21RQehJsO9P0
         eBygy1Wvr2FHFn0EofFIRQFWritbUYnJ3yO4and4ZwfpjYolykXXyHjue9XUqsaY1QLG
         BtdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1770676313; x=1771281113; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d08/Nt43bjOjQktFsYenGbHQUA7+zLDH0pYMagY5598=;
        b=OhWFX8HOo3/wXOsyC+YwH8kTPfhoYZCyFqNrSCAmW+Z9npDoBvsBnR6qqAvqTcJZxE
         qdLlLP+ZQMDWrkG/r4O6PX2jsBBT9tKerVfQZsxyv4/odrfpaE8Nz8U6KD69Fv5OyC+1
         iqHRkl5cFWiv0xqHhlk3xdHk3BI46lFn5HcWrajkosGROHi9rNwCUhDplsFibOd+2IYC
         GCEQUhutGW/uhE3HtJEZ6ROi5BFO3cOgvS10uet9XMrGaH6l3/3N5kPqyVXxcbl1r4v/
         BtBScpmqeoGo3gbhbzoQNsANqQJC48gwyLHQ3ygkBva/c9MNtHbYwxTsEQyZZA2RnYJm
         ulBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676313; x=1771281113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d08/Nt43bjOjQktFsYenGbHQUA7+zLDH0pYMagY5598=;
        b=DsYsBwZ0guj4DnEzBWW6piYeNC+qFRwvFwPZaMzPMgOxlVkrkFF+WbFU6vgUWuE2t0
         bkk0/xmu91FUDingng/y0TklAEgwBUdMkArBckyYmg3FjueNe1wctI2EHmWtarbNe9bD
         OKvitCRnP66rV1YAgTuKU1SFIqjjQmg79fnytVRFHU+5XRgUZJ4FJsSfmxKU2e4Tggwi
         MkgdIAwmmvqcAVAw6mfYXQLDvR+663vVqbeFMsZ0GgKYiwebAfc1xnpWC11cpcKhjqiX
         ix+qs89GwhA61yP4+F21de8YQPb0KwmmxXBAQShdUfXLk9TYcu8sYTci+k3kl5fzzL5X
         m4ow==
X-Forwarded-Encrypted: i=1; AJvYcCVF2Gi/By363aPQqaOoWlyJakQEGRmiSJmgHpSetPG7kj3XUx8y54ap/OPmGXjbNRAVptxgIJ2ErHKTnJcL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn04Nm2HJlXpCdrwjgy9jzyjCiXJ5A8Bnndoydlir1zvbaLwHk
	cDokAFufIvN6b61GqKck+ZQ9AcTmNEw2DspGezoy1y5diT8vodAblBjGRPmgS3lrJqhc0JsR0cx
	ovexvjdhtFa+9r7h48rbGMOQzGauPcWM=
X-Gm-Gg: AZuq6aI0i3sR9twMNkXSwq/KbBL78NsQBLMh8qDG4tzjlHDTfBqTj01CAT4PXBW8NX6
	VaU8+is4K0gd42BNej+Noqn8rq7yE3U1MM1YXwgeqeTFcvk5bEGnIPAjrqgEaCV7MG/NxGqhg07
	0/t1TFrJSDwY4pv65/SPStnLQUk+7MjnpHB1IADZYIO5q/4WMUgEM2gqHSqewIduDVPYlDqj4KJ
	E0TzE3PY77E/reirWiM86xJjCiW3q+luxDE35cSMdB1TI/5Ot02/atv+VQz8HCz+FfGJeVGsl2n
	SEju7sqVOty4UDGWzhKC1PifVAwH
X-Received: by 2002:a17:902:ce91:b0:2a3:1d78:7505 with SMTP id
 d9443c01a7336-2a951924f55mr126359035ad.56.1770676312902; Mon, 09 Feb 2026
 14:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20260115030015.1334517-1-nick@khadas.com> <20260115030015.1334517-4-nick@khadas.com>
 <09df45e1-90b5-4618-9197-c724142bd83a@salutedevices.com> <PS1PPF62EEA9B1D287E26DFE619BB840508AE93A@PS1PPF62EEA9B1D.apcprd03.prod.outlook.com>
 <88a0395b-1ab3-4ef0-96c4-440b3a5c96f4@salutedevices.com>
In-Reply-To: <88a0395b-1ab3-4ef0-96c4-440b3a5c96f4@salutedevices.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 23:31:40 +0100
X-Gm-Features: AZwV_Qg9-pSrN0eULTrynbIuhC886DIQHj3VdC6tJoFAxqLkGIhfsb5jWDc-CwI
Message-ID: <CAFBinCDcDy4M79+mM+axsqXLfoQ56Ucd1C-OHkGLxwNkpfZ-zQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW0RNQVJDIGVycm9yXSBbUEFUQ0ggdjMgMy8zXSBhcm02NDogZHRzOg==?=
	=?UTF-8?B?IG1lc29uLXM0LXM5MDV5NC1raGFkYXMtdmltMXM6IGFkZCBpbml0aWFsIGRldmljZSB0cmVl?=
To: George Stark <gnstark@salutedevices.com>
Cc: Nick Xie <nick@khadas.com>, "robh@kernel.org" <robh@kernel.org>, 
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "xianwei.zhao@amlogic.com" <xianwei.zhao@amlogic.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_143154_199954_A9D4B2CA 
X-CRM114-Status: GOOD (  21.22  )
X-Mailman-Approved-At: Wed, 01 Apr 2026 08:01:08 -0700
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

SGkgR2VvcmdlLAoKc29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LgoKT24gVGh1LCBKYW4gMjksIDIw
MjYgYXQgMzo0OOKAr1BNIEdlb3JnZSBTdGFyayA8Z25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbT4g
d3JvdGU6Cj4KPgo+Cj4gT24gMS8yNi8yNiAxMjozNSwgTmljayBYaWUgd3JvdGU6Cj4gPj4gVGhh
bmtzIGZvciB0aGUgcGF0Y2guIFNpbmNlIHlvdSBoYXZlIGtoYWRhcyBtYWlsIEknbSBwcmV0dHkg
c3VyZSB5b3UndmUKPiA+PiBoYWQgdGhlIHBvc3NpYmlsaXR5IHRvIHRlc3QgaXQgb24gdGhlIHJl
YWwgdmltIGJvYXJkIGFuZCBJIGp1c3QgZG9uJ3QKPiA+PiBnZXQgaXQgaG93IGl0IHdvcmtzIHdp
dGggdGhlIHZvbHRhZ2UgdGFibGUgYWJvdmUuIFRoZSBwcm9ibGVtIGlzIHRoYXQKPiA+PiBwd20g
aXMgY2FsY3VsYXRlZCBpbmNvcnJlY3RseSBpbiB0aGUgdXBzdHJlYW0gcHdtLW1lc29uIGRyaXZl
ci4gVGhhdAo+ID4+IHZvbHRhZ2UgdGFibGUgYXBwZWFyZWQgdG8gYmUgdXNlZCBpbiBlYXJseSBh
bWxvZ2ljIGJsIGxvYWRlciBhbmQKPiA+PiBhcHByb3ByaWF0ZSBwd20gaXMgaW5pdGlhbGl6ZWQg
ZnJvbSBhIHRhYmxlJ3MgcmVjb3JkLiBEdXR5IGN5Y2xlIHZhbHVlCj4gPj4gaXMgdHJhbnNsYXRl
ZCB0byBwd20gcmVncyBjb3JyZWN0bHkuIExhdGVyIHdoZW4ga2VybmVsIHN0YXJ0IHJ1bm5pbmcK
PiA+PiBwd20tcmVndWxhdG9yIGRyaXZlciBpcyBwcm9iZWQuIEl0IHJlYWRzIHRoZSBwd20gcmVn
cywgY2FsY3VsYXRlcyBiYWNrCj4gPj4gZHV0eS1jeWxlIGFuZCBzZWFyY2ggaXQgaW4gdGhlIHRh
YmxlLiBTaW5jZSBjYWxjdWxhdGlvbiBhbGdvcyBhcmUgbm90Cj4gPj4gbWF0Y2ggYW5kIHRoZSB0
YWJsZSBkb2Vzbid0IGNvbnRhaW4gZnVsbCByYW5nZSBvZiAwLTEwMCUgdmFsdWVzCj4gPj4gcmVn
dWxhdG9yIGRyaXZlciBkb2Vzbid0IGZpbmQgY3VycmVudCB2b2x0YWdlLiBJbiBzdWNoIGNhc2Ug
cmVndWxhdG9yCj4gPj4gY29yZSBzZXRzIHRoZSBtaW5pbXVtIHZvbHRhZ2UgZnJvbSB0aGUgdGFi
bGUgWzFdIGFuZCB0aGUgU29DIG1heSBoYW5nCj4gPj4gKGRlcGVuZGluZyBvbiBib2FyZCkgZHVl
IHRvIG1pbmltdW0gdm9sdGFnZSBtYXkgYmUgdG9vIGxvdyBmb3IgdGhlCj4gPj4gY3VycmVudCBm
cmVxdWVuY3kgU29DIHVzZXMuCk5pY2sgbGlrZWx5IGRpZG4ndCBzcG90IGFueSBpc3N1ZXMgb24g
UzQgc2luY2UgQ1BVIGZyZXF1ZW5jeSBzY2FsaW5nCmlzIG5vdCB1cHN0cmVhbWVkIHlldCAoYXMg
dGhlcmUncyBubyB3YXkgdG8gY29udHJvbCB0aGUgQ1BVIGNsb2NrCnlldCkuClRoZSBsYWNrIG9m
IGEgT1BQIHRhYmxlIG1lYW5zOiB0aGUgUFdNIGFuZCBDUFUgY2xvY2sgd2lsbCBqdXN0IHN0YXkg
YXQKd2hhdGV2ZXIgdGhlIGJvb3Rsb2FkZXIgcHJvdmlkZXMKCj4gPj4gT3IgSSdtIG1pc3Npbmcg
c29tZXRoaW5nPwo+ID4KPiA+Cj4gPj4gVGhlcmUncyBub3QteWV0LXJldmlld2VkIHBhdGNoIHRo
YXQgZml4ZXMgcHdtIGFsZ28gWzJdLiBUaGVyZSdzCj4gPj4gY2FsY3VsYXRpb24gZXhhbXBsZSBp
biB0aGUgY292ZXIgbGV0dGVyLgo+ID4+IFsxXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC92Ni4xOS1yYzUvc291cmNlL2RyaXZlcnMvcmVndWxhdG9yL2NvcmUuYyNMMTIyNwo+ID4+
IFsyXSBodHRwczovL2xrbWwuaXUuZWR1LzI0MTIuMy8wMDgyNi5odG1sCj4gPgo+ID4gV2hhdCdz
IHRoZSBzdGF0dXMgb2Ygc3VjaCBwYXRjaGVzPwo+Cj4gdGhlIHBhdGNoIGlzIHJlYWR5IGZvciBy
ZXZpZXcuIEl0J3Mgc2VlbXMgbGlrZSBub2JvZHkgaXMgaW50ZXJlc3RlZApJJ20gc29ycnkgdG8g
c2VlIHRoYXQgdGhlIHBhdGNoIGhhZCBpdCdzIGZpcnN0IGFubml2ZXJzYXJ5LgpJJ2xsIG5lZWQg
dG8gYnJpbmcgb3V0IG15IGxvZ2ljIGFuYWx5emVyIGFuZCB0ZXN0IHlvdXIgcGF0Y2ggKEkgaG9w
ZQppdCdzIHByZWNpc2UgZW5vdWdoIHRvIHNob3cgdGhlIGltcGFjdCBvZiB5b3VyIGNoYW5nZXMp
LgpBcmUgeW91ciBwbGFucyB0aGVuIHRvIHJlLXNlbmQgdGhlIHBhdGNoZXMgb3IgaGF2ZSB5b3Ug
bW92ZWQgb24gYW5kCm5lZWQgc29tZW9uZSBlbHNlIHRvIHRha2UgY2FyZSBvZiBpdD8KCgpCZXN0
IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
