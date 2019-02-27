Return-Path: <SRS0=9Y1m=RC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AF0C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Feb 2019 19:03:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42DB320C01
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Feb 2019 19:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JMl2MLJG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42DB320C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gR2Slo1atNpjd8AcrMZCopkGsFJTzTC01NGVFaB/ADo=; b=JMl2MLJGXo9PPv
	hkcw1o98xbSBW70Kogxs96HJp5D5XECdLrItXFiqscnC3uObXlJcUU7j4TQz4hq56JT0nPB4dVusQ
	fSMC78ACM8OAVT3rpLEAaiboOaxSU+kIgAABzy7PCCJcJfQ+nUudJ349FOqvKb41rmz65c5N+IO73
	9YnYabVn++UAWBV2su3mIQXtRoMf1WMnZ/E6qFmNWhDQ8n966l35s3zbI5GyakDY7Wea5z2x1i3Gd
	s9gBk6rRqUcBYNqREMSTrbM+G51uHuYJSZs4PpFnowqV+WhgE8alrMGJ7F4el5PNMeNcb0tiUmGTo
	zgWY1qybGqbOpkGD8Hog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz4Tk-0006hW-PY; Wed, 27 Feb 2019 19:02:52 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz4Th-0006h3-C5
 for linux-amlogic@lists.infradead.org; Wed, 27 Feb 2019 19:02:51 +0000
Received: from [10.10.11.100] ([95.88.214.118]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Mh5h7-1gdGKr2hyj-00MI82; Wed, 27
 Feb 2019 20:02:28 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Jose Abreu <jose.abreu@synopsys.com>,
 Sebastian Gottschall <s.gottschall@newmedia-net.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <cd344fa3-758f-3824-ddd3-568ce837c4f7@gmx.de>
 <8bae9cd6-5c44-30e3-bfe5-8d6f853f170e@synopsys.com>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
 <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
 <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
 <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
 <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
 <1426d8ed40be0927c135aff25dcf989a11326932.camel@baylibre.com>
 <9074d29b-4cc9-87b6-009f-48280a4692c0@gmx.de>
 <d7de65c614ee788152300f6d3799fd537b438496.camel@baylibre.com>
 <8ec64936-c8fa-1f0e-68bf-2ad1d6e8f5d9@gmx.de>
 <f08f2659-dde0-41ec-9233-6b4d5f375ffe@newmedia-net.de>
 <3a040370-e7e5-990e-81dc-8e9bb0ab7761@gmx.de>
 <c21c30e9-e53e-02a5-c367-25898c4614e9@synopsys.com>
From: Simon Huelck <simonmail@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=simonmail@gmx.de; prefer-encrypt=mutual; keydata=
 mQGiBD/bCNARBACE3URTBXZ/AA03NwRNtz03ewQn3uhvYSTjfqgplBtb3dfC4a79BXDRIWVX
 xPGH9Ewios1c8gMu3/RI2l3JzXoISfw5b0L/5igyPKV+sGuUA2FD27kYtPaaF/TqEWIv+Yxp
 9DCjCX5IQSYyvCfcxcyEkY8eVWxnaAlV3zKRR8wn0wCglWIOtAugBcg1YXmoLpFZE8Ca0fkD
 /jG+n4U9DPfCgkbgjQ/dv2W2a0ZDHccA9N8AW/FTXGyXXO0e7ql9/kORJnp7jD7/Z9HCKpeS
 HajgxuX9Vhfx6bH1dAMfsg88+K8pOO9oulNX1+YffQyZWOfdbmnZDUzBt9HKR9Wgh8WoIyw9
 TVluclzn6hYz+z9jbqHWMOsiCu8zA/0apHbW8vaIDT4+nNUxNdqU1TKa9kW47vNjwYYL0jZW
 TXNjDIRpqJVSugYVc/U847GoVoxyvtzre4TAbBV8h0BAOeMdxI5En67RGWzeNaMDJV1bwapj
 qdfj3e/X8rnGIfwz47rwztLNKoAIUlKrATwroiI7UNT+84G7H5qalu+Eu7QqU2ltb24gSHVl
 bGNrIDxzaW1vbi5odWVsY2tAZ29vZ2xlbWFpbC5jb20+iGIEExECACIFAlH7wL4CGyMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEJNSVvfBt05KlBQAn1JDO7e4H3N0WFJkZnxvObhk
 2kiAAJwPdDd6T1TuGo4iDIENRhAX4AH2KrkBDQQ/2wjSEAQAj6JnDDQzIIYzPGsrHRvaq8vw
 n8VrZCbPRvkngGvtQIss5pH/MLeu9jLepDGO9WHByFSg4QJh8cINYwTLtX8Bu0naA6ZI46hn
 GyfxdRlxSU9dRqHpU3G0tymL1w3AER6aVSfdXQTmFgf61anKunbIIptkqzZurkjnxkwCE/RM
 RscABA0D/jhglpj8siSIAxs8XLVfKJrjzbYM9/wS0NfdSXBeQJiYtKrY0WMNsqjY50wDnLMg
 anORN/odT6mCwKI6xChzxEv/ta4+teZl92aitziSuqmtl+jm23DpOcUC7UBz2W1+TvnrhPR+
 MKu8pPKAgsE8AI5uwCcNJx7V3bczYkIGaXybiEYEGBECAAYFAj/bCNIACgkQk1JW98G3Tko6
 3wCfZBpZAUhUz/Rcp2rfg/YSKl4YLlEAoJN7e322OvHc2GQ9n1+tKLi6Og4c
Message-ID: <12d1d6de-2905-46a8-6481-d6f20c8e9d85@gmx.de>
Date: Wed, 27 Feb 2019 20:02:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <c21c30e9-e53e-02a5-c367-25898c4614e9@synopsys.com>
X-Provags-ID: V03:K1:QfpMrKK4J3sxHEHL1COGTs5kYu9xIVUbRZzSC8KHQSq9EVWraFm
 OaXlLMhyL85o3flVU/tuiz+6f0Zp/YR846kPkARc7S5LRWJzUkJgMwAGFCYlIs4zsrOTdPh
 1FqSW45hQ638dIUVk5XX1bfFsqY/n1eXigQYKxGGvaY+tzcgztNnHVx7G9SRV5WPslbdLIe
 FyxxIhEmfcpdcz5fVMhmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QhqJOWB/OiE=:tHCDgoy+v0KZBrZz7yABhA
 OMC4hvCsihR5yaWhBv6vv9QGjy3LOhiaAZHAiqWknNHloeksfSexHlRSKDTSvddETccZUnOI2
 I6QLDV2NvJgnxlhNtlEeGfNr6toNl6GpRxdo+9Rj8Jk8lg2uFMZFlwaomk6xSyiaqwn1u6528
 i61BQZrxQuAs2U0DPbK4ZAXu/MfXDGkeSuA41/HlV+vFElB5qULmDLfh3E/rtkwlQRR5VSm02
 pmFdtiewxqTCkVa87kVImOvRjFg4FQBky4+JnWrg1fyWk2GRRWfgvuj94uSmrjcFOen6D+2Jk
 E4pxo6/Epk+tixEG5L5Kwea1z+IuPc07UEqcV9yllb1qsu83lMwzRANICsXVr3WUK7mLyjx9d
 6b/fD9mZ7f8Y6DYb07hKLO7xGqieaj00ixbSNgdbLHnWIhwvy63NpfeVbzyk8Gcq6vXzMcfXT
 NekCFR8akaFXOpW0B3EyeNBAiYa+wZpOil30UUMhUWsLGH19oIAYAr+QNhRAijooqo/Xdu7xG
 612rksvFO5fkEY8L8PG5Czaz8B48RfjIGwWtwTLWcprBtnxqQiKNyLL41PgH4FL18F6lQbWyD
 Ayc8JIV5JARxlFozC8b4olx9MRH09XgIxBAP259gr3Vv3MZ/QFyqmqZyRidTDQvah7F6lZcoj
 h71eMRjvgLA9ZbjgwL2/XWncNSpkS1ZDq5bluysbdi3KxSKjWEVg6eD16BkesxBRyMeTHFv98
 xxvaNFnPI++Ai9goypXuI+dqdhyKZiqRHg7y/6X2bI5qkh0GoSN+YY+EwJh70u174cAjiex47
 hkUJKDWzrqxc7NdIp+W86PMSIolTVUQlfCzPMiIPkZUgdryebv09DTtUrCDsnxzce5zTMAqIN
 9SsMkmSAQrdpUSIBfWsDTrG9abG41fkkj8IsvuI1D+u+Nr6nir3BFZLomEZ0rkUfZsiobinzO
 a8LAa9Pw0GA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_110249_719739_8588B20C 
X-CRM114-Status: GOOD (  14.66  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgoKdGhlIHRoaW5nIGlzICwgdGhhdCBpbSBub3QgYSBzdG1tYWMgZGV2ZWxvcGVyLiBZZXMg
LCBtYXliZSBpIGNhbiBiaXNzZWN0Cml0IGFuZCB5ZXMgeW91IGFyZSBsdWNreSBzaW5jZSBpbSBh
IEMtZGV2ZWxvcGVyIHNpbmNlIGEgbG9uZyB0aW1lIGZvcgplbWJlZGRlZCBzeXN0ZW1zLgoKVGhl
IHByb2JsZW0gaXMgdGhhdCBpIGRvbnQgdW5kZXJzdGFuZCB0aGUgc3RydWN0dXJlIG9mIHN0bW1h
YyBhbmQgaW0gbm90CmF3YXJlIG9mIGFueSBkb2N1bWVudGF0aW9uIGFib3V0IHRoZSBkcml2ZXIg
c3RydWN0dXJlIG5vciB0aGUgdW5kZXJseWluZwpldGhlcm5ldCBoYXJkd2FyZSAoIGV2ZW4gdGhv
dWdoIGltIHVzZWQgdG8gZXRoZXJuZXQgaGFyZHdhcmUgaW4gZW1iZWRkZWQKZW52aXJvbm1lbnQg
KS4gU28gaG93IHNoYWxsIGkgcmVjb2duaXplIHRoZSByZWxldmFudCBjaGFuZ2UgYmV0d2Vlbgo0
LjE0LjI5IGFuZCA1LjByYzggPwoKCklzIGl0IGluIHRoZSBEVFMvRFRCLCB3cm9uZyBoYXJkd2Fy
ZSBkZXNjcmlwdGlvbiA/IElzIGl0IGluIHRoZSBjb2RlID8KaG93IGlzIHRoZSBkdXBsZXggaGFy
ZHdhcmUgd29ya2luZyBvbiB0aGlzIHBpZWNlID8KCkkgY2FuIHRyeSB0byBzdXBwb3J0IHlvdSB0
aGUgYmVzdCBpIGNhbiwgYnV0IGkgaGF2ZSBsaXR0bGUgY2hhbmNlcyB0bwphbmFseXplIGl0IG15
c2VsZi4gQXQgd2hpY2ggbWVhc3VyZW1lbnRzIC8gY291bnRlcnMgaXMgaXQgcG9zc2libGUgdG8K
c2VlIHRoYXQgZHVwbGV4IGlzIGZ1bGx5IHdvcmtpbmcgP8KgIFdoeSBkaWQgZXZlbiB0aGUgbm9u
LWR1cGxleApiYW5kd2lkdGggcmVncmVzcyBmcm9tIDkwME1CaXRzIHRvIDY1MCA/IFdoeSBpcyB0
aGF0IDY1MCBNQml0cyBkaXZpZGluZwp1cCB0byBUWCBhbmQgUlggaW4gc3VtbWFyeSB3aGVuIGRv
aW5nIGR1cGxleCA/IFdoeSBpcyBUWCBub3Qgc3RhcnZpbmcgaW4KZHVwbGV4IGJ1dCBSWCA/CgpG
cm9tIG15IHBvaW50IG9mIHZpZXcgc2hvdWxkIGJlIHRoZSBmb2xsb3dpbmcgdGhpbmdzIGdpdmVu
OgotIHRoZSBub24gZHVwbGV4IGJhbmR3aWR0aCBzaG91bGQgYmUgc29tZXdoZXJlIGFyb3VuZCA5
MDBNQml0cyAsIHRoZSBIVwppcyBjYXBhYmxlIG9mIHRoYXQKLSBUWCBzaG91bGQgbm90IGluZmx1
ZW5jZSBSWCBvciB2aWNlIHZlcnNhIGluIGR1cGxleAotIHRoZSBkdXBsZXggYmFuZHdpZHRoIHNo
b3VsZCBiZSA5MDBNQml0cyBpbiBib3RoIGRpcmVjdGlvbnMgKCBtYXliZSBhCmJpdCBhc3ltZXRy
aWMgd2hlbiBidWZmZXJzIGluIGJvdGggZGlycyBhcmUgbm90IHNhbWUgKQoKSSBndWVzcyB3ZSBu
ZWVkIHNvbWUgcHJvZmlsaW5nIG9uIHN0bW1hYyBhbmQgKCBhdCBsZWFzdCBpIG5lZWQgKSBtb3Jl
Cmtub3dsZWRnZSBvZiB0aGUgaGFyZHdhcmUgYW5kIHN0bW1hYyBpdHNlbGYuIENhbiBzb21lb25l
IHBvaW50IG1lIHRvIHRoZQpkcml2ZXIgZG9jdW1lbnRhdGlvbiwgZGVzY3JpYmluZyB0aGUgZnVu
Y3Rpb25zIGluIHRoZSBjb2RlIGFuZCB0aGUKc3RydWN0dXJlID8gSG93IGNhbiBpIHByb2ZpbGUg
c3RtbWFjICggdXN1YWxseSBpbSB1c2luZyBoYXJkd2FyZSAvIEpUQUcKZGVidWdnZXJzIGF0IHdv
cmssIGJ1dCBoZXJlIEBob21lIGkgZ290IG5vdGhpbmcgbGlrZSB0aGF0ICkKClNvIGhvdyBkbyB3
ZSBjb250aW51ZSA/CgpyZWdhcmRzLApTaW1vbgoKCgpBbSAyNy4wMi4yMDE5IHVtIDEyOjA5IHNj
aHJpZWIgSm9zZSBBYnJldToKPiBIaSBTaW1vbiwKPgo+IE9uIDIvMjQvMjAxOSA4OjM0IFBNLCBT
aW1vbiBIdWVsY2sgd3JvdGU6Cj4+IHRoZSB0b3BpYyBpcyBhYm91dCBPRFJPSUQgQzIgLyBBbWxv
Z2ljIFM5MDVYIHNpbmNlIHRoZSBzdGFydC4gd2UgaGF2ZSBhCj4+IHBlcmZvcm1hbmNlIHJlZ3Jl
c3Npb24gc2luY2UgNC4xNC4KPiBBcyB3ZSBhcmUgbm90IGFkdmFuY2luZyBpbiB0aGlzIHRvcGlj
IEkgc3VnZ2VzdCB5b3UgdHJ5IGJpc2VjdGluZwo+IHRoZSBvZmZlbmRpbmcgY29tbWl0Lgo+Cj4g
VGhhbmtzLAo+IEpvc2UgTWlndWVsIEFicmV1CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
