Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A3EC4167B
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGjRdtVI3uZOR+G2ATBFjZvQ3r5stUl8WhMJQyrgWPk=; b=GUH8lUDHXGLp8X
	wgJ00fOFMee9bQMhoXNNxGcjQXZYU+aMHlmJZkNaVAAyvOqDqEAMD1Ehn+odIgozQCgV6zsUREOrg
	nvjlOjXMSejdx1MPq/YKyc4cpmFkj12g48pc4Bb6buiV0Ike77fCvRAyHtPnsl6ZoqB/y/WyyzCdd
	i9Pd+AOcRPWX6Nmv1ksLF9dyByYNXdqvNV3GuOp14ddMlEuF94z1ZW09jTaK444JapyLiMqN3B+rx
	QzyfJjDOmgG3zmP/eL87ANNnNWQ0GPa/RBEYT62gF3o2UmRnVdyt/lKQx9dAFm0PDxZM5xwzhcpvf
	00MHFxEShhpLmrDEit1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVSN-00FAPZ-Lj; Fri, 25 Nov 2022 09:57:15 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVHG-00F3jb-Db
	for linux-amlogic@lists.infradead.org; Fri, 25 Nov 2022 09:45:51 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d1so5908146wrs.12
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Nov 2022 01:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRHQGS+MoseEWu2yP0z89M73Jh0x//1y0OJv+t/zrF4=;
        b=VHenaF9GA9zau2yTbhZLVlj/UOicgW8VqYY9JP+GKLrUZKstFV4JeYJC14+igFZ5jo
         ivV6GZPYQCSu6F/41h4fNLdg5NXdV6JOc1seY/dmy447b1+Ry/DWlKbMbrEECVWopaFS
         ZbdlzdkDTZKhTb8cp7tdSX8OVFEMKdNNXwJ2BmeCDzKARD9QAKA95dkXrn/WfbadyLPh
         QiKFe5V6aScDowFY2Cb1rsOLTZdBihkp+l7BW/H++uTzBjXCUIWvyIXrSGB4/TCuz7U1
         CVbvKY0EBFGYkXYfBTAAm+zyPCx5lUGCGnJY1WNxYXhwefWSMujvZiQi4FVG0FdYmOZK
         vtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NRHQGS+MoseEWu2yP0z89M73Jh0x//1y0OJv+t/zrF4=;
        b=S+fRHyezosrr8m31sn22uftkyCs0gdCRA0g8dqJE7d5TDbzBqgymcjgkOxolZfBK7A
         ys0VAVBqbtofXtVFsXkq/D8OiEvvTc2/3bIHutJ1fWV2OcdpfjwXyZwNQ6A/PUuyfi7A
         yO78Uj/tMtp3aAdo/6NNkk334C5Ioi0RHBWEvdaL21PnQ0zW0BTCtVMsX3dp71ONFHIx
         vP+trA5HSKgbyA0bv+hHCMaikLs0+mRzhMAZzMV/auBqul1XpUDjxm/qRPmt+rACGkSJ
         /kGinjZK/IYNzOJzQOX8xqnnHF1ahJ8ePZscHbQl4Lb5rlggAFTXr0VStkHfl7T4DZhp
         clvg==
X-Gm-Message-State: ANoB5pnFnAdaNJsvGAVhD5zt8Ufepsj2t91N4Kkvab+W49LyYIjyWrv7
	XiEA0jaYxDHB0CjQzCiJxRO1NQ==
X-Google-Smtp-Source: AA0mqf77dAkSUmh1pzGht0Y8PIR6ERxk7qG/8Cmgq5KSMALFlw0aHhnbmfPpk9f+8tHdo0LVxfsSgw==
X-Received: by 2002:a5d:5b19:0:b0:241:dea3:ad48 with SMTP id bx25-20020a5d5b19000000b00241dea3ad48mr12678300wrb.357.1669369542781;
        Fri, 25 Nov 2022 01:45:42 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id h12-20020a056000000c00b00241cfa9333fsm3488340wrx.5.2022.11.25.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 01:45:42 -0800 (PST)
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-2-yu.tu@amlogic.com>
 <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
 <92b570ea-3ddc-8e91-5a7a-ed601bb7c02c@amlogic.com>
 <eb56ed39-cfaa-3368-a2c0-0a4e89440e40@linaro.org>
 <5b7176b4-d7a2-c67f-31c6-e842e0870836@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 neil.armstrong@linaro.org, Yu Tu <yu.tu@amlogic.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver and bindings
Date: Fri, 25 Nov 2022 10:23:28 +0100
In-reply-to: <5b7176b4-d7a2-c67f-31c6-e842e0870836@linaro.org>
Message-ID: <1jfse72wqk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_014546_769585_2CB8D473 
X-CRM114-Status: GOOD (  23.57  )
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

Ck9uIFdlZCAyMyBOb3YgMjAyMiBhdCAxNDo1MywgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKCj4gT24gMjMvMTEvMjAyMiAxNDoyMywg
TmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+IEhpLAo+PiAKPj4gT24gMjMvMTEvMjAyMiAxMjoxNiwg
WXUgVHUgd3JvdGU6Cj4+PiBIaSBLcnp5c3p0b2YsCj4+PiAgwqDCoMKgwqBUaGFuayB5b3UgZm9y
IHlvdXIgcmVwbHkuCj4+Pgo+Pj4gT24gMjAyMi8xMS8yMyAxODowOCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Pgo+Pj4+IE9uIDIzLzExLzIw
MjIgMDM6MTMsIFl1IFR1IHdyb3RlOgo+Pj4+PiBBZGQgdGhlIFM0IFBMTCBjbG9jayBjb250cm9s
bGVyIGZvdW5kIGFuZCBiaW5kaW5ncyBpbiB0aGUgczQgU29DIGZhbWlseS4KPj4+Pj4KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPgo+Pj4+PiAtLS0KPj4+Pj4g
wqAgLi4uL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbMKgwqAgfMKgIDUx
ICsKPj4+Pgo+Pj4+IFRoaXMgaXMgdjUgYW5kIHN0aWxsIGJpbmRpbmdzIGFyZSBoZXJlPyBCaW5k
aW5ncyBhcmUgYWx3YXlzIHNlcGFyYXRlCj4+Pj4gcGF0Y2hlcy4gVXNlIHN1YmplY3QgcHJlZml4
ZXMgbWF0Y2hpbmcgdGhlIHN1YnN5c3RlbSAoZ2l0IGxvZyAtLW9uZWxpbmUKPj4+PiAtLSAuLi4p
Lgo+Pj4+Cj4+Pj4gQW5kIHRoaXMgd2FzIHNwbGl0LCB3YXNuJ3QgaXQ/IFdoYXQgaGFwcGVuZWQg
aGVyZT8hPwo+Pj4KPj4+IFB1dCBiaW5kaW5ncyBhbmQgY2xvY2sgZHJpdmVyIHBhdGNoIHRvZ2V0
aGVyIGZyb20gSmVyb21lLiBNYXliZSB5b3UgY2FuIHJlYWQgdGhpcyBjaGF0IGhpc3RvcnkuCj4+
PiBodHRwczovL2xvcmUua2VybmVsLm9yL2FsbC8xankxdjZ6MTRuLmZzZkBzdGFyYnVja2lzYWN5
bG9uLmJheWxpYnJlLmNvbS8KPj4gCj4+IEplcm9tZSB3YXMgYXNraW5nIHlvdSB0byBzZW5kIDIg
cGF0Y2hzZXRzLCBvbmUgd2l0aCA6Cj4+IC0gYmluZGluZ3MgaW4gc2VwYXJhdGUgcGF0Y2hlcwo+
PiAtIGRyaXZlcnMgaW4gc2VwYXJhdGUgcGF0Y2hlcwo+PiBhbmQgYSBzZWNvbmQgd2l0aCBEVCBj
aGFuZ2VzLgoKSW5kZWVkLCB0aGlzIGlzIHdoYXQgd2FzIGFza2VkLiBJdCBpcyBhbGlnbmVkIHdp
dGggS3J6eXN6dG9mJ3MgcmVxdWVzdC4KCj4+IAo+PiBUaGVuIHdoZW4gdGhlIGJpbmRpbmdzICsg
Y2xvY2tzIHBhdGNoZXMgYXJlIG1lcmdlZCwgYSBwdWxsIHJlcXVlc3Qgb2YgdGhlIGJpbmRpbmdz
Cj4+IGNhbiBiZSBkb25lIHRvIG1lIHNvIEkgY2FuIG1lcmdlIGl0IHdpdGggRFQuCj4+IAo+Pj4K
Pj4+Pgo+Pj4+Cj4+Pj4+IMKgIE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+Pj4+
IMKgIGRyaXZlcnMvY2xrL21lc29uL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxMyArCj4+Pj4+IMKgIGRyaXZlcnMvY2xrL21lc29uL01ha2VmaWxl
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+Pj4+IMKg
IGRyaXZlcnMvY2xrL21lc29uL3M0LXBsbC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCA4NzUgKysrKysrKysrKysrKysrKysrCj4+Pj4+IMKgIGRyaXZlcnMvY2xrL21l
c29uL3M0LXBsbC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDg4
ICsrCj4+Pj4+IMKgIC4uLi9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmjC
oMKgIHzCoCAzMCArCj4+Pj4+IMKgIDcgZmlsZXMgY2hhbmdlZCwgMTA1OSBpbnNlcnRpb25zKCsp
Cj4+Pj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy55YW1sCj4+Pj4+IMKgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNvbi9zNC1wbGwuYwo+Pj4+PiDCoCBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9jbGsvbWVzb24vczQtcGxsLmgKPj4+Pj4gwqAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy5oCj4+Pj4+
Cj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xv
Y2svYW1sb2dpYyxzNC1wbGwtY2xrYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbAo+Pj4+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+Pj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmZkNTE3ZThlZjE0Zgo+Pj4+PiAtLS0g
L2Rldi9udWxsCj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9j
bG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLnlhbWwKPj4+Pj4gQEAgLTAsMCArMSw1MSBAQAo+Pj4+
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpCj4+Pj4+ICslWUFNTCAxLjIKPj4+Pj4gKy0tLQo+Pj4+PiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLnlhbWwjCj4+Pj4+ICsk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4+
Pj4gKwo+Pj4+PiArdGl0bGU6IEFtbG9naWMgTWVzb24gUyBzZXJpYWxzIFBMTCBDbG9jayBDb250
cm9sbGVyCj4+Pj4+ICsKPj4+Pj4gK21haW50YWluZXJzOgo+Pj4+PiArwqAgLSBOZWlsIEFybXN0
cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4+Pj4+ICvCoCAtIEplcm9tZSBCcnVuZXQg
PGpicnVuZXRAYmF5bGlicmUuY29tPgo+Pj4+PiArwqAgLSBZdSBUdSA8eXUuaHVAYW1sb2dpYy5j
b20+Cj4+Pj4+ICsKPj4+PiBPbmUgYmxhbmsgbGluZS4KPj4+Cj4+PiAgwqBJIHdpbGwgZGVsZXRl
IHRoaXMsIG9uIG5leHQgdmVyc2lvbiBwYXRjaC4KPj4+Cj4+Pj4KPj4+Pj4gKwo+Pj4+PiArcHJv
cGVydGllczoKPj4+Pj4gK8KgIGNvbXBhdGlibGU6Cj4+Pj4+ICvCoMKgwqAgY29uc3Q6IGFtbG9n
aWMsczQtcGxsLWNsa2MKPj4+Pj4gKwo+Pj4+PiArwqAgcmVnOgo+Pj4+PiArwqDCoMKgIG1heEl0
ZW1zOiAxCj4+Pj4+ICsKPj4+Pj4gK8KgIGNsb2NrczoKPj4+Pj4gK8KgwqDCoCBtYXhJdGVtczog
MQo+Pj4+PiArCj4+Pj4+ICvCoCBjbG9jay1uYW1lczoKPj4+Pj4gK8KgwqDCoCBpdGVtczoKPj4+
Pj4gK8KgwqDCoMKgwqAgLSBjb25zdDogeHRhbAo+Pj4+PiArCj4+Pj4+ICvCoCAiI2Nsb2NrLWNl
bGxzIjoKPj4+Pj4gK8KgwqDCoCBjb25zdDogMQo+Pj4+PiArCj4+Pj4+ICtyZXF1aXJlZDoKPj4+
Pj4gK8KgIC0gY29tcGF0aWJsZQo+Pj4+PiArwqAgLSByZWcKPj4+Pj4gK8KgIC0gY2xvY2tzCj4+
Pj4+ICvCoCAtIGNsb2NrLW5hbWVzCj4+Pj4+ICvCoCAtICIjY2xvY2stY2VsbHMiCj4+Pj4+ICsK
Pj4+Pj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+Pj4+PiArCj4+Pj4+ICtleGFtcGxl
czoKPj4+Pj4gK8KgIC0gfAo+Pj4+PiArwqDCoMKgIGNsa2NfcGxsOiBjbG9jay1jb250cm9sbGVy
QGZlMDA4MDAwIHsKPj4+Pj4gK8KgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHM0LXBs
bC1jbGtjIjsKPj4+Pj4gK8KgwqDCoMKgwqAgcmVnID0gPDB4ZmUwMDgwMDAgMHgxZTg+Owo+Pj4+
PiArwqDCoMKgwqDCoCBjbG9ja3MgPSA8Jnh0YWw+Owo+Pj4+PiArwqDCoMKgwqDCoCBjbG9jay1u
YW1lcyA9ICJ4dGFsIjsKPj4+Pj4gK8KgwqDCoMKgwqAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+Pj4+
PiArwqDCoMKgIH07Cj4+Pj4KPj4+Pgo+Pj4+PiArI2VuZGlmIC8qIF9fTUVTT05fUzRfUExMX0hf
XyAqLwo+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2lj
LHM0LXBsbC1jbGtjLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxs
LWNsa2MuaAo+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+PiBpbmRleCAwMDAwMDAwMDAw
MDAuLjM0NWY4NzAyMzg4Ngo+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+ICsrKyBiL2luY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy5oCj4+Pj4KPj4+PiBUaGlzIGJl
bG9uZ3MgdG8gYmluZGluZ3MgcGF0Y2gsIG5vdCBkcml2ZXIuCj4+Pj4KPj4+Pj4gQEAgLTAsMCAr
MSwzMCBAQAo+Pj4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBN
SVQpICovCj4+Pj4+ICsvKgo+Pj4+PiArICogQ29weXJpZ2h0IChjKSAyMDIxIEFtbG9naWMsIElu
Yy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPj4+Pj4gKyAqIEF1dGhvcjogWXUgVHUgPHl1LnR1QGFt
bG9naWMuY29tPgo+Pj4+PiArICovCj4+Pj4+ICsKPj4+Pj4gKyNpZm5kZWYgX0RUX0JJTkRJTkdT
X0NMT0NLX0FNTE9HSUNfUzRfUExMX0NMS0NfSAo+Pj4+PiArI2RlZmluZSBfRFRfQklORElOR1Nf
Q0xPQ0tfQU1MT0dJQ19TNF9QTExfQ0xLQ19ICj4+Pj4+ICsKPj4+Pj4gKy8qCj4+Pj4+ICsgKiBD
TEtJRCBpbmRleCB2YWx1ZXMKPj4+Pj4gKyAqLwo+Pj4+PiArCj4+Pj4+ICsjZGVmaW5lIENMS0lE
X0ZJWEVEX1BMTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMQo+Pj4+PiArI2RlZmluZSBDTEtJRF9G
Q0xLX0RJVjLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDMKPj4+Pgo+Pj4+IEluZGV4ZXMgc3RhcnQg
ZnJvbSAwIGFuZCBhcmUgaW5jcmVtZW50ZWQgYnkgMS4gTm90IGJ5IDIuCj4+Pj4KPj4+PiBOQUsu
Cj4+Pgo+Pj4gSSByZW1lbWJlciBKZXJvbWUgZGlzY3Vzc2luZyB0aGlzIHdpdGggeW91LllvdSBj
YW4gbG9vayBhdCB0aGlzIHN1Ym1pc3Npb24gaGlzdG9yeS4KPj4+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC9jMDg4ZTAxYy0wNzE0LTgyYmUtODM0Ny02MTQwZGFmNTY2NDBAbGluYXJvLm9y
Zy8KPj4gCj4+IEhpc3RvcmljYWxseSB3ZSBkaWQgdGhhdCBieSBvbmx5IGV4cG9zaW5nIHBhcnQg
b2YgdGhlIG51bWJlcnMsIGNvbnRyb2xsaW5nIHdoaWNoCj4+IGNsb2NrcyB3ZXJlIHBhcnQgb2Yg
dGhlIGJpbmRpbmdzLgo+PiAKPj4gQnV0IGl0IHNlZW1zIHRoaXMgZG9lc24ndCBtYWtlIHNlbnMg
YW55bW9yZSwgbWF5YmUgaXQgd291bGQgYmUgdGltZSB0byBwdXQgYWxsIHRoZQo+PiBjbG9jayBp
ZHMgaW4gdGhlIGJpbmRpbmdzIGZvciB0aGlzIG5ldyBTb0MgYW5kIGJyZWFrIHdpdGggdGhlIHBy
ZXZpb3VzIHN0cmF0ZWd5LgoKS3J6eXN6dG9mIGFuZCBJIGFncmVlZCB0aGVyZSBpcyBub3RoaW5n
IHdyb25nIHdpdGggdGhlIGN1cnJlbnQKYXBwcm9hY2gsIEkgYmVsaWV2ZS4KCkl0IGRvZXMgbm90
IHByZXZlbnQgc29tZW9uZSBmcm9tIHVzaW5nIGFuIHVuLWV4cG9zZWQgY2xvY2ssIHN1cmUsIG9y
CmV4cG9zaW5nIGl0IGluIHRoZSBmdXR1cmUgaWYgbmVjZXNzYXJ5LgoKSG93ZXZlciwgSSB0aGlu
ayBpdCBjbGVhcmx5IHNob3dzIHRoYXQgYW4gdW4tZXhwb3NlZCBlbGVtZW50IGlzIG5vdApleHBl
Y3RlZCB0byBiZSB1c2VkIGJ5IGFuIGV4dGVybmFsIGNvbnN1bWVycy4gSXQgc2hvdWxkIGJlIGVu
b3VnaCB0bwp0cmlnZ2VyIGEgZGlzY3Vzc2lvbiBpZiB0aGlzIGV4cGVjdGF0aW9uIGlzIHdyb25n
LgoKPgo+IFNvIHRoZSBvdXRjb21lIG9mIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIHdhcyBzb21l
d2hlcmUgbGF0ZXIgaW4gdGhhdAo+IHRocmVhZDoKPgo+PiBJdCBpcyBqdXN0IGEgY2hvaWNlIHRv
IG5vdCBleHBvc2Ugc29tZSBJRHMuCj4+IEl0IGlzIG5vdCB0aWVkIHRvIHRoZSBpbXBsZW1lbnRh
dGlvbiBhdCBhbGwuCj4+IEkgdGhpbmsgd2UgYWN0dWFsbHkgZm9sbG93IHRoZSBydWxlcyBhbmQg
dGhlIGlkZWEgYmVoaW5kIGl0Lgo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
