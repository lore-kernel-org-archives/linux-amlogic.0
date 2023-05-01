Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D61BC77B7C
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 18:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhcJyzWI8rB8UiNuVk8SWdCbJxKvn4LBVVS+u2n3Vko=; b=SD1nsn6kItO+5r
	c9T+0ex9Fx7bnwdBZtpAvPiW6D5oyBzmCrysRsKRSfi0my2NCsSIjzydRFRfKEO/dnALwjD5w+ePx
	gfUO/hqNQNx/CfnIOmq4GL296wY+Ywpz0GgA6U3HwhOwrKi/pjcPEysbMUn8CXxka/BGTmwRM/Psw
	qhElfZsGVyN9TAjwhhWMvinIMUfm3v7Ac5CtjQaGMJiWTJXuZiC75SRkha9R+Hmd+6cN7CpliBFBp
	StuHknz9RV3x9Kln6NN5JKOaNcb1bcKC7Vl8LGvEgZbmwQUxuxwvi7PobrsuPT/rCEAuUIBEDvPIm
	SQdtO+zSOqMCjFfMPBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYQy-00GZ6B-2V;
	Mon, 01 May 2023 18:39:36 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYQw-00GZ5d-1d;
	Mon, 01 May 2023 18:39:35 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-956ff2399c9so576412866b.3;
        Mon, 01 May 2023 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682966372; x=1685558372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vy8LMgK7nlj8Hadd9P4DNIqtoF7V1DAnGwP0/fa2hB8=;
        b=U5D7cxNQTURT8xwkIm3G1FjwzyMGG5dzHJMisO4ldoGpHCh2i4+CzU5YRAlZCAKUGD
         Xn6lbly6fyylDsFJy7yJgxXVXxkji8ExeXlGf6txh4V/hW7XCBVIKBxy5q71Bivb2V2c
         uIgmKUQHOAA0WMq1LxPtFAvSwnlWRx2YBULmIgt+592UWgpHwxO75jhDHOoB4H82COlr
         yy1R9sUHSAI2/hJ6oWc4RqgrpbJv+uy9qVnZ5qo62qEQ5zgJMIrAASjE+RcYdFefYVw3
         JNfCACRGxcC0WO5XEoqMtPKgw6j3KM5b4jUV2TgDyTT4trKxdU2Pwl0XeAcsxa+mW/xZ
         q4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682966372; x=1685558372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vy8LMgK7nlj8Hadd9P4DNIqtoF7V1DAnGwP0/fa2hB8=;
        b=MFWJFlHm3p7GaIXr1f1Oqsrjmq3uoX60eQkqv68pfYj0zzWvgbbJ2nVUKd00nhyUrd
         OxVKoxXqIC0YqN53MbdO44We3SJlb7ODWwe0mjfley8VN6767a5PxNiKI5oK7rCvIQfA
         H2z0z6QYKB40VlLu8cbbTrc3daxAUy0+TO643WgoTeSsLhvki/4U2vl2IYfBwACZuqa/
         YBk7h0INWyc42lYVfKowavgLpTEF8nN3PYSp2OX0w6+NCGBESpHirr9EiM56dAUiJGf4
         2HhFHZ5fgHreg7TyhjzgXZBmCLoS5EXqdaalIZQQQdL2+yK1y03s1B+0txq+ztG8g6MA
         NJXQ==
X-Gm-Message-State: AC+VfDyMTi+kgjKrE5Y8MLac38fJlvjyvDjSESs2W/fPGBaYiLcZSYpe
	AY8Yi9yvGfAcTabG95dZVG2BkazLieRfMrC7Pnk=
X-Google-Smtp-Source: ACHHUZ7XYkmDWh6C7QrAP5IrIgIh54a4MMgW7FDGV1Ipa9leHn0ud1zf0ChP3eFCS4Yg4qGriQmF6zeP4UR5ar4Bb4U=
X-Received: by 2002:a17:907:160a:b0:94f:21cf:86c6 with SMTP id
 hb10-20020a170907160a00b0094f21cf86c6mr14226257ejc.51.1682966371921; Mon, 01
 May 2023 11:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230405195927.13487-1-ddrokosov@sberdevices.ru>
 <20230405195927.13487-5-ddrokosov@sberdevices.ru> <CAFBinCA3uZXzr3RgnWnKV5Qr-CPaZQX5joDg319i_cgzhLJy2g@mail.gmail.com>
 <20230425123304.xjmrkraybp2siwdw@CAB-WSD-L081021>
In-Reply-To: <20230425123304.xjmrkraybp2siwdw@CAB-WSD-L081021>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 1 May 2023 20:39:20 +0200
Message-ID: <CAFBinCCqx1oHf+PcXBkeRYHnGQChbTTPRyD8SJU+ait+TG+AjQ@mail.gmail.com>
Subject: Re: [PATCH v13 4/6] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_113934_563889_04466DAB 
X-CRM114-Status: GOOD (  30.88  )
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

SGVsbG8gRG1pdHJ5LAoKKEknbSBhd2FyZSB5b3UgYWxyZWFkeSBwb3N0ZWQgYSB2MTQgLSBidXQg
SSdtIHN0aWxsIHJlcGx5aW5nIGhlcmUgdG8KY29udGludWUgdGhlIGRpc2N1c3Npb24gb24gb25l
IHF1ZXN0aW9uIEkgaGFkIHRvIGtlZXAgdGhlIGNvbnRleHQpCgpPbiBUdWUsIEFwciAyNSwgMjAy
MyBhdCAyOjMz4oCvUE0gRG1pdHJ5IFJva29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4g
d3JvdGU6ClsuLi5dCj4gPiA+ICsvKiBQTEwgcmVnaXN0ZXIgb2Zmc2V0ICovCj4gPiA+ICsjZGVm
aW5lIEFOQUNUUkxfRklYUExMX0NUUkwwICAgMHgwCj4gPiA+ICsjZGVmaW5lIEFOQUNUUkxfRklY
UExMX0NUUkwxICAgMHg0Cj4gPiA+ICsjZGVmaW5lIEFOQUNUUkxfRklYUExMX1NUUyAgICAgMHgx
NAo+ID4gPiArI2RlZmluZSBBTkFDVFJMX0hJRklQTExfQ1RSTDAgIDB4YzAKPiA+ID4gKyNkZWZp
bmUgQU5BQ1RSTF9ISUZJUExMX0NUUkwxICAweGM0Cj4gPiA+ICsjZGVmaW5lIEFOQUNUUkxfSElG
SVBMTF9DVFJMMiAgMHhjOAo+ID4gPiArI2RlZmluZSBBTkFDVFJMX0hJRklQTExfQ1RSTDMgIDB4
Y2MKPiA+ID4gKyNkZWZpbmUgQU5BQ1RSTF9ISUZJUExMX0NUUkw0ICAweGQwCj4gPiA+ICsjZGVm
aW5lIEFOQUNUUkxfSElGSVBMTF9TVFMgICAgMHhkNAo+ID4gSGVyZSBJIGhhdmUgYSBxdWVzdGlv
biB0aGF0IHdpbGwgcG90ZW50aWFsbHkgYWZmZWN0IHBhdGNoIDMvNgo+ID4gKCJkdC1iaW5kaW5n
czogY2xvY2s6IG1lc29uOiBhZGQgQTEgUExMIGNsb2NrIGNvbnRyb2xsZXIgYmluZGluZ3MiKS4K
PiA+IEluIHRoZSBjb3Zlci1sZXR0ZXIgeW91IG1lbnRpb25lZCB0aGF0IHF1aXRlIGEgZmV3IGNs
b2NrcyBoYXZlIGJlZW4gb21pdHRlZC4KPiA+IEFueSBkdC1iaW5kaW5ncyB0aGF0IHdlIGNyZWF0
ZSBuZWVkIHRvIGJlIHN0YWJsZSBnb2luZyBmb3J3YXJkLiBUaGF0Cj4gPiBtZWFuczogdGhlIGR0
LWJpbmRpbmdzIHdpbGwgYWx3YXlzIG5lZWQgdG8gZGVzY3JpYmUgd2hhdCB0aGUgaGFyZHdhcmUK
PiA+IGlzIGNhcGFibGUgb2YsIG5vdCB3aGF0IHRoZSBkcml2ZXIgaW1wbGVtZW50cy4KPiA+IFNv
IG15IHF1ZXN0aW9uIGlzOiBkbyB3ZSBoYXZlIGFsbCBuZWVkZWQgaW5wdXRzIGRlc2NyaWJlZCBp
biB0aGUKPiA+IGR0LWJpbmRpbmdzIChldmVuIHRob3VnaCB3ZSdyZSBvbWl0dGluZyBxdWl0ZSBh
IGZldyByZWdpc3RlcnMgaGVyZQo+ID4gdGhhdCB3aWxsIG9ubHkgYmUgYWRkZWQvdXNlZCBpbiB0
aGUgZnV0dXJlKT8KPiA+IE9sZGVyIFNvQ3MgcmVxdWlyZSAodGVtcG9yYXJpbHkpIHVzaW5nIHRo
ZSBYVEFMIGNsb2NrIGZvciBDUFUgY2xvY2sKPiA+IHRyZWUgY2hhbmdlcy4gVG8gbWFrZSBhIGxv
bmcgc3Rvcnkgc2hvcnQ6IEknbSB3b25kZXJpbmcgaWYgLSBhdCBsZWFzdAo+ID4gLSB0aGUgWFRB
TCBjbG9jayBpbnB1dCBpcyBtaXNzaW5nLgo+Cj4gVGhlIEFtbG9naWMgQTEgY2xvY2sgZW5naW5l
IGNvbXByaXNlcyBmb3VyIGNsb2NrIGNvbnRyb2xsZXJzIGZvcgo+IHBlcmlwaGVyYWxzLCBQTEws
IENQVSwgYW5kIGF1ZGlvLiBXaGlsZSB0aGUgZmlyc3QgdHdvIGhhdmUgYmVlbgo+IGludHJvZHVj
ZWQgaW4gdGhlIGN1cnJlbnQgcGF0Y2ggc2VyaWVzLCB0aGUgbGFzdCB0d28gd2lsbCBiZSBzZW50
IGluIHRoZQo+IG5leHQgaXRlcmF0aW9uLgpJICh0aGluayB0aGF0IEkpIHVuZGVyc3RhbmQgdGhp
cyBwYXJ0LgoKPiBQcmVzZW50bHksIHRoZSBQTEwgY29udHJvbGxlciBkcml2ZXIgaW5jbHVkZXMg
YWxsIHRoZSByZXF1aXJlZCBiaW5kaW5ncywKPiBhbmQgdGhlIHBlcmlwaGVyYWxzIGNvbnRyb2xs
ZXIgZHJpdmVyIGhhcyBhbGwgYmluZGluZ3MgZXhjZXB0IGZvciB0aGUKPiBDUFUtcmVsYXRlZCBj
bG9jay4KTGV0J3Mgc3RpY2sgdG8gdGhlIFBMTCBjb250cm9sbGVyIGJpbmRpbmdzIGZvciB0aGUg
bmV4dCBwYXJ0LgpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIFBMTCBjbG9jayBjb250cm9s
bGVyIHJlZ2lzdGVycwooQU5BQ1RSTF8qKSBhcmUgbWFuYWdpbmcgdGhlIGZvbGxvd2luZyBjbG9j
a3M6Ci0gZml4ZWRfcGxsCi0gc3lzX3BsbAotIGhpZmlfcGxsCi0gd2hhdGV2ZXIgIkFVREREUyIg
aXMKLSBhbmQgc29tZSBtaXNjZWxsYW5lb3VzIHJlZ2lzdGVycyBsaWtlIEFOQUNUUkxfUE9SX0NO
VEwgYW5kCkFOQUNUUkxfTUlTQ1RPUF9DVFJMMAoKSSAqdGhpbmsqIHlvdSBnb3QgdGhlIGR0LWJp
bmRpbmdzIGNvcnJlY3Q6CkV2ZW4gdGhvdWdoIHRoZSBkcml2ZXIgcGFydCBkb2VzIG5vdCBzdXBw
b3J0IHRoZSBoaWZpX3BsbCB5ZXQsIHRoaXMgSVAKYmxvY2sgc2VlbXMgdG8gaGF2ZSBhICJoaWZp
cGxsX2luIiBjbG9jayBpbnB1dC4KU2luY2UgdGhlIGR0LWJpbmRpbmdzIGRlc2NyaWJlcyB0aGUg
aGFyZHdhcmUgaXQgbWF5IGRlc2NyaWJlIChmb3IKZXhhbXBsZSkgY2xvY2sgaW5wdXRzIHRoYXQg
YXJlIG5vdCB1c2VkIGJ5IHRoZSBkcml2ZXIgeWV0LgoKSWYgeW91IGFncmVlIHdpdGggbXkgc3Rh
dGVtZW50IGZyb20gYWJvdmUgSSdsbCBiZSBhYmxlIHRvIG1ha2UgbXkKb3JpZ2luYWwgcXVlc3Rp
b24gbW9yZSBzcGVjaWZpYzoKU2luY2Ugd2Uga25vdyB0aGF0IHdlIGhhdmUgYWxsIHRoZSByZXF1
aXJlZCBpbnB1dHMgZm9yIGZpeGVkX3BsbCwKc3lzX3BsbCBhbmQgaGlmaV9wbGwgLSBkbyB5b3Ug
a25vdyB3aGF0IEFVREREUyBpcyBhbmQgd2hldGhlciBpdApyZXF1aXJlcyBhbnkgc3BlY2lmaWMg
Y2xvY2sgaW5wdXRzIChvdGhlciB0aGFuICJmaXhwbGxfaW4iIGFuZAoiaGlmaXBsbF9pbiIpPwoK
PiBIb3dldmVyLCBJIGRvIG5vdCBiZWxpZXZlIHRoaXMgdG8gYmUgYSBzaWduaWZpY2FudCBpc3N1
ZS4gVGhlIGNsb2NrIERUCj4gYmluZGluZ3MgYXJlIG9yZ2FuaXplZCB0byBzaW1wbGlmeSB0aGUg
cHJvY2VzcyBvZiBpbnRyb2R1Y2luZyBuZXcgYmluZGluZ3MsCj4gd2hldGhlciBwdWJsaWMgb3Ig
cHJpdmF0ZS4gRm9yIGluc3RhbmNlLCB3ZSBtYXkgYWRkIG5ldyBiaW5kaW5ncyB0bwo+IGluY2x1
ZGUvZHQtYmluZGluZ3MgYXQgdGhlIGVuZCBvZiB0aGUgbGlzdCBhbmQgaW5jcmVhc2UgdGhlIG92
ZXJhbGwgbnVtYmVyLAo+IHdpdGhvdXQgZGlzcnVwdGluZyB0aGUgRFQgYmluZGluZ3MgQUJJICh0
aGUgb2xkIG51bWJlcnMgd2lsbCByZW1haW4KPiB1bmNoYW5nZWQpLgpZZXAsIHRoaXMgcGFydCBp
cyBjbGVhciB0byBtZS4gSSBzaG91bGQgaGF2ZSBiZWVuIG1vcmUgc3BlY2lmaWMgdGhhdCBJCndh
cyBhc2tpbmcgYWJvdXQgdGhlIGlucHV0cyB0aGF0IGFyZSBkZXNjcmliZWQgaW4gdGhlIC55YW1s
IGZpbGUsIG5vdAp0aGUgY2xvY2sgSURzLgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
