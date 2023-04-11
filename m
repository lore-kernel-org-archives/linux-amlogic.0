Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA957C76196
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 07:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkOgJYgYQHQHqEwX3IHvQqFhcDz3f2EMFTLTdHLekII=; b=3R5ydrTv9P3lV8
	Ig8YUvCKUQV1pbJwBhn6c8RxGAd/snj/CnFUqNOwNKzUhLXhJDaANK5F+TuHbNAtw+MvxPX/pavPB
	Je4m7PnpMJ1qYLpp2/TX8qhwlnMaSCgPUJpYfTnYPU0JYAr9ECIF1WeHQsfatzDltJb7QG2e1WKE3
	ftzFwVtfgXMVaotFV5SZgfvjQUcMuIt2jM9aLhNwyViJRb7y7gmCz4lYE9gtYYZOjQExLPvdcSHEt
	uLatQt5LrvsrGMuTDfWOgx2matrXtFZQVOhZtEbnUdwBwNM51Y6WC3stEBa3kSclEzepECaXj8X3D
	Jpkfsd3DW/5Bkymmpb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm82I-00GeOp-2e;
	Tue, 11 Apr 2023 07:03:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm82D-00GeNI-27
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Apr 2023 07:03:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id q5so3863949wmo.4
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Apr 2023 00:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681196594; x=1683788594;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hfUaJK5K49gfETGPOisBCfJxa2HZGrxX8QV+fOnnOk=;
        b=HnYFK4qZqI4RcIXlAvUrDPNcSifFMcVs8GEkxM0XP7F+xTSBSNj/S7IiVL0iGDSoFy
         pRqgAqa/xOFc0p/iNoWRXqes2yZZ6L168sZJR7TGUA9ylELoqrMdSJLDOBlh1hMBLpob
         yvDnmI6GszfQ6KYoSKVsMMfzYVDk5EmCE6jhxYSehWFN8SBgZ/ReFYsShee1Gdytf2X2
         riJ1rHZEh/69HQvHFsInHqTbwPJEj8aOvWF7A5+ABkyqPi7XDWm0l62zy/5L6NVIY45A
         5Oxx+55Ss7yvmexk/9StbJuIunmqcDfef6fEBTzXOCdfk7zTBGttdyj5sXaF19YkgEzG
         mBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681196594; x=1683788594;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8hfUaJK5K49gfETGPOisBCfJxa2HZGrxX8QV+fOnnOk=;
        b=GpY6Oju6h2E1b4+XEH7BKbTQhlI0PERjrOA+kiXWNKpLqiGOziuazdTqGkM7ZFxukt
         Nxdntz5N0th4FtNOdS6avhJlZpgBx6z9Pj17p1rywN7jstpinX9P9KJvND6mf/mFFE71
         OayTa3G07i+B8KgULymCbb5cQZaE7vGiKHyjiPQJPPQKosoBH3qcNoa+96HkQQ7flBVp
         Rxiejbz3JJCLQ5/jBcCSgtkmiryfid4MlVWTXYiKqelvvOiPMJM3hqfYQ45U8oI4Y58x
         TUV2e3RIMKmXcdAsMAklE5CgXzUbqN+yc96OgpqezQe+5ERJl7MOQYgNsH9KWLutn8Ql
         aVYA==
X-Gm-Message-State: AAQBX9c9NL3TV2uRgNNwoqhYns/fqkAAxo9ut3au7kVRJ1UCevRB5JnO
	Vzt29gIgrGXHbuNCC81PJs96pQ==
X-Google-Smtp-Source: AKy350a8CllWGeVxvR6LgE7adUkYW/miVmQdA9w/Zz0JH4Oqzoo7pwigEO21rIknjgkedlOCSp0FfQ==
X-Received: by 2002:a05:600c:20e:b0:3ed:29db:cb80 with SMTP id 14-20020a05600c020e00b003ed29dbcb80mr6010292wmi.18.1681196594540;
        Tue, 11 Apr 2023 00:03:14 -0700 (PDT)
Received: from localhost ([2a04:cec0:11b6:9335:e66a:358b:d934:608b])
        by smtp.gmail.com with ESMTPSA id fm7-20020a05600c0c0700b003f063a709dbsm1688043wmb.2.2023.04.11.00.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 00:03:13 -0700 (PDT)
References: <20230320113445.17260-1-yu.tu@amlogic.com>
 <CAFBinCAE-ihq9oeXc=GqUEHVKUYM+n_e+2_5+gDMTGQcEEhRtg@mail.gmail.com>
 <b5e647e2-4561-e6c1-016f-2c3b260916bb@amlogic.com>
 <1jsfdy77n8.fsf@starbuckisacylon.baylibre.com>
 <d403dda4-e3db-4f26-6996-090a8c520b94@amlogic.com>
 <1j8rfp6u0h.fsf@starbuckisacylon.baylibre.com>
 <2e68acd1-f3d1-adbc-5ed2-66c40e006579@amlogic.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, kelvin.zhang@amlogic.com,
 qi.duan@amlogic.com
Subject: Re: [PATCH V2] clk: meson: vid-pll-div: added meson_vid_pll_div_ops
 support
Date: Tue, 11 Apr 2023 09:02:11 +0200
In-reply-to: <2e68acd1-f3d1-adbc-5ed2-66c40e006579@amlogic.com>
Message-ID: <1jleiyyk7k.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_000321_947798_1F827A17 
X-CRM114-Status: GOOD (  37.21  )
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

Ck9uIEZyaSAwNyBBcHIgMjAyMyBhdCAxODowOCwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3
cm90ZToKCj4gT24gMjAyMy8zLzIyIDE2OjQxLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBbIEVY
VEVSTkFMIEVNQUlMIF0KPj4gT24gV2VkIDIyIE1hciAyMDIzIGF0IDE1OjQ2LCBZdSBUdSA8eXUu
dHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+PiAKPj4+IE9uIDIwMjMvMy8yMSAxNzo0MSwgSmVyb21l
IEJydW5ldCB3cm90ZToKPj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+IEhpIEplcm9tZSwKPj4+
IAlUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4+Pj4gT24gVHVlIDIxIE1hciAyMDIzIGF0IDEw
OjI5LCBZdSBUdSA8eXUudHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4+IEhpIE1hcnRp
bu+8jAo+Pj4+PiAJRmlyc3Qgb2YgYWxsLCB0aGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4+Pj4+
Cj4+Pj4+IE9uIDIwMjMvMy8yMCAyMzozNSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPj4+
Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4+Pj4gSGVsbG8gWXUgVHUsCj4+Pj4+PiBPbiBNb24s
IE1hciAyMCwgMjAyMyBhdCAxMjozNeKAr1BNIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3Jv
dGU6Cj4+Pj4+Pj4KPj4+Pj4+PiBTaW5jZSB0aGUgcHJldmlvdXMgY29kZSBvbmx5IHByb3ZpZGVz
ICJyb19vcHMiIGZvciB0aGUgdmlkX3BsbF9kaXYKPj4+Pj4+PiBjbG9jay4gSW4gZmFjdCwgdGhl
IGNsb2NrIGNhbiBiZSBzZXQuIFNvIGFkZCAib3BzIiB0aGF0IGNhbiBzZXQgdGhlCj4+Pj4+Pj4g
Y2xvY2ssIGVzcGVjaWFsbHkgZm9yIGxhdGVyIGNoaXBzIGxpa2UgUzQgU09DIGFuZCBzbyBvbi4K
Pj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4K
Pj4+Pj4+PiAtLS0KPj4+Pj4+IHBsZWFzZSBkZXNjcmliZSB0aGUgY2hhbmdlcyB5b3UgZGlkIGNv
bXBhcmVkIHRvIHRoZSBwcmV2aW91cyB2ZXJzaW9uKHMpCj4+Pj4+Cj4+Pj4+IEknbGwgYWRkIGl0
IGluIHRoZSBuZXh0IHZlcnNpb24uCj4+Pj4+Cj4+Pj4+PiBbLi4uXQo+Pj4+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Nsay9tZXNvbi92aWQtcGxsLWRpdi5oIGIvZHJpdmVycy9jbGsvbWVzb24v
dmlkLXBsbC1kaXYuaAo+Pj4+Pj4+IGluZGV4IGMwMTI4ZTMzY2NmOS4uYmJjY2FiMzQwOTEwIDEw
MDY0NAo+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvY2xrL21lc29uL3ZpZC1wbGwtZGl2LmgKPj4+Pj4+
PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi92aWQtcGxsLWRpdi5oCj4+Pj4+Pj4gQEAgLTEwLDEx
ICsxMCwxNCBAQAo+Pj4+Pj4+ICAgICAjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+Cj4+
Pj4+Pj4gICAgICNpbmNsdWRlICJwYXJtLmgiCj4+Pj4+Pj4KPj4+Pj4+PiArI2RlZmluZSBWSURf
UExMX0RJVl9UQUJMRV9TSVpFICAgICAgICAgMTQKPj4+Pj4+IEluIHYxIHlvdSB1c2VkIEFSUkFZ
X1NJWkUodmlkX3BsbF9kaXZfdGFibGUpIHdoZXJldmVyIHRoaXMgbmV3IG1hY3JvCj4+Pj4+PiBp
cyB1c2VkIGluc3RlYWQuCj4+Pj4+PiBJIHRoaW5rIHVzaW5nIEFSUkFZX1NJWkUgaXMgdGhlIGJl
dHRlciBhcHByb2FjaCBiZWNhdXNlIGl0IG1lYW5zIHRoZQo+Pj4+Pj4gcmVmZXJlbmNlcyB3aWxs
IHVwZGF0ZSBhdXRvbWF0aWNhbGx5IGlmIGFuIGVudHJ5IGlzIGFkZGVkL3JlbW92ZWQgZnJvbQo+
Pj4+Pj4gdmlkX3BsbF9kaXZfdGFibGUKPj4+Pj4KPj4+Pj4gSSBhZ3JlZSB3aXRoIHlvdS4gUGVy
aGFwcyB0aGUga2V5IGlzIHRvIHVuZGVyc3RhbmQgd2hhdCBKZXJvbWUgc2FpZC4KPj4+PiBJIGFz
a2VkIHlvdSB0byBkZXNjcmliZSBob3cgdGhpcyBkaXZpZGVyIGFjdHVhbGx5IHdvcmtzLiBOb3Qg
cmVtb3ZlCj4+Pj4gQVJSQVlfU0laRSgpLgo+Pj4KPj4+IE9LYXkhIEkgbWlzdW5kZXJzdG9vZCB5
b3VyIG1lYW5pbmcuCj4+Pgo+Pj4+IFRoaXMgZGl2aWRlciB1c2VzIHRhYmxlcyBvbmx5IGJlY2F1
c2UgdGhlIHBhcmFtZXRlcnMgYXJlICJtYWdpYyIuCj4+Pj4gSSdkIGxpa2UgdGhlIGRyaXZlciB0
byBiZSBhYmxlIGNvbWUgdXAgd2l0aCAiY29tcHV0ZWQiIHZhbHVlcyBpbnN0ZWFkLgo+Pj4+IFdo
YXQgSSByZXF1ZXN0ZWQgaXMgc29tZSBleHBsYW5hdGlvbiBhYm91dCBob3cgdGhpcyBIVyBjbG9j
ayB3b3Jrcwo+Pj4+IGJlY2F1c2UgdGhlIGRvY3VtZW50YXRpb24gaXMgbm90IHZlcnkgY2xlYXIg
d2hlbiBpdCBjb21lcyB0byB0aGlzLiBUaGVzZQo+Pj4+IHZhbHVlcyBtdXN0IGNvbWUgZnJvbSBz
b21ld2hlcmUsIEknZCBsaWtlIHRvIHVuZGVyc3RhbmQgImhvdyIuCj4+Pj4gVGhpcyBpcyB0aGUg
c2FtZSBhcyB0aGUgUExMIGRyaXZlciB3aGljaCBjYW4gdGFrZSBhIHJhbmdlIGFuZCBjb21lIHVw
Cj4+Pj4gd2l0aCB0aGUgZGlmZmVyZW50IHBhcmFtZXRlcnMsIGluc3RlYWQgb2YgdXNpbmcgYmln
IHByZS1jb21wdXRlZCB0YWJsZXMuCj4+Pj4KPj4+Pj4KPj4+Pj4+IEFsc28gSSB0aGluayB0aGVy
ZSdzIGEgZGlmZmVyZW50IHVuZGVyc3RhbmRpbmcgYWJvdXQgd2hhdCBKZXJvbWUKPj4+Pj4+IHBy
ZXZpb3VzbHkgd3JvdGU6Cj4+Pj4+Pj4gSXQgd291bGQgYmUgbmljZSB0byBhY3R1YWxseSBkZXNj
cmliZSBob3cgdGhpcyB2aWQgcGxsIHdvcmsgc28gd2UgY2FuCj4+Pj4+Pj4gc3RvcCB1c2luZyBw
cmVjb21wdXRlICJtYWdpYyIgdmFsdWVzIGFuZCBhY3R1YWxseSB1c2UgdGhlIElQIHRvIGl0cyBm
dWxsCj4+Pj4+Pj4gY2FwYWNpdHkuCj4+Pj4+PiAgICBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kIGlz
IHRoYXQgeW91IGludGVycHJldGVkIHRoaXMgYXMgImxldCdzIGNoYW5nZQo+Pj4+Pj4gQVJSQVlf
U0laRSh2aWRfcGxsX2Rpdl90YWJsZSkgdG8gYSBuZXcgbWFjcm8gY2FsbGVkCj4+Pj4+PiBWSURf
UExMX0RJVl9UQUJMRV9TSVpFIi4KPj4+Pj4+IEJ1dCBJIHRoaW5rIHdoYXQgSmVyb21lIG1lYW50
IGlzOiAibGV0J3MgZ2V0IHJpZCBvZiB2aWRfcGxsX2Rpdl90YWJsZQo+Pj4+Pj4gYW5kIGltcGxl
bWVudCBob3cgdG8gYWN0dWFsbHkgY2FsY3VsYXRlIHRoZSBjbG9jayByYXRlIC0gd2l0aG91dAo+
Pj4+Pj4gaGFyZC1jb2RpbmcgMTQgcG9zc2libGUgY2xvY2sgc2V0dGluZ3MgaW4gdmlkX3BsbF9k
aXZfdGFibGUiLiBMb29rIGF0Cj4+Pj4+PiBjbGstbXBsbC5jIGFuZC9vciBjbGstcGxsLmMgd2hp
Y2ggYWxsb3cgY2FsY3VsYXRpbmcgYXJiaXRyYXJ5IHJhdGVzCj4+Pj4+PiB3aXRob3V0IGFueSBo
YXJkLWNvZGVkIHRhYmxlcy4KPj4+Pj4KPj4+PiBleGFjdGx5IC4uLiBvciBhdCBsZWFzdCBhbiBl
eHBsYW5hdGlvbiBhYm91dCBob3cgaXQgd29ya3MgYW5kCj4+Pj4gd2h5IGl0IGlzIHRvbyBjb21w
bGljYXRlZCB0byBjb21wdXRlIHRoZSB2YWx1ZXMgYXQgcnVudGltZS4KPj4+Pgo+Pj4+PiBJbiBm
YWN0LCBwbGwgYW5kIG1wbGwgYXJlIGFsc28gZml4ZWQgcmVnaXN0ZXIgd3JpdGVzIGNvcnJlc3Bv
bmRpbmcKPj4+Pj4gdmFsdWVzLgo+Pj4+IFRoYXQgaXMgbm90IHRydWUuIFRoZSBwbGwgYW5kIG1w
bGwgZHJpdmVycyBhcmUgYWJsZSB0byBjb21wdXRlIHRoZWlyCj4+Pj4gdmFsdWVzIGF0IHJ1bnRp
bWUuIFBsZWFzZSBoYXZlIGEgbG9vayBhdCB0aGUgZHJpdmVycy4KPj4+Pgo+Pj4KPj4+IEFmdGVy
IGNvbnN1bHRpbmcgdGhlIGVuZ2luZWVyIG9mIHRoZSBjaGlwIGRlc2lnbiwgdGhlIGNsb2NrIGlz
IGEgZGlnaXRhbAo+Pj4gZnJlcXVlbmN5IGRpdmlkZXIsIGFuZCB0aGUgZnJlcXVlbmN5IGRpdmlk
ZXIgaXMgdmVyaWZpZWQgYnkgdGhlIHNlcXVlbmNlCj4+PiBnZW5lcmF0b3IsIHdoaWNoIGlzIGJp
dDAtYmkxNS4gYml0MTYtYml0MTcgY29uZmlybXMgdGhlIHNpemUgb2YgdGhlCj4+PiBmcmVxdWVu
Y3kgZGl2aXNpb24uCj4+IFRoYXQsIHdlIGFscmVhZHkga25vdy4gVGhpcyBpcyB3aGF0IHRoZSBk
YXRhc2hlZXQgYWxyZWFkeSBnaXZlIHVzLgo+PiBJdCBpcyBzdGlsbCBhIGJpdCBsaWdodC4KPj4g
WW91IGRvbid0IHNldCB0aGUgYml0IHJhbmRvbWx5IGFuZCBjaGVjayB0aGUgb3V0cHV0LCBkbyB5
b3UgPwo+PiBUaGUgcXVlc3Rpb24gaXMgaG93IHNldHRpbmcgdGhpcyBiaXQgaW1wYWN0IHRoZSBy
ZWxhdGlvbiBiZXR3ZWVuCj4+IHRoZSBpbnB1dCBhbmQgb3V0cHV0IHJhdGU/IElPVywgZnJvbSB0
aGVzZSAxN2JpdHMsIGhvdyBkbyB5b3UgY29tZSB1cAo+PiB3aXRoIHRoZSBtdWx0aXBsaWVyIGFu
ZCBkaXZpZGVyIHZhbHVlcyAoYW5kIHRoZSBvdGhlciB3YXkgYXJvdW5kKSA/Cj4+IAo+Pj4gV2hl
cmVhcyBvdGhlciBQTExTIGFuZCBNUExMUyBhcmUgYW5hbG9nIGRpdmlkZXJzIHNvCj4+PiB0aGVy
ZSBhcmUgZml4ZWQgZm9ybXVsYXMgdG8gY2FsY3VsYXRlLgo+Pj4KPj4+IFNvIE5laWwgaGFkIG5v
IHByb2JsZW0gaW1wbGVtZW50aW5nIGl0IHRoaXMgd2F5LiBTbyBub3cgSSB3YW50IHRvIGtub3cg
eW91cgo+Pj4gYWR2aWNlIHdoYXQgc2hvdWxkIEkgZG8gbmV4dD8KPj4gMSkgTmVpbCBkaWQgd2hh
dCBoZSBjb3VsZCB0byBnZXQgY29tcHV0ZSB0aGUgcmF0ZSAoUk8pIHdoaWNoIHRoZSBsaXR0bGUK
Pj4gaW5mb3JtYXRpb24gaGUgaGFkLiBZb3UgYXJlIHRyeWluZyB0byBleHRlbmQgdGhlIGRyaXZl
ciwga2VlcGluZyBhbgo+PiBkdW1teSBhcHByb2FjaC4gSXQgaXMgb25seSBmYWlyIHRoYXQgSSBh
c2sgeW91IHRvIG1ha2UgdGhpcyBhIHJlYWwKPj4gZHJpdmVyLgo+PiAyKSBCZWNhdXNlIHNvbWV0
aGluZyBoYXMgYmVlbiBkb25lIG9uY2UsIGl0IG5vdCBuZWNlc3NhcmlseSBhcHByb3ByaWF0ZQo+
PiB0byBjb250aW51ZSAuLi4gdGhpcyB0eXBlIG9mIGFyZ3VtZW50IGhhcmRseSBhIHZhbGlkIHJl
YXNvbi4KPj4gSSBkb24ndCB3YW50IHRvIGtlZXAgYWRkaW5nIHRhYmxlIGJhc2VkIGRyaXZlciB1
bmxlc3MgbmVjZXNzYXJ5Lgo+PiBTbyBmYXIsIHlvdSBoYXZlIG5vdCBwcm92ZWQgdGhpcyBhcHBy
b2FjaCBpcyByZWFsbHkgcmVxdWlyZWQsIG5vcgo+PiBwcm92aWRlZCB0aGUgbmVjZXNzYXJ5IGlu
Zm9ybWF0aW9uIHRvIG1ha2UgdGhlIGNhbGN1bGF0aW9uLgo+Cj4gVGVjaG5pY2FsbHkgeW91IGFy
ZSByaWdodC4gSSBhbSBjb21tdW5pY2F0aW5nIGFuZCBjb25maXJtaW5nIHdpdGggdGhlIGNoaXAK
PiBkZXNpZ25lciB0byBzZWUgaWYgdGhlIGdlbmVyYWwgY2FsY3VsYXRpb24gZm9ybXVsYSBjYW4g
YmUgZ2l2ZW4uIElmIG5vdCwgSQo+IHdpbGwgZXhwbGFpbiB3aHkuIFBsZWFzZSBnaXZlIG1lIHNv
bWUgdGltZS4KPgo+IEJ1dCBJIGhhdmUgdG8gbWVudGlvbiB0aGF0IHRoZSBTT0MsIGFsdGhvdWdo
IHRoZXJlIGlzIHRoaXMgcmVnaXN0ZXIgYnV0Cj4gYWN0dWFsbHkgZG9lcyBub3QgdXNlIHRoZSBj
bG9jay4gQ2FuIHdlIHRyZWF0IHRoaXMgYXMgYSBzZXBhcmF0ZSBwYXRjaCB0aGF0Cj4gd2Ugd2ls
bCBjb250aW51ZSB0byBzZW5kIGFuZCBleHBsYWluIGxhdGVyPwo+Cj4gVGhpcyB3YXkgSSBjYW4g
Y29udGludWUgd2l0aCB0aGUgb3RoZXIgcGF0Y2hlcyBvZiBTNCBTT0MgZmlyc3QsIGFuZCB0aGlz
Cj4gY2xvY2sgc3RheXMgdGhlIHNhbWUgd2F5IGFzIHRoZSBHMTJBIGZpcnN0LiBMYXRlciwgYWZ0
ZXIgdGhlIHBhdGNoIG9mIHRoZQo+IGNsb2NrIGlzIGNvcnJlY3RlZCwgaXQgY2FuIGJlIGNvcnJl
Y3RlZCB0byAib3BzIiBhcyByZXF1aXJlZC5PdGhlcndpc2UsIHdlCj4gY2Fubm90IGNvbnRpbnVl
IG90aGVyIGRyaXZlciBwYXRjaGVzLiBJIGRvbid0IGtub3cgaWYgeW91IGFncmVlPwo+CgpTdXJl
IHlvdSBjYW4gc2VuZCB5b3VyIHM0IHNlcmllcyB3aXRoIFJPIG9wcyBhbmQgY2hhbmdlIHRvIFJX
IGxhdGVyIG9uCmlmIG5lY2Vzc2FyeS4KCj4+IAo+Pj4KPj4+Pj4gQnV0IGV2ZXJ5IFNPQyBpcyBk
aWZmZXJlbnQsIHNvIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gc2V0IGl0Cj4+Pj4+IG91dHNpZGUu
IFRoZSBWSUQgUExMIGlzIGEgZml4ZWQgdmFsdWUgZm9yIGFsbCBjdXJyZW50IFNvQ3MuCj4+Pj4+
Cj4+Pj4+PiBCZXN0IHJlZ2FyZHMsCj4+Pj4+PiBNYXJ0aW4KPj4+Pj4+Cj4+Pj4KPj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
