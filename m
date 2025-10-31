Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72929CCF9F8
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Oct 2025 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bC1zeocqfU7w7i94yaQNwUtIlsVFs3Ohz//VlmByc40=; b=jKlf8nFyoe46K9
	chxgUTfQeO7KGO/PWSibPLcz7cR2fSJqJ2jyJqoDe8eWz3gAdggakuWn5ReMYJSN1FPdlr8MIO/gE
	PnJXDR6p29+om7TLl90/9hU6p51bWZW/f6i9XMdNgtrcQBVk3MC+hYU8q4gCkg8XW7jUbzBrZhh9B
	3Cf7sE0fjL5e0xRXZ3ZqLZWaDSpKj6/KFYy0HIr86KBX1uMKz7ctfiVrTKJGnMAQdYGt9xpEfWLgk
	NEWGu4wdb5Vj9khbwEcOdjOWHC30a+Ji/63TZlxrxKoy5Xrsbz4PLSzIodbaoODfk1pH1wl8eWNrl
	K+p32qD1rlbCMFCyaDXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEryu-00000006PLf-3TQo;
	Fri, 31 Oct 2025 16:28:04 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEryr-00000006PKY-0sbc
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Oct 2025 16:28:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-426fc536b5dso1579206f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 31 Oct 2025 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761928079; x=1762532879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDssZKzypBLff+1ZVIfB58ENRKA3B3YlfDeq0xu5XOQ=;
        b=KRSWf4v/EPv8EPb/a5+5pgo09gLV5BBpmsT88rmMM7zsTiJXMwqdeJD3C8wnjK9FpL
         mUFPDYKwBeNErQCv10OkMybT6kka4hViF0i2o0D5VVkOsOX1e27aDLUlRBpXF1+nkM+E
         7RiCUSrn9YfIac3mO6CRNpdje0bPTNllD0qg4x+nUrRFQwELwSDYBcy4g+/zJAlyM1tQ
         X4UYqbz8JmAaXEVdb4DE8DbTHJ0hwYEJdt7/HV2OU6eThc7Z7Yxsxjcqb3JB8ttHx+X2
         MoUlhpkQT2Ec7ciYF4O0rXzhaQ5I1d6JAjcVctH3ZaQuSgL3b2scX3Fjw/j4w3W3MZKk
         0klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761928079; x=1762532879;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDssZKzypBLff+1ZVIfB58ENRKA3B3YlfDeq0xu5XOQ=;
        b=UA3wtuUza2cS6PlHNHp8pJBpY3HPq0bJlf5AvqZPDSWmy5ax5Wc8l3sX1BBSNimMqh
         0y9aTnjjLgvthOny2w3tvml5LuG5wn8+Jt0Tu9ZpUom8IldLj9EUU7HRaiHO+/R4p42D
         coHhMfa3GM9XRnr/Hjs7rRv39kScVXUriusEWBBIHM+zm/3ghSF/5TQRaRiKSvI1bm7Z
         9oXazq9Iljkyqcez6cYhvo+unX+Z6YKE+yLK7idRG5q9xRpJMkI4Be0J1ayQZ8lXy1gG
         JMojjQVZjG1bqxXt/JzuDeKrJ5CxoPAemLxGTLRbkqGdH4LZTkUKBbLnW6ulPHvG6SEY
         vaog==
X-Forwarded-Encrypted: i=1; AJvYcCVWlIt/siFX3SsWPo9ne0vX4/p5mMw6LjBUBdgVTb45qogPo/OUyf/xIfIVoZvGSjlCOHGno3cyvWsY1sw1@lists.infradead.org
X-Gm-Message-State: AOJu0YxfulllaqCpuadffYu61ny/dt0lcN/cSNLRL3dulq3gwAs9hmLV
	oiRwzN1lOlGO7TrqilMRsb2M5JLrMbszrZYpw2tIRl7Ws8xgsw33x5/Fqgghl4hhUfQ=
X-Gm-Gg: ASbGncvuuiqZfGPj5XKoRuHHKhATJiQcJsNBGDReuS3JlYY5Q/WDe9sncRasOwPtLbo
	c4+Uh7rPXXYq74tbubCDfta201aTXgzjDjYCxNCPXkXZsJtfr9jIHQaegBebKsd+39FijFcw0hn
	nqk0lkE8Lrb5sVf3xaepAoAFaKgFHuTlI40JhHnqCvFmtWpRF/YfYHLgRUyHzICWBOY7+OG6h8c
	H1yRUi3mItL871wuXTn9O36kP7481ZdBqn30Lkxgeo4eGEb2sRCFzXhLeOAPjdBuSYra/J+1j/G
	dZopygTyYb/Rz9aUp+3R+ocXT/4KANIkOieISl3lDtAWPHh1yATkRunImRtYLJWqgejJMBzviVd
	oxoyxqifQNOp2jFwbL46iZYs5CjlRTm3cHa4+CZlVbPfNUKN+vKWwrCiU9Qt3MfW1hY8YQlpin5
	CO8cLnUw5umA==
X-Google-Smtp-Source: AGHT+IFrsbEnwLrCCUR6Iu0VY5Uzhd0sq8qEcvcS/A9/eiqg3la7OAXHkma7L0rV7CnkzwdcPd10ig==
X-Received: by 2002:a05:6000:178f:b0:429:bb21:94e1 with SMTP id ffacd0b85a97d-429bd6a0caemr3886114f8f.41.1761928079286;
        Fri, 31 Oct 2025 09:27:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b8e9:e124:10fc:8444])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c112413esm4367494f8f.12.2025.10.31.09.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 09:27:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: amlogic: optimize the PLL driver
In-Reply-To: <9751014d-926e-4d42-b8e1-5a4d3e734457@amlogic.com> (Chuan Liu's
	message of "Fri, 31 Oct 2025 23:09:13 +0800")
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
	<1jms57xx05.fsf@starbuckisacylon.baylibre.com>
	<9751014d-926e-4d42-b8e1-5a4d3e734457@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 31 Oct 2025 17:27:58 +0100
Message-ID: <1j5xbvxchd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_092801_270722_D5E62906 
X-CRM114-Status: GOOD (  16.28  )
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

T24gRnJpIDMxIE9jdCAyMDI1IGF0IDIzOjA5LCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4gd3JvdGU6Cgo+IEhpIEplcm9tZSwKPgo+IE9uIDEwLzMxLzIwMjUgNTowNCBQTSwgSmVy
b21lIEJydW5ldCB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+IE9uIEZyaSAzMSBPY3Qg
MjAyNSBhdCAxNjoxMCwgQ2h1YW4gTGl1IHZpYSBCNCBSZWxheQo+PiA8ZGV2bnVsbCtjaHVhbi5s
aXUuYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+IAo+Pj4gVGhpcyBwYXRjaCBzZXJp
ZXMgY29uc2lzdHMgb2YgZm91ciB0b3BpY3MgaW52b2x2aW5nIHRoZSBhbWxvZ2ljIFBMTAo+Pj4g
ZHJpdmVyOgo+Pj4gLSBGaXggb3V0LW9mLXJhbmdlIFBMTCBmcmVxdWVuY3kgc2V0dGluZy4KPj4+
IC0gSW1wcm92ZSB0aGUgaXNzdWUgb2YgUExMIGxvY2sgZmFpbHVyZXMuCj4+PiAtIEFkZCBoYW5k
bGluZyBmb3IgUExMIGxvY2sgZmFpbHVyZS4KPj4+IC0gT3B0aW1pemUgUExMIGVuYWJsZSB0aW1p
bmcuCj4+Pgo+Pj4gRm9yIGVhc2llciByZXZpZXcgYW5kIG1hbmFnZW1lbnQsIHRoZXNlIGFyZSBz
dWJtaXR0ZWQgYXMgYSBzaW5nbGUKPj4+IHBhdGNoIHNlcmllcy4KPj4+Cj4+PiBUaGUgUExMIHRp
bWluZyBvcHRpbWl6YXRpb24gY2hhbmdlcyB3ZXJlIG1lcmdlZCBpbnRvIG91ciBpbnRlcm5hbAo+
Pj4gcmVwb3NpdG9yeSBxdWl0ZSBzb21lIHRpbWUgYWdvIGFuZCBoYXZlIGJlZW4gdmVyaWZpZWQg
b24gYSBsYXJnZQo+Pj4gbnVtYmVyIG9mIFNvQ3M6Cj4+PiAtIEFscmVhZHkgc3VwcG9ydGVkIHVw
c3RyZWFtOiBHMTJBLCBHMTJCLCBTTTEsIFM0LCBBMSwgQzMuCj4+PiAtIFBsYW5uZWQgZm9yIHVw
c3RyZWFtIHN1cHBvcnQ6IFQ3LCBBNSwgQTQsIFM3LCBTN0QsIFM2LCBldGMuCj4+Pgo+Pj4gQmFz
ZWQgb24gdGhlIHVwc3RyZWFtIGNvZGUgYmFzZSwgSSBoYXZlIHBlcmZvcm1lZCBmdW5jdGlvbmFs
IHRlc3RpbmcKPj4+IG9uIEcxMkEsIEExLCBBNSwgQTQsIFQ3LCBTNywgUzdELCBhbmQgUzYsIGFs
bCBvZiB3aGljaCBwYXNzZWQuCj4+Pgo+Pj4gQWRkaXRpb25hbGx5LCBzdHJlc3MgdGVzdGluZyB1
c2luZyBzY3JpcHRzIHdhcyBjb25kdWN0ZWQgb24gQTUgYW5kCj4+PiBBMSwgd2l0aCBvdmVyIDQw
LDAwMCBhbmQgNTAsMDAwIGl0ZXJhdGlvbnMgcmVzcGVjdGl2ZWx5LCBhbmQgbm8KPj4+IGFibm9y
bWFsaXRpZXMgd2VyZSBvYnNlcnZlZC4gQmVsb3cgaXMgYSBwb3J0aW9uIG9mIHRoZSBzdHJlc3Mg
dGVzdAo+Pj4gbG9nIChDTE9DS19BTExPV19XUklURV9ERUJVR0ZTIGhhcyBiZWVuIG1hbnVhbGx5
IGVuYWJsZWQpOgo+PiBPa2F5LCB0aGlzIGxpdHRsZSBnYW1lIGhhcyBiZWVuIGdvaW5nIG9uIGxv
bmcgZW5vdWdoLgo+PiBZb3UndmUgcG9zdGVkIHYyIDI0aCBob3VycyBhZ28KPj4gWW91J3ZlIGdv
dCBmZWVkYmFjayB3aXRoaW4gaG91cnMKPj4gVGhlcmUgd2FzIHN0aWxsIGEgMSBxdWVzdGlvbiBw
ZW5kaW5nCj4+IFRoZSByZXN0IG9mIGNvbW11bml0eSBoYWQgbm8gY2hhbmNlIHRvIHJldmlldy4K
Pj4gCj4KPiBUaGVyZSBtaWdodCBiZSBhIHNlcmlvdXMgbWlzdW5kZXJzdGFuZGluZyBoZXJlLgo+
Cj4gSW4gcmVjZW50IHllYXJzLCB3ZSd2ZSBtYWlubHkgYmVlbiBtYWludGFpbmluZyBvdXIgY29k
ZSBpbiBvdXIKPiBpbnRlcm5hbCByZXBvc2l0b3J5LCB3aGljaCBoYXMgbGVkIHRvIHNvbWUgZGlm
ZmVyZW5jZXMgYmV0d2VlbiBvdXIKPiBpbnRlcm5hbCBjb2RlYmFzZSBhbmQgdGhlIHVwc3RyZWFt
IHZlcnNpb24uIFRoZSBwYXRjaGVzIHRoYXQgYWNjb3VudAo+IGZvciB0aGVzZSBkaWZmZXJlbmNl
cyBhcmUgYWxyZWFkeSBxdWV1ZWQgZm9yIHN1Ym1pc3Npb24sIGFuZCBzZXZlcmFsCj4gU29DcyBh
cmUgYWxzbyB3YWl0aW5nIGluIGxpbmUgdG8gYmUgc3VibWl0dGVkLiBBcyBhIHJlc3VsdCwgcXVp
dGUgYQo+IGZldyBwYXRjaGVzIGhhdmUgcGlsZWQgdXAsIHdhaXRpbmcgdG8gZ28gdXBzdHJlYW0u
Cj4KPiBQcmV2aW91c2x5LCBJIGhhZCBiZWVuIHdhaXRpbmcgZm9yIHlvdXIgY2xvY2sgZHJpdmVy
IHJlc3RydWN0dXJpbmcKPiBwYXRjaGVzIHRvIGJlIHJlYWR5ICh3aGljaCBoYXZlIHJlY2VudGx5
IGJlZW4gbWVyZ2VkKSwgc28gZm9yIGFsbW9zdAo+IGEgeWVhciwgd2UgaGF2ZW4ndCBtYWRlIG11
Y2ggcHJvZ3Jlc3Mgb24gY2xvY2sgZHJpdmVy4oCTcmVsYXRlZAo+IHVwc3RyZWFtaW5nLgoKT2hv
aCBub3cgeW91IGFyZSBqdXN0IHRlYXNpbmcgbWUgIQoKVGhhdCB3b3JrIHdhcyBtYWRlIG5lY2Vz
c2FyeSBiZWNhdXNlIG9mIGFsbCB0aGUgY29weS9wYXN0ZSBBbWxvZ2ljIHdhcwpzdWJtaXR0aW5n
LiBEZXNwaXRlIG1hbnkgcmVxdWVzdHMsIHRoaXMgd2FzIG5ldmVyIGFkZHJlc3NlZCBzbyBJIGhh
ZAp0byBzdGVwIGluLgoKSWYgeW91IHdhbnQgdGhpbmdzIHRvIGdvIGZhc3RlciwgdGhlbiAqcmVh
bGx5KiBwYXkgYXR0ZW50aW9uIHRvIHRoZSByZXZpZXcKeW91IGFyZSBnZXR0aW5nLCBkbyBub3Qg
YXNrIHF1ZXN0aW9uIHRvIGlnbm9yZSB0aGUgYW5zd2VycyBhbmQgc3RvcAptYWtpbmcgcGVvcGxl
IHJlcGVhdCB0aGVtc2VsdmVzIG92ZXIgYW5kIG92ZXIuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
