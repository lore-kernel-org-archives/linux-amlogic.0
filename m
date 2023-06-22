Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05769EB64D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 06:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHbUF26hxln0IMP8A6OhScwo9yh4rQxxQvJDr0vBgQA=; b=g96LF0jZKeQfbh
	JGuZ9coctRUBaQVXaJwGI3HoARZXEYwE0EaYZGFjTLfqRsra1IyeGVrhAYjryPJGcjzqcoHl5djKB
	35dtDPraAsCQJQ0M7dmNsLT77rRBJfTd87WgUPfYfsV76aUN+SiPk8dY0ssQEV4hCR4xChC13GKbM
	nde4xj1ftqi9+DYt+FYNI51y3PqfiXdykxc7ELDcllR3dnnPqaa809Hs1t4+csRjFCaEu5oyOjt8Q
	gPu5hNXgoRs1EyAQSGXsI28aynDu0O8BI3WRGFtmoVbLqz2UYNcZg+U53PCqm5wS1aHXTK61cJ700
	dpsiRPyp9M5bo49/eEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCDRw-00Gz3q-07;
	Thu, 22 Jun 2023 06:05:44 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCDRs-00Gz2a-1k
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Jun 2023 06:05:42 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b45bc83f26so95370381fa.0
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Jun 2023 23:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687413938; x=1690005938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d48QL4xYBkYPSQ79byiwt7gdoiHpfP1AngpKZiSgsmo=;
        b=pDGDZPRo4LMAO7LsAH/HPtgh50sV9icy1ai8AYAceBTMnBNTj1tVmVfdCPiK08qAbV
         AcnPZtdnFMkoT6VmBJ4I+uCbZyqzZ774UdpOG28TCqTJ0i0K89bz/WxETQTn4YbI6a3p
         z7RflGIlSy23sVd2SN0S9a0dFcvPo0/QFg1lLh03K99ZuUJvK2jsiumW3SkPSzmeScGR
         f5bmfeA12+9Jz4cPzg/zp9AtCRNGiTJsStJYQqIokHb4C6N+X8e2l1EQC4X/9Wu0rZN/
         OEJDVWNzgxf53MjydCSFoxCjMTnA+F45B99E25OgqI0pGq82DgOBaYVLLZTpQ8cOzF0m
         TOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687413938; x=1690005938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d48QL4xYBkYPSQ79byiwt7gdoiHpfP1AngpKZiSgsmo=;
        b=ZRfJxk8PYqCc6l52s2q6brp6A8h57JrWBbd6XdxheR5dV0ZOpUQFryYGKMZ58LQtF8
         uEBNfMlr6LxtXMnnFEB1R0RLFu3d+eRo//zS4mUAh+GZ9iWWPmS0e65BnLwD+wU6ujvJ
         nhT6rgj2X0AyHG/a9QB3indcq0T1bFKOdXriVUb0AN92iqJDXjfUPMvwtFH70lvp4Ydz
         db6hMWuu9t1GdRmrhC9SmUMdVSS+a0LXxvOn25+m48fHu+m/ySYUg7yhe7gon9tfRta6
         Tt/zTcAfev8I2yiDDhqtK42jSlxINKojDSG6GKQqrF/gjSG7RtqudrRLcIh+vNOObWgW
         eY4w==
X-Gm-Message-State: AC+VfDxb4EDUmDBQA0E8IbfAB83JiErnhR3a4IRBCP3X0LE49XrkWCK6
	cIBIY81bgI99hNrQ/23g26ROrnu/RWLPLhtNuzw=
X-Google-Smtp-Source: ACHHUZ4mzF9dz2D1rbqamqE5oOM4nBo5i0YkWVxNocvrS9XvQU+a+JjvBtryfGC6QIeOVmUOk9dGHQ==
X-Received: by 2002:a19:7b06:0:b0:4f3:a051:58df with SMTP id w6-20020a197b06000000b004f3a05158dfmr10488956lfc.59.1687413937848;
        Wed, 21 Jun 2023 23:05:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id y17-20020a056000109100b0030c6751a49dsm6057792wrw.115.2023.06.21.23.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 23:05:37 -0700 (PDT)
Message-ID: <e4c993e1-8409-1ec0-c1b2-175603052e46@linaro.org>
Date: Thu, 22 Jun 2023 08:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
To: tanure@linux.com, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Nick <nick@khadas.com>, Artem <art@khadas.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230621133215.109254-1-tanure@linux.com>
 <20230621133215.109254-3-tanure@linux.com>
 <20f25e98-d02e-f914-c4e7-72bb9ddb1ae5@linaro.org>
 <20230621-uncaring-impeding-15cfbe8e0e7c@spud>
 <CAJX_Q+342dx9S4C2C814uQgOj_QR3EBKhETH9eVZOm7PtzFAVQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJX_Q+342dx9S4C2C814uQgOj_QR3EBKhETH9eVZOm7PtzFAVQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_230540_682731_4308BFF7 
X-CRM114-Status: GOOD (  14.27  )
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

T24gMjIvMDYvMjAyMyAwNzozMiwgTHVjYXMgVGFudXJlIHdyb3RlOgo+IE9uIFdlZCwgSnVuIDIx
LCAyMDIzIGF0IDc6MTLigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Pgo+PiBMdWNhcywKPj4KPj4gT24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMDM6NTM6MDRQTSAr
MDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDIxLzA2LzIwMjMgMTU6MzIs
IEx1Y2FzIFRhbnVyZSB3cm90ZToKPj4+PiBBbWxvZ2ljIFQ3IFNvQ3MgdXNlcyB0aGUgc2FtZSBV
QVJUIGNvbnRyb2xsZXIgYXMgUzQgU29DcyBhbmQgRzEyQS4KPj4+PiBUaGVyZSBpcyBubyBuZWVk
IGZvciBhbiBleHRyYSBjb21wYXRpYmxlIGxpbmUgaW4gdGhlIGRyaXZlciwgYnV0Cj4+Pj4gYWRk
IFQ3IGNvbXBhdGlibGUgbGluZSBmb3IgZG9jdW1lbnRhdGlvbi4KPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4KPj4+PiAtLS0KPj4+PiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sICAgICAg
ICAgIHwgMiArKwo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9h
bWxvZ2ljLG1lc29uLXVhcnQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKPj4+PiBpbmRleCAwMWVjNDViM2I0MDYu
Ljg2MGFiNThkODdiMCAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sCj4+Pj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFt
bAo+Pj4+IEBAIC0zMyw2ICszMyw3IEBAIHByb3BlcnRpZXM6Cj4+Pj4gICAgICAgICAgICAgICAg
LSBhbWxvZ2ljLG1lc29uOGItdWFydAo+Pj4+ICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNv
bi1neC11YXJ0Cj4+Pj4gICAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLXM0LXVhcnQKPj4+
PiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tdDctdWFydAo+Pj4+ICAgICAgICAgICAg
LSBjb25zdDogYW1sb2dpYyxtZXNvbi1hby11YXJ0Cj4+Pj4gICAgICAgIC0gZGVzY3JpcHRpb246
IEFsd2F5cy1vbiBwb3dlciBkb21haW4gVUFSVCBjb250cm9sbGVyIG9uIEcxMkEgU29Dcwo+Pj4+
ICAgICAgICAgIGl0ZW1zOgo+Pj4+IEBAIC00Niw2ICs0Nyw3IEBAIHByb3BlcnRpZXM6Cj4+Pj4g
ICAgICAgICAgICAtIGFtbG9naWMsbWVzb244Yi11YXJ0Cj4+Pj4gICAgICAgICAgICAtIGFtbG9n
aWMsbWVzb24tZ3gtdWFydAo+Pj4+ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLXM0LXVhcnQK
Pj4+PiArICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi10Ny11YXJ0Cj4+Pgo+Pj4gSXQgZG9lcyBu
b3QgbG9vayBsaWtlIHlvdSB0ZXN0ZWQgdGhlIERUUyBhZ2FpbnN0IGJpbmRpbmdzLiBQbGVhc2Ug
cnVuCj4+PiBgbWFrZSBkdGJzX2NoZWNrYCAoc2VlCj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvd3JpdGluZy1zY2hlbWEucnN0IG9yCj4+PiBodHRwczovL3d3dy5saW5hcm8u
b3JnL2Jsb2cvdGlwcy1hbmQtdHJpY2tzLWZvci12YWxpZGF0aW5nLWRldmljZXRyZWUtc291cmNl
cy13aXRoLXRoZS1kZXZpY2V0cmVlLXNjaGVtYS8KPj4+IGZvciBpbnN0cnVjdGlvbnMpLgo+Pgo+
PiBDaGVjayBiYWNrIG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uLCBJIHNob3VsZCd2ZSBwb3N0ZWQg
YW4gdW50ZXN0ZWQKPj4gdmVyc2lvbiBvZiB3aGF0IHlvdSBuZWVkIHRvIGFkZC4KPiBJIHNhdyB0
aGF0LCBidXQgYWRkaW5nIGEgUzQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIG1lLiBBbmQgeW91IGRp
ZG4ndAo+IHNob3cgdGhlIGVudGlyZSBjaGFuZ2UsIHNvIEkgY2FuJ3QgdW5kZXJzdGFuZCB3aGF0
IHlvdSB3YW50IHRoZXJlLgoKRm9yIHN1cmUgeW91IG5lZWQgc29tZXRoaW5nIHdoaWNoIGRvZXMg
bm90IHRyaWdnZXIgZXJyb3JzLiBJZiB5b3UgY2xhaW0KYWRkaW5nIFM0IGFzIGZhbGxiYWNrIGRv
ZXMgbm90IG1ha2Ugc2Vuc2UsIHRoZW4gd2h5IGRpZCB5b3UgdXNlIGl0PwpTZW5kaW5nIGEgY29k
ZSB3aGljaCBpcyBjbGVhcmx5IGluY29ycmVjdCBkb2VzIG5vdCBtYWtlIHNlbnNlLgoKCkJlc3Qg
cmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
