Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D840EB64DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 07:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DadD4gXatrsOxNiB6RUosRnboi2XyzQ3M5h9in2hSOM=; b=MhbvfBLAZ7r+Vd
	W5lgrq1reyZYp4XpHnGxy21nWlpVivhBe8U5nBaRxIuUgl8H2Y4OAM1iC+8XlT13psqptw14HKQUh
	f63j7hg7lvUK/wGx8YnftmtGHO/pal4PZc8wpEqAqMbpv9XYPOThMhW5iFuMiSyM/mmlPSRLAD0kI
	4NS5fTK7nOQg9mC+wUcJeZWQLQnK6njjFOeS6HVh+QF1woHlz73yE1/CmZnDGb6K7x0mX1g2aL04C
	PRQ8lLT3fi2U0QlEAWjo71jd1f3QXe3cItQhAIa2dI2xaHyVBhuYTVgBu6Rv6pjp4b1+DdrvEzrnU
	MIyKYiJSQ+Cr+D3+cv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCEsM-00HGhC-36;
	Thu, 22 Jun 2023 07:37:06 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCEsK-00HGgS-03;
	Thu, 22 Jun 2023 07:37:05 +0000
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-3fde5e37974so54361551cf.2;
        Thu, 22 Jun 2023 00:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687419422; x=1690011422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuUJjlZbFPNY43FuR0Z534E1rySnymoUTOyJbJ3pOqo=;
        b=Pcmc0LVnm0WPDrWAOvdBimpoBIi4RcqrPtxjQx03Kc3k/j2N4D7SCbRrcA4sSAn/BH
         Y8GY1Zh+Gi0+/JLT9hNt7qC9eD+zFLBkGS57kVL9pf0qMxGkO0tNVqNoQdjkpy4MtUYl
         mayo59HxJCP8uBd8G55lQ6rc4hd7bPf+Ohg1hal5JPHAiGyYLhkzPXW6JguJDHjjrIkY
         GuuBK1YwP+/DHClpMMXMXFn18fYX5sxBbTuJ81X80VXXRCieI6qJ4nOdJ79EbdDn2Ct3
         M8nLjZUNg49Qy6D6GpfOpTJ+xs0KbkR03S5+qVHwT0FuN3ZGaQEQAoNjUkH6Y2DD6atB
         eLXw==
X-Gm-Message-State: AC+VfDwQX6+EZbdxTWi0aC1BXKEx8xHlNZStRHjMFnb3cBYSIphhGMQv
	Ilu+ID0I6Bjw7gaReeG+el8QZf8HK3WVSruc
X-Google-Smtp-Source: ACHHUZ66+dqGySwGEzloGm9QbidDuc5Wth30jydWluhb1W2e57p8TXNK9boH3J3kPT5Cv3eyVTyBFg==
X-Received: by 2002:a05:622a:611:b0:3fd:d376:d9bb with SMTP id z17-20020a05622a061100b003fdd376d9bbmr21750481qta.18.1687419422075;
        Thu, 22 Jun 2023 00:37:02 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id v36-20020a25aba7000000b00bd01affd4c8sm1406857ybi.58.2023.06.22.00.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 00:37:01 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-570808d8ddeso66788877b3.0;
        Thu, 22 Jun 2023 00:37:01 -0700 (PDT)
X-Received: by 2002:a81:5215:0:b0:56c:e2c1:6695 with SMTP id
 g21-20020a815215000000b0056ce2c16695mr16348313ywb.50.1687419420742; Thu, 22
 Jun 2023 00:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230621133215.109254-1-tanure@linux.com> <20230621133215.109254-3-tanure@linux.com>
 <20f25e98-d02e-f914-c4e7-72bb9ddb1ae5@linaro.org> <20230621-uncaring-impeding-15cfbe8e0e7c@spud>
 <CAJX_Q+342dx9S4C2C814uQgOj_QR3EBKhETH9eVZOm7PtzFAVQ@mail.gmail.com>
 <e4c993e1-8409-1ec0-c1b2-175603052e46@linaro.org> <CAJX_Q+09WLqmnWwOL7QESEuDzwZvVVzbtg9Upd5j2LOAYs=vmA@mail.gmail.com>
 <20230622-hardhat-elitism-26f0d0df204f@wendy>
In-Reply-To: <20230622-hardhat-elitism-26f0d0df204f@wendy>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 22 Jun 2023 08:36:49 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3+bdXd-NrsQymXerpWZuj3zb8CKHcZRNM_iLSZcp2Mfg@mail.gmail.com>
Message-ID: <CAJX_Q+3+bdXd-NrsQymXerpWZuj3zb8CKHcZRNM_iLSZcp2Mfg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>, Artem <art@khadas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_003704_074487_7D3A641A 
X-CRM114-Status: GOOD (  40.57  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgODoxMuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgMDc6
NDM6MzFBTSArMDEwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMjIsIDIw
MjMgYXQgNzowNeKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPiA+IDxrcnp5c3p0b2Yua296bG93
c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPiBPbiAyMi8wNi8yMDIzIDA3OjMyLCBMdWNhcyBU
YW51cmUgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgNzoxMuKAr1BNIENv
bm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4+IE9uIFdlZCwgSnVu
IDIxLCAyMDIzIGF0IDAzOjUzOjA0UE0gKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6
Cj4gPiA+ID4+PiBPbiAyMS8wNi8yMDIzIDE1OjMyLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPiA+
ID4+Pj4gQW1sb2dpYyBUNyBTb0NzIHVzZXMgdGhlIHNhbWUgVUFSVCBjb250cm9sbGVyIGFzIFM0
IFNvQ3MgYW5kIEcxMkEuCj4gPiA+ID4+Pj4gVGhlcmUgaXMgbm8gbmVlZCBmb3IgYW4gZXh0cmEg
Y29tcGF0aWJsZSBsaW5lIGluIHRoZSBkcml2ZXIsIGJ1dAo+ID4gPiA+Pj4+IGFkZCBUNyBjb21w
YXRpYmxlIGxpbmUgZm9yIGRvY3VtZW50YXRpb24uCj4gPiA+ID4+Pj4KPiA+ID4gPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4gPiA+ID4+Pj4gLS0t
Cj4gPiA+ID4+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29u
LXVhcnQueWFtbCAgICAgICAgICB8IDIgKysKPiA+ID4gPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQo+ID4gPiA+Pj4+Cj4gPiA+ID4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24t
dWFydC55YW1sCj4gPiA+ID4+Pj4gaW5kZXggMDFlYzQ1YjNiNDA2Li44NjBhYjU4ZDg3YjAgMTAw
NjQ0Cj4gPiA+ID4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nl
cmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbAo+ID4gPiA+Pj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKPiA+
ID4gPj4+PiBAQCAtMzMsNiArMzMsNyBAQCBwcm9wZXJ0aWVzOgo+ID4gPiA+Pj4+ICAgICAgICAg
ICAgICAgIC0gYW1sb2dpYyxtZXNvbjhiLXVhcnQKPiA+ID4gPj4+PiAgICAgICAgICAgICAgICAt
IGFtbG9naWMsbWVzb24tZ3gtdWFydAo+ID4gPiA+Pj4+ICAgICAgICAgICAgICAgIC0gYW1sb2dp
YyxtZXNvbi1zNC11YXJ0Cj4gPiA+ID4+Pj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29u
LXQ3LXVhcnQKPiA+ID4gPj4+PiAgICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb24tYW8t
dWFydAo+ID4gPiA+Pj4+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBBbHdheXMtb24gcG93ZXIgZG9t
YWluIFVBUlQgY29udHJvbGxlciBvbiBHMTJBIFNvQ3MKPiA+ID4gPj4+PiAgICAgICAgICBpdGVt
czoKPiA+ID4gPj4+PiBAQCAtNDYsNiArNDcsNyBAQCBwcm9wZXJ0aWVzOgo+ID4gPiA+Pj4+ICAg
ICAgICAgICAgLSBhbWxvZ2ljLG1lc29uOGItdWFydAo+ID4gPiA+Pj4+ICAgICAgICAgICAgLSBh
bWxvZ2ljLG1lc29uLWd4LXVhcnQKPiA+ID4gPj4+PiAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNv
bi1zNC11YXJ0Cj4gPiA+ID4+Pj4gKyAgICAgICAgICAtIGFtbG9naWMsbWVzb24tdDctdWFydAo+
ID4gPiA+Pj4KPiA+ID4gPj4+IEl0IGRvZXMgbm90IGxvb2sgbGlrZSB5b3UgdGVzdGVkIHRoZSBE
VFMgYWdhaW5zdCBiaW5kaW5ncy4gUGxlYXNlIHJ1bgo+ID4gPiA+Pj4gYG1ha2UgZHRic19jaGVj
a2AgKHNlZQo+ID4gPiA+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dyaXRp
bmctc2NoZW1hLnJzdCBvcgo+ID4gPiA+Pj4gaHR0cHM6Ly93d3cubGluYXJvLm9yZy9ibG9nL3Rp
cHMtYW5kLXRyaWNrcy1mb3ItdmFsaWRhdGluZy1kZXZpY2V0cmVlLXNvdXJjZXMtd2l0aC10aGUt
ZGV2aWNldHJlZS1zY2hlbWEvCj4gPiA+ID4+PiBmb3IgaW5zdHJ1Y3Rpb25zKS4KPiA+ID4gPj4K
PiA+ID4gPj4gQ2hlY2sgYmFjayBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwgSSBzaG91bGQndmUg
cG9zdGVkIGFuIHVudGVzdGVkCj4gPiA+ID4+IHZlcnNpb24gb2Ygd2hhdCB5b3UgbmVlZCB0byBh
ZGQuCj4gPiA+ID4gSSBzYXcgdGhhdCwgYnV0IGFkZGluZyBhIFM0IGRvZXNuJ3QgbWFrZSBzZW5z
ZSB0byBtZS4gQW5kIHlvdSBkaWRuJ3QKPiA+ID4gPiBzaG93IHRoZSBlbnRpcmUgY2hhbmdlLCBz
byBJIGNhbid0IHVuZGVyc3RhbmQgd2hhdCB5b3Ugd2FudCB0aGVyZS4KPiA+ID4KPiA+ID4gRm9y
IHN1cmUgeW91IG5lZWQgc29tZXRoaW5nIHdoaWNoIGRvZXMgbm90IHRyaWdnZXIgZXJyb3JzLiBJ
ZiB5b3UgY2xhaW0KPiA+ID4gYWRkaW5nIFM0IGFzIGZhbGxiYWNrIGRvZXMgbm90IG1ha2Ugc2Vu
c2UsIHRoZW4gd2h5IGRpZCB5b3UgdXNlIGl0Pwo+ID4gPiBTZW5kaW5nIGEgY29kZSB3aGljaCBp
cyBjbGVhcmx5IGluY29ycmVjdCBkb2VzIG5vdCBtYWtlIHNlbnNlLgo+ID4gPgo+ID4gU29ycnks
IEkgdGhpbmsgd2UgYXJlIHRhbGtpbmcgYWJvdXQgZGlmZmVyZW50IHRoaW5ncy4gSXQgZG9lcyBu
b3QgbWFrZQo+ID4gc2Vuc2UgdG8gbWUgdG8gYWRkIGFuIFM0IGxpbmUgaW4gdGhlIGRvY3VtZW50
YXRpb24gd2hlbiBpdCBpcyBhbHJlYWR5Cj4gPiB0aGVyZS4gU28gSSBjb3VsZCBub3QgdW5kZXJz
dGFuZCBvciBtYWtlIHNlbnNlIG9mIHRoZSBwYXRjaCBDb25vciBzZW50Cj4gPiBpbiByZXBseSB0
byBteSBWMi4KPgo+IFRoYXQgaXMganVzdCBob3cgaXQgd29ya3MuIFlvdSBuZWVkIHRvIHNwZWxs
IG91dCBleGFjdGx5IHdoaWNoCj4gY29tYmluYXRpb25zIGFyZSBwZXJtaXR0ZWQuIFRoZSBjdXJy
ZW50IGVudHJ5IGZvciBzNCBzYXlzIHRoYXQgczQgaXMKPiBvbmx5IHBlcm1pdHRlZCBpbiBpc29s
YXRpb24uCj4gU2luY2UgeW91IGFyZSBhZGRpbmcgImFtbG9naWMsbWVzb24tdDctdWFydCIsICJh
bWxvZ2ljLG1lc29uLXM0LXVhcnQiCj4geW91IG5lZWQgdG8gZXhwbGljaXRseSBhbGxvdyB0aGF0
IGNvbWJpbmF0aW9uLiBZb3UnbGwgbm90aWNlIGlmIHlvdSBsb29rCj4gYXQgdGhlIGZpbGUgdGhh
dCB0aGUgZ3ggdWFydCBhcHBlYXJzIG1vcmUgdGhhbiBvbmNlLgo+Cj4gR2l2ZW4gdGhlIGcxMmEg
d2FzIHRoZSBtb3N0IHJlY2VudGx5IGFkZGVkIGNvbXBhdGlibGUsIGl0IG1pZ2h0IG1ha2UKPiBz
ZW5zZSB0byBmb2xsb3cgdGhlIHBhdHRlcm4gdGhhdCBpdCBoYWQgc2V0LCBnaXZlbiB0aGUgdGhp
bmcgeW91cgo+IG9yaWdpbmFsIHBhdGNoIGNvcGllZCB0aGUgbWF0Y2ggZGF0YSBmcm9tIHdhcyB0
aGUgZzEyYS4gVGhhdCBjaGFuZ2UgdG8KPiB0aGUgZHQtYmluZGluZyB3b3VsZCBsb29rIGxpa2U6
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwv
YW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sCj4gaW5kZXggMDFlYzQ1YjNiNDA2Li5l
YWUxMWU4N2I4OGEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKPiBAQCAt
NTAsNiArNTAsMTMgQEAgcHJvcGVydGllczoKPiAgICAgICAgICBpdGVtczoKPiAgICAgICAgICAg
IC0gY29uc3Q6IGFtbG9naWMsbWVzb24tZzEyYS11YXJ0Cj4gICAgICAgICAgICAtIGNvbnN0OiBh
bWxvZ2ljLG1lc29uLWd4LXVhcnQKPiArICAgICAgLSBkZXNjcmlwdGlvbjoKPiArICAgICAgICAg
IEV2ZXJ5dGhpbmctRWxzZSBwb3dlciBkb21haW4gVUFSVCBjb250cm9sbGVyIG9uIEcxMkEgY29t
cGF0aWJsZSBTb0NzCj4gKyAgICAgICAgaXRlbXM6Cj4gKyAgICAgICAgICAtIGVudW06Cj4gKyAg
ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLXQ3LXVhcnQKPiArICAgICAgICAgIC0gY29uc3Q6
IGFtbG9naWMsbWVzb24tZzEyYS11YXJ0Cj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1l
c29uLWd4LXVhcnQKPgo+ICAgIHJlZzoKPiAgICAgIG1heEl0ZW1zOiAxCj4KPiAvSS8gZG9uJ3Qg
cmVhbGx5IGNhcmUgd2hldGhlciB5b3UgZG8gdGhhdCwgb3IgZG8gdGhlIHM0IHZlcnNpb24gb2Yg
aXQsCj4gYnV0IGZvbGxvd2luZyB0aGUgbW9zdCByZWNlbnQgcGF0dGVybiBtaWdodCBtYWtlIG1v
cmUgc2Vuc2UuIFdoZW4gSQo+IHN1Z2dlc3RlZCBzNCwgaXQgd2FzIGJlY2F1c2UgSSBvbmx5IGxv
b2tlZCBhdCB0aGUgZHJpdmVyIHBhdGNoIHJhdGhlcgo+IHRoYW4gdGhlIGNvZGUgaXRzZWxmLgo+
Cj4gPiBLcnp5c3p0b2YsIEkgd2lsbCBjaGVjayBhZ2FpbiB3aXRoIGR0YnNfY2hlY2sgYW5kIHJl
LXNlbmQuCj4KPiBDaGVlcnMsCj4gQ29ub3IuCkkgYW0gc3RydWdnbGluZyB0byB1bmRlcnN0YW5k
IHRoaXMuIEV2ZXJ5dGhpbmcgSSB0cnkgZmFpbHMgdGhlIGNoZWNrLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
