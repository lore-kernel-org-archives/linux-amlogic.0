Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C19CC04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TV/oOM69ztoYR/62W+nofTIQ0Py1O79uG0+g2104X64=; b=HZduiq4EDguUui
	WAugeYGVKEk0NQUo2nlu7/CaNQxx3Dp91fkVyKkT/f5cPTMDFrKieOrN9MXh9nMJFSiARO7e0wjI3
	yh/gnIAVXwtF9Dp5qyiN9Iu85EdYJhsqmMKiQzQQ4SanhFmtvjLkCG3NS8RJw+87ApeTKWsJo3Jy4
	OyxHqfcB7H5jPFxlWLtyjxlBZ3aUVI+YdulrXtVKYfvR3mT2YQFG4PSij2Iqn+svrsqncrM3vgGa8
	ZinbdTGWH4ZvLo+hoR4pNOGwLzt4VO4QHv/PGtTmyzpQL0WiRTPsVHvKh7VUtN/F/K/E0i0ZuvHb4
	SXG2DmOe2lC4h+Q0uEWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGzSl-0067M6-OZ; Thu, 28 Jul 2022 09:05:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGzSi-0067BV-9n
	for linux-amlogic@lists.infradead.org; Thu, 28 Jul 2022 09:05:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id a18-20020a05600c349200b003a30de68697so3057411wmq.0
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Jul 2022 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:subject:date:in-reply-to:message-id
         :mime-version:content-transfer-encoding;
        bh=+OcFPLQx6Ft687/V7wURN2VQWAIUGdH0K7LY/fhlaDo=;
        b=YPaUlAEQdlx+kmxBPZ+Nh79C/fBgQ+GJSZbX5sGR5UeAsooqhdnkgJE1nos0wwFkey
         g9PoE5y0wGPR98y7OvhuiVdg0RZKcr58XveY7cWN93fwYIcXL1thMwn629mb12kakRMf
         WpU85G+NJa+8UOuIwtQ/psMhwNuTMdpQZdyOpOrQL3z+QjfVuOKHB6F8KS/0B1+cfRzU
         Q1FJ/bVoMQONqRBYpCjUxJ6s+ccWVpfQ1g0QHF8zYB8cH/DpcijrlYfV+lWqfzGrZslK
         KT+TpwIuvfA6Kjywvu0CAt+ofsXTNFm9dTHEfMd3+ldst4onF/tasVuSrgXDQYAXCDt5
         /i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=+OcFPLQx6Ft687/V7wURN2VQWAIUGdH0K7LY/fhlaDo=;
        b=CbmFRxr8QiA2LlJZzLSQ4yOuhcsyIWP42l46UuzEleF1ghHcn5A12RTVO6HsrBcfyM
         dtoVVapFYD9bLc+lo5tlKEpWIItKeC4x+LG+DYpDnebhHV0QaVvmQhnz/a6bda07g4gQ
         Gfee5tIkM9JzQuC0kWb/CcRO9qdiHJFwqn9aDcPUsit7KHlwqO8VIZyGlPjRNDXRqaUU
         RcXVDvhwGDwgoLheyWieBy03Goz93ONrW0kbU2Ot42bzTCAuf45XDQQ2SRGee5lcxFO9
         4FxcHxNavU4dKdbBJG94l36w7A0jgsASdPtYvzSObgZ8TLAbZawZp9BBXc5PkECXS7x0
         TxAw==
X-Gm-Message-State: AJIora+eGZPfoD44X9zGGlI/5Dr6BsVLuAGzYEZ9RyZwCQeFJnyz3Glh
	0qsmqoZ3p2SMZMIYtk5MnFxxnA==
X-Google-Smtp-Source: AGRyM1sVNiJX8YKWerXapN2Ixv89nJZDNv/1hf5hRxoFAVrVo4zBDMO23Ru7zb0iN/K21CTzXnBD8g==
X-Received: by 2002:a05:600c:3582:b0:3a3:3b00:cb25 with SMTP id p2-20020a05600c358200b003a33b00cb25mr5762604wmq.170.1658999141375;
        Thu, 28 Jul 2022 02:05:41 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b003a31d200a7dsm664591wmq.9.2022.07.28.02.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 02:05:40 -0700 (PDT)
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <1j8rodhfn9.fsf@starbuckisacylon.baylibre.com>
 <032b3c3f-f899-bf53-ecbb-35191d39392b@amlogic.com>
 <1j4jz1hbr5.fsf@starbuckisacylon.baylibre.com>
 <965f83cf-4695-f89c-5ede-2f6b2524f392@amlogic.com>
User-agent: mu4e 1.8.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen  Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V2 0/3] Add S4 SoC clock controller driver
Date: Thu, 28 Jul 2022 11:03:18 +0200
In-reply-to: <965f83cf-4695-f89c-5ede-2f6b2524f392@amlogic.com>
Message-ID: <1jr125fvz0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_020544_367487_2D395B33 
X-CRM114-Status: GOOD (  18.74  )
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

Ck9uIFRodSAyOCBKdWwgMjAyMiBhdCAxNjo1NSwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3
cm90ZToKCj4gSGkgSmVyb21lLAo+IAlUaGFua3MgZm9yIHlvdXIgcmVwbHkgYW5kIGV4cGxhbmF0
aW9uLgo+Cj4gT24gMjAyMi83LzI4IDE2OjI3LCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBbIEVY
VEVSTkFMIEVNQUlMIF0KPj4gCj4+IE9uIFRodSAyOCBKdWwgMjAyMiBhdCAxNjowNiwgWXUgVHUg
PHl1LnR1QGFtbG9naWMuY29tPiB3cm90ZToKPj4gCj4+PiBIaSBKQu+8jAo+Pj4KPj4+IE9uIDIw
MjIvNy8yOCAxNTowOCwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4+PiBbIEVYVEVSTkFMIEVNQUlM
IF0KPj4+Pgo+Pj4+IE9uIFRodSAyOCBKdWwgMjAyMiBhdCAxMzo0MSwgWXUgVHUgPHl1LnR1QGFt
bG9naWMuY29tPiB3cm90ZToKPj4+Pgo+Pj4+PiAxLiBBZGQgY2xvY2sgY29udHJvbGxlciBkcml2
ZXIgZm9yIFM0IFNPQy4KPj4+Pj4KPj4+Pj4gWXUgVHUgKDMpOgo+Pj4+PiAgICAgZHQtYmluZGlu
Z3M6IGNsazogbWVzb246IGFkZCBTNCBTb0MgY2xvY2sgY29udHJvbGxlciBiaW5kaW5ncwo+Pj4+
PiAgICAgYXJtNjQ6IGR0czogbWVzb246IGFkZCBTNCBTb2MgY2xvY2sgY29udHJvbGxlciBpbiBE
VAo+Pj4+PiAgICAgY2xrOiBtZXNvbjogczQ6IGFkZCBzNCBTb0MgY2xvY2sgY29udHJvbGxlciBk
cml2ZXIKPj4+Pj4KPj4+Pj4gVjEgLT4gVjI6IENoYW5nZSBmb3JtYXQgYXMgZGlzY3Vzc2VkIGlu
IHRoZSBlbWFpbC4KPj4+Pj4KPj4+Pj4gTGluazpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1hbWxvZ2ljLzIwMjIwNzA4MDYyNzU3LjM2NjItMS15dS50dUBhbWxvZ2ljLmNvbS8KPj4+Pj4K
Pj4+Pj4gICAgLi4uL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsZ3hiYi1jbGtjLnR4dCAgICAgIHwg
ICAgMSArCj4+Pj4+ICAgIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDEgKwo+Pj4+PiAgICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
czQuZHRzaSAgICAgfCAgIDExICsKPj4+Pj4gICAgZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgIHwgICAxNSArCj4+Pj4+ICAgIGRyaXZlcnMvY2xrL21lc29uL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKwo+Pj4+PiAgICBkcml2ZXJzL2Nsay9t
ZXNvbi9zNC5jICAgICAgICAgICAgICAgICAgICAgICAgfCA0NzMyICsrKysrKysrKysrKysrKysr
Cj4+Pj4+ICAgIGRyaXZlcnMvY2xrL21lc29uL3M0LmggICAgICAgICAgICAgICAgICAgICAgICB8
ICAyOTYgKysKPj4+Pj4gICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zNC1jbGtjLmggICAg
ICAgICAgIHwgIDE0NiArCj4+Pj4+ICAgIDggZmlsZXMgY2hhbmdlZCwgNTIwMyBpbnNlcnRpb25z
KCspCj4+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNvbi9zNC5jCj4+
Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNvbi9zNC5oCj4+Pj4+ICAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3M0LWNsa2MuaAo+
Pj4+Pgo+Pj4+Pgo+Pj4+PiBiYXNlLWNvbW1pdDogYjI5M2JjOTI4NmVlMjE4MjRlOTNmMGZjZmVk
M2I3OGZkZmVlMDFlNgo+Pj4+IFBsZWFzZSBkb24ndCBwb3N0IHVudGlsIHlvdSBoYXZlIGFkZHJl
c3NlZCAqQUxMKiB0aGUgY29tbWVudHMgZnJvbSB0aGUKPj4+PiBwcmV2aW91cyB2ZXJzaW9uLgo+
Pj4gVGhlIGxhc3QgZW1haWwgYXNrZWQgeW91IHRvIGFkb3B0IEExIG1ldGhvZCwgYnV0IHlvdSBk
aWQgbm90IHJlcGx5Pwo+Pj4KPj4+PiBBdCBmaXJzdCBnbGFuY2UsIEkgY2FuIHNlZSB0aGF0IHRo
aXMgaXMgc3RpbGwgYSBzaW5nbGUgZHJpdmVyIGZvcgo+Pj4+IHdoYXQgaXMgb2J2aW91c2x5IDIg
Y29udHJvbGxlcnMgd2l0aCAyIHJlZ2lzdGVyIHNwYWNlcy4gU2ltcGxlIGNvbW1lbnRzCj4+Pj4g
bGlrZSB0aGUgIjw8IDIiIGluIHRoZSByZWdpc3RlciBkZWNsYXJhdGlvbiBoYXZlIG5vdCBiZWVu
IGFkZHJlc3NlZCBlaXRoZXIuCj4+PiBJIHVuZGVyc3RhbmQgdGhhdCB0aGlzIHNob3VsZCBiZSBh
IGNvbnRyb2xsZXIsIGp1c3QgdHdvIGFkZHJlc3MKPj4+IGRlc2NyaXB0aW9ucy4gT25lIGlzIHRo
ZSB2YXJpb3VzIFBMTCByZWdpc3RlcnMgYW5kIG9uZSBpcyB0aGUgY2xvY2sgZm9yCj4+PiB0aGUg
cGVyaXBoZXJhbHMuIEFuZCBQTEwgaXMgdG8gcHJvdmlkZSBhIGNsb2NrIHNvdXJjZSBmb3IgdmFy
aW91cwo+Pj4gcGVyaXBoZXJhbCBjbG9ja3MuIFNvIGEgY2xvY2sgY29udHJvbGxlciBpcyByZWFz
b25hYmxlLiBJIHRoaW5rIHlvdSBnb3QKPj4+IGl0IHdyb25nLgo+PiBJIGRvbid0IHRoaW5rIEkg
ZG8uIFRoaXMgbG9va3MgZXhhY3RseSBsaWtlIHRoZSBBMS4KPj4gVGhlIHBvc3Qgb2YgdGhhdCBj
b250cm9sbGVyIGFyZSBzdGlsbCBpbiB0aGUgIGFyY2hpdmUgYW5kIEkgYW0gc3VyZSB5b3VyCj4+
IGNvbGxlYWd1ZXMgY2FuIGdpdmUgeW91IHRoZSBoaXN0b3J5Lgo+PiBZb3UgY2xlYXJseSBoYXZl
IHJlZ2lzdGVyIHJlZ2lvbnMgcHJvdmlkaW5nIGNsb2NrLCBzZXBhcmF0ZWQgYnkKPj4gMHg4MDAw
LiBDbGFpbWluZyB0aGF0IGFzIG9uZSBiaWcgcmVnaW9uIGlzIGJhZCBkZXNpZ24uCj4+IFRoZXJl
IGhhcyBiZWVuIHNldmVyYWwgcmVtYXJrcyBhYm91dCB1c2luZyBhIGJpZyBzeXNjb24gb24gVjEs
Cj4+IHVuYWRkcmVzc2VkIHRvby4KPj4gQ0NGIGhhcyBldmVyeXRoaW5nIG5lY2Vzc2FyeSBpbiBw
bGFjZSB0byBoYW5kbGUgZWFjaCByZWdpc3RlciByZWdpb24KPj4gc2VwYXJhdGVseSwgcHJvcGVy
bHkgYW5kIHBhc3MgY2xvY2sgYXJvdW5kLgo+PiBZb3UgY2FuIGhhbmRsZSBpdCBhcyBhIHNpbmds
ZSBjb250cm9sbGVyLCBjbGFpbWluZyB0aGUgdHdvIHJlZ2lvbnMKPj4gaW5kaXZpZHVhbGx5IGJ1
dDoKPj4gIyAxIC0gaGFuZGxpbmcgMiBkaWZmZXJlbnQgcmVnbWFwcyBpbiB0aGUgY29udHJvbGxl
ciBpcyBnb2luZyB0byBiZQo+PiAgICAgICAgYmlnZ2VyIG1lc3MgdGhhbiB5b3UgdGhpbmsKPj4g
IyAyIC0gSSBhbSBmYXIgZnJvbSBjb252aW5jZWQgdGhlcmUgaXMgYW55IHJlYXNvbiB0byBkbyBz
bwo+PiAKPiBJdCBtYWtlcyBzZW5zZSwgYXMgeW91IHNheSwgdG8gc2VwYXJhdGUgdGhlIHR3byBj
b250cm9sbGVycy4gQnV0IEkgdGhpbmsKPiB0aGUgb25seSB0aGluZyB0aGF0IHdhcyBmb3JjZWQg
YXBhcnQgd2FzIHRoYXQgdGhlIGRpZ2l0YWwgZGVzaWduZXJzIAo+IGRpZG4ndCBwdXQgdGhlc2Ug
cmVnaXN0ZXJzIHRvZ2V0aGVyIHdoZW4gdGhleSB3ZXJlIGRlc2lnbmluZyB0aGUgY2hpcHMuCj4K
Ck9uZSBjb250cm9sbGVyIGlzIHByb3ZpZGluZyBhbGwgdGhlIGJhc2UgUExMcwpUaGUgb3RoZXIg
aXMgcHJvdmlkaW5nIG1vc3QgKGlmIG5vdCBhbGwpIHRoZSBkZXZpY2VzIGNsb2Nrcy4KVGhpcyBk
b2VzIG5vdCBsb29rIGxpa2UgY29pbmNpZGVuY2Ugb3IgbWlzdGFrZSB0byBtZS4KCj4gSSdtIGdv
aW5nIHRvIHNlcGFyYXRlIHRoZSB0d28gY29udHJvbGxlcnMgbGlrZSB5b3Ugc2FpZC4KPgo+PiAK
Pj4+Cj4+PiBPaywgaWYgeW91IGluc2lzdCBvbiB1c2luZyB0d28gY2xvY2sgY29udHJvbGxlcnMs
LCBwbGVhc2UgcHJvdmlkZSB5b3VyIHRoZQo+Pj4gcmVhc29uIGFuZCBleGFtcGxlIGNvZGU/Cj4+
Pgo+Pj4+IFNlZWluZyB0aGF0LCBJIGhhdmUgbm90IHJldmlld2VkIHRoaXMgdmVyc2lvbiBmdXJ0
aGVyLgo+Pj4+IEkgd29uJ3QgdW50aWwgYWxsIHRoZSBjb21tZW50cyBmcm9tIHYxIGFyZSBlaXRo
ZXIgYWRkcmVzc2VkIG9yIGFuc3dlcgo+Pj4+IFJlZ2FyZHMKPj4+PiBKZXJvbWUKPj4+PiAuCj4+
IC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
