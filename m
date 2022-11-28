Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C113BC43217
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 12:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bl3Yr5AkgsoRppaI/n0lBEXh3PppbePwAJzOqFy1H4=; b=roLh3yL7U2Qzcp
	Fd1DYFNinuFnXZ5WAcZs2pySODIpMx709u3pqN/htVDV9gvOHBEO4MdhXAQ6iU++nbb5PFcCN2ZTq
	IraeM+iGyaX2Nk+vyDkTVtU/rs88GE9847nhV9OkdzixfUh9bMnR9TFvrdcVwH8E+ZK0KBQ+kgZ4+
	5sRoojvLGE1T+b1IFHdfwkjWm5e/ifwXlhyeJDypZ33VIZVHeFBBeD7e+LYYW3KqL3Mxk39ak4Lkg
	puCr6jnEkOSVykzzwL2m2GUjLCKDtEZoYPXHx4axymgbc06YnKbBQXJlxzmkf2lqXabrVcT95SVbB
	V+GcfAPDfb30dl3niaZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozdeU-001gKF-7O; Mon, 28 Nov 2022 12:54:26 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozdeH-001gEN-8i
	for linux-amlogic@lists.infradead.org; Mon, 28 Nov 2022 12:54:16 +0000
Received: by mail-wr1-x435.google.com with SMTP id x17so16644599wrn.6
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Nov 2022 04:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK7qj9aXUJa826HEmyjR+0PMVp4wD4eGk7gtFFJ40nA=;
        b=Q0uW3L0fkalrrFMcdBSypGNKFGzHvgGybKj4IpUm+p6wU1mHUg44U8cxfL5nfhmDlT
         2VzKN44IStX/oQtwG2p43wxDtqw5wBJKqIJ9TWBxv8IWfEVs1EFUGo/Ord8B4rdm9dQi
         firV4AN+oeO9HjsZmMW/ytu8rz45dZN/EIlG/mihescrrIaBdwUbBuZBg1HYXp7MviY1
         pTbNuhFCrf7zM9FoIa4T10qV2DJ+4UzXaPCFdCrLE2M7xOunlFaiH8Sgwt62uEyY+Ag5
         1jBx6joYA/VIxaMf6tDk5Ap4jDZwSa3x9AAY9Tk3EpVhDJOQ98OURBJ+dGg+hJd+7Qiz
         L6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jK7qj9aXUJa826HEmyjR+0PMVp4wD4eGk7gtFFJ40nA=;
        b=xYDWIO0yZten+TxHn/jbLPq+MKmDCzEaUTpniNar3Vs7h/Mk5KngJcVaeCOMs3sTkk
         MOsisE9doZfwrAYrEN5aSVpUFmrRFKDL6uCqIeEyf6h2GOg8yHriMn0DH40/jI8AS2PN
         SIdGoL0LvtWjuFyFpCDSZQhxFFQLSkcgXQ7coKEoxDQCxp6Xz4CdfzM+C7TDUgFThVw6
         6nRMyPeGSv9GtgK8j+IoG4p7Kwxtxg2hKvCVvInfiycwRcR2UmjTqZE1FOkBE+vGneXa
         dNF+2nEFdmtwOM5iDzV93nwT4VGOZG/Gk4lOU/7hi+lIDkeJgZ7m+6vTIBKq2fEcQqAR
         c7wg==
X-Gm-Message-State: ANoB5pnxQjc5c1wLVBp6cqG8Pt1V2nbvmb4Q2nmTrdcb+xdgUHmcWO1Y
	zsALo9zeyvbFdQxFsgnbmWzXBg==
X-Google-Smtp-Source: AA0mqf42I4YzFCmCIX6Y7CLLjIa2od2/zzq8dij0Vj6yhbihZB61n/r4BHawsiyTl6uEsUzNF00Z5g==
X-Received: by 2002:a5d:526b:0:b0:242:380:c10e with SMTP id l11-20020a5d526b000000b002420380c10emr10820781wrc.132.1669640049615;
        Mon, 28 Nov 2022 04:54:09 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g3-20020a5d5543000000b00241a8a5bc11sm10737223wrw.80.2022.11.28.04.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 04:54:09 -0800 (PST)
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-2-yu.tu@amlogic.com>
 <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
 <92b570ea-3ddc-8e91-5a7a-ed601bb7c02c@amlogic.com>
 <eb56ed39-cfaa-3368-a2c0-0a4e89440e40@linaro.org>
 <5b7176b4-d7a2-c67f-31c6-e842e0870836@linaro.org>
 <1jfse72wqk.fsf@starbuckisacylon.baylibre.com>
 <a6cf1b3f-259d-44b7-8a9a-2a0cd29c714b@amlogic.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, neil.armstrong@linaro.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen  Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver and bindings
Date: Mon, 28 Nov 2022 13:33:47 +0100
In-reply-to: <a6cf1b3f-259d-44b7-8a9a-2a0cd29c714b@amlogic.com>
Message-ID: <1jedtnp7db.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_045413_321987_A3A70E75 
X-CRM114-Status: GOOD (  26.49  )
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

Ck9uIE1vbiAyOCBOb3YgMjAyMiBhdCAxNTozOSwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3
cm90ZToKCj4gSGkgSmVyb21lLAo+IAlUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4KPiBPbiAy
MDIyLzExLzI1IDE3OjIzLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBbIEVYVEVSTkFMIEVNQUlM
IF0KPj4gT24gV2VkIDIzIE5vdiAyMDIyIGF0IDE0OjUzLCBLcnp5c3p0b2YgS296bG93c2tpCj4+
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+PiAKPj4+IE9uIDIzLzEx
LzIwMjIgMTQ6MjMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gT24g
MjMvMTEvMjAyMiAxMjoxNiwgWXUgVHUgd3JvdGU6Cj4+Pj4+IEhpIEtyenlzenRvZiwKPj4+Pj4g
ICDCoMKgwqDCoFRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4KPj4+Pj4KPj4+Pj4gT24gMjAyMi8x
MS8yMyAxODowOCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+Pj4+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Pj4+Pj4KPj4+Pj4+IE9uIDIzLzExLzIwMjIgMDM6MTMsIFl1IFR1IHdyb3RlOgo+
Pj4+Pj4+IEFkZCB0aGUgUzQgUExMIGNsb2NrIGNvbnRyb2xsZXIgZm91bmQgYW5kIGJpbmRpbmdz
IGluIHRoZSBzNCBTb0MgZmFtaWx5Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWXUg
VHUgPHl1LnR1QGFtbG9naWMuY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+ICDCoCAuLi4vYmluZGlu
Z3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy55YW1swqDCoCB8wqAgNTEgKwo+Pj4+Pj4KPj4+
Pj4+IFRoaXMgaXMgdjUgYW5kIHN0aWxsIGJpbmRpbmdzIGFyZSBoZXJlPyBCaW5kaW5ncyBhcmUg
YWx3YXlzIHNlcGFyYXRlCj4+Pj4+PiBwYXRjaGVzLiBVc2Ugc3ViamVjdCBwcmVmaXhlcyBtYXRj
aGluZyB0aGUgc3Vic3lzdGVtIChnaXQgbG9nIC0tb25lbGluZQo+Pj4+Pj4gLS0gLi4uKS4KPj4+
Pj4+Cj4+Pj4+PiBBbmQgdGhpcyB3YXMgc3BsaXQsIHdhc24ndCBpdD8gV2hhdCBoYXBwZW5lZCBo
ZXJlPyE/Cj4+Pj4+Cj4+Pj4+IFB1dCBiaW5kaW5ncyBhbmQgY2xvY2sgZHJpdmVyIHBhdGNoIHRv
Z2V0aGVyIGZyb20gSmVyb21lLiBNYXliZSB5b3UgY2FuIHJlYWQgdGhpcyBjaGF0IGhpc3Rvcnku
Cj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3IvYWxsLzFqeTF2NnoxNG4uZnNmQHN0YXJidWNr
aXNhY3lsb24uYmF5bGlicmUuY29tLwo+Pj4+Cj4+Pj4gSmVyb21lIHdhcyBhc2tpbmcgeW91IHRv
IHNlbmQgMiBwYXRjaHNldHMsIG9uZSB3aXRoIDoKPj4+PiAtIGJpbmRpbmdzIGluIHNlcGFyYXRl
IHBhdGNoZXMKPj4+PiAtIGRyaXZlcnMgaW4gc2VwYXJhdGUgcGF0Y2hlcwo+Pj4+IGFuZCBhIHNl
Y29uZCB3aXRoIERUIGNoYW5nZXMuCj4+IEluZGVlZCwgdGhpcyBpcyB3aGF0IHdhcyBhc2tlZC4g
SXQgaXMgYWxpZ25lZCB3aXRoIEtyenlzenRvZidzIHJlcXVlc3QuCj4KPiBBY2NvcmRpbmcgdG8g
eW91ciBkaXNjdXNzaW9uLCBJIHN0aWxsIHNob3VsZCBzZW5kIHBhdGNoZXMgaW4gdGhlIHByZXZp
b3VzCj4gd2F5IGluIHNlcmllcy4gQnV0IEknbSBnb2luZyB0byBjaGFuZ2UgaXQgbGlrZSB5b3Ug
c3VnZ2VzdGVkLgo+IEkgZG9uJ3Qga25vdywgYW0gSSBnZXR0aW5nIGl0IHJpZ2h0PwoKMyBwZW9w
bGUgdHJpZWQgdG8gZXhwbGFpbiB0aGlzIGFscmVhZHkgYW5kIHdlIGFsbCB0b2xkIHlvdSB0aGUg
c2FtZSB0aGluZy4KCiogMSBwYXRjaHNldCBwZXIgbWFpbnRhaW5lcjogY2xrIGFuZCBkdAoqIGJp
bmRpbmdzIG11c3QgYmUgZGVkaWNhdGVkIHBhdGNoZXMgLSBuZXZlciBtaXhlZCB3aXRoIGRyaXZl
ciBjb2RlLgoKSSBzdHJvbmdseSBzdWdnZXN0IHRoYXQgeW91IHRha2Ugc29tZSB0aW1lIHRvIChy
ZSlyZWFkOgoqIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRj
aGVzLmh0bWwKKiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1
Ym1pdHRpbmctcGF0Y2hlcy5odG1sCgpJZiBzdGlsbCB1bmNsZWFyLCBwbGVhc2UgdGFrZSBzb21l
IHRpbWUgdG8gbG9vayBhdCB0aGUga2VybmVsIG1haWxpbmcKbGlzdCBhcmNoaXZlIGFuZCBzZWUg
aG93IG90aGVycyBoYXZlIGRvbmUgdGhlIHNhbWUgdGhpbmdzLgoKVGh4LgoKPgo+PiAKPj4+Pgo+
Pj4+IFRoZW4gd2hlbiB0aGUgYmluZGluZ3MgKyBjbG9ja3MgcGF0Y2hlcyBhcmUgbWVyZ2VkLCBh
IHB1bGwgcmVxdWVzdCBvZiB0aGUgYmluZGluZ3MKPj4+PiBjYW4gYmUgZG9uZSB0byBtZSBzbyBJ
IGNhbiBtZXJnZSBpdCB3aXRoIERULgo+Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+PiAg
wqAgTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4+Pj4+PiAgwqAgZHJpdmVycy9j
bGsvbWVzb24vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDEzICsKPj4+Pj4+PiAgwqAgZHJpdmVycy9jbGsvbWVzb24vTWFrZWZpbGXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4+Pj4+PiAgwqAgZHJpdmVy
cy9jbGsvbWVzb24vczQtcGxsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDg3NSArKysrKysrKysrKysrKysrKysKPj4+Pj4+PiAgwqAgZHJpdmVycy9jbGsvbWVzb24v
czQtcGxsLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgODggKysK
Pj4+Pj4+PiAgwqAgLi4uL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MuaMKg
wqAgfMKgIDMwICsKPj4+Pj4+PiAgwqAgNyBmaWxlcyBjaGFuZ2VkLCAxMDU5IGluc2VydGlvbnMo
KykKPj4+Pj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLnlhbWwKPj4+Pj4+PiAgwqAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lc29uL3M0LXBsbC5jCj4+Pj4+Pj4gIMKgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNvbi9zNC1wbGwuaAo+Pj4+Pj4+ICDCoCBj
cmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBs
bC1jbGtjLmgKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbAo+
Pj4+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5m
ZDUxN2U4ZWYxNGYKPj4+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+Pj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbAo+
Pj4+Pj4+IEBAIC0wLDAgKzEsNTEgQEAKPj4+Pj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+Pj4+Pj4gKyVZQU1MIDEuMgo+Pj4+
Pj4+ICstLS0KPj4+Pj4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9jbG9j
ay9hbWxvZ2ljLHM0LXBsbC1jbGtjLnlhbWwjCj4+Pj4+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4+Pj4+ICsKPj4+Pj4+PiArdGl0
bGU6IEFtbG9naWMgTWVzb24gUyBzZXJpYWxzIFBMTCBDbG9jayBDb250cm9sbGVyCj4+Pj4+Pj4g
Kwo+Pj4+Pj4+ICttYWludGFpbmVyczoKPj4+Pj4+PiArwqAgLSBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4+Pj4+Pj4gK8KgIC0gSmVyb21lIEJydW5ldCA8amJydW5l
dEBiYXlsaWJyZS5jb20+Cj4+Pj4+Pj4gK8KgIC0gWXUgVHUgPHl1Lmh1QGFtbG9naWMuY29tPgo+
Pj4+Pj4+ICsKPj4+Pj4+IE9uZSBibGFuayBsaW5lLgo+Pj4+Pgo+Pj4+PiAgIMKgSSB3aWxsIGRl
bGV0ZSB0aGlzLCBvbiBuZXh0IHZlcnNpb24gcGF0Y2guCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+ICsK
Pj4+Pj4+PiArcHJvcGVydGllczoKPj4+Pj4+PiArwqAgY29tcGF0aWJsZToKPj4+Pj4+PiArwqDC
oMKgIGNvbnN0OiBhbWxvZ2ljLHM0LXBsbC1jbGtjCj4+Pj4+Pj4gKwo+Pj4+Pj4+ICvCoCByZWc6
Cj4+Pj4+Pj4gK8KgwqDCoCBtYXhJdGVtczogMQo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqAgY2xvY2tz
Ogo+Pj4+Pj4+ICvCoMKgwqAgbWF4SXRlbXM6IDEKPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgIGNsb2Nr
LW5hbWVzOgo+Pj4+Pj4+ICvCoMKgwqAgaXRlbXM6Cj4+Pj4+Pj4gK8KgwqDCoMKgwqAgLSBjb25z
dDogeHRhbAo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqAgIiNjbG9jay1jZWxscyI6Cj4+Pj4+Pj4gK8Kg
wqDCoCBjb25zdDogMQo+Pj4+Pj4+ICsKPj4+Pj4+PiArcmVxdWlyZWQ6Cj4+Pj4+Pj4gK8KgIC0g
Y29tcGF0aWJsZQo+Pj4+Pj4+ICvCoCAtIHJlZwo+Pj4+Pj4+ICvCoCAtIGNsb2Nrcwo+Pj4+Pj4+
ICvCoCAtIGNsb2NrLW5hbWVzCj4+Pj4+Pj4gK8KgIC0gIiNjbG9jay1jZWxscyIKPj4+Pj4+PiAr
Cj4+Pj4+Pj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+Pj4+Pj4+ICsKPj4+Pj4+PiAr
ZXhhbXBsZXM6Cj4+Pj4+Pj4gK8KgIC0gfAo+Pj4+Pj4+ICvCoMKgwqAgY2xrY19wbGw6IGNsb2Nr
LWNvbnRyb2xsZXJAZmUwMDgwMDAgewo+Pj4+Pj4+ICvCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAi
YW1sb2dpYyxzNC1wbGwtY2xrYyI7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqAgcmVnID0gPDB4ZmUwMDgw
MDAgMHgxZTg+Owo+Pj4+Pj4+ICvCoMKgwqDCoMKgIGNsb2NrcyA9IDwmeHRhbD47Cj4+Pj4+Pj4g
K8KgwqDCoMKgwqAgY2xvY2stbmFtZXMgPSAieHRhbCI7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqAgI2Ns
b2NrLWNlbGxzID0gPDE+Owo+Pj4+Pj4+ICvCoMKgwqAgfTsKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+
ICsjZW5kaWYgLyogX19NRVNPTl9TNF9QTExfSF9fICovCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy5oIGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmgKPj4+Pj4+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+Pj4+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzQ1Zjg3MDIzODg2Cj4+Pj4+
Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2sv
YW1sb2dpYyxzNC1wbGwtY2xrYy5oCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBiZWxvbmdzIHRvIGJpbmRp
bmdzIHBhdGNoLCBub3QgZHJpdmVyLgo+Pj4+Pj4KPj4+Pj4+PiBAQCAtMCwwICsxLDMwIEBACj4+
Pj4+Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKSAqLwo+
Pj4+Pj4+ICsvKgo+Pj4+Pj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjEgQW1sb2dpYywgSW5jLiBB
bGwgcmlnaHRzIHJlc2VydmVkLgo+Pj4+Pj4+ICsgKiBBdXRob3I6IFl1IFR1IDx5dS50dUBhbWxv
Z2ljLmNvbT4KPj4+Pj4+PiArICovCj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsjaWZuZGVmIF9EVF9CSU5E
SU5HU19DTE9DS19BTUxPR0lDX1M0X1BMTF9DTEtDX0gKPj4+Pj4+PiArI2RlZmluZSBfRFRfQklO
RElOR1NfQ0xPQ0tfQU1MT0dJQ19TNF9QTExfQ0xLQ19ICj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsvKgo+
Pj4+Pj4+ICsgKiBDTEtJRCBpbmRleCB2YWx1ZXMKPj4+Pj4+PiArICovCj4+Pj4+Pj4gKwo+Pj4+
Pj4+ICsjZGVmaW5lIENMS0lEX0ZJWEVEX1BMTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMQo+Pj4+
Pj4+ICsjZGVmaW5lIENMS0lEX0ZDTEtfRElWMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMwo+Pj4+
Pj4KPj4+Pj4+IEluZGV4ZXMgc3RhcnQgZnJvbSAwIGFuZCBhcmUgaW5jcmVtZW50ZWQgYnkgMS4g
Tm90IGJ5IDIuCj4+Pj4+Pgo+Pj4+Pj4gTkFLLgo+Pj4+Pgo+Pj4+PiBJIHJlbWVtYmVyIEplcm9t
ZSBkaXNjdXNzaW5nIHRoaXMgd2l0aCB5b3UuWW91IGNhbiBsb29rIGF0IHRoaXMgc3VibWlzc2lv
biBoaXN0b3J5Lgo+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYzA4OGUwMWMtMDcx
NC04MmJlLTgzNDctNjE0MGRhZjU2NjQwQGxpbmFyby5vcmcvCj4+Pj4KPj4+PiBIaXN0b3JpY2Fs
bHkgd2UgZGlkIHRoYXQgYnkgb25seSBleHBvc2luZyBwYXJ0IG9mIHRoZSBudW1iZXJzLCBjb250
cm9sbGluZyB3aGljaAo+Pj4+IGNsb2NrcyB3ZXJlIHBhcnQgb2YgdGhlIGJpbmRpbmdzLgo+Pj4+
Cj4+Pj4gQnV0IGl0IHNlZW1zIHRoaXMgZG9lc24ndCBtYWtlIHNlbnMgYW55bW9yZSwgbWF5YmUg
aXQgd291bGQgYmUgdGltZSB0byBwdXQgYWxsIHRoZQo+Pj4+IGNsb2NrIGlkcyBpbiB0aGUgYmlu
ZGluZ3MgZm9yIHRoaXMgbmV3IFNvQyBhbmQgYnJlYWsgd2l0aCB0aGUgcHJldmlvdXMgc3RyYXRl
Z3kuCj4+IEtyenlzenRvZiBhbmQgSSBhZ3JlZWQgdGhlcmUgaXMgbm90aGluZyB3cm9uZyB3aXRo
IHRoZSBjdXJyZW50Cj4+IGFwcHJvYWNoLCBJIGJlbGlldmUuCj4+IEl0IGRvZXMgbm90IHByZXZl
bnQgc29tZW9uZSBmcm9tIHVzaW5nIGFuIHVuLWV4cG9zZWQgY2xvY2ssIHN1cmUsIG9yCj4+IGV4
cG9zaW5nIGl0IGluIHRoZSBmdXR1cmUgaWYgbmVjZXNzYXJ5Lgo+PiBIb3dldmVyLCBJIHRoaW5r
IGl0IGNsZWFybHkgc2hvd3MgdGhhdCBhbiB1bi1leHBvc2VkIGVsZW1lbnQgaXMgbm90Cj4+IGV4
cGVjdGVkIHRvIGJlIHVzZWQgYnkgYW4gZXh0ZXJuYWwgY29uc3VtZXJzLiBJdCBzaG91bGQgYmUg
ZW5vdWdoIHRvCj4+IHRyaWdnZXIgYSBkaXNjdXNzaW9uIGlmIHRoaXMgZXhwZWN0YXRpb24gaXMg
d3JvbmcuCj4+IAo+Pj4KPj4+IFNvIHRoZSBvdXRjb21lIG9mIHRoZSBwcmV2aW91cyBkaXNjdXNz
aW9uIHdhcyBzb21ld2hlcmUgbGF0ZXIgaW4gdGhhdAo+Pj4gdGhyZWFkOgo+Pj4KPj4+PiBJdCBp
cyBqdXN0IGEgY2hvaWNlIHRvIG5vdCBleHBvc2Ugc29tZSBJRHMuCj4+Pj4gSXQgaXMgbm90IHRp
ZWQgdG8gdGhlIGltcGxlbWVudGF0aW9uIGF0IGFsbC4KPj4+PiBJIHRoaW5rIHdlIGFjdHVhbGx5
IGZvbGxvdyB0aGUgcnVsZXMgYW5kIHRoZSBpZGVhIGJlaGluZCBpdC4KPj4+Cj4+Pgo+Pj4gQmVz
dCByZWdhcmRzLAo+Pj4gS3J6eXN6dG9mCj4+IC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
