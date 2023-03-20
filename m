Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DB0C7618D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 12:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieeSakptfEqBLddRAGT1zooGSxEcjmB9sH4pYpvIKRI=; b=OakiDC9SPEhtwdchMQkju32SX1
	Ax8Thx0Hsl6hQKVtNjWpi1+Xjcd+px8torkhysh3YeDW7UyOojagT4cD2NV9RkTf/hmlE7gcJH2A8
	MBXjnPBuIRFX1gcA/+EyfTLSxVPnnhhHdLTjcU2dc+5IlxX5+ENPZY2yrtOlRuA0eJRbjCMrDjiGC
	hN9w/cv1D00DVNhIM6rY9MUCElqQpl/h3WARV11e6BylwjQtMMOzDYm6WNoLpVOnds8TeQdy9eKJZ
	coQ7jWqVdP/MIvMWEKIUPy0Y05Pypygg0fCdeT38BGpcnKZ7Kyv3fgHORT3T3eG5uoj4g/x3Adl6l
	WRqir1hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peEZd-008xua-24;
	Mon, 20 Mar 2023 12:25:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peEZa-008xtn-2Q
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 12:25:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso9061258wmb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 05:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679315109;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hbYe87C1ax7n2gUxfYefOp4CtanFQWHmul8SCrZFOBg=;
        b=Jnuru+ugnRyx+FSA1ergwvCdAydNXxsWVv3Ri6zD2IU2rKfgHJbCGh3M17afwv1oQB
         Cum6Un6UsIqsOvgxT0ZQ8bpk3qXnSK8nV6J0H4KWm25XaYwR7KDa4ahmn7+UXuoaug0A
         OH1cb93hharg0gk3KFjPVWbiaCXowamGonQM6uCDE/Kunob9J6P165fE5JyNcX9WZ4np
         q/jwJEQlrM4zTqlI/R+GBczM8Ceea26CmFpMl7PHn/oA8OA0TDMmFuaI5N/lDLVwdymX
         aut9ZNKDh4dhxIITz8JeZw2oRJw10/OKGvwdGJeQPYQ2iNffTLNHuMog+JviFvfSIRSS
         W+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679315109;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbYe87C1ax7n2gUxfYefOp4CtanFQWHmul8SCrZFOBg=;
        b=u0H8D4iu7OczAZfINyuFdDflKb6GIIRdSuRy+nvGQHsRV7EVRZvIOTUPJ1rq8ssfyG
         PbwptxT1KcZTaEl2N+Qt3qJmqtuxpRS+ngYmba4ChY4oHPXQ8+bxDlHxPbhq6Akz4mCC
         KUurqCFsrxdQVZDwlLt8T4F4YoFRNNeWZCb4f3Gd3TmIxKGhcZR1e43xM6eEOB62vzAT
         zfBQmyOJzs1tjBLQPhX8NuhrOE+L74yg0qAcjCkP3Sdc5a/s/viaiMFlYokv7ih1Rge1
         A/rFqsC9z37Wgi8rdrPU9J2PjZlsi+Z/+F69k5A9asTAGlehwNYKJQdcpH4k2Ei7qG2p
         IAxA==
X-Gm-Message-State: AO0yUKUmZ+0qz+Y1Hf+m8ihVmE9Juc2+L6hvSURBZlMyABX6KBFUU0C7
	5iLw8/NqbN1xvvCtyOPo+XLe2Q==
X-Google-Smtp-Source: AK7set89E2abehNN1E9+rbr6OJWVOL1zvSP5b/dkKe1I03NmUyjReU/Ko9yooLErL2dmGoHjNc/cfw==
X-Received: by 2002:a05:600c:358d:b0:3df:e6bb:768 with SMTP id p13-20020a05600c358d00b003dfe6bb0768mr31491095wmq.24.1679315109219;
        Mon, 20 Mar 2023 05:25:09 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b003ed1f111fdesm10262676wme.20.2023.03.20.05.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 05:25:08 -0700 (PDT)
Message-ID: <4a49100c-2ab4-09f5-780c-1a734f0bd1f1@linaro.org>
Date: Mon, 20 Mar 2023 13:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 30/33] doc: boards: amlogic: add documentation for
 BananaPi CM4IO
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: u-boot-amlogic@groups.io, u-boot@lists.denx.de,
 linux-amlogic@lists.infradead.org
References: <20230320114609.930145-1-christianshewitt@gmail.com>
 <20230320114609.930145-31-christianshewitt@gmail.com>
 <5e29634d-0751-5b1b-5bfa-4a85f536f672@linaro.org>
 <3CBB7476-13B0-410F-9F19-1323157F1FFC@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <3CBB7476-13B0-410F-9F19-1323157F1FFC@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_052510_818401_5CDC89A2 
X-CRM114-Status: GOOD (  14.36  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjAvMDMvMjAyMyAxMzoyMywgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPiAKPj4gT24gMjAg
TWFyIDIwMjMsIGF0IDQ6MTMgcG0sIE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5h
cm8ub3JnPiB3cm90ZToKPj4KPj4gT24gMjAvMDMvMjAyMyAxMjo0NiwgQ2hyaXN0aWFuIEhld2l0
dCB3cm90ZToKPj4+IEFkZCBidWlsZCBpbnN0cnVjdGlvbnMgZm9yIHRoZSBCYW5hbmFQaSBCUEkt
Q000SU8gY2FycmllciBib2FyZCB3aXRoCj4+PiBCUEktQ000IG1vZHVsZS4KPj4+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgo+Pj4g
LS0tCj4+PiAgIGJvYXJkL2FtbG9naWMvdTIwMC9NQUlOVEFJTkVSUyAgICAgICB8ICAgMSAtCj4+
PiAgIGJvYXJkL2FtbG9naWMvdzQwMC9NQUlOVEFJTkVSUyAgICAgICB8ICAgMiArCj4+PiAgIGRv
Yy9ib2FyZC9hbWxvZ2ljL2JhbmFuYXBpLWNtNGlvLnJzdCB8IDE1MiArKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4+ICAgZG9jL2JvYXJkL2FtbG9naWMvaW5kZXgucnN0ICAgICAgICAgIHwg
ICAxICsKPj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxNTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jL2JvYXJkL2FtbG9naWMvYmFuYW5hcGkt
Y200aW8ucnN0Cj4+Cj4+IDxzbmlwPgo+Pgo+Pj4gKwo+Pj4gK1UtQm9vdCBTaWduaW5nIHdpdGgg
UHJlLUJ1aWx0IEZJUCByZXBvCj4+PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPj4+ICsKPj4+ICsuLiBjb2RlLWJsb2NrOjogYmFzaAo+Pj4gKyAgICAkIGdpdCBjbG9u
ZSBodHRwczovL2dpdGh1Yi5jb20vTGlicmVFTEVDL2FtbG9naWMtYm9vdC1maXAgLS1kZXB0aD0x
Cj4+PiArICAgICQgY2QgYW1sb2dpYy1ib290LWZpcAo+Pj4gKyAgICAkIG1rZGlyIG15LW91dHB1
dC1kaXIKPj4+ICsgICAgJCAuL2J1aWxkLWZpcC5zaCBiYW5hbmFwaS1jbTRpbyAvcGF0aC90by91
LWJvb3QvdS1ib290LmJpbiBteS1vdXRwdXQtZGlyCj4+Cj4+Cj4+IFRoaXMgc2hvdWxkIGJlIGJh
bmFuYXBpLW0ycyBzaW5jZSB0aGUgc2FtZSBpcyB1c2VkLCBvciB3ZSBzaG91bGQgZHVwbGljYXRl
IGl0IGZvciBjbTRpby9jbTQuCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL0xpYnJlRUxFQy9hbWxv
Z2ljLWJvb3QtZmlwL3RyZWUvbWFzdGVyL2JhbmFuYXBpLWNtNGlvCj4gCj4gXiBJdOKAmXMgdGhl
IHNhbWUgRklQcyB0aGF0IHdlcmUgc3VibWl0dGVkIGZvciBNMlMgYnV0IGZvciBwYWNrYWdpbmcK
PiByZWFzb25zIEkgY2xvbmVkIHRoZW0gKHVzZXJzIHN0cnVnZ2xlIHRvIGZpbmQgaW1hZ2VzIG5v
dCBleHBsaWNpdGx5Cj4gbmFtZWQgZm9yIHRoZWlyIGJvYXJkKS4gSeKAmWxsIHN1Ym1pdCBwYXRj
aGVzIGZvciB0aGUgTTJTIGFuZCBNMi1Qcm8KPiBib2FyZHMgb25jZSB0aGlzIHNlcmllcyBpcyBh
Y2NlcHRlZCAoaG9wZWZ1bGx5KS4KCkFjaywgc28gbm8gY2hhbmdlcyBuZWVkZWQgdGhlbiAhCgo+
IAo+IENocmlzdGlhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
