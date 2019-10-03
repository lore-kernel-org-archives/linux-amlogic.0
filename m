Return-Path: <SRS0=WwkR=X4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7438C32792
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 08:34:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE11D21783
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 08:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cunzqwi7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zTchbkJb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE11D21783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGFYO19ChKdRW2Fk5Eqm1gIKU58GMOfdNB5Kze3jFes=; b=Cunzqwi7CWfXTv
	rkjlogJHpNhZp4hGs8fBQKyE8x/f3fYG0pYDWmCxLiqivDGYC2qdqZmc0pCXJBXMRzEihUZ9+DDCz
	9rlOc2DZ7rXGoROhfmES/4mkdRFEWauP7OOXCYtfVUGQP+9NDS3UI8+HC5vc1kBowZema4l7sIsuV
	GP3kCy96MTkClcy88LTvDK19cAHfZSq1nzXXHc4ATz3Lnk4LouPfenY98UNf6MboIulPYvqJc/5z3
	81yK9Ho5Ao2KuCntGJl2A9luy97Cxsp7BU3wSAgglDVx0yw+ZROWFl6dvesOORzKWdtJYKpr6htos
	G8SRBa/2t7jkhnlX8RNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFwZ9-0003nl-IW; Thu, 03 Oct 2019 08:34:27 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFwZ5-0003mq-W5
 for linux-amlogic@lists.infradead.org; Thu, 03 Oct 2019 08:34:25 +0000
Received: by mail-wm1-x342.google.com with SMTP id y21so1573203wmi.0
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Oct 2019 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=pI9C6ahl+nbQHPAC35dp9wq8rqxSsDDWofoWIyRDkLM=;
 b=zTchbkJbgDTpNLzYwpdrWTE/gd+vuOPqap7nsSbbZ7+8Ec77H1VBaUDGtFpxoA8Wsy
 rO2dvutBNGUKTXyH+TJSnv6zLMGC8UBJjbZ/DzCH3ko9E+3EEUAZNvxBnKTjImTxKGHg
 dFid8JAY3zOjgb0NKCgxcHpbwJXFBuGJR2nOeNlybSaS3hFq9eIa1e8Diqpp1nosCmjz
 GNr1KuzN7K3FCz0nMCInp5KFNv0xH8+1uC1g3VYS9Qm449WqeUoPFBSFasSQLUn/U4eM
 tBhXWmFRC05WZo/hqCw1XiR8CdQT8uhC6ekLnd1hwADf8pIesbTUpa81F+D60JXHYCOC
 xmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=pI9C6ahl+nbQHPAC35dp9wq8rqxSsDDWofoWIyRDkLM=;
 b=relMosctfmTol9zJCiomwrZ/WaXyBAfJOykl/SGz7tkDkCoFbgd2cyYYLVGxFfzd+W
 apIzpMcRODSM13OjvYo2DTDJUUImc8dx4ShhAKwfBK+fYz2O4kEgcxhGS3DsmdjEVdEC
 n9DbMhIKimEjnxa0yXjOg/Dajv+FTtDF3NHTQABc7im+xrnP/d5EE1GkVS75328Kkt3T
 l/VKylfNENbOz1AEklm+fg6YkVtwNW/SuXARDIdI6Wu7okwoQGuYUTRIQDCf5GE9SuL+
 kCQvPnEhrv8toXlg2ss4rl3TtFxT541o6iiG2ui0ygZyFIndNFz3khUDUNGC3yjaEdU2
 mWng==
X-Gm-Message-State: APjAAAX3k3vZUpjAwj8uvU9EA2YiS7J4HPZ848g93bckE14jJlOuAH/f
 Ot5e7MGJatB+eH4D+e4f+nVRErEKl/joEQ==
X-Google-Smtp-Source: APXvYqw4bv6iyI1N5Z9utskDI3+DaWWDjbAcHP6jbcMIYZDH9RbG+kUfYFbm+NrAdKLO8R+/Yht+8Q==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr6042506wmi.151.1570091661782; 
 Thu, 03 Oct 2019 01:34:21 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 x129sm2591475wmg.8.2019.10.03.01.34.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 01:34:20 -0700 (PDT)
Subject: Re: drm_sched with panfrost crash on T820
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Hillf Danton <hdanton@sina.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
 <20190930145228.14000-1-hdanton@sina.com>
 <d2888614-8644-7d04-b73b-3ab7c6623e9a@amd.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <7339b7a1-2d1c-4379-89a0-daf8b28d81c8@baylibre.com>
Date: Thu, 3 Oct 2019 10:34:19 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <d2888614-8644-7d04-b73b-3ab7c6623e9a@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_013424_033576_1132CC1D 
X-CRM114-Status: GOOD (  16.04  )
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

SGkgQW5kcmV5LAoKTGUgMDIvMTAvMjAxOSDDoCAxNjo0MCwgR3JvZHpvdnNreSwgQW5kcmV5IGEg
w6ljcml0IDoKPiAKPiBPbiA5LzMwLzE5IDEwOjUyIEFNLCBIaWxsZiBEYW50b24gd3JvdGU6Cj4+
IE9uIE1vbiwgMzAgU2VwIDIwMTkgMTE6MTc6NDUgKzAyMDAgTmVpbCBBcm1zdHJvbmcgd3JvdGU6
Cj4+PiBEaWQgYSBuZXcgcnVuIGZyb20gNS4zOgo+Pj4KPj4+IFsgICAzNS45NzE5NzJdIENhbGwg
dHJhY2U6Cj4+PiBbICAgMzUuOTc0MzkxXSAgZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKzB4NWMv
MHhmMAo+Pj4gCQkJZmZmZjAwMDAxMDY2N2YzOAlGRkZGMDAwMDEwNjY3Rjk0Cj4+PiAJCQlkcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYzozMzUKPj4+Cj4+PiBUaGUgY3Jhc2hp
bmcgbGluZSBpcyA6Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoYmFk
LT5zX2ZlbmNlLT5zY2hlZHVsZWQuY29udGV4dCA9PQo+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVudGl0eS0+ZmVuY2VfY29udGV4dCkgewo+Pj4KPj4+IERvZXNuJ3Qg
c2VlbSByZWxhdGVkIHRvIGd1aWx0eSBqb2IuCj4+IEJhaWwgb3V0IGlmIHNfZmVuY2UgaXMgbm8g
bG9uZ2VyIGZyZXNoLgo+Pgo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+
PiBAQCAtMzMzLDYgKzMzMywxMCBAQCB2b2lkIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYShzdHJ1
Y3QgZHJtCj4+ICAgCj4+ICAgCQkJc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+ICAgCQkJbGlzdF9m
b3JfZWFjaF9lbnRyeV9zYWZlKGVudGl0eSwgdG1wLCAmcnEtPmVudGl0aWVzLCBsaXN0KSB7Cj4+
ICsJCQkJaWYgKCFzbXBfbG9hZF9hY3F1aXJlKCZiYWQtPnNfZmVuY2UpKSB7Cj4+ICsJCQkJCXNw
aW5fdW5sb2NrKCZycS0+bG9jayk7Cj4+ICsJCQkJCXJldHVybjsKPj4gKwkJCQl9Cj4+ICAgCQkJ
CWlmIChiYWQtPnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0ID09Cj4+ICAgCQkJCSAgICBlbnRp
dHktPmZlbmNlX2NvbnRleHQpIHsKPj4gICAJCQkJCWlmIChhdG9taWNfcmVhZCgmYmFkLT5rYXJt
YSkgPgo+PiBAQCAtNTQzLDcgKzU0Nyw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2pvYl9p
bml0KTsKPj4gICB2b2lkIGRybV9zY2hlZF9qb2JfY2xlYW51cChzdHJ1Y3QgZHJtX3NjaGVkX2pv
YiAqam9iKQo+PiAgIHsKPj4gICAJZG1hX2ZlbmNlX3B1dCgmam9iLT5zX2ZlbmNlLT5maW5pc2hl
ZCk7Cj4+IC0Jam9iLT5zX2ZlbmNlID0gTlVMTDsKPj4gKwlzbXBfc3RvcmVfcmVsZWFzZSgmam9i
LT5zX2ZlbmNlLCAwKTsKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfam9iX2Ns
ZWFudXApOwo+IAoKVGhpcyBmaXhlZCB0aGUgcHJvYmxlbSBvbiB0aGUgMTAgQ0kgcnVucy4KCk5l
aWwKCj4gCj4gRG9lcyB0aGlzIGNoYW5nZSBoZWxwIHRoZSBwcm9ibGVtID8gTm90ZSB0aGF0IGRy
bV9zY2hlZF9qb2JfY2xlYW51cCBpcyAKPiBjYWxsZWQgZnJvbSBzY2hlZHVsZXIgdGhyZWFkIHdo
aWNoIGlzIHN0b3BwZWQgYXQgYWxsIHRpbWVzIHdoZW4gd29ya190ZHIgCj4gdGhyZWFkIGlzIHJ1
bm5pbmcgYW5kIGFueXdheSB0aGUgJ2JhZCcgam9iIGlzIHN0aWxsIGluIHRoZSAKPiByaW5nX21p
cnJvcl9saXN0IHdoaWxlIGl0J3MgYmVpbmcgYWNjZXNzZWQgZnJvbSAgCj4gZHJtX3NjaGVkX2lu
Y3JlYXNlX2thcm1hIHNvIEkgZG9uJ3QgdGhpbmsgZHJtX3NjaGVkX2pvYl9jbGVhbnVwIGNhbiBi
ZSAKPiBjYWxsZWQgZm9yIGl0IEJFRk9SRSBvciB3aGlsZSBkcm1fc2NoZWRfaW5jcmVhc2Vfa2Fy
bWEgaXMgZXhlY3V0ZWQuCj4gCj4gQW5kcmV5Cj4gCj4gCj4+ICAgCj4+IC0tCj4+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
