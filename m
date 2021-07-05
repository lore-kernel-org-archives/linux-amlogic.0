Return-Path: <SRS0=nO3E=L5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA75C07E98
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 08:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7150861164
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 08:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7150861164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khu2E4k+uaRcpYRoDSHCurBkQDDQDlESJgtauvFS9L4=; b=1GxahiYz4JIbmc
	dU/C0LdhT1rbpJM74IFwb8T/mVblP2jvjgR/mz6AwFfHqcIiIqZiDj48MBo+0R3TO2HbKi0j32lcv
	T62T7Xck+UzAgfhCxjHo2Y98X1Y7iFIRGkQUVBKWBfsl+8+xaL5R6RWWYsi+DEP60sklfXh0OjkWP
	fhugMxtfx+XDXWOCCt+BtgimaXT7wXGzT6ykNSYr7umnver8OJ0i+Y5HQw9KTQNz6vC6vrU51dr4f
	elVAlQsvbaTtfk9X/dp0Xma/eTjUDIkOrTRE6GaWAAtqxdjJco0Yxb7UJl3P5vB28lmHbyvSuMUjH
	fJ4A2GcG2JHVpXZ74NsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0K5G-008JFc-PG; Mon, 05 Jul 2021 08:36:06 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0K4i-008J38-EU; Mon, 05 Jul 2021 08:35:34 +0000
Received: by mail-il1-x131.google.com with SMTP id h3so16624815ilc.9;
 Mon, 05 Jul 2021 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d/z0wdGwqo9fBiWvUKCHWb/kQLPqJkEvWOdgihFLsj8=;
 b=nnIo3J5eDnno109p9aSKDxVdvCbFHp1smIORXB6hZq5EJHpgLZSCO4qP5Zs/l1a6XV
 HB8E3gbb9zLBNY+M89JdThVHsIUMNs8YWeIVS3vgcwqOMSy34psw+1t/dNaHc+RgCpGt
 Ud6XtMDaWKU0aKQZlxLdbBKP71+N4ICCQyeG2NNdbYcPGjpJku68kl4nOv5pU62ibYT1
 oToGm7yNkp15taLIWju8i0ZO5Ry08JoF3LMatsVsrVh9gFMz/wdk400nt1P/xbtP3FaZ
 O5FMuRzJ/grWG1JJL08q+p47b8UrFJO14V+l+wjvzua9sliDAmZYOE0OQNatiTH03wr/
 zmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d/z0wdGwqo9fBiWvUKCHWb/kQLPqJkEvWOdgihFLsj8=;
 b=JlyDBmt0+adG/yaFUVKVRlTtbaepGms6SzGGtjuNZi9wANgmGgCVcrSPMYMZgI+kEK
 uURgol6MatGc0tlk8B0T54ktJnhGnQX7kRqbrkcGtbpmZcp5K4J7+fqBXZpJhtL7aHQO
 ckrt5NNInQgbusANmui2DIJfjCecvMpytqP84ykdXSTtB10GVSNDE3YdQ0wmIZpabsxm
 f/Q6WM7EmgfoK+TzPJSh8+hZDqvuArQ4KOsgidIh1+bsY2nk6B6yc60cB9bbgnlYRWAE
 DXVhSWaEzCoyQZJ5oLOe6bku23kbQ8hnWIRMNtPka4b3oZ7UrRtnJzohXtaBk1VVpw7c
 VmtQ==
X-Gm-Message-State: AOAM532pkgyzWUHSMDSGwzanS7EnFH/FWqWQdwISKUJEg63JXfebV35s
 rIvOfewhgZ2VOeKNeLB5q4aXyC2Fe7QEuIdHpYI=
X-Google-Smtp-Source: ABdhPJz2XNkzxoMF2ciJoR4PMgzdzbrxMkwrN9p4oVhgaS5rrdQ8ctbDneqd2RHXne/ebOI01Evyw56XuTGLo2Wwkng=
X-Received: by 2002:a05:6e02:1d0e:: with SMTP id
 i14mr3756014ila.150.1625474130559; 
 Mon, 05 Jul 2021 01:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210701154634.GA60743@bjorn-Precision-5520>
 <67a9e1fa.81a9.17a64c8e7f7.Coremail.chenhuacai@loongson.cn>
In-Reply-To: <67a9e1fa.81a9.17a64c8e7f7.Coremail.chenhuacai@loongson.cn>
From: Art Nikpal <email2tema@gmail.com>
Date: Mon, 5 Jul 2021 16:35:19 +0800
Message-ID: <CAKaHn9KxRrBsn4b9fSO1eDzM3XdV2GzfwVX+cGw9uS_eKg75dw@mail.gmail.com>
Subject: Re: Re: [PATCH 0/4] PCI: replace dublicated MRRS limit quirks
To: =?UTF-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Wilczynski <kw@linux.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 PCI <linux-pci@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-kernel@vger.kernel.org, 
 Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
 Gouwa Wang <gouwa@khadas.com>, chenhuacai@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_013532_567117_F4A012E6 
X-CRM114-Status: GOOD (  19.03  )
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

PiBEb2VzIHRoYXQgbWVhbnMga2V5c3RvbmUgYW5kIExvb25nc29uIGhhcyB0aGUgc2FtZSBNUlJT
IHByb2JsZW0/IEFuZCB3aGF0IHNob3VsZCBJIGRvIG5vdz8KCkxvb2sgbGlrZSB5ZXMgISBhbmQg
IGFtbG9naWMgaGFzIHRoZSBzYW1lIHByb2JsZW0uCkkgdGhpbmsgc29tZWJvZHkgbmVlZCB0byBy
ZXdyaXRlIGl0IGFsbCB0byBvbmUgY29tbW9uIHF1aXJrIGZvciB0aGlzIHByb2JsZW0uCgpJZiBu
byBvbmUgaGFzIGFueSBvYmplY3Rpb24sIEkgY2FuIHRyeSB0byByZW1ha2UgaXQgYWdhaW4uCgpP
biBGcmksIEp1bCAyLCAyMDIxIGF0IDk6MTUgQU0g6ZmI5Y2O5omNIDxjaGVuaHVhY2FpQGxvb25n
c29uLmNuPiB3cm90ZToKPgo+IEhpLCBCam9ybiwKPgo+ICZndDsgLS0tLS3ljp/lp4vpgq7ku7Yt
LS0tLQo+ICZndDsg5Y+R5Lu25Lq6OiAiQmpvcm4gSGVsZ2FhcyIgPGhlbGdhYXNAa2VybmVsLm9y
Zz4KPiAmZ3Q7IOWPkemAgeaXtumXtDogMjAyMS0wNy0wMSAyMzo0NjozNCAo5pif5pyf5ZubKQo+
ICZndDsg5pS25Lu25Lq6OiAiQXJ0ZW0gTGFwa2luIiA8ZW1haWwydGVtYUBnbWFpbC5jb20+Cj4g
Jmd0OyDmioTpgIE6IG5hcm1zdHJvbmdAYmF5bGlicmUuY29tLCB5dWUud2FuZ0BBbWxvZ2ljLmNv
bSwga2hpbG1hbkBiYXlsaWJyZS5jb20sIGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20sIHJvYmhA
a2VybmVsLm9yZywga3dAbGludXguY29tLCBqYnJ1bmV0QGJheWxpYnJlLmNvbSwgY2hyaXN0aWFu
c2hld2l0dEBnbWFpbC5jb20sIG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20sIGxp
bnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZywgbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnLCBhcnRAa2hhZGFzLmNvbSwgbmlja0BraGFkYXMuY29tLCBnb3V3YUBraGFk
YXMuY29tLCAiSHVhY2FpIENoZW4iIDxjaGVuaHVhY2FpQGxvb25nc29uLmNuPgo+ICZndDsg5Li7
6aKYOiBSZTogW1BBVENIIDAvNF0gUENJOiByZXBsYWNlIGR1YmxpY2F0ZWQgTVJSUyBsaW1pdCBx
dWlya3MKPiAmZ3Q7Cj4gJmd0OyBbK2NjIEh1YWNhaV0KPiAmZ3Q7Cj4gJmd0OyBPbiBTYXQsIEp1
biAxOSwgMjAyMSBhdCAwMjozOTo0OFBNICswODAwLCBBcnRlbSBMYXBraW4gd3JvdGU6Cj4gJmd0
OyAmZ3Q7IFJlcGxhY2UgZHVibGljYXRlZCBNUlJTIGxpbWl0IHF1aXJrcyBieSBtcnJzX2xpbWl0
X3F1aXJrIGZyb20gY29yZQo+ICZndDsgJmd0OyAqIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaS1rZXlzdG9uZS5jCj4gJmd0OyAmZ3Q7ICogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kt
bG9vbmdzb24uYwo+ICZndDsKPiAmZ3Q7IHMvZHVibGljYXRlZC9kdXBsaWNhdGVkLyAoc2V2ZXJh
bCBvY2N1cnJlbmNlcykKPiAmZ3Q7Cj4gJmd0OyBDYXBpdGFsaXplIHN1YmplY3QgbGluZXMuCj4g
Jmd0Owo+ICZndDsgVXNlICJnaXQgbG9nIC0tb25saW5lIiB0byBsZWFybiBjb252ZW50aW9ucyBh
bmQgZm9sbG93IHRoZW0uCj4gJmd0Owo+ICZndDsgQWRkICIoKSIgYWZ0ZXIgZnVuY3Rpb24gbmFt
ZXMuCj4gJmd0Owo+ICZndDsgQ2FwaXRhbGl6ZSBhY3JvbnltcyBhcHByb3ByaWF0ZWx5IChOVk1l
LCBNUlJTLCBQQ0ksIGV0YykuCj4gJmd0Owo+ICZndDsgRW5kIHNlbnRlbmNlcyB3aXRoIHBlcmlv
ZHMuCj4gJmd0Owo+ICZndDsgQSAibW92ZSIgcGF0Y2ggbXVzdCBpbmNsdWRlIGJvdGggdGhlIHJl
bW92YWwgYW5kIHRoZSBhZGRpdGlvbiBhbmQgbWFrZQo+ICZndDsgbm8gY2hhbmdlcyB0byB0aGUg
Y29kZSBpdHNlbGYuCj4gJmd0Owo+ICZndDsgQW1sb2dpYyBhcHBlYXJzIHdpdGhvdXQgZXhwbGFu
YXRpb24gaW4gMi80LiAgTXVzdCBiZSBzZXBhcmF0ZSBwYXRjaCB0bwo+ICZndDsgYWRkcmVzcyBv
bmx5IHRoYXQgc3BlY2lmaWMgaXNzdWUuICBTaG91bGQgcmVmZXJlbmNlIHB1Ymxpc2hlZCBlcnJh
dHVtCj4gJmd0OyBpZiBwb3NzaWJsZS4gICJTb2x2ZXMgc29tZSBpc3N1ZSIgaXMgbm90IGEgY29t
cGVsbGluZyBqdXN0aWZpY2F0aW9uLgo+ICZndDsKPiAmZ3Q7IFRoZSB0cmVlIG11c3QgYmUgY29u
c2lzdGVudCBhbmQgZnVuY3Rpb25hbGx5IHRoZSBzYW1lIG9yIGltcHJvdmVkCj4gJmd0OyBhZnRl
ciBldmVyeSBwYXRjaC4KPiAmZ3Q7Cj4gJmd0OyBBZGQgdG8gcGNpX2lkcy5oIG9ubHkgaWYgc3lt
Ym9sIHVzZWQgbW9yZSB0aGFuIG9uZSBwbGFjZS4KPiAmZ3Q7Cj4gJmd0OyBTZWUKPiAmZ3Q7IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTA3MDEwNzQ0NTguMTgwOTUzMi0zLWNoZW5odWFj
YWlAbG9vbmdzb24uY24sCj4gJmd0OyB3aGljaCBsb29rcyBzaW1pbGFyLiAgQ29tYmluZSBlZmZv
cnRzIGlmIHBvc3NpYmxlIGFuZCBjYyBIdWFjYWkgc28KPiAmZ3Q7IHlvdSdyZSBib3RoIGF3YXJl
IG9mIG92ZXJsYXBwaW5nIHdvcmsuCj4gJmd0Owo+ICZndDsgTW9yZSBoaW50cyBpbiBjYXNlIHRo
ZXkncmUgdXNlZnVsOgo+ICZndDsgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGNpLzIw
MTcxMDI2MjIzNzAxLkdBMjU2NDlAYmhlbGdhYXMtZ2xhcHRvcC5yb2FtLmNvcnAuZ29vZ2xlLmNv
bS8KPiAmZ3Q7Cj4gJmd0OyAmZ3Q7IEJvdGgga3NfcGNpZV9xdWlyayBsb29uZ3Nvbl9tcnJzX3F1
aXJrIHdhcyByZXdyaXR0ZW4gd2l0aG91dCBhbnkKPiAmZ3Q7ICZndDsgZnVuY3Rpb25hbGl0eSBj
aGFuZ2VzIGJ5IG9uZSBtcnJzX2xpbWl0X3F1aXJrCj4gRG9lcyB0aGF0IG1lYW5zIGtleXN0b25l
IGFuZCBMb29uZ3NvbiBoYXMgdGhlIHNhbWUgTVJSUyBwcm9ibGVtPyBBbmQgd2hhdCBzaG91bGQg
SSBkbyBub3c/Cj4KPiBIdWFjYWkKPiAmZ3Q7ICZndDsKPiAmZ3Q7ICZndDsgQWRkZWQgRGVzaWdu
V2FyZSBQQ0kgY29udHJvbGxlciB3aGljaCBuZWVkIHNhbWUgcXVpcmsgZm9yCj4gJmd0OyAmZ3Q7
ICogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMgKFBDSV9ERVZJQ0VfSURf
U1lOT1BTWVNfSEFQU1VTQjMpCj4gJmd0OyAmZ3Q7Cj4gJmd0OyAmZ3Q7IFRoaXMgcXVpcmsgY2Fu
IHNvbHZlIHNvbWUgaXNzdWUgZm9yIEtoYWRhcyBWSU0zL1ZJTTNMKEFtbG9naWMpCj4gJmd0OyAm
Z3Q7IHdpdGggSERNSSBzY3JhbWJsZWQgcGljdHVyZSBhbmQgbnZtZSBkZXZpY2VzIGF0IGludGVu
c2l2ZSB3cml0aW5nLi4uCj4gJmd0OyAmZ3Q7Cj4gJmd0OyAmZ3Q7IGNvbWUgZnJvbToKPiAmZ3Q7
ICZndDsgKiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyMTA2MTgwNjM4MjEu
MTM4MzM1Ny0xLWFydEBraGFkYXMuY29tLwo+ICZndDsgJmd0Owo+ICZndDsgJmd0OyBBcnRlbSBM
YXBraW4gKDQpOgo+ICZndDsgJmd0OyAgUENJOiBtb3ZlIEtleXN0b25lIGFuZCBMb29uZ3NvbiBk
ZXZpY2UgSURzIHRvIHBjaV9pZHMKPiAmZ3Q7ICZndDsgIFBDSTogY29yZTogcXVpcmtzOiBhZGQg
bXJyc19saW1pdF9xdWlyawo+ICZndDsgJmd0OyAgUENJOiBrZXlzdG9uZSBtb3ZlIG1ycnMgcXVp
cmsgdG8gY29yZQo+ICZndDsgJmd0OyAgUENJOiBsb29uZ3NvbiBtb3ZlIG1ycnMgcXVpcmsgdG8g
Y29yZQo+ICZndDsgJmd0Owo+ICZndDsgJmd0OyAtLQo+ICZndDsgJmd0OyAyLjI1LjEKPiAmZ3Q7
ICZndDsKPgo+Cj4gPC9jaGVuaHVhY2FpQGxvb25nc29uLmNuPjwvZW1haWwydGVtYUBnbWFpbC5j
b20+PC9oZWxnYWFzQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
