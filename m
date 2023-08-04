Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146E3C04A6A
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Aug 2023 22:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70u6KVT6zGQ8kFv5XvO6TcdoxCV6z2HREwneAWpwySU=; b=N8BmMuzR45ZtbE
	hc6zK5AlcUDuTumT/VH/c58I6czD0yeKCi7Ox5U/2jPBcSkAeFifQaY6bi/wgOPuEtbKmQnTwjiXo
	xm9SPZsiMxBaRRhW+YuziFFxnaBL1yc+eDnfRSRnpaH3r0ICOJym0E/sq8MdZEDKvmjYrlpKJ4+kp
	Yt0FHtFrhqZHBR41G5upqM6EcLnOMtNualcxz0fdcg3oeOvHkI09yeQ6ZDBPUEKftgLf2WUf75+Sy
	+d3uUjije801eU6qY4mopqYwICQba25j2mJNcd2AwSdgL7+2WN0z1596NCS5XfP4uZYl1fwJOwYDR
	osOvq2KX+WOx9E15h/rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS393-00DLkx-1l;
	Fri, 04 Aug 2023 22:19:41 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS390-00DLjV-1A
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Aug 2023 22:19:39 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2683add3662so1750659a91.1
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Aug 2023 15:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1691187574; x=1691792374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z85yAr9ygR49mY8rjDO0s+k4VK4gbZo4ggiBhhqGLBc=;
        b=exPRrngy/Xjg/0z8oKkOelqiXWNej+LTTOqlHFXzJWkLXH0y93hSwg9u30WZLWI79j
         Tlpu7V5P7ZMiSL5/OwQc0nHT195XzeF632ka4WQqLyBI9aES/Fr17LaK05Ca+dye5eN+
         Uo0zPgm8tGZZf7jWNvBH7Vj3zNA9JPftcqEvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691187574; x=1691792374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z85yAr9ygR49mY8rjDO0s+k4VK4gbZo4ggiBhhqGLBc=;
        b=A/bnepBSZaO/CEVkAT5E4Hy7GexCdo7WrC/oipBjNYI7sQNBJiboJzQd8TI5JT8q5J
         MsXPg4LQzTAV3eUWmuRNr9slpom1kxtfMJRSs1OxAKBh5CbqmrPFtLuNFiSdSWok8yDP
         aFF1iyoL/DspmWNbJ54OVSbG78KPtK+GsFg4uRWGPI2jH/MI9XBVka1rahYvG74kEbxP
         sLffzck9yKXUo3WjAcK7G/0h9grqMut2h6rzKuNXB9vfcnhHQFKKZKKi3H+qY61gf2kN
         y5qxpT+UXQHjbPKzpp+hkXLyOQYeSAItfyTR1SJkRG00LGI6ZCFGKlACmL5GmAezHrAq
         y35A==
X-Gm-Message-State: AOJu0YxL6fhRHZ7PwgOwS/03GFdkMdx9bPqJAZsMhxjK2FqI+lfWV3j/
	IPvQK6H0jfuI1Ei1tvtPkGFff26kjJ5pN3ssCrfalQ==
X-Google-Smtp-Source: AGHT+IHq75oMUwTP7tsh4zuYgxSN7ctvXDAvCHDjXLH3Lv0LvVtdMIp7bMWeA3v2s0EEm7jvwo/OmXZ1WmZEs/61/c4=
X-Received: by 2002:a17:90a:f00e:b0:262:e6d2:2d6 with SMTP id
 bt14-20020a17090af00e00b00262e6d202d6mr3027874pjb.47.1691187574564; Fri, 04
 Aug 2023 15:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <CACqvRUZRyXTVQyy9bUviQZ+_moLQBjPc6nin_NQC+CJ37yNnLw@mail.gmail.com>
 <36acaa5c-f41a-af88-78dd-cd3714301c12@linaro.org>
In-Reply-To: <36acaa5c-f41a-af88-78dd-cd3714301c12@linaro.org>
From: Da Xue <da@lessconfused.com>
Date: Fri, 4 Aug 2023 18:19:23 -0400
Message-ID: <CACdvmAgaVnUWOyQBdAVV8wJX8LYOC+kSQkJydCDmDrJ+ito7NQ@mail.gmail.com>
Subject: Re: [PATCH] net: phy: meson-gxl: implement meson_gxl_phy_resume()
To: neil.armstrong@linaro.org
Cc: Da Xue <da@libre.computer>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_151938_396031_CCA99B8F 
X-CRM114-Status: GOOD (  22.32  )
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

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA0OjQ04oCvQU0gTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJt
c3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gSGkgRGEsCj4KPiBPbiAwNC8wOC8yMDIzIDA1
OjA3LCBEYSBYdWUgd3JvdGU6Cj4gPiBBZnRlciBzdXNwZW5kIGFuZCByZXN1bWUsIHRoZSBtZXNv
biBHWEwgaW50ZXJuYWwgUEhZIGNvbmZpZyBuZWVkcyB0bwo+ID4gYmUgaW5pdGlhbGl6ZWQgYWdh
aW4gb3IgdGhlIGNhcnJpZXIgY2Fubm90IGJlIGZvdW5kLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEx1a2UgTHUgPGx1a2UubHVAbGlicmUuY29tcHV0ZXI+Cj4gPiBSZXZpZXdlZC1ieTogRGEgWHVl
IDxkYUBsaWJyZS5jb21wdXRlcj4KPiA+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9uZXQvcGh5L21l
c29uLWd4bC5jIHwgMTQgKysrKysrKysrKysrKy0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvcGh5L21lc29uLWd4bC5jIGIvZHJpdmVycy9uZXQvcGh5L21lc29uLWd4bC5jCj4gPiBpbmRl
eCBiYjliMzNiNmIuLmM0YTA3ZTZmNyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3BoeS9t
ZXNvbi1neGwuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvcGh5L21lc29uLWd4bC5jCj4gPiBAQCAt
MTMyLDYgKzEzMiwxOCBAQCBzdGF0aWMgaW50IG1lc29uX2d4bF9jb25maWdfaW5pdChzdHJ1Y3Qg
cGh5X2RldmljZSAqcGh5ZGV2KQo+ID4gICAgcmV0dXJuIDA7Cj4gPiAgIH0KPiA+Cj4gPiArc3Rh
dGljIGludCBtZXNvbl9neGxfcGh5X3Jlc3VtZShzdHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2KQo+
ID4gK3sKPiA+ICsgaW50IHJldDsKPiA+ICsKPiA+ICsgcGh5X2NsZWFyX2JpdHMocGh5ZGV2LCBN
SUlfQk1DUiwgQk1DUl9QRE9XTik7Cj4KPiBDYWxsIGdlbnBoeV9yZXN1bWUoKSBpbnN0ZWFkLgoK
U2VudCB2Mi4KCj4KPiA+ICsgcmV0ID0gbWVzb25fZ3hsX2NvbmZpZ19pbml0KHBoeWRldik7Cj4g
PiArIGlmIChyZXQpCj4gPiArIHJldHVybiByZXQ7Cj4gPiArCj4gPiArIHJldHVybiAwOwo+ID4g
K30KPgo+IFBsZWFzZSByZS1pbmRlbnQgdGhpcyBmdW5jdGlvbi4KCkFjaywgbXkgYXBvbG9naWVz
LiBJIGRpZG4ndCByZWFkIHRoZSBleGNlcnB0IGFib3V0IEdtYWlsIGNvbXBvc2UKY29udmVydGlu
ZyB0YWJzIHRvIHNwYWNlcy4KCj4KPiA+ICsKPiA+ICAgLyogVGhpcyBmdW5jdGlvbiBpcyBwcm92
aWRlZCB0byBjb3BlIHdpdGggdGhlIHBvc3NpYmxlIGZhaWx1cmVzIG9mIHRoaXMgcGh5Cj4gPiAg
ICAqIGR1cmluZyBhbmVnIHByb2Nlc3MuIFdoZW4gYW5lZyBmYWlscywgdGhlIFBIWSByZXBvcnRz
IHRoYXQgYW5lZyBpcyBkb25lCj4gPiAgICAqIGJ1dCB0aGUgdmFsdWUgZm91bmQgaW4gTUlJX0xQ
QSBpcyB3cm9uZzoKPiA+IEBAIC0xOTYsNyArMjA4LDcgQEAgc3RhdGljIHN0cnVjdCBwaHlfZHJp
dmVyIG1lc29uX2d4bF9waHlbXSA9IHsKPiA+ICAgIC5jb25maWdfaW50ciA9IHNtc2NfcGh5X2Nv
bmZpZ19pbnRyLAo+ID4gICAgLmhhbmRsZV9pbnRlcnJ1cHQgPSBzbXNjX3BoeV9oYW5kbGVfaW50
ZXJydXB0LAo+ID4gICAgLnN1c3BlbmQgICAgICAgID0gZ2VucGh5X3N1c3BlbmQsCj4gPiAtIC5y
ZXN1bWUgICAgICAgICA9IGdlbnBoeV9yZXN1bWUsCj4gPiArIC5yZXN1bWUgICAgICAgICA9IG1l
c29uX2d4bF9waHlfcmVzdW1lLAo+ID4gICAgLnJlYWRfbW1kID0gZ2VucGh5X3JlYWRfbW1kX3Vu
c3VwcG9ydGVkLAo+ID4gICAgLndyaXRlX21tZCA9IGdlbnBoeV93cml0ZV9tbWRfdW5zdXBwb3J0
ZWQsCj4gPiAgICB9LCB7Cj4gPiAtLQo+ID4gMi4zOS4yCj4KPiBUaGFua3MsCj4gTmVpbAo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
YwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
