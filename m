Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8F4C77B7A
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 May 2023 20:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxsCWlH0BANfpmmMcrDOA1b4pD6DlUe2NfoQqx5jQoI=; b=zkg1bvfXESvQWF
	l35xSrxNynwyRg8ZsVqcr093N3ERA6bVKvV4uxKlgTqd6MIkKtwweT1it5w90t8gES+0WnsB+vmPQ
	UkuU83LS+cMHPYEkSZtR225YJ4gFlUkrc+uu/JKaUWrRhppxWw1YgER0+aKN8oWHUFJHS5SFALxaZ
	JDk6OPfvDblDgr2i3zfpY59p8BdLvFWvdA62+alHqJNPLA2CtXlwjqDmbf2pWIQTP/VLVKdy59But
	+WSMGcmeOC1P9m7gz+oqY0qJ/1zKSLMqDcaUeeiMVoSCnkaH04ybIFMos7mbqPOHQtq1BPP+9bPvg
	Yyw/QVdf42yH/xuBb3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jdk-00BeR8-0C;
	Mon, 29 May 2023 20:38:52 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jdg-00BeQK-2l;
	Mon, 29 May 2023 20:38:50 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96f9cfa7eddso666030966b.2;
        Mon, 29 May 2023 13:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685392724; x=1687984724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1toJ4Ziiwkh6Uorqj0Y7CR8iggvNFOiNmMnjnIZtME=;
        b=jSTFRK90J4fjGPvkA2TKfJY2v4K96Gd0EFHgmeeisj5WF0B697V0YN8iDEI8dq8F2S
         BjddDb5lARn85ymxhNdSfn+wPq7QHypoBDjF/PNnq5T0OVqWPRusr3g+WMR7MSWBgJFZ
         ithPzxjE4liO2A6ntGlySxN3wZiLQlYUuAF4gnHRQOaQDq29zg9Ugjjjq9Ywcph+Eu0x
         b5t7d07GEsR9E24MlEPXWOwV/Knq1HXU3aMF+yhkSzDVdkzWWzxQz1gnTuXAp+VYFhwM
         uinEs07l7yXB7O4WcXQKa/4Obpp3VCIyclSTDBKV8oyIpcaHqiPwW8XvMRo86vBk/n67
         XR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685392724; x=1687984724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1toJ4Ziiwkh6Uorqj0Y7CR8iggvNFOiNmMnjnIZtME=;
        b=mDuvt2av/f18LwpEA5ca1tB0tT6yEZvq4pcoXiF6F9jjPN7N9zhzoDXC2zWIPwwbmT
         3zC3WVoUXANKUF86jSpccslz34oDRzPRN49JvQJR0K7nUb2+1mzFtPmaM8CpZ/tUliTL
         1nfUhmWLKS+K92lZzSkdCX1h8l2QJkj1mJ3/fUFzG5d77/h1YznrytwLlkPxTfvy/4mv
         ddlj8UgeBJm+8fb+qIUFkpg+IQubX32oT8pzKsn7Wlxwi11zEntb2OuyBKwNwvW1P2W4
         rlwGVPNtiuAvLmaaRunM6i7XvOQPDLuFbY+jQJf+ODes+WLmS8JNNRkTr9OieLpMRTO6
         hR2g==
X-Gm-Message-State: AC+VfDzm7QqAOTz/jE6BrGTK1OQcIi0zNokymuppgdHVzaJmxyv4O/i6
	WIhE+2/kAR0SeU4Rz3Q07ufPtJqY/O9wOUDtwWE=
X-Google-Smtp-Source: ACHHUZ4UtXw5S6P31cGYC8SENa/qvkWQuSzFjsy13hgt+tpBjTHl3HQ3Xk+hjLn2wdue1VC2ihr2v8r1mi/Prs9uGvU=
X-Received: by 2002:a17:907:7fa7:b0:94f:59aa:8a7c with SMTP id
 qk39-20020a1709077fa700b0094f59aa8a7cmr409487ejc.20.1685392724055; Mon, 29
 May 2023 13:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230517133309.9874-1-ddrokosov@sberdevices.ru>
 <20230517133309.9874-6-ddrokosov@sberdevices.ru> <CAFBinCC3kQ9Nz3R2W-Qj9tbPJfS8JsB_4AkmPgS6xpQ96DBy2w@mail.gmail.com>
 <20230522130033.a47vlybocme66rev@CAB-WSD-L081021>
In-Reply-To: <20230522130033.a47vlybocme66rev@CAB-WSD-L081021>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 29 May 2023 22:38:33 +0200
Message-ID: <CAFBinCAk9+Km3BssA8d8nc_Z_GbhY87FD3qQRpZ2k7ChKt7TBg@mail.gmail.com>
Subject: Re: [PATCH v15 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, Conor Dooley <conor.dooley@microchip.com>, 
	krzysztof.kozlowski+dt@linaro.org
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, khilman@baylibre.com, 
	jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_133848_919757_338D2008 
X-CRM114-Status: GOOD (  30.87  )
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

SGkgRG1pdHJ5LAoKT24gTW9uLCBNYXkgMjIsIDIwMjMgYXQgMzowMOKAr1BNIERtaXRyeSBSb2tv
c292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+ID4gVGhpcyBJUCBi
bG9jayBoYXMgYXQgbGVhc3Qgb25lIGFkZGl0aW9uYWwgaW5wdXQgY2FsbGVkICJzeXNfcGxsX2Rp
djE2Ii4KPiA+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgInN5c19wbGxfZGl2MTYiIGNs
b2NrIGlzIGdlbmVyYXRlZCBieSB0aGUKPiA+IENQVSBjbG9jayBjb250cm9sbGVyLiBTdXBwb3J0
IGZvciB0aGUgQ1BVIGNsb2NrIGNvbnRyb2xsZXIKPiA+IChkdC1iaW5kaW5ncyBhbmQgYSBkcml2
ZXIpIHdpbGwgYmUgYWRkZWQgYXQgYSBsYXRlciB0aW1lIGJ5IERtaXRyeS4KPiA+IEhvdyBjYW4g
d2UgbWFuYWdlIGluY3JlbWVudGFsbHkgaW1wbGVtZW50aW5nIHRoZSBjbG9jayBjb250cm9sbGVy
cz8KPiA+IEZyb20gYSBoYXJkd2FyZSBwZXJzcGVjdGl2ZSB0aGUgInN5c19wbGxfZGl2MTYiIGlu
cHV0IGlzIG1hbmRhdG9yeS4KPiA+IEhvdyB0byBtYW5hZ2UgdGhpcyBpbiB0aGUgLmR0cyBwYXRj
aGVzIHRoZW4gKGZvciBleGFtcGxlOiBkb2VzIHRoaXMKPiA+IG1lYW4gdGhhdCBEbWl0cnkgY2Fu
IG9ubHkgYWRkIHRoZSBjbG9jayBjb250cm9sbGVyIHRvIHRoZSAuZHRzIHdoZW4KPiA+IGFsbCBj
bG9jayBjb250cm9sbGVyIGJpbmRpbmdzIGhhdmUgYmVlbiBpbXBsZW1lbnRlZCAtIG9yIGlzIHRo
ZXJlCj4gPiBhbm90aGVyIHdheSk/Cj4KPiBZb3UncmUgYWJzb2x1dGVseSByaWdodDogY3VycmVu
dGx5LCBub3QgYWxsIGlucHV0cyBhcmUgc3VwcG9ydGVkIGJlY2F1c2UKPiB0aGUgQ1BVIGNsb2Nr
IGNvbnRyb2xsZXIgaXNuJ3QgcmVhZHkgeWV0IOKAkyBJJ20gd29ya2luZyBvbiBpdCBhdCB0aGUK
PiBtb21lbnQuCj4KPiBJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJucyBhYm91dCBiaW5kaW5ncyBh
bmQgc2NoZW1hIGRlc2NyaXB0aW9uLCBidXQKPiB0aGVyZSBpcyBhbiBpc3N1ZSB0byBiZSBjb25z
aWRlcmVkLiBJJ20gZGV2ZWxvcGluZyB0aGUgZW50aXJlIGNsb2NrCj4gY29udHJvbGxlciBBMSBz
dWJzeXN0ZW0gaW5jcmVtZW50YWxseSBpbiB0aHJlZSBzdGFnZXM6IHBlcmlwaGVyYWxzIGFuZAo+
IFBMTCwgQ1BVLCBhbmQgQXVkaW8uIFRoaXMgaXMgYmVjYXVzZSB0aGUgQ1BVIGNhbiBvcGVyYXRl
IGF0IGEgc3RhdGljCj4gZnJlcXVlbmN5IGFuZCB2b2x0YWdlLCBhbmQgdGhlIGJvYXJkIGJvb3Rz
IG5vcm1hbGx5IHdpdGhvdXQgdGhlIENQVQo+IGNsb2NrIGNvbnRyb2xsZXIsIHRoZXJtYWwgc2Vu
c29yLCBhbmQgT1BQIHRhYmxlLiBBdWRpbyBpcyBhbHNvCj4gaW1wb3J0YW50LCBidXQgaXQncyBv
cHRpb25hbC4gT24gdGhlIG90aGVyIGhhbmQsIHdpdGhvdXQgc2V0dGluZyB1cCB0aGUKPiBwZXJp
cGhlcmFscyBhbmQgUExMIGNvbnRyb2xsZXJzLCB0aGUgYm9hcmQgd29uJ3QgZnVuY3Rpb24gYmVj
YXVzZQo+IHRoZXkncmUgZnVuZGFtZW50YWwuCkkgdW5kZXJzdGFuZCB5b3VyIGFwcHJvYWNoIGFu
ZCBJIGxpa2UgaXQgKHdpdGhvdXQgdGhhdCBpbmNyZW1lbnRhbAphcHByb2FjaCB5b3Ugd291bGQg
cHJvYmFibHkgYmUgbG9va2luZyBhdCBhIHNlcmllcyB3aXRoIDE1LTIwCnBhdGNoZXMpLgoKTWF5
YmUgdGhlIGR0LWJpbmRpbmcgbWFpbnRhaW5lcnMgaGF2ZSBhIHN1Z2dlc3Rpb24gZm9yIHVzIGhl
cmU/CkxldCBtZSB0cnkgdG8gc3VtbWFyaXplIHRoZSBpc3N1ZSBpbiBhIGZldyBidWxsZXQgcG9p
bnRzOgotIFRoZXJlJ3MgKGF0IGxlYXN0KSBmb3VyIGNsb2NrIGNvbnRyb2xsZXJzIG9uIHRoZSBB
bWxvZ2ljIEExIFNvQwotIFNvbWUgb2YgdGhlc2UgY2xvY2sgY29udHJvbGxlcnMgdGFrZSB0aGUg
b3V0cHV0cyBvZiBhbm90aGVyIGNsb2NrCmNvbnRyb2xsZXIgYXMgaW5wdXRzCi0gSW4gdGhpcyBz
ZXJpZXMgcGF0Y2ggdGhlIHBlcmlwaGVyYWwgY2xvY2sgY29udHJvbGxlciBoYXMgYW4gaW5wdXQK
Y2FsbGVkICJzeXNfcGxsX2RpdjE2IgotIFRoZSBjbG9jayBjb250cm9sbGVyIHdoaWNoIHByb3Zp
ZGVzIHRoZSAic3lzX3BsbF9kaXYxNiIgY2xvY2sgaXMgbm90CmltcGxlbWVudGVkIHlldCAobXkg
dW5kZXJzdGFuZGluZyBpcyB0aGF0IGltcGxlbWVudGluZyBpdCBhbmQgYWRkaW5nCml0IHRvIHRo
aXMgc2VyaWVzIGlzIG5vdCBlYXN5OiBpdCB3b3VsZCBhZGQgZXZlbiBtb3JlIHBhdGNoZXMgdGhh
dApuZWVkIHRvIGJlIHJldmlld2VkIGFuZCBpbiBnZW5lcmFsIGl0J3MgYSB0cmlja3kgY2xvY2sg
Y29udHJvbGxlciB0bwppbXBsZW1lbnQgYXMgaXQgbWFuYWdlcyB0aGUgQ1BVIGNsb2NrcykKCj4g
UmlnaHQgbm93LCB3ZSdyZSBpbiB0aGUgZmlyc3Qgc3RhZ2Ugb2YgdGhlIHBsYW4uIFVuZm9ydHVu
YXRlbHksIEkgY2FuJ3QKPiBkaXNjbG9zZSB0aGUgZXhhY3QgbmFtZXMgYW5kIG51bWJlciBvZiBj
bG9jayBiaW5kaW5ncyBmb3IgdGhlIENQVSBhbmQKPiBBdWRpbywgYXMgdGhleSdyZSBzdGlsbCBp
biBkZXZlbG9wbWVudCBhbmQgb25seSBleGlzdCBpbiBteSBoZWFkIG9yCj4gZHJhZnQgdmVyc2lv
bnMuCj4KPiBJZiBwb3NzaWJsZSwgSSdkIHByZWZlciB0byBwcm92aWRlIHRoZSBuZXcgYmluZGlu
Z3MgYW5kIGNvbm5lY3Rpb25zIG9uY2UKPiBhbGwgdGhlIGFwcHJvcHJpYXRlIGRyaXZlcnMgYXJl
IGZpbmFsaXplZC4KUXVlc3Rpb24gdG8gQ29ub3IgYW5kIEtyenlzenRvZiAoYXNzdW1pbmcgeW91
IHJlYWQgbXkgc3VtbWFyeSBhYm92ZSk6CklzIGl0IGZpbmUgdGhhdCBEbWl0cnkgYWRkcyBhZGRp
dGlvbmFsIGlucHV0cyB0byB0aGUgcGVyaXBoZXJhbCBjbG9jawpjb250cm9sbGVyIGJpbmRpbmcg
aW4gbGF0ZXIgcGF0Y2hlcz8KSWYgbm90OiBob3cgY2FuIHdlIHByb2NlZWQgaW4gY2FzZSB3ZSBu
ZWVkIHRvIGFkZCB0aGVtIG5vdyAodGhlCmR0LWJpbmRpbmcgZXhhbXBsZSBpcyB0aGUgZWFzeSBw
YXJ0IGZvciBtZSBhcyB3ZSBjYW4ganVzdCBtYWtlIHVwIGEKcGhhbmRsZSBsaWtlICZzeXNfcGxs
X2RpdjE2X2NsayBhbmQgdXNlIHRoYXQgLSBidXQgdGhpcyBjYW4ndCB3b3JrCndoZW4gRG1pdHJ5
IHRyaWVzIHRvIGFkZCB0aGUgY2xvY2sgY29udHJvbGxlciB0byBtZXNvbi1hMS5kdHNpKQoKUFM6
IERtaXRyeSBpcyB0cnlpbmcgdG8gZ2V0IHRoaXMgc2VyaWVzIGludG8gTGludXggNi41LiBBcyBm
YXIgYXMgSQpyZW1lbWJlciB0aGUgY29tbW9uIGNsb2NrIG1haW50YWluZXJzIGRvbid0IHRha2Ug
cHVsbCByZXF1ZXN0cyB3aXRoCm5ldyBmZWF0dXJlcyBhZnRlciAtcmM2ICh3aGljaCBpcyBpbiBs
ZXNzIHRoYW4gdHdvIHdlZWtzKS4KU28gdGltZSBpcyBnZXR0aW5nIGEgYml0IHNob3J0IGFuZCBm
b3IgbWUgdGhpcyBpcyB0aGUgdmVyeSBsYXN0Cm91dHN0YW5kaW5nIHF1ZXN0aW9uLiBJZiB5b3Ug
c2F5IHRoYXQgaXQncyBmaW5lIHRvIGFkZCBjbG9ja3MgbGF0ZXIgb24KdGhpcyB3aWxsIGltbWVk
aWF0ZWx5IGdldCBteSBSZXZpZXdlZC1ieS4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
