Return-Path: <SRS0=Ikdi=X3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACAA9C352AA
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 14:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 675CF21783
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 14:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lpkbxXdA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="N5wcQz6t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 675CF21783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmX8YFOR/lo9n2CNXFHOPJ1fqLIuYs9DcONG9t+3uUE=; b=lpkbxXdA+yPyIZ
	9ZKFaIfsbmXGBwUITr/nfcguL1W0+PP/Je7PQ37eNJnm0moCfVdCL6rOgPNxzPOWQ9YNlMa5VsjtI
	MY684XzQT3fLDIaQ/BVuzWv/C8OskGXy6UaOEFzcE5Z0+bQD/G9HCmQ78DghyfXJ5WlWd4rsdToxH
	ZIBOhifiTQSs1wwz8YghnF4DWZP22txPuCgUd2w+6hgGst8NpAm4l8SP9tVWuwgDXvBylG2nJCFvK
	EcmQ72uyvlt7WqO8kLUKs6xBl7H0eeuibdK2WDML7QGAhQ681TFF4JO/7ilFDEfeeaP7AS83ck4+L
	33szg66KlrgPwz8S61SA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFfsp-0006td-B8; Wed, 02 Oct 2019 14:45:39 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFfro-0004aX-Ks
 for linux-amlogic@lists.infradead.org; Wed, 02 Oct 2019 14:44:39 +0000
Received: by mail-wm1-x341.google.com with SMTP id b24so7261861wmj.5
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Oct 2019 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LKzMTTB8XV2AJkzo5S/56DrG6y6U1OC2/G5Z8Cw0zJE=;
 b=N5wcQz6tmc0QNH2OOHLHL1cfArP/bC7kbYrThjsiadXH3X4OjM8HrimpMIh0iNpxM9
 SVM7vpkt1agIkPjijOFf9O1qBIaT9IykydKmfy3OzE8LFpjorWWC3fzu/AoHNkUTsjB8
 vvX7LKpJrFH0/4kHC8arM7S99H/IFF2IegBPb1jsRZPWk8z5p0ZJAj6G+9l8eXPdKwWr
 92k8sgElo21Y48o4pG6T7uyrjN77rnTFe1uigBAria5xOT3NEsfYufy8KFAM9hXy235K
 uauIVQKo+KdheuHYY9w/aUGWOhRm4co/ngPyhJUjLZAu1mTCmvoiVjRCwELzbsymiKnK
 lftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LKzMTTB8XV2AJkzo5S/56DrG6y6U1OC2/G5Z8Cw0zJE=;
 b=RiiT7Djy+NIry9of0KqWDP4o23zqAdKrWxH/hjCw2NiwhZEQ2SQVsya6uNzh8goGd5
 hfExBoc1vzS70LX4yNGrQ3MEkz2GhiadEFCWDe2EYh2ynSKSTWiQ/b+im4+sjDZKw5ku
 k2JcTtGqfENTqt33ZIxq0EQXtHJIJsO7t98vSCA4pyInHTHboeg6ed5MKoqE1M2Ebc0x
 IqQ3TAk2APkn/PgEeqGY0d5mh/v90L4NdW0tgjqIo9J7s9cnVtUj9rbak5NYC9b6HmdO
 JofP/eMRI9Mps8rCWDaFFJReaHESqY2d8iotTgWE7gveCpa7hXp9L2+07u0oGyKSI5ts
 PjHQ==
X-Gm-Message-State: APjAAAUfWju2xdpkviHOrYskDBXhGZuzDxU5DYPVptNt2T61LfyNPpkJ
 I+gRYxXVQYo8P7U5yrVDDaTVRmYe+HAwOw==
X-Google-Smtp-Source: APXvYqw5vtCHPqtCkgw9ZdxQdx3eNIPI89zqupQVrUgJSgf01qmh1DfG369DRIKsrte1anj4Ed6h5Q==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr3132435wmj.21.1570027473707; 
 Wed, 02 Oct 2019 07:44:33 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h17sm11313874wme.6.2019.10.02.07.44.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 07:44:32 -0700 (PDT)
Subject: Re: drm_sched with panfrost crash on T820
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Hillf Danton <hdanton@sina.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
 <20190930145228.14000-1-hdanton@sina.com>
 <d2888614-8644-7d04-b73b-3ab7c6623e9a@amd.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <81694dcc-0bb5-0c47-dab2-ed61a65a5845@baylibre.com>
Date: Wed, 2 Oct 2019 16:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d2888614-8644-7d04-b73b-3ab7c6623e9a@amd.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_074436_858408_6EE9C061 
X-CRM114-Status: GOOD (  15.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQW5kcmV5LAoKCk9uIDAyLzEwLzIwMTkgMTY6NDAsIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90
ZToKPiAKPiBPbiA5LzMwLzE5IDEwOjUyIEFNLCBIaWxsZiBEYW50b24gd3JvdGU6Cj4+IE9uIE1v
biwgMzAgU2VwIDIwMTkgMTE6MTc6NDUgKzAyMDAgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+PiBE
aWQgYSBuZXcgcnVuIGZyb20gNS4zOgo+Pj4KPj4+IFsgICAzNS45NzE5NzJdIENhbGwgdHJhY2U6
Cj4+PiBbICAgMzUuOTc0MzkxXSAgZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKzB4NWMvMHhmMAo+
Pj4gCQkJZmZmZjAwMDAxMDY2N2YzOAlGRkZGMDAwMDEwNjY3Rjk0Cj4+PiAJCQlkcml2ZXJzL2dw
dS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYzozMzUKPj4+Cj4+PiBUaGUgY3Jhc2hpbmcgbGlu
ZSBpcyA6Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoYmFkLT5zX2Zl
bmNlLT5zY2hlZHVsZWQuY29udGV4dCA9PQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGVudGl0eS0+ZmVuY2VfY29udGV4dCkgewo+Pj4KPj4+IERvZXNuJ3Qgc2VlbSBy
ZWxhdGVkIHRvIGd1aWx0eSBqb2IuCj4+IEJhaWwgb3V0IGlmIHNfZmVuY2UgaXMgbm8gbG9uZ2Vy
IGZyZXNoLgo+Pgo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
Ywo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+PiBAQCAt
MzMzLDYgKzMzMywxMCBAQCB2b2lkIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYShzdHJ1Y3QgZHJt
Cj4+ICAgCj4+ICAgCQkJc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+ICAgCQkJbGlzdF9mb3JfZWFj
aF9lbnRyeV9zYWZlKGVudGl0eSwgdG1wLCAmcnEtPmVudGl0aWVzLCBsaXN0KSB7Cj4+ICsJCQkJ
aWYgKCFzbXBfbG9hZF9hY3F1aXJlKCZiYWQtPnNfZmVuY2UpKSB7Cj4+ICsJCQkJCXNwaW5fdW5s
b2NrKCZycS0+bG9jayk7Cj4+ICsJCQkJCXJldHVybjsKPj4gKwkJCQl9Cj4+ICAgCQkJCWlmIChi
YWQtPnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0ID09Cj4+ICAgCQkJCSAgICBlbnRpdHktPmZl
bmNlX2NvbnRleHQpIHsKPj4gICAJCQkJCWlmIChhdG9taWNfcmVhZCgmYmFkLT5rYXJtYSkgPgo+
PiBAQCAtNTQzLDcgKzU0Nyw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2pvYl9pbml0KTsK
Pj4gICB2b2lkIGRybV9zY2hlZF9qb2JfY2xlYW51cChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9i
KQo+PiAgIHsKPj4gICAJZG1hX2ZlbmNlX3B1dCgmam9iLT5zX2ZlbmNlLT5maW5pc2hlZCk7Cj4+
IC0Jam9iLT5zX2ZlbmNlID0gTlVMTDsKPj4gKwlzbXBfc3RvcmVfcmVsZWFzZSgmam9iLT5zX2Zl
bmNlLCAwKTsKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfam9iX2NsZWFudXAp
Owo+IAo+IAo+IERvZXMgdGhpcyBjaGFuZ2UgaGVscCB0aGUgcHJvYmxlbSA/IE5vdGUgdGhhdCBk
cm1fc2NoZWRfam9iX2NsZWFudXAgaXMgCj4gY2FsbGVkIGZyb20gc2NoZWR1bGVyIHRocmVhZCB3
aGljaCBpcyBzdG9wcGVkIGF0IGFsbCB0aW1lcyB3aGVuIHdvcmtfdGRyIAo+IHRocmVhZCBpcyBy
dW5uaW5nIGFuZCBhbnl3YXkgdGhlICdiYWQnIGpvYiBpcyBzdGlsbCBpbiB0aGUgCj4gcmluZ19t
aXJyb3JfbGlzdCB3aGlsZSBpdCdzIGJlaW5nIGFjY2Vzc2VkIGZyb23CoCAKPiBkcm1fc2NoZWRf
aW5jcmVhc2Vfa2FybWEgc28gSSBkb24ndCB0aGluayBkcm1fc2NoZWRfam9iX2NsZWFudXAgY2Fu
IGJlIAo+IGNhbGxlZCBmb3IgaXQgQkVGT1JFIG9yIHdoaWxlIGRybV9zY2hlZF9pbmNyZWFzZV9r
YXJtYSBpcyBleGVjdXRlZC4KCkknbSBydW5uaW5nIGl0IHJpZ2h0IG5vdywgd2lsbCBwb3N0IHJl
c3VsdHMgd2hlbiBmaW5pc2hlZC4KClRoYW5rcywKTmVpbAoKPiAKPiBBbmRyZXkKPiAKPiAKPj4g
ICAKPj4gLS0KPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
