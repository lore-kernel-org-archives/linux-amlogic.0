Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABBF1099B54
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Mar 2026 06:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5xBhiUUmLJmEOCZnjpSEqG5fnA+zMzGSfoT8YWsfac=; b=lNBAxJRnYJUzwm
	Y6GnMJAytubnLcyHzNvy+dZ/rGVbLnt905lWzbq5aO1elM+p7pvYE+lKawfnxxfz1EyhThZJq+sbA
	JHvyWGZGbPnbPO/ZWLzeO5s44s4qG2TSGfEF0/w7XHe6x/DAt8IGV0tFRk/dO3DnnOmuUsKKUoCmD
	52aHknBiND8MsB4GGvNUCKVjiCEatDm+8rn5cq7CrYg0FAMK5UvZk48VheQmo1ZrTeOVz1/cwkiKM
	M3UPw+P5U+0qi7ZjlX76cUztZs6KMcmrLswwpV9GZac5zi6xR9KM0C2LcyCVqFTT34zL/hJMNH7ns
	uJuvxm6AS+lof0PlnHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qE3-0000000EAgu-3Ynt;
	Sat, 21 Mar 2026 06:54:23 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qE1-0000000EAf5-0B0q
	for linux-amlogic@lists.infradead.org;
	Sat, 21 Mar 2026 06:54:22 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b9382e59c0eso185714666b.0
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Mar 2026 23:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774076057; cv=none;
        d=google.com; s=arc-20240605;
        b=Vi93knwIuZO/sU7tNR7X+oEje5KWwd4hsV8t7Kb4WsmwVbpOyPdNXKcdypoAc5W1pk
         FgDaH/lrFIwOzNJ5vYAbunvv8bItYIsOxAnRqzDBqn+ZBOSLys4VLyp2rZtTVsIGmYhO
         hwUoRpTeXhFs5aaDJ1+QG+0V2tzlFATUT+PnWvS+2APM8gFF8DYBycb31tiA9UJl676n
         JNWVIvHKjNhwM2qHD/eIYjpsBp43V9xqsiFaIdMt7MlPHwDUAtOMuMs33ONwkVEg/nRP
         +m4G6Fcy7L1zosBaii4qk8don80CJPDu7yt+vd9BqKV0cI67bphBTjZyFHQdZTCM0m2k
         H6Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        fh=TdiBChk2Uuv0/wFXX6Zk0Lyn0nMSoeiqepyIIWCB3iU=;
        b=B3TA/GQvBoWHiarfiBtkdIGLLA/mn1UrntVR0wQT/4i4lI6dW2PD0paVG5jjnRUSv1
         1FDfSaNwh+YRiYElIgLtPbt92OnDPRndYpi2b0O5RlGEzSBZJOpvgwerQbEIqXypcqa3
         DdpHW6Y+jmFRLFAwYiB32IGDU1TkxEay5Jez/r4x3kftZF8DC4dJDDj/G1ZUYAFD8Led
         cPCM1AjxwwmjQFlo7UuGPybWRy6oajUlrZmlHhWirZH0KQfxk6hho9GCj/ogLahpMHOT
         c77DxxPaqyw3lCLfA0MtvutrUk14J+6JrpaowRNQPLcnNHThJvO4tlzl9pJRrTFv85Zp
         ijCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774076057; x=1774680857; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        b=Ub1t7LsZKnCXgK9tMZgEg4n+GJFs1xyUO6TbGeOyjSQeHg6HVY1xBSo2NzMD50dayV
         jm2SupIMS0ZzOnl/c9hb6YujmraRKvSig+oXbtTYJ4v29f+/p6Fb0Vi9Wz8XS01ucGAF
         HogOHTgGS6cl1vuu0hrnCAlvnwAKOsWPaFlbGr8HKWMgIzZUIwtL8yIUvddVDBr8dY7G
         7G5TSyF7XDb3X20WWvGhv8EAP8HNzr/NnNv+qFIsP3D4AdR5hgjsYuHKBDdzerMSRqee
         27kW2ZaCMLRj83HCDQv9FPc2/oRva70CRRM4m8QPKVhGFB2NGDs/2DmwEyzxcv8Jg69+
         ElUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076057; x=1774680857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        b=Jn1Qt/xerkQof7F7U1tVfGwW+ZWvSgE9sVI1BgwTP7Sdi0z8459y23kmRRtFOlGGxH
         ruShRU/tzp3AiT3wbPbLRdOH3Iy30sr90bvmA+Lmego3jv/VXblxnWzxN5BHVkyousGH
         X8nSb8V0xQ1Yy3yvVJGERkPigP8g6Jr765VZ88iJUcUSFpIId3McoAJF2gTdGlyJIhZ8
         l/jXCpe+Hk3zTIpDU74Jc0zKvygvKm7fq3lZYGxfzuN20NkYm03Aw8I0jBdFFoN5yl60
         agbLQVDTT/9nqxZ5vi6rvBFPELyfh5a7LvNi9WlOH52o7n9TCv2EoGl1RrZJDmTrgPTz
         HiWA==
X-Forwarded-Encrypted: i=1; AJvYcCWyM7KP6jr3w7AQMNYwB6eQ2AWcy1vAImir/kR8evk747/Vsuj7F4ffP7BbLrvbrZKmOvTASTWQakJrZxIy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwkk7djtmg+1OUudQ8Qf5EzXInSq8MsrLWwde/ruJ0QtlkI1Rr
	+fF1NYpIQkyJIEw2y3ALSiiu3eR463VxMnP14txEO9DHRicQHFbroY8KC5IGtIpwn7P9bJaD5Yx
	zpvPJOHvpQhgePkrRJdZiwRw53O+9w9E=
X-Gm-Gg: ATEYQzxNtgIva18A6kjT1h2NIDhrjGD4zPDDmrUZ2C2AmtTbCHquzfoqMMGiIl9Zfl5
	XXkycRcUnIh7uV6j5asitHPEA/RurGnGMsGm0gKmduuCB9BJCJ59Yu+s/lHIhXAwCVS4tzydHs0
	3TCHrdUL9/B0JK067Rh5L4yTEAb/lliZyCOjJ+Ri69sZBoTCTNGFw78tUIUaX+YrfzsNkHOKNzo
	OEXL7q30MVjcrkNoPcIQNFP4oGtcxcpjrwTBgfCCcD/8NOTNDiOn0/69UcgO6UHJC2uhXGHrEm5
	nFIEYBxIOPbOxVJ2
X-Received: by 2002:a17:907:d109:b0:b96:f6f1:e7af with SMTP id
 a640c23a62f3a-b982f1ed7bdmr419710366b.9.1774076056402; Fri, 20 Mar 2026
 23:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260304100557.126488-1-linux.amoon@gmail.com> <9db109a657e18d1e5ead67d7db06cfaf68f7fa84.camel@ndufresne.ca>
In-Reply-To: <9db109a657e18d1e5ead67d7db06cfaf68f7fa84.camel@ndufresne.ca>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 21 Mar 2026 12:24:01 +0530
X-Gm-Features: AaiRm522SeNM1abZw4YAK4uXkmRkLpmLZXI60fMElcfZGsZpbYfOo6oOjvIO9yA
Message-ID: <CANAwSgQ0N3wmJF2s_fuQN8GWvoYrrgg09X2cMnGFiyM+5U641Q@mail.gmail.com>
Subject: Re: [PATCH v1] media: meson: vdec: Fix memory leak in error path of vdec_open
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Jourdan <mjourdan@baylibre.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_235421_136511_619846C7 
X-CRM114-Status: GOOD (  20.50  )
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

SGkgTmljb2xhcywKClRoYW5rcyBmb3IgeW91ciByZXZpZXcgY29tbWVudHMuCgpPbiBGcmksIDIw
IE1hciAyMDI2IGF0IDAyOjA1LCBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzQG5kdWZyZXNuZS5j
YT4gd3JvdGU6Cj4KPiBIaSwKPgo+IExlIG1lcmNyZWRpIDA0IG1hcnMgMjAyNiDDoCAxNTozNSAr
MDUzMCwgQW5hbmQgTW9vbiBhIMOpY3JpdCA6Cj4gPiBJZiB2ZGVjX2luaXRfY3RybHMoc2Vzcykg
ZmFpbHMsIG9yIGFueSBzdWJzZXF1ZW50IGluaXRpYWxpemF0aW9uIHN0ZXAKPiA+IGR1cmluZyB2
ZGVjX29wZW4gZmFpbHMsIHRoZSBjb250cm9sIGhhbmRsZXIgYWxsb2NhdGVkIGZvciB0aGUgc2Vz
c2lvbgo+ID4gaXMgbm90IHJlbGVhc2VkLiBUaGlzIGNhdXNlcyBhIG1lbW9yeSBsZWFrIG9mIHRo
ZSB2NGwyX2N0cmxfaGFuZGxlcgo+ID4gYW5kIGl0cyBhc3NvY2lhdGVkIGNvbnRyb2wgb2JqZWN0
cy4KPiA+Cj4gPiBBZGQgYSBjYWxsIHRvIHY0bDJfY3RybF9oYW5kbGVyX2ZyZWUoKSBpbiB0aGUg
ZXJyX20ybV9yZWxlYXNlIGVycm9yCj4gPiBwYXRoIHRvIGVuc3VyZSByZXNvdXJjZXMgYXJlIHBy
b3Blcmx5IHJlY2xhaW1lZC4KPiA+Cj4gPiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjAwMDAy
MDVkNjg3OCAoc2l6ZSA4KToKPiA+ICAgY29tbSAidjRsX2lkIiwgcGlkIDUyODksIGppZmZpZXMg
NDI5NDkzODU4MAo+ID4gICBoZXggZHVtcCAoZmlyc3QgOCBieXRlcyk6Cj4gPiAgICAgNDAgZDIg
NDkgMTggMDAgMDAgZmYgZmYgICAgICAgICAgICAgICAgICAgICAgICAgIEAuSS4uLi4uCj4gPiAg
IGJhY2t0cmFjZSAoY3JjIGQzMjA0NTk5KToKPiA+ICAgICBrbWVtbGVha19hbGxvYysweGM4LzB4
ZjAKPiA+ICAgICBfX2t2bWFsbG9jX25vZGVfbm9wcm9mKzB4NjBjLzB4ODUwCj4gPiAgICAgdjRs
Ml9jdHJsX2hhbmRsZXJfaW5pdF9jbGFzcysweDFiNC8weDJlOCBbdmlkZW9kZXZdCj4gPiAgICAg
dmRlY19vcGVuKzB4MWY0LzB4Nzg4IFttZXNvbl92ZGVjXQo+ID4gICAgIHY0bDJfb3BlbisweDE0
NC8weDQ2MCBbdmlkZW9kZXZdCj4gPiAgICAgY2hyZGV2X29wZW4rMHgxYWMvMHg1MDAKPiA+ICAg
ICBkb19kZW50cnlfb3BlbisweDNmMC8weGZlOAo+ID4gICAgIHZmc19vcGVuKzB4NjgvMHgzMjAK
PiA+ICAgICBkb19vcGVuKzB4MmQ4LzB4OWE4Cj4gPiAgICAgcGF0aF9vcGVuYXQrMHgxZDAvMHg0
ZjAKPiA+ICAgICBkb19maWxwX29wZW4rMHgxOTAvMHgzODAKPiA+ICAgICBkb19zeXNfb3BlbmF0
MisweGY4LzB4MWIwCj4gPiAgICAgX19hcm02NF9zeXNfb3BlbmF0KzB4MTNjLzB4MWU4Cj4gPiAg
ICAgaW52b2tlX3N5c2NhbGwrMHhkYy8weDI2OAo+ID4gICAgIGVsMF9zdmNfY29tbW9uLmNvbnN0
cHJvcC4wKzB4MTc4LzB4MjU4Cj4gPiAgICAgZG9fZWwwX3N2YysweDRjLzB4NzAKPiA+Cj4gPiBG
aXhlczogM2U3ZjUxYmQ5NjA3ICgibWVkaWE6IG1lc29uOiBhZGQgdjRsMiBtMm0gdmlkZW8gZGVj
b2RlciBkcml2ZXIiKQo+ID4gU2lnbmVkLW9mZi1ieTogQW5hbmQgTW9vbiA8bGludXguYW1vb25A
Z21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMv
dmRlYy5jIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jIGIv
ZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jCj4gPiBpbmRleCA0Yjc3ZWMx
YWY1YTcuLmE1YWIwYzIzOTBmNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9tZWRp
YS9tZXNvbi92ZGVjL3ZkZWMuYwo+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29u
L3ZkZWMvdmRlYy5jCj4gPiBAQCAtOTE0LDYgKzkxNCw3IEBAIHN0YXRpYyBpbnQgdmRlY19vcGVu
KHN0cnVjdCBmaWxlICpmaWxlKQo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPgo+ID4gIGVycl9tMm1f
cmVsZWFzZToKPgo+IFRoaXMgZ290byBpcyB1c2VkIHR3aWNlLiBUaGUgc2Vjb25kIHRpbWUgaXMg
d2hlbiB2ZGVjX2luaXRfY3RybHMoKSBmYWlscywgYW5kIGluCj4gdGhhdCBjYXNlIHRoZSB2NGwy
X20ybV9jdHggaXMgbGVhZGVkLiBDYW4geW91IGFkZCB0aGUgbWlzc2luZyBsYWJlbCBhbmQgY2Fs
bAo+IHY0bDJfbTJtX2N0eF9yZWxlYXNlKCkgYWNjb3JkaW5nbHkuIFRoaXMgd2F5IHdlIGRvbid0
IGhhdmUgdG8gcmV2aXNpdCBhZ2Fpbi4KPgpPaywgdW5kZXJzdG9vZCwgSSB3aWxsIHVwZGF0ZSB0
aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uCgpUaGFua3MKLUFuYW5kCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
