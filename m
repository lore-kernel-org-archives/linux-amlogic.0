Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA63606A31A
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 17:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n2MIgEe/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PjdlMEDET+YlTsVojDFc38B7eYdAxFFn1jvyjTo5gh8=; b=n2MIgEe/R+jSVP4wGt+Eqn7Pb9
	Fpau0qCcxLiK6vQYYsiTghs5qWLk/v1Ppja/tyFzhxOM/CM5VVR2S/Nt3RVa/oPNGMVLDvvMq2BOU
	s6PD1WhBkE8rqM5HHBzU2hWAhfIJLCmSIAFUomVcYntSjL50SBJRR+L3ibFz+iQMcoU1P4yogqvWh
	JmDiyVOD5kZd2NG+1RakfiT9RZMbz/islJnbIFwo7MsnjHiZTRyq30LRZ7JLlvSpIamTvk4xROQ39
	QXpqMqgosa12uUb9KJXZRbAtYVoy+EQi9umkUQEZuUPvsV7tgaZLVDQTQGRnDGW2ZksWIQ9xJmu6P
	X7xFqvhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwuH-0000000EdNv-0hr2;
	Thu, 22 Oct 2026 17:48:49 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwuF-0000000EdLz-10ku
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 17:48:48 +0000
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso868728f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 10:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691325; x=1793296125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPri+pnxfg/GkSkcUBWyDRaSPhtWuHho0ObTvb26NIc=;
        b=yi3eLMDJxFEb3l58Tt4jMQOoST+DX7gnfEU9T9NYh01+6eLW0Cic3+IeZfgdFiM6Mw
         CaIwofF8crDfNAlXtD2t+r8Agy+rKSR+L2vf/gQdWZwn3DBKndiy/1uAkYeuPfFjzi0I
         W9IFL0Ehy0awVpcV1qfNaYlWnZ4hGPj31j9fxI7J70q0+APoT14ij9x1wcKQ0wLQgXgt
         L5s+naQFB4yFHc48X9Hyxmw1e2gL3kvNaOSRuHmY8opdMIxyZd94WitxG2Gcm/SyQYfs
         Fj70LldI6srBiWh7M9x/pU1kUnuQ1OibwqDwBDIxR76AGtLSBUClmqDyBnx4m26h6h0u
         NWQg==
X-Forwarded-Encrypted: i=1; AKwUvByNKsOf+bMBMYLCXUsynaFgL+KoTN07WQD5wkiEThBdTvR6BYuUu7lcjp0TSxSz0DpGxMAiy6g7HnNeqiQQ@lists.infradead.org
X-Gm-Message-State: AFq9FYI1xo+zUa7zr2QcMM1suPh1IGB/NnA/UCZI80J9ZDVkXBg8vs//
	A7E5sf9ZLNYT/iYeIb1FATyCLE3EnPkYns6bRyhTWF4qe28yxU9k0U9b
X-Gm-Gg: AYBFou3N/Q13Gna+Osq+coLDVP0cgb3yMW5sjiSlLBHbUETmFo7S+DaH8IL6zpEfsoB
	40HEIR8k1N/4dG7WxKc+E/7TW3oIPRqJnZDfCnXAp0lUwd54Veh0GntAPgx6UnLoWQDyipswGvB
	/CoHSOFr/sy1WDQC2D/oj97xgvrETyZmER/uG/yaD4Tf7iuTtKThM+kx6w4H9BX1jCvmz8uGrP6
	4s34V3ZUZgDw5OBAba7DuFCYM96WD5bmiKZZ2hMfD33GreYQFZQQdHwE6EDm0JeFz8FnyPc4stQ
	Ww5d+PDNK6YQaeKYdhGb6+opGXiBENw4NGOCqkxPcUpHObO6pO6xkeGtXQ6GigvltGxzCWWukBt
	3EqFymtIsSQZAUTHctl/ybSfA52BmU9tv3Wm0cKB9T7dZCYc+KDzUCGNdACEHAMG4Bhg/4l+G8A
	0ui3iJRelONcfToBN3Y1PuuRsL+Jy6PQULLaEqb7EzdAwr5PAraOAa6Fb/Jz9DmU03IZhAFfjJc
	rmrDYZoL6faOPwHpBVv0+sYWtjRPO+R7KYVGxV6I43DufIKLfmWzXDN/6EIzPKnIbjyLRfxHVOy
	MG4QXFasFA==
X-Received: by 2002:a05:600c:3e0c:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a204b042e5mr54395825e9.8.1792691325102;
        Thu, 22 Oct 2026 10:48:45 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210327422sm14119865e9.14.2026.10.22.10.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:48:43 -0700 (PDT)
Message-ID: <9b5fe9c2-aca1-4460-81fa-826e05e88c1a@linux.com>
Date: Thu, 22 Oct 2026 18:48:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
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
 <20261010105900.247342-9-tanure@linux.com>
 <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_104847_305037_F115F06B 
X-CRM114-Status: GOOD (  18.09  )
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

T24gMTAvMTAvMjAyNiAyMzozNywgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBBbmRy
ZXcsIEhpIEx1Y2FzLAo+IAo+IE9uIFNhdCwgT2N0IDEwLCAyMDI2IGF0IDEyOjU54oCvUE0gTHVj
YXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPiB3cm90ZToKPiBbLi4uXQo+PiArIyAgIHBoeS1t
b2RlICAgIHR4LWludGVybmFsLWRlbGF5LXBzICByeC1pbnRlcm5hbC1kZWxheS1wcyAgVFggZGVs
YXkgICAgUlggZGVsYXkKPj4gKyMgICByZ21paSAgICAgICAtICAgICAgICAgICAgICAgICAgICAg
LSAgICAgICAgICAgICAgICAgICAgIFBDQiB0cmFjZSAgIFBDQiB0cmFjZQo+PiArIyAgIHJnbWlp
LWlkICAgIC0gICAgICAgICAgICAgICAgICAgICAtICAgICAgICAgICAgICAgICAgICAgUEhZICAg
ICAgICAgUEhZCj4+ICsjICAgcmdtaWktaWQgICAgcHJlc2VudCAgICAgICAgICAgICAgIC0gICAg
ICAgICAgICAgICAgICAgICBNQUMgICAgICAgICBQSFkKPj4gKyMgICByZ21paS1pZCAgICAtICAg
ICAgICAgICAgICAgICAgICAgcHJlc2VudCAgICAgICAgICAgICAgIFBIWSAgICAgICAgIE1BQwo+
PiArIyAgIHJnbWlpLWlkICAgIHByZXNlbnQgICAgICAgICAgICAgICBwcmVzZW50ICAgICAgICAg
ICAgICAgTUFDICAgICAgICAgTUFDCj4+ICsjICAgcmdtaWktdHhpZCAgLSAgICAgICAgICAgICAg
ICAgICAgIC0gICAgICAgICAgICAgICAgICAgICBQSFkgICAgICAgICBQQ0IgdHJhY2UKPj4gKyMg
ICByZ21paS10eGlkICBwcmVzZW50ICAgICAgICAgICAgICAgLSAgICAgICAgICAgICAgICAgICAg
IE1BQyAgICAgICAgIFBDQiB0cmFjZQo+PiArIyAgIHJnbWlpLXJ4aWQgIC0gICAgICAgICAgICAg
ICAgICAgICAtICAgICAgICAgICAgICAgICAgICAgUENCIHRyYWNlICAgUEhZCj4+ICsjICAgcmdt
aWktcnhpZCAgLSAgICAgICAgICAgICAgICAgICAgIHByZXNlbnQgICAgICAgICAgICAgICBQQ0Ig
dHJhY2UgICBNQUMKPiBXZSBoYXZlIHNvbWUgYm9hcmRzIHdoZXJlIHRoZSBQQ0IgdHJhY2VzIHJl
c3VsdCBpbiBwYXJ0ICgxMjAwcHMpIG9mCj4gdGhlIGRlbGF5IG5lZWRlZCBmb3IgUkdNSUkgKDIw
MDBwcykuCj4gVGhlIHJlbWFpbmRlciAoODAwcHMpIGhhcyB0byBiZSBhZGRlZCBieSBlaXRoZXIg
UEhZIG9yIE1BQzogdGhlCj4gKFJUTDgyMTFGKSBQSFkgY2FuIG9ubHkgZ2VuZXJhdGUgMCBvciAy
MDAwcHMgZGVsYXkgc28gdGhlIE1BQyBoYXMgdG8KPiB0YWtlIG92ZXIuCj4gRm9yIHRoZSB0aHJl
ZSBib2FyZHMgSSBoYXZlIGluIG1pbmQsIHBsZWFzZSBzZWUgJCBnaXQgZ3JlcAo+IHJ4LWludGVy
bmFsLWRlbGF5LXBzIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy8KPiAKPj4gKyMgQSBwcm9w
ZXJ0eSBmb3IgYSBjbG9jayB0aGUgUENCIGFscmVhZHkgZGVsYXlzIGlzIG5vdCBpbiB0aGlzIHRh
YmxlLgo+IENhbiB5b3UgcGxlYXNlIGV4cGxhaW4gdGhpcyBzZW50ZW5jZSAoSSdtIG5vdCBhIG5h
dGl2ZSBFbmdsaXNoIHNwZWFrZXIpPwo+IEhvdyBJIGludGVycHJldCB0aGUgc2VudGVuY2U6IFRo
ZSBQQ0IgbWF5IGFkZCBkZWxheXMgYnV0IHRob3NlIGFyZQo+IGltcGxpY2l0IGFuZCBub3QgcGFy
dCBvZiB0aGUge3J4LHR4fS1pbnRlcm5hbC1kZWxheS1wcyBwcm9wZXJ0aWVzLiBJZgo+IHRoZSBk
ZWxheXMgYWRkZWQgYnkgdGhlIFBDQiBkb24ndCBjb3ZlciB0aGUgZnVsbCAybnMgcmVxdWlyZW1l
bnQgdGhlbgo+IGVpdGhlciBNQUMgb3IgUEhZIG5lZWQgdG8gYWRkIHRoZSByZW1haW5kZXIsIHNl
ZSBmaW5lLXR1bmluZyBiZWxvdy4KPiAKPj4gKyMgSXQgaXMgZWl0aGVyIHRoZSBmaW5lIHR1bmlu
ZyBkZXNjcmliZWQgbmV4dCwgb3IgYSBtaXN0YWtlIHRoZSBNQUMKPj4gKyMgc2hvdWxkIHJlcG9y
dCBhcyBhIGZhdGFsIGVycm9yLgo+IEhvdyBjYW4gSSBkaWZmZXJlbnRpYXRlIGJldHdlZW4gImZp
bmUgdHVuaW5nIiBhbmQgIm1pc3Rha2UiPwo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4K
VGhlIHBhdGNoIGlzIHdyb25nLiBJdCBhc3N1bWVzIGEgcHJlc2VudCBwcm9wZXJ0eSBtb3ZlcyB0
aGUgMm5zIGZyb20KdGhlIFBIWSB0byB0aGUgTUFDLCBhbmQgQW5kcmV3J3MgcmVwbHkgb24gcGF0
Y2ggNCBzYXlzIGl0IGRvZXMgbm90LgpJIGFtIGRyb3BwaW5nIGl0IGluIHY0LgoKdGhhbmtzCkx1
Y2FzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
