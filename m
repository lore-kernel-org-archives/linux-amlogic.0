Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB8B606A8D9
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i4Ar5QWk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zo3t100/cW+S+dEn6TrkkkyZDFMLz3/aIrQRXBaOTHs=; b=i4Ar5QWk/3yUnWmcZknJMD81Y2
	ZU8HIyZ9/bRtrmLszjvAT6Kvq4qQr6Qr+hIF8PjPwnqqJKEbTVjuax+ndm+rZMoNvHczxaitV0JsD
	nxwoEIyWPFCObQyKj+WSLO9A+DbWJ88zEpvLJuwML08aB+xa6kUPyJ2JsOfH4DA8FDRN18ZeYlMdJ
	Z/9cFjwYd89sAd5+XAEvWZ0BWk4zBwHv35tU0HODQPG91gBJDBXVDsXwDyWMJM9w1nhWwmfppFhxd
	Nil9laipuY++kn3hC554XuSHQHr7GB05uTT4DCUYfHlTjHdO4cmDcfwfnIspGwXgbG/5ZnwTvdZlz
	I++E8DpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq4o-0000000Cepo-1kk2;
	Fri, 13 Nov 2026 12:08:18 +0000
Received: from mail-yx1-f50.google.com ([74.125.224.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq4f-0000000Cem3-0moG
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 12:08:10 +0000
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so948972d50.2
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 04:08:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571688; x=1795176488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Akznn5x8/2l1e49bpMLHpotxCwIi2QP3ICBwS80oL8w=;
        b=mGZ3+TaVuwIw2Vaz9PXc7krXIH1fjVAdqCRBZYkhd52dJjqKQ+phEWn203UYlw8EWf
         Mx3MexzSHsDKYXAtBRgsUr3VJ8+wtEyXHn87C5YhjQlGGKn8b3t3ozsrgL8NB2M/qcq1
         Dfi2olQgiGwmtjVwmueLo6zKIiaw820zEdNrWD01p4zGfS0VzBm9mxW1+rlxmMa/b1pg
         Ezo0zaexHcEzCm06efzIkDuMfTzHUTuwmXgl1t+H7DYqCm5JTGN1FFtU68UbBhboiD2I
         5EybXdyv6COOVzAor5YiU2+6G7S8NT74YkIj7fhISdruQVePh1B4d+FDFfrh5OTjgSUE
         iwEQ==
X-Forwarded-Encrypted: i=1; AL+hErHylvYhgqq6cp6cXIECOA2aMiaed4XhX0dCof5hM51zJob4/PKCzCFDwwRScVWoOCBwrsaNFET9TYXplRTD@lists.infradead.org
X-Gm-Message-State: APuU4Z+LxfjcWdFAuNYfTErKerIxGc69s5j4gBOLnMFucH/LLW5dr5GC
	+/Pj0aom5B+NfKJJ8/lRVYPsDT9zY2Rmiy9Uuxz7WyDHsbB4jbQDUTKqavKGw26b
X-Gm-Gg: AYBFou1Y8xmNfyYzCqQNHx6tS5RRZAJwSBkIg3hpn84Ws5uXXIN8Eh5zH/jKFkjfFdG
	dPgfVkdg+crfEfcp1J3NI07pFJFXBTIJ1inf1P/HNwzQ0ut7cL7pIkTArur3CRmaO7fAI5oSVzg
	fQJABbEm/M4Pm2QvAQGwTJ3ps+GRV1eskW5Udb+PsFaDF48iO7TybiBJUoE25WpPsSqZuKZMnq6
	2TP0Tlcy+w/6qDiFCZIWLyHqYkuJxxmiSpX7YIAlzdNx6w3UCDsZEwxe394cyJFP+VS9ltlyh4K
	A6ifhllXnYGBTqXAT06i7L2b/10s3CNYXo+twXubtBO0YK36NQ4/PXj4wU6mT9goZrlv04Fx9SX
	AXKTD+sU3XxtcjvxTGvzKhEgPuDr69HxAwcR1RVHumoA2ztnsteZTZ6GBnp7GFg5KyCbSjzR+4d
	MGBsG1PAI33bjlDFyqmP7+IzJUgxxe4UkOyHy6VYR0SgI4WHQ4xJl+sz7R/I3hviiQ/8Hxq2bhf
	P3gBwp4h6t6EGEsvSund8v2XrlDwyQYnRxSVHTmNpX4V3dT6tUuBXkSNDl4Oiyowo9Kt6ZAFiTg
	Q3LzPDIhV1W3MfLEEfzZnzmbgYmA1TqaIC9sokkrS3y2kfFw9UQWRrZGYn8YdZcJgQ==
X-Received: by 2002:a05:690e:144d:b0:673:5042:76f5 with SMTP id 956f58d0204a3-67d8976d4b4mr1323520d50.91.1794571687118;
        Fri, 13 Nov 2026 04:08:07 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a629a2dsm1845337d50.21.2026.11.13.04.08.07
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:08:07 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b3541bb1a2so4363287b3.1
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 04:08:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFrkewco6oPs1gb5R7CmEfJF7h0Kkqzonw9yNPFGwZhd7W/EybmSnWlpASGrHA6J3DO7lwIm+MjAHl/F6HJ@lists.infradead.org
X-Received: by 2002:a05:690c:9413:b0:8b3:b06d:68de with SMTP id
 00721157ae682-8b4aa3b2d79mr10574347b3.106.1794571686768; Fri, 13 Nov 2026
 04:08:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105100322.37816-1-tanure@linux.com> <20261105100322.37816-3-tanure@linux.com>
 <20261110175451.GA833369-robh@kernel.org>
In-Reply-To: <20261110175451.GA833369-robh@kernel.org>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 13 Nov 2026 12:07:55 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
X-Gm-Features: AclHuK8ofQ5KQ8mwVSBPN6RHiYMAZFp4eZUj5gb-QcBMy0mlvdZGEaaXPcOEhAQ
Message-ID: <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Rob Herring <robh@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_040809_259425_A9612389 
X-CRM114-Status: GOOD (  30.92  )
X-Spam-Score: 0.6 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgNTo1NOKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMDUsIDIwMjYgYXQgMTA6MDM6MTdBTSArMDAw
MCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gVGhlIFQ3IGhhcyB0aGUgc2FtZSBldGhlcm5ldCBn
bHVlIGFzIHRoZSBHMTJBIGJ1dCBuZWVkcyB0d28gY2xvY2tzIG9mCj4gPiBpdHMgb3duLiBUaGUg
Y29udHJvbGxlciByZWFjaGVzIG1lbW9yeSB0aHJvdWdoIGEgcGlwZWxpbmUgc3RhZ2Ugd2l0aAo+
ID4gaXRzIG93biBnYXRlOyBub3RoaW5nIGVsc2UgY2xhaW1zIGl0LCBzbyBpdCBpcyBzd2l0Y2hl
ZCBvZmYgYXMgdW51c2VkCj4gPiBhbmQgdHJhbnNmZXJzIG5ldmVyIGZpbmlzaC4gVGhlIGdsdWUg
cmVnaXN0ZXJzIHNpdCBpbiBhIGJsb2NrIGNsb2NrZWQKPiA+IHRvZ2V0aGVyIHdpdGggdGhlIE1E
SU8gbXVsdGlwbGV4ZXIsIHdoaWNoIHByb2JlcyBhZnRlciB0aGUgY29udHJvbGxlcgo+ID4gaGFz
IHByb2dyYW1tZWQgdGhlbTogdGhlIHdyaXRlcyBhcmUgbG9zdCBhbmQgdGhlIHBvcnQga2VlcHMg
dGhlCj4gPiBib290bG9hZGVyJ3MgZGVsYXlzLgo+ID4KPiA+IFNvIHRoZSBUNyBnZXRzIGl0cyBv
d24gY2xvY2sgbGlzdCwgd2l0aG91dCB0aGUgdGltaW5nIGFkanVzdG1lbnQgY2xvY2sKPiA+IGl0
IG5ldmVyIHVzZXMuIEl0cyBkZWxheXMgZm9sbG93IGV0aGVybmV0LWNvbnRyb2xsZXIueWFtbDog
dGhlIFBIWSBhZGRzCj4gPiB0aGUgMm5zLCBhbmQgb25seSB0aGUgcmVjZWl2ZSBkZWxheSBsaW5l
IG9mZmVycyBmaW5lIHR1bmluZywgc28gb25seQo+ID4gcngtaW50ZXJuYWwtZGVsYXktcHMgaXMg
dmFsaWQgaGVyZS4KPiA+Cj4gPiBBc3Npc3RlZC1ieTogTExNCj4gPiBTaWduZWQtb2ZmLWJ5OiBM
dWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYmluZGluZ3Mv
bmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbCAgICAgfCA0OSArKysrKysrKysrKysrKysrKysr
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKPgo+IEkgdGVuZCB0byBhZ3Jl
ZSB3aXRoIHRoZSBzYXNoaWtvIGNvbW1lbnQsIGJ1dCBhbSBmaW5lIGVpdGhlciB3YXkuIE9uY2UK
PiB0aGUgaWYvdGhlbiBzY2hlbWFzIGFyZSBsb25nZXIgdGhhbiB0aGUgbWFpbiBzY2hlbWEsIGl0
J3MgYSBzaWduIHRvCj4gc3BsaXQuCgpJbiBWNyBJIHdpbGwgc3BsaXQgYXMgSSB0aGluayBpdCB3
aWxsIGJlIGVhc2llciB0byByZXZpZXcuCgo+Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNvbi1kd21hYy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFj
LnlhbWwKPiA+IGluZGV4IGU3NjljOWJiNzBkOC4uZmY1ZTUwZjY1MTE0IDEwMDY0NAo+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3
bWFjLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
YW1sb2dpYyxtZXNvbi1kd21hYy55YW1sCj4gPiBAQCAtMjMsNiArMjMsNyBAQCBzZWxlY3Q6Cj4g
PiAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1neGJiLWR3bWFjCj4gPiAgICAgICAgICAgIC0g
YW1sb2dpYyxtZXNvbi1heGctZHdtYWMKPiA+ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWcx
MmEtZHdtYWMKPiA+ICsgICAgICAgICAgLSBhbWxvZ2ljLHQ3LWR3bWFjCj4gPiAgICByZXF1aXJl
ZDoKPiA+ICAgICAgLSBjb21wYXRpYmxlCj4gPgo+ID4gQEAgLTg0LDYgKzg1LDQ5IEBAIGFsbE9m
Ogo+ID4gICAgICAgICAgcngtaW50ZXJuYWwtZGVsYXktcHM6Cj4gPiAgICAgICAgICAgIGRlZmF1
bHQ6IDAKPiA+Cj4gPiArICAtIGlmOgo+ID4gKyAgICAgIHByb3BlcnRpZXM6Cj4gPiArICAgICAg
ICBjb21wYXRpYmxlOgo+ID4gKyAgICAgICAgICBjb250YWluczoKPiA+ICsgICAgICAgICAgICBj
b25zdDogYW1sb2dpYyx0Ny1kd21hYwo+ID4gKyAgICB0aGVuOgo+ID4gKyAgICAgIHByb3BlcnRp
ZXM6Cj4gPiArICAgICAgICBjbG9ja3M6Cj4gPiArICAgICAgICAgIGl0ZW1zOgo+ID4gKyAgICAg
ICAgICAgIC0gZGVzY3JpcHRpb246IEdNQUMgbWFpbiBjbG9jawo+ID4gKyAgICAgICAgICAgIC0g
ZGVzY3JpcHRpb246IEZpcnN0IHBhcmVudCBjbG9jayBvZiB0aGUgaW50ZXJuYWwgbXV4Cj4gPiAr
ICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogU2Vjb25kIHBhcmVudCBjbG9jayBvZiB0aGUgaW50
ZXJuYWwgbXV4Cj4gPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICAgICAg
ICAgICAgY2xvY2sgb2YgdGhlIHBpcGVsaW5lIHN0YWdlIGluc2VydGVkIGluIHRoZSBidXMgcGF0
aCBiZXR3ZWVuCj4gPiArICAgICAgICAgICAgICAgIHRoZSBjb250cm9sbGVyIGFuZCB0aGUgRFJB
TS4gV2l0aG91dCBpdCwgdGhlIGNvbnRyb2xsZXIgY2Fubm90Cj4gPiArICAgICAgICAgICAgICAg
IGNvbXBsZXRlIERNQSB0cmFuc2ZlcnMuCj4gPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjoK
PiA+ICsgICAgICAgICAgICAgICAgY2xvY2sgb2YgdGhlIHJlZ2lzdGVyIGJsb2NrIGhvbGRpbmcg
UFJHX0VUSDAgYW5kIFBSR19FVEgxLgo+ID4gKyAgICAgICAgICAgICAgICBXaXRob3V0IGl0LCB0
aGUgYmxvY2sgcmVhZHMgYXMgemVybyBhbmQgaWdub3JlcyB3cml0ZXMuCj4gPiArCj4gPiArICAg
ICAgICBjbG9jay1uYW1lczoKPiA+ICsgICAgICAgICAgaXRlbXM6Cj4gPiArICAgICAgICAgICAg
LSBjb25zdDogc3RtbWFjZXRoCj4gPiArICAgICAgICAgICAgLSBjb25zdDogY2xraW4wCj4gPiAr
ICAgICAgICAgICAgLSBjb25zdDogY2xraW4xCj4gPiArICAgICAgICAgICAgLSBjb25zdDogcGlw
ZWxpbmUKPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBwY2xrCj4gPiArCj4gPiArICAgICAgICAj
IFRoZSBQSFkgYWRkcyB0aGUgMm5zIFJHTUlJIGRlbGF5cywgc2VlIGV0aGVybmV0LWNvbnRyb2xs
ZXIueWFtbC4KPiA+ICsgICAgICAgICMgVGhlIFJYIGRlbGF5IGxpbmUgb2YgdGhpcyBnbHVlIGlz
IGZpbmUgdHVuaW5nIGluIDIwMHBzIHN0ZXBzLAo+Cj4gU291bmRzIGxpa2UgY29uc3RyYWludHM6
Cj4KPiBtYXhpbXVtOiAyMDAwCj4gbXVsdGlwbGVPZjogMjAwCgpZZXMsIHdpdGggbWF4aW11bTog
MzAwMDogdGhlIGZpZWxkIGlzIGZvdXIgYml0cywgMCB0byAxNSBzdGVwcyBvZgoyMDBwcy4KPgo+
ID4gKyAgICAgICAgIyBhZGRlZCBvbiB0b3Agb2Ygd2hhdCBwaHktbW9kZSBkZXNjcmliZXMuIFRo
ZSBUWCBzaWRlIGhhcyBubyBmaW5lCj4gPiArICAgICAgICAjIHR1bmluZzogaXRzIG9ubHkgc3Rl
cCBpcyBhIHF1YXJ0ZXIgb2YgdGhlIGNsb2NrIHBlcmlvZCwgdGhlIGZ1bGwKPiA+ICsgICAgICAg
ICMgMm5zIGF0IDFHYml0L3MsIHNvIHRoZSBUWCBwcm9wZXJ0eSBpcyBub3QgYWNjZXB0ZWQuCj4K
PiBNb3ZlIHRoaXMgdG8gdHgtaW50ZXJuYWwtZGVsYXktcHMuIFlvdSBjYW4gKGtpbmQgb2YgYWNr
d2FyZGx5KSBkbzoKPgo+IHR4LWludGVybmFsLWRlbGF5LXBzOgo+ICAgZGVzY3JpcHRpb246IC4u
Lgo+ICAgbm90OiB7fQoKZHRfYmluZGluZ19jaGVjayBkb2VzIG5vdCBhY2NlcHQgIm5vdCIgb24g
YSBwcm9wZXJ0eSB1bmRlcgpwcm9wZXJ0aWVzOiBvciBpbiBhbiBhbGxPZiBlbnRyeTogY2VsbC55
YW1sIGFsbG93cyBvbmx5IGRlc2NyaXB0aW9uLApkZXByZWNhdGVkLCBjb25zdCwgZW51bSwgbWlu
aW11bSwgbWF4aW11bSwgbXVsdGlwbGVPZiwgZGVmYXVsdCwgJHJlZgphbmQgb25lT2YgdGhlcmUu
IEl0IHBhc3NlcyBvbmx5IGluc2lkZSBpZi90aGVuLCBhbmQgdGhlIG5ldyBmaWxlIGhhcwpubyBp
Zi90aGVuLiBTbyB0aGUgcHJvcGVydHkgc3RheXMgZmFsc2UsIHdpdGggdGhlIGV4cGxhbmF0aW9u
IGFzIGEKY29tbWVudCBhYm92ZSBpdC4KCj4KPiAob3IgIm5vdDogdHJ1ZSIpCj4KPiA+ICsgICAg
ICAgIHJ4LWludGVybmFsLWRlbGF5LXBzOgo+ID4gKyAgICAgICAgICBkZWZhdWx0OiAwCj4gPiAr
Cj4gPiArICAgICAgICB0eC1pbnRlcm5hbC1kZWxheS1wczogZmFsc2UKPiA+ICsKPiA+ICsgICAg
ICAgICMgRGVwcmVjYXRlZDogbmV3IFNvQ3MgdXNlIHRoZSBzdGFuZGFyZCAqLWludGVybmFsLWRl
bGF5LXBzCj4gPiArICAgICAgICAjIHByb3BlcnRpZXMgaW5zdGVhZC4KPiA+ICsgICAgICAgIGFt
bG9naWMsdHgtZGVsYXktbnM6IGZhbHNlCj4gPiArICAgICAgICBhbWxvZ2ljLHJ4LWRlbGF5LW5z
OiBmYWxzZQo+ID4gKwo+ID4gICAgLSBpZjoKPiA+ICAgICAgICBwcm9wZXJ0aWVzOgo+ID4gICAg
ICAgICAgY29tcGF0aWJsZToKPiA+IEBAIC0xMDYsNiArMTUwLDcgQEAgYWxsT2Y6Cj4gPiAgICAg
ICAgICAgIGNvbnRhaW5zOgo+ID4gICAgICAgICAgICAgIGVudW06Cj4gPiAgICAgICAgICAgICAg
ICAtIGFtbG9naWMsbWVzb24tZzEyYS1kd21hYwo+ID4gKyAgICAgICAgICAgICAgLSBhbWxvZ2lj
LHQ3LWR3bWFjCj4gPiAgICAgIHRoZW46Cj4gPiAgICAgICAgcHJvcGVydGllczoKPiA+ICAgICAg
ICAgIHJ4LWludGVybmFsLWRlbGF5LXBzOgo+ID4gQEAgLTE0Miw2ICsxODcsMTAgQEAgcHJvcGVy
dGllczoKPiA+ICAgICAgICAtIGl0ZW1zOgo+ID4gICAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2lj
LG1lc29uNi1kd21hYwo+ID4gICAgICAgICAgICAtIGNvbnN0OiBzbnBzLGR3bWFjCj4gPiArICAg
ICAgLSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyx0Ny1kd21hYwo+ID4g
KyAgICAgICAgICAtIGNvbnN0OiBzbnBzLGR3bWFjLTUuMTBhCj4gPiArICAgICAgICAgIC0gY29u
c3Q6IHNucHMsZHdtYWMKPgo+IEkgd291bGQgZHJvcCBlaXRoZXIgYm90aCBvciBhdCBsZWFzdCAn
c25wcyxkd21hYycuIFRoZXkgcHJvdmlkZSBubyB2YWx1ZQo+IGJlY2F1c2UgdGhlcmUgaXMgbm90
aGluZyB0byB1c2UgdGhlbS4gSU9XLCB0aGVyZSdzIG5vdCBzL3cgdGhhdCB3b3Jrcwo+IHdoaWNo
IG9ubHkgdW5kZXJzdGFuZHMgdGhlIGxhc3QgMiBhbmQgbm90IGFtbG9naWMsdDctZHdtYWMuIENv
cnJlY3QgbWUKPiBpZiBJJ20gd3JvbmcuIE1heWJlIGEgYm9vdGxvYWRlciB3aXRoIHNpbXBsZSBu
ZWVkcy4KPgo+IFJvYgoKUmlnaHQsIG5vdGhpbmcgdXNlcyB0aGVtOiB0aGUgZ2VuZXJpYyBkcml2
ZXIgY2Fubm90IGVuYWJsZSB0aGUKcGlwZWxpbmUgY2xvY2ssIGFuZCBubyBib290bG9hZGVyIGRy
aXZlcyB0aGlzIHBvcnQgZnJvbSB0aGUgZGV2aWNlCnRyZWUuIHY3IGtlZXBzICJzbnBzLGR3bWFj
LTUuMTBhIiBmb3IgdGhlIGNvcmUgdmVyc2lvbiBhbmQgZHJvcHMKInNucHMsZHdtYWMiLgoKVGhh
bmtzLApMdWNhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
