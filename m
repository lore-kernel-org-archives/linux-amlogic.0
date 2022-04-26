Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F38C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Apr 2022 08:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tX36NMDXMMSaITDJQ5xN8vXO1dvT8smRmJaEIM5pwFs=; b=CjcWFTDW9Pzsor
	08v0fGWG796beI/OCHNnHf1ekBqAuQaY25iDjut8rZuj7/fpcd/SIT/g3/J5HFYPitlSRYEqB1icQ
	mKFL3TotexEBBPFLv9PtUi11cNDsOFp9LJjwIjip48VjPBZE6ot7wHqHvyfOGDguYMeLOG6ikMVh/
	GJKbggILU7vLXCfo/IvKlLXGlCsSKZaWTzVOwpaa5cS6zO6Npdq1zb1IUgyzrK087g9Z2pf4mm2uc
	KeT6UQNYM17x7tF7rE1vLF1lYt6CwrgAXcX+kBGBm4mhTsZvwSI8DykIoL0Wpl/ml+PaRtXgW7gfL
	FAyzJZ/JTqpdt7gNFHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njGss-00DQyw-30; Tue, 26 Apr 2022 08:49:22 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njGsp-00DQvX-5V
 for linux-amlogic@lists.infradead.org; Tue, 26 Apr 2022 08:49:20 +0000
Received: by mail-ed1-x52f.google.com with SMTP id p4so5820382edx.0
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Apr 2022 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1SRbe9A5ASn2nonWqQhzkEvCLgc9MI3gYPXmr+E0JF4=;
 b=FT5NHB7JNJb9INBCwP+UQDRPzwiNIBUfVpJvQFXmcFRzep1s29caK6rVzPB04SQNm4
 eBZQ5YQI4v0MRGwdAq0hQtn6/XYEyEkkvLnONhCqrD81LWjNi8MRMbwyOC0ygEDga+Mn
 5B7/W7VfzDYbg45VH+EwXzFmGbjgAEJhoPGlKAwbESxNzAxQZJp6A3wSpngXzwOkRAV1
 eba5Splb5JsCS3nNmA2rTenHAOyQpoEPEo88kal6052Jj0wTY189uyfIsFDUlmFynQsr
 n9UejIl6Pyn3pwb7HD+aGqevJJr51PQVwEVFh3p+YgWNmcJGxeAoWBcVf+UK09ZOUyG+
 o3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1SRbe9A5ASn2nonWqQhzkEvCLgc9MI3gYPXmr+E0JF4=;
 b=lPT5js2crYoYpVQzoofB8SJVpzO7UP0EXvQPmifiXGqrBWKAWkbsV71pTiy6pugCpU
 71VZS3Ow5vg0qtLp91cg1SYHP+gTjeA+Fr6xGIDtg3vPbQw733vhl2ae7qkKvUUMmBZW
 3YlX2G+NW9fal4kUnggieuZElisqlIeeUWExxyUukfxhJeP6X3bN5bmPLg5aojttw+1C
 MGN6nqnwp+79WxjlDZorgXLfzXTuNuC0UpEIFcAwZ4GBol/qu99DLT86qpjT/248n7Ws
 +QjG3WS3wC31/MDT4NmTyrwdmiOxbB9tFulsLncTig4dLg8m5tCaWZAGEo9VwFWw9fUP
 6Y3A==
X-Gm-Message-State: AOAM533yg02fgPiQNBUFpJ06cu3RoMr1brC+ro/39x3ybUuGa0l9hql6
 IBMMwXwjmv0Iv7dKr0JdXvU=
X-Google-Smtp-Source: ABdhPJxL/MBJT7skioWyPgqpxjAY6F3tgnv/LHN+CyeHKlL27SNPSBrtScxKR5UqRA21s4bsBz4gqQ==
X-Received: by 2002:a05:6402:3509:b0:423:f906:8e2d with SMTP id
 b9-20020a056402350900b00423f9068e2dmr23490637edd.333.1650962955286; 
 Tue, 26 Apr 2022 01:49:15 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7b47:9400:4d47:5fc5:7882:b844?
 (dynamic-2a01-0c22-7b47-9400-4d47-5fc5-7882-b844.c22.pool.telefonica.de.
 [2a01:c22:7b47:9400:4d47:5fc5:7882:b844])
 by smtp.googlemail.com with ESMTPSA id
 c13-20020a056402100d00b0042294fdbcf9sm5689505edu.14.2022.04.26.01.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 01:49:14 -0700 (PDT)
Message-ID: <213cb041-9abc-a701-368d-1b770cc5e16f@gmail.com>
Date: Tue, 26 Apr 2022 10:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH RFC] tty: serial: meson: add new compatible for gxl uart
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, Yu Tu <yu.tu@amlogic.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <fd06c40a-4f63-3b93-8471-477506f4ef38@gmail.com>
 <2e0d53d9-5770-7d47-4dd5-9302ee8d546b@baylibre.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <2e0d53d9-5770-7d47-4dd5-9302ee8d546b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_014919_274803_560A1BF9 
X-CRM114-Status: GOOD (  21.28  )
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

T24gMjYuMDQuMjAyMiAwOToyMSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MjUvMDQvMjAyMiAyMjozOSwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+PiBNeSBTQzIgdGVzdCBz
eXN0ZW0gKGFoMjEyLWJhc2VkIEhLMSBSQk9YIFg0KSB1c2VzIGFuIHVib290IGNvbnNvbGUKPj4g
c3BlZWQgb2YgOTIxNjAwIGJwcy4gQmVpbmcgYWJsZSB0byB1c2UgdGhlIHNhbWUgc3BlZWQgaW4g
TGludXgKPj4gcmVxdWlyZXMgdXNpbmcgYSAxMk1IeiBjbG9jayBzb3VyY2UuIElkZWFsbHkgd2Un
ZCBzZXQgdGhlIG5ldwo+PiBjb21wYXRpYmxlIHRvIHRoZSBmaXJzdCBjaGlwIHZlcnNpb24gc3Vw
cG9ydGluZyB0aGUKPj4gQU1MX1VBUlRfQkFVRF9YVEFMX0RJVjIgYml0Lgo+IAo+IEFjdHVhbGx5
IEcxMkEgaXMgdGhlIGZpcnN0IGNoaXAgaGF2aW5nIEFNTF9VQVJUX0JBVURfWFRBTF9ESVYyLCBi
dXQgU0MyIGlzCj4gdGhlIGZpcnN0IG9uZSByZXF1aXJpbmcgaXQgdG8gYWNoaWV2ZSA5MjE2MDAg
YnBzIGNvcnJlY3RseS4KPiAKPj4gTm90IGhhdmluZyBhY2Nlc3MgdG8gY2hpcCBkb2N1bWVudGF0
aW9uCj4+IEknZCBhcHByZWNpYXRlIGEgaGludCBvbiB3aGVuIHRoaXMgYml0IHdhcyBpbnRyb2R1
Y2VkLgo+PiBJZiBmaW5lIHdpdGggeW91IGluIGdlbmVyYWwgdGhlIGZpbmFsIHNlcmllcyB3b3Vs
ZCBpbmNsdWRlIGEKPj4gc2VwYXJhdGUgcGF0Y2ggZm9yIHRoZSBuZXcgY29tcGF0aWJsZS4KPiAK
PiBUaGlzIGhhcyBiZWVuIGFscmVhZHkgaGFuZGxlZCBpbjoKPiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ncmVna2gvdHR5LmdpdC9jb21taXQvP2g9dHR5
LW5leHQmaWQ9MzY4YWI2OGIxOGRlMTA0NzE5ZjM4NmE1Y2ZlMzU5NTY3M2NjOTZkZQo+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC90dHkuZ2l0
L2NvbW1pdC8/aD10dHktbmV4dCZpZD0wMGE3ZmE4MzZkYmM0NTRmYWY1YjcwMjdhZDY3NTE5YWY3
YzZjMTViCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
Z3JlZ2toL3R0eS5naXQvY29tbWl0Lz9oPXR0eS1uZXh0JmlkPTliOTJjYzVlZTJkMTBlNmM0ZDMy
N2QxZTRjZWI3N2FhOGIxMDgxZWUKPiAKCkdvb2QgdG8ga25vdywgdGhhbmtzIGZvciB0aGUgaGlu
dCEKCj4+Cj4+IE5vdGU6IFRoaXMgcGF0Y2ggZG9lc24ndCBjb25zaWRlciAidHR5OiBzZXJpYWw6
IG1lc29uOgo+PiBVc2UgRElWX1JPVU5EX0NMT1NFU1QgdG8gY2FsY3VsYXRlIGJhdWQgcmF0ZXMi
IHlldCBhbmQgdGhlcmVmb3JlCj4+IHdvbid0IGFwcGx5IGNsZWFubHkgb24gbGludXgtbmV4dC4K
Pj4gSSBsb2NhbGx5IHVzZWQgdGhlIHNhbWUgRElWX1JPVU5EX0NMT1NFU1QoKSBjaGFuZ2VzIGJl
Zm9yZS4KPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+PiBOZXdlciBTb0MgdmVyc2lvbnMgc3VwcG9ydCB1c2luZyBYVEFM
IC8gMiAoMTJNSHopIGFzIGNsb2NrIHNvdXJjZQo+PiBmb3IgdGhlIFVBUlQuIFRoaXMgY2xvY2sg
c291cmNlIGFsbG93cyB0byBzdXBwb3J0IDkyMTYwMCBicHMgYXMgdXNlZAo+PiBieSB2ZW5kb3Ig
dWJvb3Qgb24gY2VydGFpbiBzeXN0ZW1zIGxpa2UgYWgyMTIgcmVmIGJvYXJkLgo+Pgo+PiAxMk1I
eiAvIDEzID0gOTIzMDc2IGJwcwo+PiBXaXRoIHRoZSBjdXJyZW50bHkgdXNlZCA4TUh6IGNsb2Nr
IHNvdXJjZSBvbmx5IDg4ODg4OGJwcyBvcgo+PiAxMDAwMDAwIGJwcyBhcmUgcG9zc2libGUuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+
Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIHwgMTMgKysrKysr
KysrKy0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMg
Yi9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4+IGluZGV4IDJiZjFjNTdlMC4uMGEw
YTA2MzZmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4+
ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4gQEAgLTY4LDYgKzY4LDcg
QEAKPj4gwqAgI2RlZmluZSBBTUxfVUFSVF9CQVVEX01BU0vCoMKgwqDCoMKgwqDCoCAweDdmZmZm
Zgo+PiDCoCAjZGVmaW5lIEFNTF9VQVJUX0JBVURfVVNFwqDCoMKgwqDCoMKgwqAgQklUKDIzKQo+
PiDCoCAjZGVmaW5lIEFNTF9VQVJUX0JBVURfWFRBTMKgwqDCoMKgwqDCoMKgIEJJVCgyNCkKPj4g
KyNkZWZpbmUgQU1MX1VBUlRfQkFVRF9YVEFMX0RJVjLCoMKgwqDCoMKgwqDCoCBCSVQoMjcpCj4+
IMKgIMKgICNkZWZpbmUgQU1MX1VBUlRfUE9SVF9OVU3CoMKgwqDCoMKgwqDCoCAxMgo+PiDCoCAj
ZGVmaW5lIEFNTF9VQVJUX1BPUlRfT0ZGU0VUwqDCoMKgwqDCoMKgwqAgNgo+PiBAQCAtMjk5LDEw
ICszMDAsMTUgQEAgc3RhdGljIHZvaWQgbWVzb25fdWFydF9jaGFuZ2Vfc3BlZWQoc3RydWN0IHVh
cnRfcG9ydCAqcG9ydCwgdW5zaWduZWQgbG9uZyBiYXVkKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
Y3B1X3JlbGF4KCk7Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKHBvcnQtPnVhcnRjbGsgPT0gMjQwMDAw
MDApIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHZhbCA9ICgocG9ydC0+dWFydGNsayAvIDMpIC8gYmF1
ZCkgLSAxOwo+PiAtwqDCoMKgwqDCoMKgwqAgdmFsIHw9IEFNTF9VQVJUX0JBVURfWFRBTDsKPj4g
K8KgwqDCoMKgwqDCoMKgIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShwb3J0LT5kZXYtPm9m
X25vZGUsICJhbWxvZ2ljLG1lc29uLWd4bC11YXJ0IikpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdmFsID0gRElWX1JPVU5EX0NMT1NFU1QocG9ydC0+dWFydGNsaywgMiAqIGJhdWQpIC0g
MTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsIHw9IEFNTF9VQVJUX0JBVURfWFRBTCB8
IEFNTF9VQVJUX0JBVURfWFRBTF9ESVYyOwo+PiArwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsID0gRElWX1JPVU5EX0NMT1NFU1QocG9ydC0+dWFy
dGNsaywgMyAqIGJhdWQpIC0gMTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsIHw9IEFN
TF9VQVJUX0JBVURfWFRBTDsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCB9IGVs
c2Ugewo+PiAtwqDCoMKgwqDCoMKgwqAgdmFsID0gKChwb3J0LT51YXJ0Y2xrICogMTAgLyAoYmF1
ZCAqIDQpICsgNSkgLyAxMCkgLSAxOwo+PiArwqDCoMKgwqDCoMKgwqAgdmFsID0gRElWX1JPVU5E
X0NMT1NFU1QocG9ydC0+dWFydGNsaywgNCAqIGJhdWQpIC0gMTsKPj4gwqDCoMKgwqDCoCB9Cj4+
IMKgwqDCoMKgwqAgdmFsIHw9IEFNTF9VQVJUX0JBVURfVVNFOwo+PiDCoMKgwqDCoMKgIHdyaXRl
bCh2YWwsIHBvcnQtPm1lbWJhc2UgKyBBTUxfVUFSVF9SRUc1KTsKPj4gQEAgLTc4Miw2ICs3ODgs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtZXNvbl91YXJ0X2R0X21hdGNo
W10gPSB7Cj4+IMKgwqDCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uOC11YXJ0
IiB9LAo+PiDCoMKgwqDCoMKgIHsgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbjhiLXVhcnQi
IH0sCj4+IMKgwqDCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWd4LXVhcnQi
IH0sCj4+ICvCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWd4bC11YXJ0IiB9
LAo+PiDCoMKgwqDCoMKgIHsgLyogc2VudGluZWwgKi8gfSwKPj4gwqAgfTsKPj4gwqAgTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgbWVzb25fdWFydF9kdF9tYXRjaCk7Cj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
