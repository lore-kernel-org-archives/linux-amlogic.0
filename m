Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF97A606A325
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uv3XYSuu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dWkgBAAP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=42lMQkkWwnAM/gzcb5hMcZUGft8eq3nWRvUoLCb79h4=; b=uv3XYSuub7gpM0GYyt4FRqIXbj
	qSSMcL9h39pPtoncGzC8wfXY4qLIM+UzLQGkADmC4hBc16A8ZvEHPw831eivfoapQAQmIWX3tKdCR
	+L61eWDmb73xAbxhq+1kRiThpLRiHoXyfzlGoD7reOiX05MEHxZTY2HrXy+7Zd2chwkmIqM9EpUMr
	y55HgHNjzArE5sGcDG2z4XCULZd0dri91oUxYJIayTK8Bvj3GbrfNWUynvyz7m7nMldybHY9EaYkV
	hpvtvF1lFyAnA7p+9YGOqdu9MKVgBPAeCqvKpJReZJcGMQ6o9qNVkW0/FMg+/med6fPguAiZ3iTxl
	n2mJnKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVy-000000013f6-1K4v;
	Mon, 09 Nov 2026 15:42:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVu-000000013eG-2oay
	for linux-amlogic@bombadil.infradead.org;
	Mon, 09 Nov 2026 15:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=xG4pMlSywf90fG++ZmuGwd6o+rUWkZppXqxcs9JhM2Y=; b=dWkgBAAP/tdGHjSR5TgKSHgdT0
	RirPMmJejHtxwNKd1ssfJ6ts3vR4JbnA66PKPtuIRLLH7TjHT6P0VN0PMusoxuS8TfuMg/zcS6ogw
	gEUBFK22L2n9l6NQ1OTuYED0G1m0CWZp7btq9Ls1VSwFDV06VBAZ0R7P90GXThLtGi2oDvGtM9xk3
	+EsUlFXzRi9mzah5ebeBYigWv6vsxBNWllqvAsnPyeEIx5YT0miWi6226qj6sgnQdroh4ypfMg7N8
	x7F/rMTY11HWCjMQolfOM2586Clw7ueVIrkchq819FCes4akfnp4G3BTWtH/RovzsX8nhixZ9iMp7
	YKTEf1Zw==;
Received: from mail-yx1-f50.google.com ([74.125.224.50])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVq-00000006tUE-2pkg
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 15:42:29 +0000
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67c24619b19so939988d50.2
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 07:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238944; x=1794843744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xG4pMlSywf90fG++ZmuGwd6o+rUWkZppXqxcs9JhM2Y=;
        b=FFHjH9+YXNfYUK4CjWokXRqBPfJTfjt+Vwciid/dG3WVbO+7vp3ycr8LVAfq8+b+Yr
         W0NxTBwyM5hIUJS0C6dAZdRWgwEGnurzvK0CroQDVH9dHvi0W0LzYLIIa+SXLmL08vLi
         vHIR4DfKxm9gBRrpUQqsxCx0IDdW4KRY0BO5+pHF/85+5DiEizjzS5Ye4k8K747DYwvR
         9cbR21Ukxmo1oKPZzB2YNPrs1Ade/nZVkpns0TIRnapY4h8lthryqejoloZW7FV9WkQ/
         dtvO3xci8ayScPIWqqLUAU+fe53xH+oZqYyAnBFApPx/3dx60N4nWus/J1rLZKNKuWyH
         Kkjg==
X-Forwarded-Encrypted: i=1; AL+hErFHbzXT6q6G+QkTtK5yVm1tV2NL72qiPXxakSh059z7jUMx9CqVhdyOV1c9VKCNaYyUeG4iE6AnSEC2nq+J@lists.infradead.org
X-Gm-Message-State: APuU4Z+j5SPatx1+haKrICaTqtww8Igu6aE3yylSkzRxoAfTtFO3BbIP
	6q9vxj9ivMKmz/gI09OLzD5Agj19IhxSkGXJ+jU+BsHGtmeGwxyJuucGo6ZTSrmsNg4=
X-Gm-Gg: AYBFou26SVgVdkr5OH6oswvkTlUDjoazXiQXJ7toEizIb0kuh+zuDrCMyAOmYcMRrRw
	aYpekQUkaROW/gpjxwTOccUaQoKVC6i9ROoEA0cttwKv88aT+YwEu5WAGTItCilpwDYrVJp5wnB
	Awxn8Zk7Rb1LvCXJHF+SxrvWvJSAttp7EDmTaPWMzkEGyFXjj54vuO2eXeopUXp9VX86TDy8d+N
	AZ4Y+iQyX1wl6FMpUAUhqLJ4G6obCWkCWQYiRKSQ8uluNIUeU0Vmh/9NJ9smzDPrRnTjsrQtLAO
	EWYojs/NM/4T0q+9PyuI6Htw4G/mU3a7nqf/CkI6jXm2EDkQgwk5goyWnPfU64N/BTOD4VJniQB
	PgPIkuBiYvRYEeTh4/spiiEmKzDp0CHHCRfcecNgfaQSsHVqjoAfUl/5Xp1eF4ref1a/dk2sykT
	uKJizmkmeisrxbPEthlvXyqKf8SfUqhCAbXOGbkAA5NKx8Bh6VaE0WdzYsohmxJ3dGSy8GV0zEM
	8XUh+L+6J2/Js8W878n+YpYFIbXIXovdpppWbgU520pceNay+Ous6Znavu/LHSFvreZhPdbNQfc
	o3S2Xldt5QG4FIzzMBaO6Pk+hFSVBQ+FjS4CwWGiEMFZ0VfvH6htHh4b2Wlx2HzBcEVIfhoPloz
	C+HLpN9Ks0ocV39pwp0iX47p13pyRafVlFdwjSrUFdn1VpOLs5b90p+Ui
X-Received: by 2002:a05:690e:4401:b0:679:ab08:5285 with SMTP id 956f58d0204a3-67c3da612admr1706850d50.82.1794238943845;
        Mon, 09 Nov 2026 07:42:23 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b90b2aasm4214819d50.6.2026.11.09.07.42.23
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:42:23 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b300713befso7502047b3.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 07:42:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErENN6EMKWfefuFPwzA3df9caIO7AAgJSt/UuFtq/lyifHWcY136IFHcyLMpx2JdIEE58h16Wu6ct0N0mBWe@lists.infradead.org
X-Received: by 2002:a05:690c:c4e6:b0:8ae:8d28:77be with SMTP id
 00721157ae682-8b36c8542c6mr28200577b3.1.1794238943160; Mon, 09 Nov 2026
 07:42:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103163715.385394-1-tanure@linux.com> <20261103163715.385394-3-tanure@linux.com>
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
In-Reply-To: <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 9 Nov 2026 15:42:11 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1OMHo_VWD2+0RUfF6EUNbLLNZafDuHxCBzU_qALBa2hQ@mail.gmail.com>
X-Gm-Features: AclHuK81wJVzU4rFeRI7sUHF0-2FEAkn5jMEtF1UQ-EscSMzMfyyODCM_UAkaVg
Message-ID: <CAJX_Q+1OMHo_VWD2+0RUfF6EUNbLLNZafDuHxCBzU_qALBa2hQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_154227_002183_8C759164 
X-CRM114-Status: GOOD (  23.39  )
X-Spam-Score: 1.1 (+)
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

T24gVGh1LCBOb3YgNSwgMjAyNiBhdCAxMTo1N+KAr0FNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE5vdiAwMywgMjAyNiBhdCAwNDozNzox
MFBNICswMDAwLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPgo+ID4gQXNzaXN0ZWQtYnk6IExMTQo+
Cj4gRHJvcCB0aGlzIG9uZS4KPgo+ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51
cmVAbGludXguY29tPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29u
LWR3bWFjLnlhbWwgICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA1OSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNvbi1kd21hYy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwK
PiA+IGluZGV4IGU3NjljOWJiNzBkOC4uNmRlMDEzZTNlOGY2IDEwMDY0NAo+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlh
bWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dp
YyxtZXNvbi1kd21hYy55YW1sCj4gPiBAQCAtMjMsNiArMjMsNyBAQCBzZWxlY3Q6Cj4gPiAgICAg
ICAgICAgIC0gYW1sb2dpYyxtZXNvbi1neGJiLWR3bWFjCj4gPiAgICAgICAgICAgIC0gYW1sb2dp
YyxtZXNvbi1heGctZHdtYWMKPiA+ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHdt
YWMKPiA+ICsgICAgICAgICAgLSBhbWxvZ2ljLHQ3LWR3bWFjCj4gPiAgICByZXF1aXJlZDoKPiA+
ICAgICAgLSBjb21wYXRpYmxlCj4gPgo+ID4gQEAgLTU3LDYgKzU4LDU5IEBAIGFsbE9mOgo+ID4g
ICAgICAgICAgICAgIC0gY29uc3Q6IGNsa2luMQo+ID4gICAgICAgICAgICAgIC0gY29uc3Q6IHRp
bWluZy1hZGp1c3RtZW50Cj4gPgo+ID4gKyAgLSBpZjoKPiA+ICsgICAgICBwcm9wZXJ0aWVzOgo+
ID4gKyAgICAgICAgY29tcGF0aWJsZToKPiA+ICsgICAgICAgICAgY29udGFpbnM6Cj4gPiArICAg
ICAgICAgICAgY29uc3Q6IGFtbG9naWMsdDctZHdtYWMKPiA+ICsgICAgdGhlbjoKPiA+ICsgICAg
ICBwcm9wZXJ0aWVzOgo+ID4gKyAgICAgICAgY2xvY2tzOgo+ID4gKyAgICAgICAgICBpdGVtczoK
PiA+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBHTUFDIG1haW4gY2xvY2sKPiA+ICsgICAg
ICAgICAgICAtIGRlc2NyaXB0aW9uOiBGaXJzdCBwYXJlbnQgY2xvY2sgb2YgdGhlIGludGVybmFs
IG11eAo+ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IFNlY29uZCBwYXJlbnQgY2xvY2sg
b2YgdGhlIGludGVybmFsIG11eAo+ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246Cj4gPiAr
ICAgICAgICAgICAgICAgIGNsb2NrIG9mIHRoZSBwaXBlbGluZSBzdGFnZSBpbnNlcnRlZCBpbiB0
aGUgYnVzIHBhdGggYmV0d2Vlbgo+ID4gKyAgICAgICAgICAgICAgICB0aGUgY29udHJvbGxlciBh
bmQgdGhlIERSQU0uIFdpdGhvdXQgaXQsIHRoZSBjb250cm9sbGVyIGNhbm5vdAo+ID4gKyAgICAg
ICAgICAgICAgICBjb21wbGV0ZSBETUEgdHJhbnNmZXJzLgo+ID4gKyAgICAgICAgICAgIC0gZGVz
Y3JpcHRpb246Cj4gPiArICAgICAgICAgICAgICAgIGNsb2NrIG9mIHRoZSByZWdpc3RlciBibG9j
ayBob2xkaW5nIFBSR19FVEgwIGFuZCBQUkdfRVRIMS4KPiA+ICsgICAgICAgICAgICAgICAgV2l0
aG91dCBpdCwgdGhlIGJsb2NrIHJlYWRzIGFzIHplcm8gYW5kIGlnbm9yZXMgd3JpdGVzLgo+Cj4g
VGhpcyBzb3VuZHMgbGlrZSB5b3UgdGFrZSBjbG9jayBmcm9tIG90aGVyIGJsb2NrLiBUaGF0J3Mg
d3JvbmcsIHRoYXQKPiBkZXZpY2Ugc2hvdWxkIHRha2UgaXRzIG93biBjbG9jay4KCkl0IGlzIHRo
aXMgZGV2aWNlJ3MgY2xvY2ssIHRoZSBkZXNjcmlwdGlvbiBpcyBtaXNsZWFkaW5nLiBQUkdfRVRI
MCBhbmQKUFJHX0VUSDEgYXJlIHRoZSBnbHVlIHJlZ2lzdGVycyBvZiB0aGlzIGNvbnRyb2xsZXIs
IHRoZSBzZWNvbmQgcmVnCmVudHJ5IG9mIHRoZSBub2RlLiBUaGUgZ2F0ZSBpcyBuYW1lZCBhZnRl
ciB0aGUgUEhZIGJsb2NrIGF0CjB4ZmUwMjgwMDAsIHdoaWNoIHRoZSBtZGlvIG11bHRpcGxleGVy
IG5vZGUgbGlzdHMgdG9vLCBidXQgaXQgYWxzbwpmZWVkcyB0aGVzZSByZWdpc3RlcnM6IHdpdGgg
aXQgb2ZmIHRoZXkgcmVhZCBhcyB6ZXJvIGFuZCBpZ25vcmUKd3JpdGVzLCBhbmQgbm8gb3RoZXIg
Z2F0ZSBicmluZ3MgdGhlbSBiYWNrLiBUaGUgc3RtbWFjIGNvcmUgZW5hYmxlcwoicGNsayIgYmVm
b3JlIHRvdWNoaW5nIHRoZW0uIHY3IHdpbGwgc2F5OgoKICAgICAgICAgICAgLSBkZXNjcmlwdGlv
bjoKICAgICAgICAgICAgICAgIEFQQiBjbG9jayBvZiB0aGUgZ2x1ZSByZWdpc3RlcnMgUFJHX0VU
SDAgYW5kIFBSR19FVEgxLgogICAgICAgICAgICAgICAgV2l0aG91dCBpdCwgdGhleSByZWFkIGFz
IHplcm8gYW5kIGlnbm9yZSB3cml0ZXMuCgpUaGFua3MsCkx1Y2FzCgo+Cj4KPiA+ICsKPiA+ICsg
ICAgICAgIGNsb2NrLW5hbWVzOgo+ID4gKyAgICAgICAgICBpdGVtczoKPiA+ICsgICAgICAgICAg
ICAtIGNvbnN0OiBzdG1tYWNldGgKPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBjbGtpbjAKPiA+
ICsgICAgICAgICAgICAtIGNvbnN0OiBjbGtpbjEKPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBw
aXBlbGluZQo+ID4gKyAgICAgICAgICAgIC0gY29uc3Q6IHBjbGsKPiA+ICsKPiA+ICsgICAgICAg
ICMgVGhlIFBIWSBhZGRzIHRoZSAybnMgUkdNSUkgZGVsYXlzLCBzZWUgZXRoZXJuZXQtY29udHJv
bGxlci55YW1sLgo+ID4gKyAgICAgICAgIyBUaGUgUlggZGVsYXkgbGluZSBvZiB0aGlzIGdsdWUg
aXMgZmluZSB0dW5pbmcgaW4gMjAwcHMgc3RlcHMsCj4gPiArICAgICAgICAjIGFkZGVkIG9uIHRv
cCBvZiB3aGF0IHBoeS1tb2RlIGRlc2NyaWJlcy4gVGhlIFRYIHNpZGUgaGFzIG5vIGZpbmUKPiA+
ICsgICAgICAgICMgdHVuaW5nOiBpdHMgb25seSBzdGVwIGlzIGEgcXVhcnRlciBvZiB0aGUgY2xv
Y2sgcGVyaW9kLCB0aGUgZnVsbAo+ID4gKyAgICAgICAgIyAybnMgYXQgMUdiaXQvcywgc28gdGhl
IFRYIHByb3BlcnR5IGlzIG5vdCBhY2NlcHRlZC4KPiA+ICsgICAgICAgIHR4LWludGVybmFsLWRl
bGF5LXBzOiBmYWxzZQo+ID4gKwo+ID4gKyAgICAgICAgIyBEZXByZWNhdGVkOiBuZXcgU29DcyB1
c2UgdGhlIHN0YW5kYXJkICotaW50ZXJuYWwtZGVsYXktcHMKPiA+ICsgICAgICAgICMgcHJvcGVy
dGllcyBpbnN0ZWFkLgo+ID4gKyAgICAgICAgYW1sb2dpYyx0eC1kZWxheS1uczogZmFsc2UKPiA+
ICsgICAgICAgIGFtbG9naWMscngtZGVsYXktbnM6IGZhbHNlCj4gPiArCj4gPiArICAjIERlbGF5
IGRlZmluaXRpb25zIGZvciBNZXNvbjhiIGFuZCBuZXdlcgo+ID4gKyAgLSBpZjoKPiA+ICsgICAg
ICBwcm9wZXJ0aWVzOgo+ID4gKyAgICAgICAgY29tcGF0aWJsZToKPiA+ICsgICAgICAgICAgY29u
dGFpbnM6Cj4gPiArICAgICAgICAgICAgZW51bToKPiA+ICsgICAgICAgICAgICAgIC0gYW1sb2dp
YyxtZXNvbjhiLWR3bWFjCj4gPiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb244bTItZHdt
YWMKPiA+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1neGJiLWR3bWFjCj4gPiArICAg
ICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tYXhnLWR3bWFjCj4gPiArICAgICAgICAgICAgICAt
IGFtbG9naWMsbWVzb24tZzEyYS1kd21hYwo+ID4gKyAgICB0aGVuOgo+ID4gKyAgICAgIHByb3Bl
cnRpZXM6Cj4gPiAgICAgICAgICBhbWxvZ2ljLHR4LWRlbGF5LW5zOgo+ID4gICAgICAgICAgICBl
bnVtOiBbMCwgMiwgNCwgNl0KPiA+ICAgICAgICAgICAgZGVmYXVsdDogMgo+ID4gQEAgLTEwNiw2
ICsxNjAsNyBAQCBhbGxPZjoKPiA+ICAgICAgICAgICAgY29udGFpbnM6Cj4gPiAgICAgICAgICAg
ICAgZW51bToKPiA+ICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1nMTJhLWR3bWFjCj4g
PiArICAgICAgICAgICAgICAtIGFtbG9naWMsdDctZHdtYWMKPiA+ICAgICAgdGhlbjoKPiA+ICAg
ICAgICBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgcngtaW50ZXJuYWwtZGVsYXktcHM6Cj4gPiBA
QCAtMTQyLDYgKzE5NywxMCBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgIC0gaXRlbXM6Cj4gPiAg
ICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb242LWR3bWFjCj4gPiAgICAgICAgICAgIC0g
Y29uc3Q6IHNucHMsZHdtYWMKPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgICAtIGNv
bnN0OiBhbWxvZ2ljLHQ3LWR3bWFjCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHNucHMsZHdtYWMt
NS4xMGEKPiA+ICsgICAgICAgICAgLSBjb25zdDogc25wcyxkd21hYwo+Cj4gSSBzZWUgbm8gc3Vj
aCBodW5rIGluIHRoZSBjb2RlLCBzbyBub3Qgc3VyZSBob3cgdG8gcmV2aWV3IHRoaXMuCj4KPiBC
ZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
