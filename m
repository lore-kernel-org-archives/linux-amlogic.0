Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87032C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1pc9JJaVRb/d2QPiuDG+zZCI45bxBteR5CObebqRcQ=; b=LPZa9AS7qWn+5oukUPuzf+UoMf
	zpgKQXgY3Mbv1IdzX4CVZR8sh1jCVHiZhmu/HDNpS32ZTBrJ0WT1WvpwyH4XHZsVRpF8kQJ0xVsHb
	d2jT+bbSnwWVbJB+k/TrCebdGXY0dBI3GneArXaYlAJzVro4A2XDqYai6uG53Oq23zMDEjaGhzcRY
	Roh85cl6ve/b8hcyeiNa7amq5pzCphYkwz/ITpgDMdykM1I0BW9brh28JdPrTBGTMPOfr9x/sEBhy
	mIdi0soeUinmgjp2EJEKI53sf1zf/lBQnXaXCTtYg4chkSqgTjnaTjpZDGALHZV8BeH7AmqnJN0cy
	IRSa/RXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpp8-00HFIl-Vx; Wed, 23 Nov 2022 13:29:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpod-00HEmk-2I
	for linux-amlogic@bombadil.infradead.org; Wed, 23 Nov 2022 13:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=TkiWRuYD2knqqdxwJxwHHjuebCRQBiEK9jcJD+g0pcM=; b=gDbhWBCBoxjE9SAB6zwmpV9o42
	gqdQcFCfn9ltULE4YKUb9L9p3am75SPRvzChIVf8IHn2Mmrlf/zz7aTkE5hBy0yB38cYSk85Penpb
	NzhYSj7LbLcUhLNJCmel7MSagvvs6AvJw1PNnXwKWPyYLpHrV04tUx3wprRUmFGC4eAifga2GBHAx
	gRwPV64hCzaK5bgrvYxwdEBhfFdUvJ8pyTHnXHeshltn4IXHHZfKglqUuBfFVIQNp8GEkszG/+EMv
	RMVrG4z958neWee7pKUYeRd8rCxAUnVY8SMxDh/VMSes96nxz7h2a9d5b/xfhwzNIsd6WKAl3XNKd
	UwWQLg4A==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpjC-003nGx-Kb
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 13:23:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id n3so12804343wrp.5
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 05:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TkiWRuYD2knqqdxwJxwHHjuebCRQBiEK9jcJD+g0pcM=;
        b=T9svSE0oUJMN5OvhyI0f/M31vDqpQ+NUh5/oWXHGxorTb8dzZzZ0x4eXE498Tkkw/W
         abjsnsCS07Wczaavcy/hMSQEtEyjSiz93fk/+7CXBp+hlXGEBgMrbpKmkoZC8/lvWsPK
         8t1tud5Oth6y/8qZuLNul5+oKiYS74/z58c4SYvU0XkjGNVLrro4uSsqooH9J3O8B17v
         3pfC254xIKae2OMEee8E5P1L/cZpwi3h1XsHMgwshJw0V1jWPai0gzx3t50QnepgeLxu
         ZRYiZO3nhdjtbV1vpIMEiyHHD1l/C/laC+gUKz7xYzCf4UsJZQfoTV7DYMvU6FY/kx4J
         h1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkiWRuYD2knqqdxwJxwHHjuebCRQBiEK9jcJD+g0pcM=;
        b=axtNKjejlCT4fYshx4yrxsEixlMyZvrN4IvqZZTtUQ6QDqub96F380ENi+iOoaZXp7
         zdeIRd5Bh/uVQZsTlDk/VxL0Sapu+q7KBVXmwDW3Mg1XKM/YVTBLa3U63/BREnaMHQu4
         poqJglHQXgENb5Jm/cDUSq2NhDGc6du9vbxe6VM63nYDoQ3P5Ey5uRBJU7mrJV2HBQ+G
         Es8l118uLUlHB88q5+aBgVIY5Me9eQblAMZMIWhDYU/nz61uAuJPT0Ast2ph8owVa0iw
         FNIFl/d7W56kcQ5JDK1SsmcTqsqrzX3050IqLk8LqNbV2cTGqKwnbtRGKVRk3Mj0+6sB
         zfgA==
X-Gm-Message-State: ANoB5plfaEtucAoIbY9HHve7XiZDM7CyGKlHiMRdj8YpXtAD3GTbOiLf
	JtEQrSDfGeNuqPLc9l+aVhlM0A==
X-Google-Smtp-Source: AA0mqf5RrnqX/NxyNHmTNkJKTpMhPMIOxJ1w2SapdUDQw0M+Nb66CgbKIgCfLWeRWjW8+FJ4WRPgnQ==
X-Received: by 2002:a5d:69d2:0:b0:241:ef59:e41f with SMTP id s18-20020a5d69d2000000b00241ef59e41fmr1455431wrw.486.1669209828269;
        Wed, 23 Nov 2022 05:23:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e551:24c3:152c:7c05? ([2a01:e0a:982:cbb0:e551:24c3:152c:7c05])
        by smtp.gmail.com with ESMTPSA id c1-20020adffb01000000b0023657e1b980sm16452329wrr.53.2022.11.23.05.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:23:47 -0800 (PST)
Message-ID: <eb56ed39-cfaa-3368-a2c0-0a4e89440e40@linaro.org>
Date: Wed, 23 Nov 2022 14:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver and bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-2-yu.tu@amlogic.com>
 <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
 <92b570ea-3ddc-8e91-5a7a-ed601bb7c02c@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <92b570ea-3ddc-8e91-5a7a-ed601bb7c02c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_132350_932950_C940D45A 
X-CRM114-Status: GOOD (  20.86  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMy8xMS8yMDIyIDEyOjE2LCBZdSBUdSB3cm90ZToKPiBIaSBLcnp5c3p0b2YsCj4g
IMKgwqDCoMKgVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lgo+IAo+IE9uIDIwMjIvMTEvMjMgMTg6
MDgsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pgo+
PiBPbiAyMy8xMS8yMDIyIDAzOjEzLCBZdSBUdSB3cm90ZToKPj4+IEFkZCB0aGUgUzQgUExMIGNs
b2NrIGNvbnRyb2xsZXIgZm91bmQgYW5kIGJpbmRpbmdzIGluIHRoZSBzNCBTb0MgZmFtaWx5Lgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4KPj4+IC0tLQo+
Pj4gwqAgLi4uL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbMKgwqAgfMKg
IDUxICsKPj4KPj4gVGhpcyBpcyB2NSBhbmQgc3RpbGwgYmluZGluZ3MgYXJlIGhlcmU/IEJpbmRp
bmdzIGFyZSBhbHdheXMgc2VwYXJhdGUKPj4gcGF0Y2hlcy4gVXNlIHN1YmplY3QgcHJlZml4ZXMg
bWF0Y2hpbmcgdGhlIHN1YnN5c3RlbSAoZ2l0IGxvZyAtLW9uZWxpbmUKPj4gLS0gLi4uKS4KPj4K
Pj4gQW5kIHRoaXMgd2FzIHNwbGl0LCB3YXNuJ3QgaXQ/IFdoYXQgaGFwcGVuZWQgaGVyZT8hPwo+
IAo+IFB1dCBiaW5kaW5ncyBhbmQgY2xvY2sgZHJpdmVyIHBhdGNoIHRvZ2V0aGVyIGZyb20gSmVy
b21lLiBNYXliZSB5b3UgY2FuIHJlYWQgdGhpcyBjaGF0IGhpc3RvcnkuCj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vci9hbGwvMWp5MXY2ejE0bi5mc2ZAc3RhcmJ1Y2tpc2FjeWxvbi5iYXlsaWJyZS5j
b20vCgpKZXJvbWUgd2FzIGFza2luZyB5b3UgdG8gc2VuZCAyIHBhdGNoc2V0cywgb25lIHdpdGgg
OgotIGJpbmRpbmdzIGluIHNlcGFyYXRlIHBhdGNoZXMKLSBkcml2ZXJzIGluIHNlcGFyYXRlIHBh
dGNoZXMKYW5kIGEgc2Vjb25kIHdpdGggRFQgY2hhbmdlcy4KClRoZW4gd2hlbiB0aGUgYmluZGlu
Z3MgKyBjbG9ja3MgcGF0Y2hlcyBhcmUgbWVyZ2VkLCBhIHB1bGwgcmVxdWVzdCBvZiB0aGUgYmlu
ZGluZ3MKY2FuIGJlIGRvbmUgdG8gbWUgc28gSSBjYW4gbWVyZ2UgaXQgd2l0aCBEVC4KCj4gCj4+
Cj4+Cj4+PiDCoCBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4gwqAgZHJpdmVy
cy9jbGsvbWVzb24vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDEzICsKPj4+IMKgIGRyaXZlcnMvY2xrL21lc29uL01ha2VmaWxlwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+PiDCoCBkcml2ZXJzL2Nsay9t
ZXNvbi9zNC1wbGwuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgODc1
ICsrKysrKysrKysrKysrKysrKwo+Pj4gwqAgZHJpdmVycy9jbGsvbWVzb24vczQtcGxsLmjCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgODggKysKPj4+IMKgIC4uLi9k
dC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmjCoMKgIHzCoCAzMCArCj4+PiDC
oCA3IGZpbGVzIGNoYW5nZWQsIDEwNTkgaW5zZXJ0aW9ucygrKQo+Pj4gwqAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0
LXBsbC1jbGtjLnlhbWwKPj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNv
bi9zNC1wbGwuYwo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lc29uL3M0
LXBsbC5oCj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9j
ay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmgKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtj
LnlhbWwKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmZk
NTE3ZThlZjE0Zgo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbAo+Pj4gQEAgLTAs
MCArMSw1MSBAQAo+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlKQo+Pj4gKyVZQU1MIDEuMgo+Pj4gKy0tLQo+Pj4gKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy55YW1sIwo+
Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iwo+Pj4gKwo+Pj4gK3RpdGxlOiBBbWxvZ2ljIE1lc29uIFMgc2VyaWFscyBQTEwgQ2xvY2sgQ29u
dHJvbGxlcgo+Pj4gKwo+Pj4gK21haW50YWluZXJzOgo+Pj4gK8KgIC0gTmVpbCBBcm1zdHJvbmcg
PG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+Pj4gK8KgIC0gSmVyb21lIEJydW5ldCA8amJydW5l
dEBiYXlsaWJyZS5jb20+Cj4+PiArwqAgLSBZdSBUdSA8eXUuaHVAYW1sb2dpYy5jb20+Cj4+PiAr
Cj4+IE9uZSBibGFuayBsaW5lLgo+IAo+ICDCoEkgd2lsbCBkZWxldGUgdGhpcywgb24gbmV4dCB2
ZXJzaW9uIHBhdGNoLgo+IAo+Pgo+Pj4gKwo+Pj4gK3Byb3BlcnRpZXM6Cj4+PiArwqAgY29tcGF0
aWJsZToKPj4+ICvCoMKgwqAgY29uc3Q6IGFtbG9naWMsczQtcGxsLWNsa2MKPj4+ICsKPj4+ICvC
oCByZWc6Cj4+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+PiArCj4+PiArwqAgY2xvY2tzOgo+Pj4g
K8KgwqDCoCBtYXhJdGVtczogMQo+Pj4gKwo+Pj4gK8KgIGNsb2NrLW5hbWVzOgo+Pj4gK8KgwqDC
oCBpdGVtczoKPj4+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IHh0YWwKPj4+ICsKPj4+ICvCoCAiI2Ns
b2NrLWNlbGxzIjoKPj4+ICvCoMKgwqAgY29uc3Q6IDEKPj4+ICsKPj4+ICtyZXF1aXJlZDoKPj4+
ICvCoCAtIGNvbXBhdGlibGUKPj4+ICvCoCAtIHJlZwo+Pj4gK8KgIC0gY2xvY2tzCj4+PiArwqAg
LSBjbG9jay1uYW1lcwo+Pj4gK8KgIC0gIiNjbG9jay1jZWxscyIKPj4+ICsKPj4+ICthZGRpdGlv
bmFsUHJvcGVydGllczogZmFsc2UKPj4+ICsKPj4+ICtleGFtcGxlczoKPj4+ICvCoCAtIHwKPj4+
ICvCoMKgwqAgY2xrY19wbGw6IGNsb2NrLWNvbnRyb2xsZXJAZmUwMDgwMDAgewo+Pj4gK8KgwqDC
oMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHM0LXBsbC1jbGtjIjsKPj4+ICvCoMKgwqDCoMKg
IHJlZyA9IDwweGZlMDA4MDAwIDB4MWU4PjsKPj4+ICvCoMKgwqDCoMKgIGNsb2NrcyA9IDwmeHRh
bD47Cj4+PiArwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9ICJ4dGFsIjsKPj4+ICvCoMKgwqDCoMKg
ICNjbG9jay1jZWxscyA9IDwxPjsKPj4+ICvCoMKgwqAgfTsKPj4KPj4KPj4+ICsjZW5kaWYgLyog
X19NRVNPTl9TNF9QTExfSF9fICovCj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5n
cy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2Nr
L2FtbG9naWMsczQtcGxsLWNsa2MuaAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMzQ1Zjg3MDIzODg2Cj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9p
bmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MuaAo+Pgo+PiBUaGlz
IGJlbG9uZ3MgdG8gYmluZGluZ3MgcGF0Y2gsIG5vdCBkcml2ZXIuCj4+Cj4+PiBAQCAtMCwwICsx
LDMwIEBACj4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQp
ICovCj4+PiArLyoKPj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjEgQW1sb2dpYywgSW5jLiBBbGwg
cmlnaHRzIHJlc2VydmVkLgo+Pj4gKyAqIEF1dGhvcjogWXUgVHUgPHl1LnR1QGFtbG9naWMuY29t
Pgo+Pj4gKyAqLwo+Pj4gKwo+Pj4gKyNpZm5kZWYgX0RUX0JJTkRJTkdTX0NMT0NLX0FNTE9HSUNf
UzRfUExMX0NMS0NfSAo+Pj4gKyNkZWZpbmUgX0RUX0JJTkRJTkdTX0NMT0NLX0FNTE9HSUNfUzRf
UExMX0NMS0NfSAo+Pj4gKwo+Pj4gKy8qCj4+PiArICogQ0xLSUQgaW5kZXggdmFsdWVzCj4+PiAr
ICovCj4+PiArCj4+PiArI2RlZmluZSBDTEtJRF9GSVhFRF9QTEzCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDEKPj4+ICsjZGVmaW5lIENMS0lEX0ZDTEtfRElWMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Mwo+Pgo+PiBJbmRleGVzIHN0YXJ0IGZyb20gMCBhbmQgYXJlIGluY3JlbWVudGVkIGJ5IDEuIE5v
dCBieSAyLgo+Pgo+PiBOQUsuCj4gCj4gSSByZW1lbWJlciBKZXJvbWUgZGlzY3Vzc2luZyB0aGlz
IHdpdGggeW91LllvdSBjYW4gbG9vayBhdCB0aGlzIHN1Ym1pc3Npb24gaGlzdG9yeS4KPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvYzA4OGUwMWMtMDcxNC04MmJlLTgzNDctNjE0MGRhZjU2
NjQwQGxpbmFyby5vcmcvCgpIaXN0b3JpY2FsbHkgd2UgZGlkIHRoYXQgYnkgb25seSBleHBvc2lu
ZyBwYXJ0IG9mIHRoZSBudW1iZXJzLCBjb250cm9sbGluZyB3aGljaApjbG9ja3Mgd2VyZSBwYXJ0
IG9mIHRoZSBiaW5kaW5ncy4KCkJ1dCBpdCBzZWVtcyB0aGlzIGRvZXNuJ3QgbWFrZSBzZW5zIGFu
eW1vcmUsIG1heWJlIGl0IHdvdWxkIGJlIHRpbWUgdG8gcHV0IGFsbCB0aGUKY2xvY2sgaWRzIGlu
IHRoZSBiaW5kaW5ncyBmb3IgdGhpcyBuZXcgU29DIGFuZCBicmVhayB3aXRoIHRoZSBwcmV2aW91
cyBzdHJhdGVneS4KCk5laWwKCj4gCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4+
Cj4+IC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
