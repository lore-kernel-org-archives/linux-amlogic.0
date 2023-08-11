Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FA8EB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Aug 2023 08:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTosRgsoOYBDPYMQI+o3aJ3w8TgHHSHJsj8EegORpqc=; b=asDvJOjRujwUWy
	lDCMBqya3WSQEs8HlqqEQ8suhpGbl8PWaPDYJ3n8Xp4b2hgh/L133AOSfbKry2Buj9n5Ufp81eNLM
	DXKeHnYE+zVMzdbFJXENotZ7K2G7D+M31Ul9FnGZgqwv7nFIx7crnYqmongLv8RpqoUoLHlmlk7wb
	YuDoUfWGan3ti7PMEyQrF1f9yNWc75odlHDfR+ltWFUVVKPje+0hw4nq1Tpe2T6VL4jeAsEFeyAwa
	xFH2zh+eEbZwBbKKwy53n/XTk2VRhnuSaAr1iysQoL1CEHRDJlG7/n8DKOwW0wsy5KxhEnEQfxYn0
	kwQVyrA4zMWNt69DXTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUNmE-009swq-1l;
	Fri, 11 Aug 2023 08:45:46 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUNmB-009sui-1L
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Aug 2023 08:45:45 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe389d6f19so2761669e87.3
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Aug 2023 01:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691743538; x=1692348338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyLoP8xMKHbbGPDbJqH4l+BBAOIbu8DKdw/y5ZAFfd8=;
        b=POcjDBX8yjO/cNrmrhyKFwIYY5gNDZn8xJwHWAHnI4kGTqKPYD+mhBRshEtpBrSytD
         URgEHJoaIdNgmualJl7OPzIR7XfCX2/8M3MqaBj3+6Rv3xhb1foVimT8BFZ5JVlg15ON
         ovORAYsxUJV+6wzdHcByY9Cm604j1a1wILyHu/LA99u7SOxSspxxqAffCX5DjXK/p0xz
         XNh81xBZ8ajcckdFcOSwvPHHcAeL/AqK1wziO6IJN/WMeTGY2UOjAGaiCJ6awQ4W5ax3
         W34V1t7f1nSNvPhif3uCfEDQo8+Q4pxZAhOg+OA4VTK8MmndvEmV2RLydiCvc+kaLQUS
         IzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691743538; x=1692348338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyLoP8xMKHbbGPDbJqH4l+BBAOIbu8DKdw/y5ZAFfd8=;
        b=C1EuW++4tSl8yyxZNg5Atf/nZ3a6bKgz9sqhpdtqfiaRye98LnklLcjPTwnex7hESB
         516WjWdtRvHxOzpWlpnYtjSCgbcFHX2fUzAFfPyveAgG/vosSYrhNBTrWHaDkP/pN9nV
         2NqFeU7w8kH829CgIgumsVD7vqtT/6UsP3nXwZFJSUVdDitVG0m/NXt322IIHQtLbHnI
         pXCBpA44r73YlSFsE9Mqpx/K5II5H5UEWS2jfgpIFZWul51s4/nfqLkd6aBDOCTulLUz
         0wQuXI6mG+Pz58Spy11QXdGX7E+lDCejrRh2KMPk4vl8/ZdRW5ZxgySfDPiWiVFN9HL4
         eTFQ==
X-Gm-Message-State: AOJu0YxR1xcQuok9h0Bv9tIWIGm1Ox6fqqFi+K3J90CKAAVRukwN/dyH
	+YAKxknyftZJJ/1UPpGWNFTeOTtlFPqrhht1WfST
X-Google-Smtp-Source: AGHT+IEs3o3OCLlXqUGMJTTKigWMXfxnbo5kLQwJsAg6qrfKzpL77GWKDVDUD9TM3uLcHetnGIr47O8aEQUeeSe/VWs=
X-Received: by 2002:ac2:58e9:0:b0:4fe:8c07:98eb with SMTP id
 v9-20020ac258e9000000b004fe8c0798ebmr747962lfo.51.1691743537923; Fri, 11 Aug
 2023 01:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230809214946.18975-1-luke.lu@libre.computer> <2cdc67aa-6029-7231-76a8-54c6b51b066c@gmail.com>
In-Reply-To: <2cdc67aa-6029-7231-76a8-54c6b51b066c@gmail.com>
From: Da Xue <da@libre.computer>
Date: Fri, 11 Aug 2023 04:45:26 -0400
Message-ID: <CACqvRUYUkeU9C_W47yPLSRb=+VL4Hti1+E2YQNLKQtcXw_H-OQ@mail.gmail.com>
Subject: Re: [PATCH net v4] net: phy: meson-gxl: implement meson_gxl_phy_resume()
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Luke Lu <luke.lu@libre.computer>, Andrew Lunn <andrew@lunn.ch>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Da Xue <da@libre.computer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_014543_454623_C84C7EDE 
X-CRM114-Status: GOOD (  34.02  )
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

T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgMjowN+KAr0FNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gMDkuMDguMjAyMyAyMzo0OSwgTHVrZSBMdSB3
cm90ZToKPiA+IEZyb206IERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0ZXI+Cj4gPgo+ID4gV2hpbGUg
dGVzdGluZyB0aGUgc3VzcGVuZC9yZXN1bWUgZnVuY3Rpb24sIHdlIGZvdW5kIHRoZSBldGhlcm5l
dAo+ID4gaXMgYnJva2VuIGlmIHVzaW5nIGludGVybmFsIFBIWSBvZiBBbWxvZ2ljIG1lc29uIEdY
TCBTb0MuCj4gPiBBZnRlciBzeXN0ZW0gcmVzdW1lIGJhY2ssIHRoZSBldGhlcm5ldCBpcyBkb3du
LCBubyBjYXJyaWVyIGZvdW5kLgo+ID4KPiA+ICAgICAgIGV0aDA6IDxOTy1DQVJSSUVSLEJST0FE
Q0FTVCxNVUxUSUNBU1QsVVA+IG10dSAxNTAwIHFkaXNjIG1xIHN0YXRlCj4gPiAgICAgICAgICAg
ICAgIERPV04gZ3JvdXAgZGVmYXVsdCBxbGVuIDEwMDAKPiA+Cj4gPiBJbiB0aGlzIHBhdGNoLCB3
ZSByZS1pbml0aWFsaXplIHRoZSBpbnRlcm5hbCBQSFkgdG8gZml4IHRoaXMgcHJvYmxlbS4KPiA+
Cj4KPiBJdCdzIG5vdCBhbiB1bnVzdWFsIGNhc2UgdGhhdCBzeXN0ZW0gY3V0cyBwb3dlciB0byB0
aGUgUEhZIGR1cmluZwo+IHN5c3RlbSBzdXNwZW5kLiBTbyB0aGUgUEhZIG5lZWRzIHRvIGJlIHJl
LWluaXRpYWxpemVkIG9uIHJlc3VtZS4KPiBUaGF0J3Mgd2h5IHdlIGNhbGwgcGh5X2luaXRfaHco
KSBpbiBtZGlvX2J1c19waHlfcmVzdW1lKCkuCgpUaGFua3MgZm9yIHRoZSByZXZpZXcsIEhlaW5l
ci4KCldlIHdpbGwgcmV3b3JrIHRoaXMgaW4gdjUuCgo+Cj4gSWYgZ29pbmcgeW91ciB3YXkgd2Ug
d291bGQgYmUgYmV0dGVyIG9mZiBjYWxsaW5nIC5jb25maWdfaW5pdCgpCj4gaW4gZ2VucGh5X3Jl
c3VtZSgpLiBQbGVhc2UgY2hlY2sgdGhlIE1BQyBkcml2ZXIsIG1heWJlIGl0J3MgYmV0dGVyCj4g
dG8gcmUtaW5pdGlhbGl6ZSB0aGUgUEhZIGluIHRoZSByZXN1bWUgcGF0aCBvZiB0aGUgTUFDIGRy
aXZlci4KPgo+ID4gICAgICAgZXRoMDogPEJST0FEQ0FTVCxNVUxUSUNBU1QsVVAsTE9XRVJfVVA+
IG10dSAxNTAwIHFkaXNjIG1xIHN0YXRlIFVQCj4gPiAgICAgICAgICAgICAgIGdyb3VwIGRlZmF1
bHQgcWxlbiAxMDAwCj4gPgo+ID4gRml4ZXM6IDczMzRiM2U0N2FlZSAoIm5ldDogcGh5OiBBZGQg
TWVzb24gR1hMIEludGVybmFsIFBIWSBkcml2ZXIiKQo+ID4gU2lnbmVkLW9mZi1ieTogRGEgWHVl
IDxkYUBsaWJyZS5jb21wdXRlcj4KPiA+IFNpZ25lZC1vZmYtYnk6IEx1a2UgTHUgPGx1a2UubHVA
bGlicmUuY29tcHV0ZXI+Cj4gPgo+ID4gLS0tCj4gPiBOb3RlLCB3ZSBkb24ndCBDYyBzdGFibGUg
a2VybmVsIHRyZWUgaW4gdGhpcyBwYXRjaCBpbnRlbnRpb25hbGx5LCBzaW5jZQo+ID4gdGhlcmUg
d2lsbCBiZSBhIGNoZXJyeS1waWNrIGZhaWx1cmUgaWYgYXBwbHkgdGhpcyBwYXRjaCBmcm9tIGtl
cm5lbCB2ZXJzaW9uCj4gPiBsZXNzIHRoYW4gdjYuMiwgaXQncyBub3QgYSBsb2dpYyBmYWlsdXJl
IGJ1dCBkdWUgdG8gdGhlIGNoYW5nZXMgdG9vIGNsb3NlLgo+ID4KPiA+IFBsZWFzZSBjaGVjayBj
b21taXQgNjlmZjUzZTRhNGM5ICgibmV0OiBwaHk6IG1lc29uLWd4bDogdXNlIE1NRCBhY2Nlc3Mg
ZHVtbXkgc3R1YnMgZm9yIEdYTCwgaW50ZXJuYWwgUEhZIikKPiA+IFdlIHBsYW4gdG8gc2xpZ2h0
bHkgcmV3b3JrIHRoZSBwYXRjaCwgYW5kIHNlbmQgaXQgdG8gc3RhYmxlIHRyZWUgc2VwYXJhdGVs
eQo+ID4gb25jZSB0aGlzIHBhdGNoIGlzIGFjY2VwdGVkIGludG8gbWFpbmxpbmUuCj4gPgo+ID4g
djQ6Cj4gPiAgLSByZWZhY3RvciBjb21taXQgbWVzc2FnZSB0byBiZXR0ZXIgZXhwbGFpbiB0aGUg
cHJvYmxlbSAmIGZpeAo+ID4gIC0gY2hlY2sgcmV0dXJuIHZhbHVlIG9mIGdlbnBoeV9yZXN1bWUo
KQo+ID4gIC0gYWRkICduZXQnIGFubm90YXRpb24KPiA+ICAtIGFkZCBGaXhlcyB0YWcKPiA+Cj4g
PiB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjMwODA4MDUwMDE2LjE5MTE0
NDctMS1kYUBsaWJyZS5jb21wdXRlcgo+ID4gIC0gZml4IG1pc3NpbmcgcGFyYW1ldGVyIG9mIGdl
bnBoeV9yZXN1bWUoKQo+ID4KPiA+IHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYv
MjAyMzA4MDQyMDE5MDMuMTMwMzcxMy0xLWRhQGxpYnJlLmNvbXB1dGVyCj4gPiAgLSBjYWxsIGdl
bmVyaWMgZ2VucGh5X3Jlc3VtZSgpCj4gPgo+ID4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC9DQUNxdlJVWlJ5WFRWUXl5OWJVdmlRWitfbW9MUUJqUGM2bmluX05RQytDSjM3eU5uTHdA
bWFpbC5nbWFpbC5jb20KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbmV0L3BoeS9tZXNvbi1neGwuYyB8
IDE3ICsrKysrKysrKysrKysrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvcGh5L21l
c29uLWd4bC5jIGIvZHJpdmVycy9uZXQvcGh5L21lc29uLWd4bC5jCj4gPiBpbmRleCBiYjliMzNi
NmJjZTIuLjllYmUwOWIwY2Q4YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3BoeS9tZXNv
bi1neGwuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvcGh5L21lc29uLWd4bC5jCj4gPiBAQCAtMTMy
LDYgKzEzMiwyMSBAQCBzdGF0aWMgaW50IG1lc29uX2d4bF9jb25maWdfaW5pdChzdHJ1Y3QgcGh5
X2RldmljZSAqcGh5ZGV2KQo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0
aWMgaW50IG1lc29uX2d4bF9waHlfcmVzdW1lKHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpCj4g
PiArewo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsKPiA+ICsgICAgIHJldCA9IGdlbnBoeV9yZXN1
bWUocGh5ZGV2KTsKPiA+ICsgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgIHJldHVybiBy
ZXQ7Cj4gPiArCj4gPiArICAgICByZXQgPSBtZXNvbl9neGxfY29uZmlnX2luaXQocGh5ZGV2KTsK
PiA+ICsgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArCj4g
PiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiAgLyogVGhpcyBmdW5jdGlvbiBpcyBw
cm92aWRlZCB0byBjb3BlIHdpdGggdGhlIHBvc3NpYmxlIGZhaWx1cmVzIG9mIHRoaXMgcGh5Cj4g
PiAgICogZHVyaW5nIGFuZWcgcHJvY2Vzcy4gV2hlbiBhbmVnIGZhaWxzLCB0aGUgUEhZIHJlcG9y
dHMgdGhhdCBhbmVnIGlzIGRvbmUKPiA+ICAgKiBidXQgdGhlIHZhbHVlIGZvdW5kIGluIE1JSV9M
UEEgaXMgd3Jvbmc6Cj4gPiBAQCAtMTk2LDcgKzIxMSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGh5X2Ry
aXZlciBtZXNvbl9neGxfcGh5W10gPSB7Cj4gPiAgICAgICAgICAgICAgIC5jb25maWdfaW50ciAg
ICA9IHNtc2NfcGh5X2NvbmZpZ19pbnRyLAo+ID4gICAgICAgICAgICAgICAuaGFuZGxlX2ludGVy
cnVwdCA9IHNtc2NfcGh5X2hhbmRsZV9pbnRlcnJ1cHQsCj4gPiAgICAgICAgICAgICAgIC5zdXNw
ZW5kICAgICAgICA9IGdlbnBoeV9zdXNwZW5kLAo+ID4gLSAgICAgICAgICAgICAucmVzdW1lICAg
ICAgICAgPSBnZW5waHlfcmVzdW1lLAo+ID4gKyAgICAgICAgICAgICAucmVzdW1lICAgICAgICAg
PSBtZXNvbl9neGxfcGh5X3Jlc3VtZSwKPiA+ICAgICAgICAgICAgICAgLnJlYWRfbW1kICAgICAg
ID0gZ2VucGh5X3JlYWRfbW1kX3Vuc3VwcG9ydGVkLAo+ID4gICAgICAgICAgICAgICAud3JpdGVf
bW1kICAgICAgPSBnZW5waHlfd3JpdGVfbW1kX3Vuc3VwcG9ydGVkLAo+ID4gICAgICAgfSwgewo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
