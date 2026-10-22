Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0985606A322
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A1In+GgD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C55M6ZojViuvT29TDYVi8sy/qXnRVkkcGJRLxdp5lHA=; b=A1In+GgDLXsirOi7rgNy/w3D9a
	Wlbz7nRcMyJrhBnP/9RURxggy0LKf9CcxeeTc3Ef7MM8BZsXD6zKqUGgDcizeda9QtF3mOEPHYOTc
	i8ZVtU+w9nCzMDL3G2f/JXwCKGmIlxdLa+4tpP9BcBTQQLQQhdsZ29lM9X6KDQAwHDZ+ZV6uK/J2s
	4wYiT+M8hBbScN5yST7i4qT2mbkZ9BgLCP9eHEhp84BZWmxf52UK/28aT7elKMhOx1RWtLYtVrU4z
	fsKvSiNYGsZzm4hl+Wl7daSGJwyRfS+AwDvos/CVFUEaXkv8LN+jW10THeVGJhUB/LfPg3jtpD9En
	AqXLQ6HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwmg-0000000EbKq-425d;
	Thu, 22 Oct 2026 17:40:59 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwmd-0000000EbJj-36K9
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 17:40:57 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so434235e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 10:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690853; x=1793295653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqDNdqh7JWi24rY3vzEqU+LCO6MlMl1qL5MbUIf6AO4=;
        b=esJJk6tFKAyz4M/wccI/+OP0+B0L7rSRyfj959wy4aznYObHTiBO3uAp4yM5yFalNO
         3WGNySQjXsMnynu3eaLmhxXE1UTRQTmYCWNBBV5s0KjGg6EEVTuEdUDuJejOqoROOFy7
         n6oykF+TZkfOwx2W6djQBdhiewqB2mG1Lu0Juf3+ppZ9AmSbI1pyyfwHlRX8OgE/yHUG
         yGloehQUCg2qRlnbmk4E4UiqOjqjvU0Cy042cUzYEOmU90EPRPOaqc8xP/X7mxjY848b
         7ZLk12fBjXuIF8Un94ZXQ20jK6SRHAlF0hoSWfeo9HzoQDaqhGTIruhpU2kR+A78tv0X
         hSmw==
X-Forwarded-Encrypted: i=1; AKwUvBzipPCxy1qUF4YI55c5ja+tv4KrDut2cAMEdh9H3guu5OzOnlH7dl5AuCNzT0K5qOfHEr3z0PrGKx+poopv@lists.infradead.org
X-Gm-Message-State: AFq9FYIAHPm28flIOAWjBCU9RH7k6QC/2WYGa3u0pgCnuWk7W4oIelkJ
	kSP4jyrQGoKbzP5gvoyYCeAwAbIdsKLibFaNcvBnbIPLHvXWYuL9aBIs
X-Gm-Gg: AYBFou2uzj7ETIYCf5V6QLZn4n8B5rhc7Spy3r6JKV/Q5cTbsw9DAjLNVr+QAtWHn92
	AstQhfu8s/kZzIleva/X8xD/Yug/w9XovLjP9XnAXMjt3Wxv9lUbWbenFoBvf2+i/2KGJXSHeif
	vuRtHhvdK5drdaACZhJbUk5vqYMM95aaFETKqYGMYU6x86QnGpYTAWHY4ad3DjXh0+XtjUq55t5
	77ufCOucis2cIpiSYRt162QTRavCJLDwPKnuowWk2/HsRF6lTBNbX1rV3Mh31PzWTCEFjDQVI6A
	kujEN/t0KQR90iQ5CarQMvxUrQOPuFIjEsd/2UGzo1XlzpgJWTycb+AA2UyPgdMG5/fipL2B6Fh
	zoA7qFrjuU9TU8yqMwCckUWw7l5jrUcgzg6t1IeJ+Hqn78kWKLoBrWPeyzGhB0HhKUoTw+ROWgY
	QVl6EO18GQ8V0atQS2BOvuZF3DvhWQ1ULQ3fNTTTVz0SoXwzXHeIyX5S29ES2RpYFo3F2PxxZ1o
	OuC0XXeMBWwq0bg8j7Y2bBF18+a4LSxHr6TA7OUkUgQwNMD4UYgxnDFMYL+8WIspql7nh9rEXb1
	+eL7l8z6iA==
X-Received: by 2002:a05:600c:8b45:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a20a3b7c0emr41739035e9.3.1792690853435;
        Thu, 22 Oct 2026 10:40:53 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2101cd7cesm14216005e9.0.2026.10.22.10.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:40:52 -0700 (PDT)
Message-ID: <74840159-62d9-4d6d-a0c3-b079e6e4da6e@linux.com>
Date: Thu, 22 Oct 2026 18:40:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-8-tanure@linux.com>
 <CAFBinCC8iKESoc2zEXJMEmqk0cwWbVap-a2KcAtB7-KFKO9Atg@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAFBinCC8iKESoc2zEXJMEmqk0cwWbVap-a2KcAtB7-KFKO9Atg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_104056_067641_086A9213 
X-CRM114-Status: GOOD (  15.35  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMTAvMjAyNiAyMzowMCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBTYXQs
IE9jdCAxMCwgMjAyNiBhdCAxMjo1OeKAr1BNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNv
bT4gd3JvdGU6Cj4gWy4uLl0KPj4gUkdNSUkgbmVlZHMgYSBkZWxheSBvbiBlYWNoIG9mIGl0cyB0
d28gY2xvY2tzLCBhbmQgb24gdGhpcyBib2FyZAo+PiBib3RoIGNvbWUgZnJvbSBpbnNpZGUgdGhl
IGNoaXBzLCBub3QgZnJvbSB0aGUgYm9hcmQgdHJhY2VzLiBUaGUgUEhZCj4+IGFkZHMgdGhlIG9u
ZSBvbiByZWNlaXZlLiBJdHMgdHJhbnNtaXQgZGVsYXkgZG9lcyBub3Qgd29yayBoZXJlLCBzbyB0
aGUKPj4gY29udHJvbGxlciBhZGRzIHRoYXQgb25lLgo+IFsuLi5dCj4+ICsmZXRobWFjIHsKPj4g
KyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4+ICsgICAgICAgcGluY3RybC0wID0gPCZldGhfcGlu
cz4sIDwmZXRoX3JnbWlpX3BpbnM+Owo+PiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7Cj4+ICsgICAgICAgcGh5LW1vZGUgPSAicmdtaWktaWQiOwo+PiArICAgICAgIHBoeS1oYW5k
bGUgPSA8JmV4dGVybmFsX3BoeT47Cj4+ICsgICAgICAgdHgtaW50ZXJuYWwtZGVsYXktcHMgPSA8
MjAwMD47Cj4gWW91J3JlIHN0YXRpbmcgdGhhdCBSVEw4MjExRidzIFRYIGRlbGF5IGRvZXNuJ3Qg
d29yayBidXQgbm90IGV4cGxhaW5pbmcgd2h5Lgo+IEkgaGF2ZW4ndCBjb21lIGFjcm9zcyB0aGlz
IGJlaGF2aW9yIGJlZm9yZSBhbmQgSSdtIHdvcnJpZWQgdGhhdCB0aGF0J3MKPiBhbiBpc3N1ZSB3
aXRoIGEgYmF0Y2ggb2YgUlRMODIxMUYuCj4gV2hhdCBpZiB0aGUgcHJldmlvdXMvbmV4dCBiYXRj
aCBvZiBSVEw4MjExRiB3aWxsIGhhdmUgd29ya2luZyBUWCBkZWxheQo+IGFnYWluIC0gd291bGRu
J3QgdGhhdCBtZWFuIDRucyBkZWxheSBpbiB0b3RhbCB1bmxlc3MgdGhlIFJUTDgyMTFGCj4gZHJp
dmVyIGlzIGNoYW5nZWQ/CgpZZXMsIHlvdSBhcmUgcmlnaHQuIEFmdGVyIEkgdW5kZXJzdG9vZCBJ
IGhhZCBhIG1pc3NpbmcgY2xvY2sgSSByZS10ZXN0ZWQgCnRoZSBldmVyeXRoaW5nIGZyb20gc2Ny
YXRjaC4KCk9uIHRoZSBUNyB0aGUgcmVnaXN0ZXIgYmxvY2sgd2l0aCBQUkdfRVRIMC9QUkdfRVRI
MSBzaXRzIGJlaGluZCBhIGNsb2NrCmdhdGUgKHRoZSAicGNsayIgY2xvY2sgaW4gcGF0Y2hlcyAy
IGFuZCA2KS4gTXkgZmlyc3QgdGVzdHMgcmFuIGJlZm9yZSBJCmtuZXcgYWJvdXQgdGhhdCBnYXRl
OiB0aGUgYmxvY2sgaWdub3JlZCBldmVyeSB3cml0ZSBhbmQgUFJHX0VUSDAga2VwdAp0aGUgdmFs
dWUgdGhlIGJvb3Rsb2FkZXIgbGVmdCB0aGVyZSwgMHgxNjIxLiBCaXQgNSBvZiB0aGF0IHZhbHVl
IGlzIHRoZQpUWCBjbG9jayBwaGFzZSBzZWxlY3QsIDEvNCBjeWNsZSwgd2hpY2ggaXMgMm5zIGF0
IDFHYml0L3MuIFNvIHdpdGgKInJnbWlpLWlkIiB0aGUgUEhZIGFkZGVkIDJucyBhbmQgdGhlIE1B
QyBhZGRlZCBhbm90aGVyIDJucyBub2JvZHkgYXNrZWQKZm9yLCA0bnMgaW4gdG90YWwuIFRoZSBD
UkMgZXJyb3JzIGZyb20gdGhhdCBtYWRlIG1lIGJlbGlldmUgdGhlIFBIWSBUWApkZWxheSB3YXMg
bm90IHdvcmtpbmcuCgpXaXRoIHRoZSBjbG9jayBlbmFibGVkIGFuZCBhIHBsYWluICJyZ21paS1p
ZCIgbm9kZSwgbm8gZGVsYXkgcHJvcGVydHk6CgogICBQUkdfRVRIMCA9IDB4MTYwMSAoVFggcGhh
c2UgMCksIFBSR19FVEgxID0gMHgwCiAgIFJUTDgyMTFGIHBhZ2UgMHhkMDg6IHJlZyAweDExID0g
MHgwMTA5IChUWCBkZWxheSBvbiksCiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyAweDE1ID0g
MHgwMDE5IChSWCBkZWxheSBvbikKICAgaXBlcmYzOiA5NDAgTWJpdC9zIGJvYXJkIHRvIFBDLCA5
NDMgTWJpdC9zIFBDIHRvIGJvYXJkLCAwIHJldHJhbnNtaXRzCiAgIDAgQ1JDIGVycm9ycyBvbiBi
b3RoIGVuZHMKCnY0IGRyb3BzIHR4LWludGVybmFsLWRlbGF5LXBzIGZyb20gdGhlIFZJTTQgbm9k
ZSBhbmQgdGhlIHdyb25nIHNlbnRlbmNlCmZyb20gdGhlIGNvbW1pdCBtZXNzYWdlLiBUaGUgUEhZ
IGFkZHMgYm90aCBkZWxheXMsIGFzIHRoZSBnZW5lcmljIHRleHQKZXhwZWN0cy4KClRoYW5rcwpM
dWNhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
