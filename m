Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AA7CA0EDC
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Aug 2025 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbIlvaxBfDiTlZJ5FHB8sqVG/NuPrUgbq71doaRmqiQ=; b=zAQc3Tzg6i1nM7
	mABjv1ommeL+BD6qNV0d3/bVXu9LfJYeBDbjOC8N4MGS91M4u0NhNfjAR4bp9cqK+D9qhNtPnJ32w
	C2ANFzYycip44l0D9TmoLlKpDtIZ2KCA9KsMVU/5e3W3vaozqY52COjioLa26SUSrjUMmdOm9oOAg
	vCupNrWZYsV0bXDS2zatYPMJyeAiKrIEaw/2QcC20vZkv9N2iZ4YFJsKcUAVyisJ81NIXSSxv28b3
	qTnaOiin5x/D53T49UmtjkX8vDsOCVsKOv+/ckvGy89voADt30yASpKdFWZlPOaOZETq1Z/7n87V3
	2rRqTSBDcSN46rnCS/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoka1-0000000EE8e-2ns3;
	Wed, 20 Aug 2025 15:18:25 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojN4-0000000DvJr-1Mfu;
	Wed, 20 Aug 2025 14:00:59 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7347e09so1076360266b.0;
        Wed, 20 Aug 2025 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755698457; x=1756303257; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9h2QLkI6YkYRhYdghU2MiWTpV4YprWIN5TJOvTtl/4=;
        b=ZbK8vIC9MaJXL/O+/giIlJcdShLkeTj3NcPbviWboPDo3dizIE8PL0MYqOTv3/DrjG
         58lr8YOfK3P1mcvc0QftsWR0T6p5PGrs5K5S6hw/K8rCnNTncZV/+YmdN+FX3PsGkgAE
         eyGTV2cG7x46WrzMmEtiNyJHTLIpaAo+jrCpUJhqaopXQaVsMTauuSVilkiW62ACYOqv
         wVp+LKSwEFjwFOT9GiMQkqefiwlRPnsmuBlpiw+ckGa2wGe+WgGb+o0ztyUBR4iz2uuL
         1rOR6vQ5ODj3yIye+BXl0tgSCvQ2ALXaJJoPkRFBYi/3ikNmaQISxc9tf8uZVmPhOsM7
         aXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755698457; x=1756303257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9h2QLkI6YkYRhYdghU2MiWTpV4YprWIN5TJOvTtl/4=;
        b=n1coniOPyMPi7/pHpKbSihZgiBPs/PV6vfd6ADvgPSAvTrbRz3GVB+D5zcdrhxtW1A
         LZmV/c8XartBnsifLt1mTucsZtjb9N7S/eTRmh31kXfTj9qfhXz6oEpA0VeTBLSur3tT
         b0/9lfcibGB2zswlKG27v39a1OXo1QJh5nSvxbV0BDaliS54fljV2EDO4+E7uL9gZyX8
         6Rv0PZTTGAYAy1E3zsJEdRkqYJvoe4ICODnSJuvDvSsMyMK1pd+GiOJCQ52IvKvzD+MD
         B+5uhfoM1bafK+s7Upo04sPczQOirLA2lMhxi/NasMqtg3IAOUyV5p5hA2heJdKsP6N1
         tneQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOo7Z7jb/f0agWou6t6oPv0cIKej7p4WdANbxjj/5nLQ0CDA3Cyqlrhlcxv/52Lo/PK7PVl/swV5/HMbfM@lists.infradead.org, AJvYcCVMh4jRJhACvbWP4BQ9eOWblUU5slDMTZyUEghv6TOMB+3EHmdJNpT3pHVX93Jua08shI9bOTZApqqEf6utVJ6IXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIhU5V1buK99lQNExuaeV+vdWwSHDGbdHevFAlQcOh2uHiTk/w
	99LVHkZwBoquVE53V0JJxenCSut7ZzYTcGcAv+X5JqZNjhySLx3CIPOzZI8gFDjq8JbKf0cd4ec
	6x70ZCX1OGnnx0f+1KrBWdXQgB39L8kM=
X-Gm-Gg: ASbGncv2ZS7ZJAyQwzPBnCNQ9f7ic54MEkn5N+jCmQPrqw4/oQ42IUGcMIyg7FfZ65A
	K+NTuX9XGkZNmFJZygWWE2WUQ7KbsNiZOfDf24cHz7ucZCSx9S5K1WXqVtDle/yT20VWOu1AqjS
	WCUEl1glW1+w93nfH4IYSlb1tN6IESdie07py3UNaKo9qn9KQNuRqnKKhSHzDkNYRP7muB1B3rs
	Wf/yZYfQRzc6doA
X-Google-Smtp-Source: AGHT+IFV+ro30RViXmPmh+UAaPLX9QXo+YSh1EhMZ8DdlEeQ+YTmgGE1awr/lw8YhiJs9zwakmOnOmQJdBgREnZFde0=
X-Received: by 2002:a17:907:3c8b:b0:afc:b13d:ea7a with SMTP id
 a640c23a62f3a-afdf020c2f4mr277148966b.57.1755698456244; Wed, 20 Aug 2025
 07:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240205171930.968-1-linux.amoon@gmail.com> <20240205171930.968-5-linux.amoon@gmail.com>
 <cf47b82c-6307-475b-af3a-eab7f09715f0@linaro.org> <CANAwSgTOpDmZGR33veBWrzr75=xEZ-28iu=GeCzqa0ZPXxDchw@mail.gmail.com>
 <f87069a4-042c-467a-94fb-0b65bfa4758d@linaro.org> <CANAwSgR1+Fb5Si6yBU6JXCfRiq-XU0xjr-ecVbnALMj7qmv0Sg@mail.gmail.com>
In-Reply-To: <CANAwSgR1+Fb5Si6yBU6JXCfRiq-XU0xjr-ecVbnALMj7qmv0Sg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 20 Aug 2025 19:30:38 +0530
X-Gm-Features: Ac12FXzAr4dY-DLEEvK_oha48667po-sPu4Fnf6VcphXOs4zMjuTfD8jZc6AdGA
Message-ID: <CANAwSgQvYyE3rZqBHR2_Q0FzggznOh=fhtBQVJZ1DRn73P24pQ@mail.gmail.com>
Subject: Re: [PATCHv1 4/5] arm64: dts: amlogic: Add cache information to the
 Amlogic S922X SoC
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_070058_372153_BD424875 
X-CRM114-Status: GOOD (  30.62  )
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

SGkgTmVpbCwKCk9uIFR1ZSwgMjcgRmViIDIwMjQgYXQgMTg6MzQsIEFuYW5kIE1vb24gPGxpbnV4
LmFtb29uQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBOaWVsLAo+Cj4gT24gVHVlLCA2IEZlYiAy
MDI0IGF0IDIwOjMxLCA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
T24gMDYvMDIvMjAyNCAxMToxNSwgQW5hbmQgTW9vbiB3cm90ZToKPiA+ID4gSGkgTmVpbCwKPiA+
ID4KPiA+ID4gT24gVHVlLCA2IEZlYiAyMDI0IGF0IDE0OjMwLCBOZWlsIEFybXN0cm9uZyA8bmVp
bC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4gT24gMDUvMDIvMjAy
NCAxODoxOSwgQW5hbmQgTW9vbiB3cm90ZToKPiA+ID4+PiBBcyBwZXIgUzkyMlggZGF0YXNoZWV0
IGFkZCBtaXNzaW5nIGNhY2hlIGluZm9ybWF0aW9uIHRvIHRoZSBBbWxvZ2ljCj4gPiA+Pj4gUzky
MlggU29DLgo+ID4gPj4+Cj4gPiA+Pj4gLSBFYWNoIENvcnRleC1BNTMgY29yZSBoYXMgMzIgS0Ig
b2YgaW5zdHJ1Y3Rpb24gY2FjaGUgYW5kCj4gPiA+Pj4gICAgICAgIDMyIEtCIG9mIEwxIGRhdGEg
Y2FjaGUgYXZhaWxhYmxlLgo+ID4gPj4+IC0gRWFjaCBDb3J0ZXgtQTczIGNvcmUgaGFzIDY0IEtC
IG9mIEwxIGluc3RydWN0aW9uIGNhY2hlIGFuZAo+ID4gPj4+ICAgICAgICA2NCBLQiBvZiBMMSBk
YXRhIGNhY2hlIGF2YWlsYWJsZS4KPiA+ID4+PiAtIFRoZSBsaXR0bGUgKEE1MykgY2x1c3RlciBo
YXMgNTEyIEtCIG9mIHVuaWZpZWQgTDIgY2FjaGUgYXZhaWxhYmxlLgo+ID4gPj4+IC0gVGhlIGJp
ZyAoQTczKSBjbHVzdGVyIGhhcyAxIE1CIG9mIHVuaWZpZWQgTDIgY2FjaGUgYXZhaWxhYmxlLgo+
ID4gPj4KPiA+ID4+IERhdGFzaGVldCBzYXlzOgo+ID4gPj4gVGhlIHF1YWQgY29yZSBDb3J0ZXji
hKItQTczIHByb2Nlc3NvciBpcyBwYWlyZWQgd2l0aCBBNTMgcHJvY2Vzc29yIGluIGEgYmlnLkxp
dHRsZSBjb25maWd1cmF0aW9uLCB3aXRoIGVhY2gKPiA+ID4+IGNvcmUgaGFzIEwxIGluc3RydWN0
aW9uIGFuZCBkYXRhIGNoYWNoZXMsIHRvZ2V0aGVyIHdpdGggYSBzaW5nbGUgc2hhcmVkIEwyIHVu
aWZpZWQgY2FjaGUgd2l0aCBBNTMKPiA+ID4+Cj4gPiA+IE9rLAo+ID4gPgo+ID4gPiBTaW5jZSBh
bGwgdGhlIENvcnRleOKEoi1BNzMgYW5kIENvcnRleOKEoi1BNTMgc2hhcmUgc29tZSBpbXByb3Zl
bWVudHMgaW4KPiA+ID4gdGhlIGFyY2hpdGVjdHVyZSB3aXRoIHNvbWUgaW1wcm92ZW1lbnRzIGlu
IGNhY2hlIGZlYXR1cmVzCj4gPiA+IGhlbmNlIEkgdXBkYXRlIHRoZSBjaGFuZ2VzIGFjY29yZGlu
Z2x5Lgo+ID4gPiBBbHNvLCBJIGNoZWNrZWQgdGhpcyBpbiB0aGUgQVJNIGRvY3VtZW50YXRpb24g
ZWFybGllciBvbiB0aGlzLgo+ID4KPiA+IEkgZG9uJ3QgdW5kZXJzdGFuZCwgQW1sb2dpYyBzdGF0
ZXMgaXQncyBhIHNoYXJlZCBMMiBjYWNoZSwgYnV0IHlvdSB0cnVzdAo+ID4gdGhlIEFSTSBkb2N1
bWVudGF0aW9uIGluc3RlYWQgPz8/Cj4KPiBZZXMgcGxlYXNlIGZpbmQgdGhlIENvcnRleOKEoi1B
NzMgVFJNCj4gTDEgQ2FjaGUKPiBodHRwczovL2RldmVsb3Blci5hcm0uY29tL2RvY3VtZW50YXRp
b24vMTAwMDQ4LzAwMDIvbGV2ZWwtMS1tZW1vcnktc3lzdGVtL2Fib3V0LXRoZS1sMS1tZW1vcnkt
c3lzdGVtP2xhbmc9ZW4KPiBMMiBDYWNoZQo+IGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vZG9j
dW1lbnRhdGlvbi8xMDAwNDgvMDAwMi9sZXZlbC0yLW1lbW9yeS1zeXN0ZW0vYWJvdXQtdGhlLWwy
LW1lbW9yeS1zeXN0ZW0/bGFuZz1lbgo+ID4KPiA+ID4KPiA+ID4+IEFuZCB0aGVyZSdzIG5vIGlu
ZGljYXRpb24gb2YgdGhlIEwxIG9yIEwyIGNhY2hlIHNpemVzLgo+ID4gPgo+ID4gPiBXaGF0IEkg
ZmVlbCBpcyBpbiBnZW5lcmFsIGFsbCB0aGUgQ29ydGV44oSiLUE3MyBhbmQgQ29ydGV44oSiLUE1
MyBzdXBwb3J0cwo+ID4gPiBMMSBhbmQgTDIgY2FjaGUgc2l6ZSBzaW5jZSBpdCBpcyBwYXJ0IG9m
IHRoZSBjb3JlIGZlYXR1cmVzLgo+ID4gPiBidXQgSSBvcHRlZCBmb3IgdGhlc2Ugc2l6ZSB2YWx1
ZXMgZnJvbSBhIFdpa2lwZWRpYSBhcnRpY2xlLgo+ID4gPgo+ID4gPiBPbiBteSBPZHJvaWQgTjIr
LCBJIG9ic2VydmUgdGhlIGZvbGxvd2luZy4KPiA+ID4KPiA+ID4gSSBoYXZlIGFsc28gZG9uZSBz
b21lIHRlc3Rpbmcgb24gdGhlIHN0cmVzcy1uZyB0byB2ZXJpZnkgdGhpcy4KPiA+Cj4gPgo+ID4g
T2sgSSBkb24ndCBmZWVsIGNvbmZpZGVudCBhZGRpbmcgbnVtYmVycyB0aGF0IGNvbWVzIG91dCBv
ZiB0aGluIGFpciwKPiA+IGFuZCBldmVuIG1vcmUgc2luY2UgdGhleSBhcmUgb25seSBzaGFyZWQg
dG8gdXNlcnNwYWNlLgo+ID4KPiA+IEkgdGhpbmsgd2Ugc2hvdWxkIG9ubHkgYWRkIHRoZSBudW1i
ZXJzIHdoaWNoIGFyZSAxMDAlIHN1cmUKPgo+IEJlc3Qgd2F5IHRvIGxldCB0aGUgQW1sb2dpYyBT
b0MgbWVtYmVycyBjb21tZW50IG9uIHRoZSBDUFUgIEwxLyAvIEwyIGNhY2hlIHNpemUuCj4gQnV0
IHdpdGggdGhlIGxhY2sgb2YgcHJlZiBQTVUgZXZlbnRzIHdlIGNhbm5vdCB0ZXN0IHRoaXMgZmVh
dHVyZS4KPgo+ID4KPiA+Cj4gPiBUaGlzIGxvb2tzIHByZXR0eSwgYnV0IGxldCdzIGtlZXAgZXhw
b3J0aW5nIHZlcmlmaWVkIGRhdGEuCj4gPgpJIGp1c3Qgd2FudGVkIHRvIHJldmlzaXQgdGhpcyBw
YXRjaCBzZXJpZXMgd2l0aCBzb21lIHVwZGF0ZXMgb24KCkhlcmUgaXMgd2hlcmUgdGhlIEFuZHJv
aWQgVFYgcHJvdmlkZXMgdGhlIGNhY2hlIGRldGFpbHMuClsxXSBodHRwczovL2FuZHJvaWRwY3R2
LmNvbS9jb21wYXJhdGl2ZS1hbWxvZ2ljLXM5MjJ4LwoKQW1sb2dpYyBTOTIyWCBIZXhhIENvcmUg
U29DIGhhcyBmb3VyIEFSTSBDb3J0ZXgtQTczIGNvcmVzIGNhcGFibGUgb2YKcmVhY2hpbmcgMS44
R2h6CndpdGggMU1CIEwyIGNhY2hlICsgMiBDb3J0ZXgtQTUzIFJBTSBwcm9jZXNzb3JzIHdpdGgg
MjU2ayBMMiBjYWNoZSwKCmh0dHBzOi8vYm9hcmRvci5jb20vYmxvZy91bmRlcnN0YW5kaW5nLXRo
ZS1hcmNoaXRlY3R1cmUtb2YtYXJtLWNvcnRleC1hNTMtY2FjaGUKCkFsc28gIEFtbG9naWMgQTMx
MUQgcHJvY2Vzc29yIHV0aWxpemVzIGEgImJpZy5MSVRUTEUiIGFyY2hpdGVjdHVyZSwgY29tYmlu
aW5nOgoKUXVhZC1jb3JlIEFSTSBDb3J0ZXgtQTczOgpFYWNoIENvcnRleC1BNzMgY29yZSBoYXM6
CiAgICAgNjQgS0IgTDEgaW5zdHJ1Y3Rpb24gY2FjaGUgNjQgS0IgTDEgZGF0YSBjYWNoZQpUaGUg
Q29ydGV4LUE3MyBjbHVzdGVyIHNoYXJlcyBhIDEgTUIgdW5pZmllZCBMMiBjYWNoZS4KCkR1YWwt
Y29yZSBBUk0gQ29ydGV4LUE1MzoKRWFjaCBDb3J0ZXgtQTUzIGNvcmUgaGFzOgogIDMyIEtCIEwx
IGluc3RydWN0aW9uIGNhY2hlLCAzMiBLQiBMMSBkYXRhIGNhY2hlCgpUaGUgQ29ydGV4LUE1MyBj
bHVzdGVyIHNoYXJlcyBhIDUxMiBLQiB1bmlmaWVkIEwyIGNhY2hlLgoKRnJvbSB3aGF0IEkgdW5k
ZXJzdGFuZCwgQ1BVIGNhY2hlcyBhcmUgYSBjb3JlIGZlYXR1cmUgb2YgdGhlIENQVS4KRG8geW91
IHRoaW5rIEkgc2hvdWxkIHVwZGF0ZSB0aGVzZSBwYXRjaGVzIGFuZCByZXNlbmQgPwoKVGhhbmtz
Ci1BbmFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
