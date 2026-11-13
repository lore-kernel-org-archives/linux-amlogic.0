Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1914F606A321
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=408C3Mxz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eDEum+mEE9PNCe8uyBKI06QxNHmq9BA9j29YY6bgo9w=; b=408C3MxzDdyMZLW21g4N18VvmZ
	p5uZXLswRNI+FZmnqjTBDZHmv9bSRvqRBuz3Q0ggx5sChaimmXjIzb1IwPf9LCN9/J/LoKhX+Ykmw
	k3t46RY54dqy1iO6oSkAxxJ5RR+ltAFmj2vTRAA15bYSNzhQBTNOCNG5JIRYqka/5iUalD1Q5dwQB
	ag7zCyEcKuHge476CAoMxd1bGAJMCbcFZQ7dF6TJOzn1sBwtw+Q8JSLD+uIvzwdGx+jSeOXjGkbf+
	pcD29h8Ulu72HRISipAr87Nmk9FmJwAaGekXaarhPExAw6t9SboIjih8A5Jem97Rqeq2uj9zPtJEa
	mzJYmaTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpdy-0000000CYmg-3B3Z;
	Fri, 13 Nov 2026 11:40:34 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpdv-0000000CYkv-2JYE
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 11:40:33 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b349d21fd1so5486677b3.2
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 03:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570030; x=1795174830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1+NgW92VziZf9PgBdzApbIe2BkR1TvVvXtYjUT220A=;
        b=gj9ZmBocWYh35987qYiUkjKuKgaNzBzAt2kAOvDTI9FiF1V+YPd+JC1ddH8AG0o1wN
         zcXlq4KIBapWaxPmvFtcA/UTmTekvTebGHSap+ZVuh80ak5KJ8usK+w5wSZxkwqONn/c
         deWzMYA6mT/oWv0iUnhvcz/QtQR4LoShTocSuYjMTlLEBcV7tZnyvOdye5vYU/P2+7E5
         ARpCOpaEXZwJjWj+HCeiskcLS8ycqKJJ5B+tEeA827IeNnaSrokCDFuf5YUjvw3pj/+E
         cUM2sf/Az47vf4f5MU/zDM5PyMOA9P3Om/fXyJsV2rIHScmTtCUhmiLZU79K+GD5mUQ0
         /0uw==
X-Forwarded-Encrypted: i=1; AL+hErFkvGoUcz5o5q1v6EgRdQg6EK18KBgbjqM0RKAv/pRL7yZStMjBOV9ywpLo9Vrbdq2rZ2zrwF1VjXpMXBDK@lists.infradead.org
X-Gm-Message-State: APuU4Z8BrJP6w6OOghlOwWmPzH7sqQsV8d38BzXtx7sp69DMx9+2P325
	rR+M1/eHWNnMBr+KMWHV69gmRCtJdkGnRUjx0UZx2CQ9MRmMhLwjezom3wyPSy3jJPY=
X-Gm-Gg: AYBFou2h0zW3K5gDFp87ss6kU3ItBzKVLOe0FOFWLi42dlEy6bNPbLTriUazMZVbrU0
	0WVmiGZq0ljnd9g8aW0gbzpkX8wKx8AxjUZUZd+2i59iXOjQQgnw+KDe6y/pa1b+YP7iGblC6Bj
	rSVeusYh7gh/XjlfDyN7O5Ig3yoPuZqCZWfeA83aSJlKhb/cn/dY24dFVuyLE2q8JUNJiuCtNbf
	XxTIcBNugFKz1Hz95f9HdLuPEnJiruEYbpBTEg13kj7V5wVr2IN0IVou/dzRH2w0Hl5CVVAcPFr
	b15YNFl84ax6Tz/QLO0TGXlnBKza4HS9xeoOrbu7IjVIiD6/5hwzEQww+DiiNPXBbr63xuGxPtz
	e4NLVBRozC66RJv0nVwTOcaQlJI45jTaNjbY4wU3jQUjlhhBa/yBcexZ8rUpCtWmHmEtw9RM6jF
	EuDJoxed7hPiu3fslaOYgmZixwy6sCyRxhjMfW4M4ywlVzAOMYs7DPNvntE22z542fbXj+8n90S
	OekHUP2xC9ESWuxILzZ/vrC47r5DD8UW7qvlP+eZbVBfOWhYLcn19E523oNKiKZ4OGnF8a9B5s0
	Gu+HsZpWBN2eqTtHaRhOa3q2GeBnHT5kFfDpKbq2mFDtiUbQaRO8XmO9WAxPChbQnJeJxVgaKFr
	ugn2CHMKwzqPcsOqfFMLMO7vksKn2pHcdccRJCpejOHEKxueU9l9F0Q==
X-Received: by 2002:a05:690c:e1db:10b0:8ac:805b:3a81 with SMTP id 00721157ae682-8b4aa38fb83mr8048387b3.93.1794570029810;
        Fri, 13 Nov 2026 03:40:29 -0800 (PST)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com. [74.125.224.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98b9a8sm17649257b3.26.2026.11.13.03.40.29
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 03:40:29 -0800 (PST)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so914038d50.2
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 03:40:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHYOJev5jqcT3zkq/j7dnLXuifIad+ytbzP8//sQD+bDKrqrztKaejhRyQdhoB4Ehi/7x6Yo30lt9hjfuz/@lists.infradead.org
X-Received: by 2002:a05:690c:f85:b0:8b3:45b:a4f3 with SMTP id
 00721157ae682-8b4aa350595mr13731467b3.83.1794570029115; Fri, 13 Nov 2026
 03:40:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103163715.385394-1-tanure@linux.com> <20261103163715.385394-3-tanure@linux.com>
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll> <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
 <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com> <bbe0dedf-4b02-4cc6-97be-accfc06baa10@amlogic.com>
In-Reply-To: <bbe0dedf-4b02-4cc6-97be-accfc06baa10@amlogic.com>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 13 Nov 2026 11:40:16 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc1gAjr=FN1p+aTdumpw@mail.gmail.com>
X-Gm-Features: AclHuK9I2BMo6FvBmijHWWypkJRsPu48XUE9NXvVmMxUtTJAFVoacoB_pnoFyzs
Message-ID: <CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc1gAjr=FN1p+aTdumpw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, xianwei.zhao@amlogic.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
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
X-CRM114-CacheID: sfid-20261113_034031_637666_57CE61EC 
X-CRM114-Status: GOOD (  33.35  )
X-Spam-Score: -0.8 (/)
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

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMTE6NDPigK9BTSBDaHVhbiBMaXUgPGNodWFuLmxpdUBh
bWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPiBIaSBMdWNhcywKPgo+IE9uIDExLzkvMjAyNiAxMTo0MyBQ
TSwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gPgo+ID4gT24g
RnJpLCBOb3YgNiwgMjAyNiBhdCAzOjE24oCvQU0gQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dp
Yy5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gSGkgS3J6eXN6dG9mLCBMdWNhcywKPiA+Pgo+ID4+IE9u
IDExLzUvMjAyNiA3OjU3IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4+PiBbIEVY
VEVSTkFMIEVNQUlMIF0KPiA+Pj4KPiA+Pj4gT24gVHVlLCBOb3YgMDMsIDIwMjYgYXQgMDQ6Mzc6
MTBQTSArMDAwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IEFzc2lzdGVkLWJ5
OiBMTE0KPiA+Pj4KPiA+Pj4gRHJvcCB0aGlzIG9uZS4KPiA+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gICAg
Li4uL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwgICAgIHwgNTkgKysrKysr
KysrKysrKysrKysrKwo+ID4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKykK
PiA+Pj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbAo+ID4+Pj4gaW5kZXggZTc2
OWM5YmI3MGQ4Li42ZGUwMTNlM2U4ZjYgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbAo+ID4+Pj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29u
LWR3bWFjLnlhbWwKPiA+Pj4+IEBAIC0yMyw2ICsyMyw3IEBAIHNlbGVjdDoKPiA+Pj4+ICAgICAg
ICAgICAgICAtIGFtbG9naWMsbWVzb24tZ3hiYi1kd21hYwo+ID4+Pj4gICAgICAgICAgICAgIC0g
YW1sb2dpYyxtZXNvbi1heGctZHdtYWMKPiA+Pj4+ICAgICAgICAgICAgICAtIGFtbG9naWMsbWVz
b24tZzEyYS1kd21hYwo+ID4+Pj4gKyAgICAgICAgICAtIGFtbG9naWMsdDctZHdtYWMKPiA+Pj4+
ICAgICAgcmVxdWlyZWQ6Cj4gPj4+PiAgICAgICAgLSBjb21wYXRpYmxlCj4gPj4+Pgo+ID4+Pj4g
QEAgLTU3LDYgKzU4LDU5IEBAIGFsbE9mOgo+ID4+Pj4gICAgICAgICAgICAgICAgLSBjb25zdDog
Y2xraW4xCj4gPj4+PiAgICAgICAgICAgICAgICAtIGNvbnN0OiB0aW1pbmctYWRqdXN0bWVudAo+
ID4+Pj4KPiA+Pj4+ICsgIC0gaWY6Cj4gPj4+PiArICAgICAgcHJvcGVydGllczoKPiA+Pj4+ICsg
ICAgICAgIGNvbXBhdGlibGU6Cj4gPj4+PiArICAgICAgICAgIGNvbnRhaW5zOgo+ID4+Pj4gKyAg
ICAgICAgICAgIGNvbnN0OiBhbWxvZ2ljLHQ3LWR3bWFjCj4gPj4+PiArICAgIHRoZW46Cj4gPj4+
PiArICAgICAgcHJvcGVydGllczoKPiA+Pj4+ICsgICAgICAgIGNsb2NrczoKPiA+Pj4+ICsgICAg
ICAgICAgaXRlbXM6Cj4gPj4+PiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogR01BQyBtYWlu
IGNsb2NrCj4gPj4+PiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogRmlyc3QgcGFyZW50IGNs
b2NrIG9mIHRoZSBpbnRlcm5hbCBtdXgKPiA+Pj4+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9u
OiBTZWNvbmQgcGFyZW50IGNsb2NrIG9mIHRoZSBpbnRlcm5hbCBtdXgKPiA+Pj4+ICsgICAgICAg
ICAgICAtIGRlc2NyaXB0aW9uOgo+ID4+Pj4gKyAgICAgICAgICAgICAgICBjbG9jayBvZiB0aGUg
cGlwZWxpbmUgc3RhZ2UgaW5zZXJ0ZWQgaW4gdGhlIGJ1cyBwYXRoIGJldHdlZW4KPiA+Pj4+ICsg
ICAgICAgICAgICAgICAgdGhlIGNvbnRyb2xsZXIgYW5kIHRoZSBEUkFNLiBXaXRob3V0IGl0LCB0
aGUgY29udHJvbGxlciBjYW5ub3QKPiA+Pj4+ICsgICAgICAgICAgICAgICAgY29tcGxldGUgRE1B
IHRyYW5zZmVycy4KPiA+Pj4+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOgo+ID4+Pj4gKyAg
ICAgICAgICAgICAgICBjbG9jayBvZiB0aGUgcmVnaXN0ZXIgYmxvY2sgaG9sZGluZyBQUkdfRVRI
MCBhbmQgUFJHX0VUSDEuCj4gPj4+PiArICAgICAgICAgICAgICAgIFdpdGhvdXQgaXQsIHRoZSBi
bG9jayByZWFkcyBhcyB6ZXJvIGFuZCBpZ25vcmVzIHdyaXRlcy4KPiA+Pj4KPiA+Pj4gVGhpcyBz
b3VuZHMgbGlrZSB5b3UgdGFrZSBjbG9jayBmcm9tIG90aGVyIGJsb2NrLiBUaGF0J3Mgd3Jvbmcs
IHRoYXQKPiA+Pj4gZGV2aWNlIHNob3VsZCB0YWtlIGl0cyBvd24gY2xvY2suCj4gPj4KPiA+PiBJ
IHNlZSB0aGF0IHRoZSBjbG9jayBpbiB0aGUgZHRzIHBhdGNoIGNvcnJlc3BvbmRzIHRvIDwmY2xr
Y19wZXJpcGhzCj4gPj4gQ0xLSURfU1lTX0VUSFBIWT4uIFRoaXMgY2xvY2sgcHJvdmlkZXMgdGhl
IHdvcmtpbmcgY2xvY2sgZm9yIHRoZSBBUEIgQnVzCj4gPj4gb2YgdGhlIEVUSCBQSFkgY29udHJv
bGxlciwgYW5kIHRoaXMgY2xvY2sgd2lsbCBhZmZlY3QgdGhlIHJlZ2lzdGVyCj4gPj4gcmVhZGlu
ZyBhbmQgd3JpdGluZyBvZiB0aGUgRVRIIFBIWSAoaW5jbHVkaW5nIHRoZSBFVEhfUExMKS4gU2Vl
IHNlY3Rpb24KPiA+PiAxNS4zLjQuMiBSZWdpc3RlckRlc2NyaXB0aW9uIGluIEEzMTFEMiBEYXRh
c2hlZXQgZm9yIGRldGFpbHMuCj4gPgo+ID4gVGhhbmtzLiBUaGF0IHNlY3Rpb24gaXMgdGhlIFBI
WSBibG9jayBhdCAweGZlMDI4MDAwLCB0aGUgcmVnaW9uIG9mIHRoZQo+ID4gbWRpbyBtdWx0aXBs
ZXhlciBub2RlLiBUaGUgcmVnaXN0ZXJzIGluIHRoaXMgZGVzY3JpcHRpb24gYXJlIFBSR19FVEgw
Cj4gPiBhbmQgUFJHX0VUSDEgaW4gZXRoX3RvcCBhdCAweGZlMDI0MDAwLiBPbiB0aGUgVklNNCB0
aGUgc2FtZSBnYXRlIGZlZWRzCj4gPiB0aGVtIHRvbzogd2l0aCBpdCBvZmYgdGhleSByZWFkIGFz
IHplcm8gYW5kIGlnbm9yZSB3cml0ZXMuIE15IGRhdGFzaGVldAo+ID4gcmV2aXNpb25zIGRvIG5v
dCBzYXkgd2hpY2ggY2xvY2sgZmVlZHMgZXRoX3RvcC4gQ2FuIHlvdSBjb25maXJtIGl0IGlzCj4g
PiB0aGlzIG9uZT8KPgo+IFRoZSBpbmZvcm1hdGlvbiBJIGNhbiBjb25maXJtIGlzOgo+ICAgIC0g
VGhlIGJhc2UgYWRkcmVzcyBvZiBldGhfcGh5IGlzIDB4ZmUwMjgwMDAsIGFuZCBpdHMgY29ycmVz
cG9uZGluZwo+IEFQQiBjbG9jayBpcyA8JmNsa2NfcGVyaXBocyBDTEtJRF9TWVNfRVRIUEhZPi4K
PiAgICAtIFRoZSBiYXNlIGFkZHJlc3Mgb2YgZXRoX3RvcCBpcyAweGZlMDI0MDAwLCBhbmQgdGhl
IGJhc2UgYWRkcmVzcyBvZgo+IGV0aF9tYWMgaXMgMHhmZGMwMDAwMDsgdGhlaXIgY29ycmVzcG9u
ZGluZyBBUEIgY2xvY2sgaXMgPCZjbGtjX3BlcmlwaHMKPiBDTEtJRF9TWVNfRVRIPi4KClRoYXQg
aXMgbm90IHdoYXQgdGhlIFZJTTQgZG9lcy4gVGhlIHN0bW1hYyBjb3JlIGVuYWJsZXMKQ0xLSURf
U1lTX0VUSCBiZWZvcmUgYW55IGdsdWUgY29kZSBydW5zLiBXaXRoIHRoYXQgY2xvY2sgb24gYW5k
CkNMS0lEX1NZU19FVEhQSFkgb2ZmLCBQUkdfRVRIMCBhbmQgUFJHX0VUSDEgcmVhZCBhcyB6ZXJv
IGFuZCB0aGUKZHJpdmVyJ3Mgd3JpdGVzIGFyZSBsb3N0OiBVLUJvb3QncyAweGEwMDAwIHdhcyBz
dGlsbCBpbiBQUkdfRVRIMQphZnRlciB0aGUgZHJpdmVyIGhhZCB3cml0dGVuIDAuIEVuYWJsaW5n
IENMS0lEX1NZU19FVEhQSFkgcmlnaHQKYmVmb3JlIHRoZSB3cml0ZSBtYWtlcyBpdCBsYW5kLiBU
aGF0IHdhcyB0aGUgdjMgYnVnLCBldmVyeSBmcmFtZSBhCkNSQyBlcnJvci4gSSByZXBlYXRlZCBp
dCB0b2RheSBvbiB0aGUgcnVubmluZyBrZXJuZWwsIHRvZ2dsaW5nIG9ubHkKYml0IDQgb2YgQ0xL
Q1RSTF9TWVNfQ0xLX0VOMF9SRUcwIGZyb20gdXNlciBzcGFjZSwgZXZlcnkgb3RoZXIgZ2F0ZQps
ZWZ0IG9uOgoKICBib3RoIGdhdGVzIG9uICAgICAgICBFTjA9ZmZmZmZmZmYgRU4xPWZmZmZmZmZm
IFBSR19FVEgwPTAwMDAxNjAxCiAgZXRocGh5IG9mZiwgZXRoIG9uICAgRU4wPWZmZmZmZmVmIEVO
MT1mZmZmZmZmZiBQUkdfRVRIMD0wMDAwMDAwMAogIGV0aHBoeSByZXN0b3JlZCAgICAgIEVOMD1m
ZmZmZmZmZiBFTjE9ZmZmZmZmZmYgUFJHX0VUSDA9MDAwMDE2MDEKClNvIG9uIHRoaXMgY2hpcCBD
TEtJRF9TWVNfRVRIIGFsb25lIGRvZXMgbm90IGdpdmUgYWNjZXNzIHRvIGV0aF90b3AuCkNvdWxk
IHRoZSByZWdpc3RlciBpbnRlcmZhY2Ugb2YgZXRoX3RvcCBzaXQgYmVoaW5kIHRoZSBldGhfcGh5
IEFQQgpzbGF2ZT8gRWl0aGVyIHdheSB0aGUgTUFDIG5vZGUgaGFzIHRvIGVuYWJsZSBDTEtJRF9T
WVNfRVRIUEhZLCBhbmQKdGhlIGJpbmRpbmcgd2lsbCBkZXNjcmliZSBpdCBhcyB0aGUgY2xvY2sg
b2YgdGhlIGdsdWUgcmVnaXN0ZXJzLgoKPgo+IFRoZSBDUFUgcmVhZHMgYW5kIHdyaXRlcyB0aGUg
cmVnaXN0ZXJzIG9mIHRoZXNlIHBlcmlwaGVyYWwgY29udHJvbGxlcnMKPiAob3IgUHJvY2Vzc2lu
ZyBVbml0cykgdmlhIHRoZSBBUEIuIENvbnNlcXVlbnRseSwgdGhlIHJlZ2lzdGVycyBvZiB0aGVz
ZQo+IGNvbnRyb2xsZXJzIGNhbm5vdCBiZSByZWFkIGFuZCB3cml0dGVuIHByb3Blcmx5IGlmIHRo
ZSBjb3JyZXNwb25kaW5nIEFQQgo+IGNsb2NrIChzeXNfY2xrL2NsazgxKSBpcyBub3QgZW5hYmxl
ZC4KPgo+ID4KPiA+IFRoYW5rcywKPiA+IEx1Y2FzCj4gPgo+ID4+Cj4gPj4+Cj4gPj4+Cj4gPj4+
PiArCj4gPj4+PiArICAgICAgICBjbG9jay1uYW1lczoKPiA+Pj4+ICsgICAgICAgICAgaXRlbXM6
Cj4gPj4+PiArICAgICAgICAgICAgLSBjb25zdDogc3RtbWFjZXRoCj4gPj4+PiArICAgICAgICAg
ICAgLSBjb25zdDogY2xraW4wCj4gPj4+PiArICAgICAgICAgICAgLSBjb25zdDogY2xraW4xCj4g
Pj4+PiArICAgICAgICAgICAgLSBjb25zdDogcGlwZWxpbmUKPiA+Pj4+ICsgICAgICAgICAgICAt
IGNvbnN0OiBwY2xrCj4gPj4+PiArCj4gPj4+PiArICAgICAgICAjIFRoZSBQSFkgYWRkcyB0aGUg
Mm5zIFJHTUlJIGRlbGF5cywgc2VlIGV0aGVybmV0LWNvbnRyb2xsZXIueWFtbC4KPiA+Pj4+ICsg
ICAgICAgICMgVGhlIFJYIGRlbGF5IGxpbmUgb2YgdGhpcyBnbHVlIGlzIGZpbmUgdHVuaW5nIGlu
IDIwMHBzIHN0ZXBzLAo+ID4+Pj4gKyAgICAgICAgIyBhZGRlZCBvbiB0b3Agb2Ygd2hhdCBwaHkt
bW9kZSBkZXNjcmliZXMuIFRoZSBUWCBzaWRlIGhhcyBubyBmaW5lCj4gPj4+PiArICAgICAgICAj
IHR1bmluZzogaXRzIG9ubHkgc3RlcCBpcyBhIHF1YXJ0ZXIgb2YgdGhlIGNsb2NrIHBlcmlvZCwg
dGhlIGZ1bGwKPiA+Pj4+ICsgICAgICAgICMgMm5zIGF0IDFHYml0L3MsIHNvIHRoZSBUWCBwcm9w
ZXJ0eSBpcyBub3QgYWNjZXB0ZWQuCj4gPj4+PiArICAgICAgICB0eC1pbnRlcm5hbC1kZWxheS1w
czogZmFsc2UKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgICAgICMgRGVwcmVjYXRlZDogbmV3IFNvQ3Mg
dXNlIHRoZSBzdGFuZGFyZCAqLWludGVybmFsLWRlbGF5LXBzCj4gPj4+PiArICAgICAgICAjIHBy
b3BlcnRpZXMgaW5zdGVhZC4KPiA+Pj4+ICsgICAgICAgIGFtbG9naWMsdHgtZGVsYXktbnM6IGZh
bHNlCj4gPj4+PiArICAgICAgICBhbWxvZ2ljLHJ4LWRlbGF5LW5zOiBmYWxzZQo+ID4+Pj4gKwo+
ID4+Pj4gKyAgIyBEZWxheSBkZWZpbml0aW9ucyBmb3IgTWVzb244YiBhbmQgbmV3ZXIKPiA+Pj4+
ICsgIC0gaWY6Cj4gPj4+PiArICAgICAgcHJvcGVydGllczoKPiA+Pj4+ICsgICAgICAgIGNvbXBh
dGlibGU6Cj4gPj4+PiArICAgICAgICAgIGNvbnRhaW5zOgo+ID4+Pj4gKyAgICAgICAgICAgIGVu
dW06Cj4gPj4+PiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb244Yi1kd21hYwo+ID4+Pj4g
KyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uOG0yLWR3bWFjCj4gPj4+PiArICAgICAgICAg
ICAgICAtIGFtbG9naWMsbWVzb24tZ3hiYi1kd21hYwo+ID4+Pj4gKyAgICAgICAgICAgICAgLSBh
bWxvZ2ljLG1lc29uLWF4Zy1kd21hYwo+ID4+Pj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1l
c29uLWcxMmEtZHdtYWMKPiA+Pj4+ICsgICAgdGhlbjoKPiA+Pj4+ICsgICAgICBwcm9wZXJ0aWVz
Ogo+ID4+Pj4gICAgICAgICAgICBhbWxvZ2ljLHR4LWRlbGF5LW5zOgo+ID4+Pj4gICAgICAgICAg
ICAgIGVudW06IFswLCAyLCA0LCA2XQo+ID4+Pj4gICAgICAgICAgICAgIGRlZmF1bHQ6IDIKPiA+
Pj4+IEBAIC0xMDYsNiArMTYwLDcgQEAgYWxsT2Y6Cj4gPj4+PiAgICAgICAgICAgICAgY29udGFp
bnM6Cj4gPj4+PiAgICAgICAgICAgICAgICBlbnVtOgo+ID4+Pj4gICAgICAgICAgICAgICAgICAt
IGFtbG9naWMsbWVzb24tZzEyYS1kd21hYwo+ID4+Pj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2lj
LHQ3LWR3bWFjCj4gPj4+PiAgICAgICAgdGhlbjoKPiA+Pj4+ICAgICAgICAgIHByb3BlcnRpZXM6
Cj4gPj4+PiAgICAgICAgICAgIHJ4LWludGVybmFsLWRlbGF5LXBzOgo+ID4+Pj4gQEAgLTE0Miw2
ICsxOTcsMTAgQEAgcHJvcGVydGllczoKPiA+Pj4+ICAgICAgICAgIC0gaXRlbXM6Cj4gPj4+PiAg
ICAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbjYtZHdtYWMKPiA+Pj4+ICAgICAgICAg
ICAgICAtIGNvbnN0OiBzbnBzLGR3bWFjCj4gPj4+PiArICAgICAgLSBpdGVtczoKPiA+Pj4+ICsg
ICAgICAgICAgLSBjb25zdDogYW1sb2dpYyx0Ny1kd21hYwo+ID4+Pj4gKyAgICAgICAgICAtIGNv
bnN0OiBzbnBzLGR3bWFjLTUuMTBhCj4gPj4+PiArICAgICAgICAgIC0gY29uc3Q6IHNucHMsZHdt
YWMKPiA+Pj4KPiA+Pj4gSSBzZWUgbm8gc3VjaCBodW5rIGluIHRoZSBjb2RlLCBzbyBub3Qgc3Vy
ZSBob3cgdG8gcmV2aWV3IHRoaXMuCj4gPj4+Cj4gPj4+IEJlc3QgcmVnYXJkcywKPiA+Pj4gS3J6
eXN6dG9mCj4gPj4+Cj4gPj4+Cj4gPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gPj4+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gPj4+IGxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+PiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKPiA+Pgo+ID4+IC0tCj4gPj4g
QmVzdCByZWdhcmRzLAo+ID4+IENodWFuCj4gPj4KPgo+IC0tCj4gQmVzdCByZWdhcmRzLAo+IENo
dWFuCj4KVGhhbmtzLApMdWNhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
