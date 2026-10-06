Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34314CA5FED
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2026 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhU7rswx0gF92aXRva+T6bOZUYRAgP2gOr7SwP1NWDg=; b=FYJ0YNEq7WALlU
	IBSBDP0tQgLXgYXKxv/RAqpIKdvMjCMp/l9vZZBQJUM2S57mtQNi5ysnpFgCwkamJlRIPcKo3PJWx
	jFpit+YrmihAFmjDKPXcn8zW6S+Fie27tKpu+LwTbmnLHpAp4FElJTcqKVX1f9XFCJFFKr+3Xc6GF
	VXXccnQRy87jn+57wwGAQKaNIkDmycVVsVF/GvxfsFGV3YOmP+1UuwfWD4TbNeVJiJ4fR8UBJpMfQ
	pULVyMLLtaQWATxmzAzExW3XsnD3+QR4U/bd3E3/4dCLxxwr1O0yXFvAUo5Cqm7xQspQth9vSl8gc
	ETuDDusiwkzbtXeW77Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1Pm-00000000NEY-0AjV;
	Tue, 06 Oct 2026 09:24:50 +0000
Received: from mail-yx1-f48.google.com ([74.125.224.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1Pi-00000000NDh-1iJC
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Oct 2026 09:24:48 +0000
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67694513f2fso284482d50.1
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Oct 2026 02:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278685; x=1791883485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVTxTfkNs+IvzxUmHzgjnWzXGShomJ5y8a1XbauhqO0=;
        b=lJU/+lob7IcA3PfaGUyvJu/huGJXtOTZphb+m1rDOGk3EwXi1DbUsZ4c02gAOjxId0
         Z5v5tLuL5NVox3F6wOkpr6YzCBPK8KemDpUpEYFqSkN0kZB60TDTQYQJbuA3GvNAK4u/
         ttOF2wWOJefLPG0hW7yXqXDMwxOr21qgV6+/JzTQ3JGMAg8In42VxJ7wzMV0/TrHIvn6
         e1IuwqO1U80oKWS285g2IxS9nchRB0Di0TTxzVWwVV/HE8Xam8ydNpJeLEw6DlH1ak2e
         8mf8cVAB8MgB+wc76ia7W924sZsWH2Gajd93pj0VITuK7fesXh/0I3EKLx5f9sL93O2q
         PC7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxphcveuvRPY0td1tUvBAB3NhJaFxehJ9AzRs1FR7NbPvOzkpNtr72++rtkefyqMHtHHPp6Fg8X5nWz8Dn+@lists.infradead.org
X-Gm-Message-State: AFq9FYLrh88vfLY7PcyV7JhMNisvsv0ksZAR9ARjppzGcb/SwtTX1RSf
	zKv1EKuY95sjVANVYzwDiHnLXKhfbM9UVNEAsVjUR5BGfEBOD8lYkLJfpDWKdtPbNjE=
X-Gm-Gg: AYBFou0HvCF84DwxcXJeGidiBY9QgPLod6//YmzQmyPNe22CXDz2eEy3KkQH+0kyW5I
	vQNvMe8n6lIIMwyKHqcB/JftbAq8RWFK4cdg7nL9MncdUa5UZV8ampWlJyY+thXrPBRdoF2DL0n
	6/3WNX67S8ijPBUKdSBJuh1d6plGCYuWi/BSCccwbJiDKNQ3+qS+R4A6wfHD4bMBfer3AEJpDl1
	WGKQHokA4rMzsmTLup+6fSSQo+/7rVurOhuQhq94eoHQb+PHje5WoWUBnautYfOddqpw/EYFr5r
	a3GvUWVuJvJWlY/PHVkdWg28M+RAy039wWBpgwak9r5zfrlqhnQCApdf20UGSPTyaaRS0ZgWlKO
	+MAApq+wIun0TRg4m0X/9cmESITeK/TXyXy8YHCkGnKSjZ1N69OSCuVk4hhLqG6L/3pujtxMcTc
	obqg+gB8JLVq8P8OUGiGnQuI1IZkpeCumgrvwZ6df6+g0tM/YJr13Ce3ZL7TaWVM2Vyc4ldK5ZQ
	Avq0Gjjau6NxZXOYPSVJ9n3KDIB7CSEIAl8n/S0KmgDLbwlyD/sjgJmEDlTMNtGkCg=
X-Received: by 2002:a05:690e:dc2:b0:671:3da4:be6 with SMTP id 956f58d0204a3-678fcd9c4e5mr237771d50.34.1791278685009;
        Tue, 06 Oct 2026 02:24:45 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8af2caa6fbasm23073087b3.37.2026.10.06.02.24.44
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 02:24:44 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-888cbacf70eso6125937b3.1
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Oct 2026 02:24:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjaLIXBaETbdljMw3wpY25kRzjFo5Xyj/zYLuWbsi/039880wxftNitRfkbwlyteCaWkSXx+sNOLeb3uoa@lists.infradead.org
X-Received: by 2002:a05:690c:7108:b0:8ae:7fb9:8cb8 with SMTP id
 00721157ae682-8b04f3b6667mr2040067b3.17.1791278683947; Tue, 06 Oct 2026
 02:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20261004144046.391444-1-tanure@linux.com> <20261004144046.391444-3-tanure@linux.com>
 <asN_-5zalENhkdVA@squawk>
In-Reply-To: <asN_-5zalENhkdVA@squawk>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 6 Oct 2026 10:24:32 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2hD_LTcimHAVhyzgTnp9jYxKKFD2TK5cv9-wLjDh8+wQ@mail.gmail.com>
X-Gm-Features: AclHuK-bVUCezgDuqipnwl794qiJm9NtCr-yWp4gG5KzmPFjPQMebZJ1Y2LQr9E
Message-ID: <CAJX_Q+2hD_LTcimHAVhyzgTnp9jYxKKFD2TK5cv9-wLjDh8+wQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Conor Dooley <conor@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_022446_462286_56C2ABB4 
X-CRM114-Status: GOOD (  28.91  )
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

T24gTW9uLCBPY3QgNSwgMjAyNiBhdCAxMTo0NuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIE9jdCAwNCwgMjAyNiBhdCAwMzo0MDo0MlBNICsw
MTAwLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPiBUaGUgVDcgaGFzIHRoZSBzYW1lIGV0aGVybmV0
IGdsdWUgYXMgdGhlIEcxMkEsIGJ1dCB0aGUgY29udHJvbGxlcgo+ID4gcmVhY2hlcyBEUkFNIHRo
cm91Z2ggYSBwaXBlbGluZSBzdGFnZSB0aGF0IHRoZSBoYXJkd2FyZSBkZXNpZ24gaW5zZXJ0cwo+
ID4gaW4gdGhlIGJ1cyBwYXRoLiBUaGF0IHN0YWdlIGhhcyBhIGdhdGUgb2YgaXRzIG93biwgd2hp
Y2ggbm8gb3RoZXIgbWVtYmVyCj4gPiBvZiB0aGUgZmFtaWx5IGhhcy4gTm90aGluZyBlbHNlIGlu
IExpbnV4IGNsYWltcyB0aGUgZ2F0ZSwgc28gaXQgaXMKPiA+IHN3aXRjaGVkIG9mZiBhcyB1bnVz
ZWQgYW5kIHRoZSBwb3J0IGNhbiB0aGVuIG5vIGxvbmdlciBjb21wbGV0ZSBhCj4gPiB0cmFuc2Zl
ci4KPiA+Cj4gPiBEZXNjcmliaW5nIGl0IG1lYW5zIGEgZm91cnRoIGNsb2NrLCBhbmQgdGhlIGZv
dXJ0aCBjbG9jayBvZiB0aGUgZXhpc3RpbmcKPiA+IGxpc3QgaXMgdGhlIG9uZSBkcml2aW5nIHRo
ZSB0aW1pbmcgYWRqdXN0bWVudCBsb2dpYy4gVGhlIFQ3IGFwcGxpZXMgdGhlCj4gPiBSR01JSSBS
WCBkZWxheSB0aHJvdWdoIFBSR19FVEgxIGFuZCBuZXZlciBlbmFibGVzIHRoYXQgbG9naWMsIHNv
IGl0IGhhcwo+ID4gbm8gdXNlIGZvciB0aGF0IGNsb2NrLiBHaXZlIHRoZSBUNyBhIGxpc3Qgb2Yg
aXRzIG93biB3aXRoIHRoZSBwaXBlbGluZQo+ID4gZ2F0ZSBhcyB0aGUgZm91cnRoIGVudHJ5LCB1
bmRlciB0aGUgc2FtZSBuYW1lIHRoZSBTRC9lTU1DIGNvbnRyb2xsZXJzIG9mCj4gPiB0aGlzIFNv
QyBhbHJlYWR5IHVzZSBmb3IgdGhlIGVxdWl2YWxlbnQgc3RhZ2Ugb24gdGhlaXIgb3duIGJ1cyBw
YXRoLiBBbGwKPiA+IGZvdXIgZW50cmllcyBhcmUgcmVxdWlyZWQsIHNpbmNlIHRoZSBwb3J0IGNh
bm5vdCBtb3ZlIGRhdGEgd2l0aG91dCBhbnkKPiA+IG9mIHRoZW0uCj4gPgo+ID4gVGhlIFJYIGRl
bGF5IHJhbmdlIGlzIHRoZSBvbmUgdGhlIEcxMkEgaGFzLCBzaW5jZSBpdCBpcyB0aGUgc2FtZQo+
ID4gcmVnaXN0ZXIgZmllbGQuCj4gPgo+ID4gVGhlIGNvbXBhdGlibGUgcGFpcnMgdGhlIFQ3IG5h
bWUgd2l0aCB0aGUgNS4xMGEgU3lub3BzeXMgY29yZSB0aGUgTUFDCj4gPiByZXBvcnRzLCBhbmQg
d2l0aCB0aGUgZ2VuZXJpYyBmYWxsYmFjay4KPiA+Cj4gPiBBc3Npc3RlZC1ieTogTExNCj4gPiBT
aWduZWQtb2ZmLWJ5OiBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4gPiAtLS0KPiA+
ICAuLi4vYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbCAgICAgfCA0NyArKysr
KysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9h
bWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbAo+ID4gaW5kZXggOTBlZjc5MTYxYWIxLi45
NjExOGI0ZDE1NjAgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwKPiA+IEBA
IC0yMyw2ICsyMyw3IEBAIHNlbGVjdDoKPiA+ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4
YmItZHdtYWMKPiA+ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWF4Zy1kd21hYwo+ID4gICAg
ICAgICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS1kd21hYwo+ID4gKyAgICAgICAgICAtIGFtbG9n
aWMsdDctZHdtYWMKPiA+ICAgIHJlcXVpcmVkOgo+ID4gICAgICAtIGNvbXBhdGlibGUKPiA+Cj4g
PiBAQCAtNTcsNiArNTgsNDcgQEAgYWxsT2Y6Cj4gPiAgICAgICAgICAgICAgLSBjb25zdDogY2xr
aW4xCj4gPiAgICAgICAgICAgICAgLSBjb25zdDogdGltaW5nLWFkanVzdG1lbnQKPiA+Cj4gPiAr
ICAjIFRoZSBUNyBhcHBsaWVzIHRoZSBSR01JSSBSWCBkZWxheSB0aHJvdWdoIFBSR19FVEgxIGFu
ZCBuZXZlciBlbmFibGVzIHRoZQo+ID4gKyAgIyB0aW1pbmcgYWRqdXN0bWVudCBsb2dpYywgc28g
aXQgaGFzIG5vIHRpbWluZy1hZGp1c3RtZW50IGNsb2NrLiBXaGF0IGl0IGRvZXMKPiA+ICsgICMg
bmVlZCBpcyB0aGUgZ2F0ZSBvZiB0aGUgcGlwZWxpbmUgc3RhZ2UgdGhlIGNvbnRyb2xsZXIgcmVh
Y2hlcyBEUkFNIHRocm91Z2guCj4gPiArICAtIGlmOgo+ID4gKyAgICAgIHByb3BlcnRpZXM6Cj4g
PiArICAgICAgICBjb21wYXRpYmxlOgo+ID4gKyAgICAgICAgICBjb250YWluczoKPiA+ICsgICAg
ICAgICAgICBjb25zdDogYW1sb2dpYyx0Ny1kd21hYwo+ID4gKyAgICB0aGVuOgo+ID4gKyAgICAg
IHByb3BlcnRpZXM6Cj4gPiArICAgICAgICBjbG9ja3M6Cj4gPiArICAgICAgICAgIGl0ZW1zOgo+
ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IEdNQUMgbWFpbiBjbG9jawo+ID4gKyAgICAg
ICAgICAgIC0gZGVzY3JpcHRpb246IEZpcnN0IHBhcmVudCBjbG9jayBvZiB0aGUgaW50ZXJuYWwg
bXV4Cj4gPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogU2Vjb25kIHBhcmVudCBjbG9jayBv
ZiB0aGUgaW50ZXJuYWwgbXV4Cj4gPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjoKPiA+ICsg
ICAgICAgICAgICAgICAgY2xvY2sgb2YgdGhlIHBpcGVsaW5lIHN0YWdlIGluc2VydGVkIGluIHRo
ZSBidXMgcGF0aCBiZXR3ZWVuCj4gPiArICAgICAgICAgICAgICAgIHRoZSBjb250cm9sbGVyIGFu
ZCB0aGUgRFJBTS4gV2l0aG91dCBpdCwgdGhlIGNvbnRyb2xsZXIgY2Fubm90Cj4gPiArICAgICAg
ICAgICAgICAgIGNvbXBsZXRlIERNQSB0cmFuc2ZlcnMuCj4KPiBIYXZlIHlvdSBjaGVja2VkIHRo
YXQgdGhpcyBhY3R1YWxseSB3b3JrcyBhcyBhIGxpbWl0ZXIgdG8gb25seSA0IGNsb2Nrcz8KSSBo
YXZlIG5vdywgYW5kIGl0IGRvZXMgbGltaXQgdG8gZm91ci4gQWRkaW5nCmEgZmlmdGggY2xvY2sg
dG8gdGhlIGJvYXJkIGdldHMgcmVqZWN0ZWQ6CgogIGV0aGVybmV0QGZkYzAwMDAwIChhbWxvZ2lj
LHQ3LWR3bWFjKTogY2xvY2stbmFtZXM6CiAgICBbJ3N0bW1hY2V0aCcsICdjbGtpbjAnLCAnY2xr
aW4xJywgJ3BpcGVsaW5lJywgJ2JvZ3VzJ10gaXMgdG9vIGxvbmcKCgo+IFRoZXJlJ3MgYW4gYWRk
aXRpb25hbEl0ZW1zOiB0cnVlIGluIHRoZSBzbnBzLGR3bWFjLnlhbWwgdGhhdCBJIGRvbid0Cj4g
a25vdyBpZiB3aWxsIHBlcm1pdCByYW5kb20gYWRkaXRpb25hbCBpdGVtcyBoZXJlLgpUaGVyZSBh
cmUgdHdvIGNoZWNrcyBvbiBjbG9ja3MgYW5kIGJvdGggaGF2ZSB0byBwYXNzOiBzbnBzLGR3bWFj
LnlhbWwKYWxsb3dzIDEgdG8gMTAgaXRlbXMsIHRoZSB0NyBicmFuY2ggYWxsb3dzIGV4YWN0bHkg
NC4gVGhlCmFkZGl0aW9uYWxJdGVtczogdHJ1ZSBvbmx5IHJlbGF4ZXMgdGhlIGZpcnN0IG9uZSwg
c28gdGhlIHNlY29uZCBzdGlsbApyZWplY3RzIGEgZmlmdGggY2xvY2suIFRoZSAiZXhhY3RseSA0
IiBpcyBub3Qgc29tZXRoaW5nIEkgd3JvdGUgLQpkdC1zY2hlbWEncyBfZml4dXBfaXRlbXNfc2l6
ZSgpIHNldHMgbWluSXRlbXMgYW5kIG1heEl0ZW1zIGZyb20gdGhlCmxlbmd0aCBvZiB0aGUgaXRl
bXMgbGlzdC4KCj4KPiBDaGVlcnMsCj4gQ29ub3IuCj4KPiA+ICsKPiA+ICsgICAgICAgIGNsb2Nr
LW5hbWVzOgo+ID4gKyAgICAgICAgICBpdGVtczoKPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBz
dG1tYWNldGgKPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBjbGtpbjAKPiA+ICsgICAgICAgICAg
ICAtIGNvbnN0OiBjbGtpbjEKPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBwaXBlbGluZQo+ID4g
Kwo+ID4gKyAgIyBEZWxheSBkZWZpbml0aW9ucyBmb3IgTWVzb244YiBhbmQgbmV3ZXIgKGluY2x1
ZGluZyBUNykKPiA+ICsgIC0gaWY6Cj4gPiArICAgICAgcHJvcGVydGllczoKPiA+ICsgICAgICAg
IGNvbXBhdGlibGU6Cj4gPiArICAgICAgICAgIGNvbnRhaW5zOgo+ID4gKyAgICAgICAgICAgIGVu
dW06Cj4gPiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb244Yi1kd21hYwo+ID4gKyAgICAg
ICAgICAgICAgLSBhbWxvZ2ljLG1lc29uOG0yLWR3bWFjCj4gPiArICAgICAgICAgICAgICAtIGFt
bG9naWMsbWVzb24tZ3hiYi1kd21hYwo+ID4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29u
LWF4Zy1kd21hYwo+ID4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHdtYWMK
PiA+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyx0Ny1kd21hYwo+ID4gKyAgICB0aGVuOgo+ID4g
KyAgICAgIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICBhbWxvZ2ljLHR4LWRlbGF5LW5zOgo+ID4g
ICAgICAgICAgICBlbnVtOiBbMCwgMiwgNCwgNl0KPiA+ICAgICAgICAgICAgZGVmYXVsdDogMgo+
ID4gQEAgLTEwNiw2ICsxNDgsNyBAQCBhbGxPZjoKPiA+ICAgICAgICAgICAgY29udGFpbnM6Cj4g
PiAgICAgICAgICAgICAgZW51bToKPiA+ICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1n
MTJhLWR3bWFjCj4gPiArICAgICAgICAgICAgICAtIGFtbG9naWMsdDctZHdtYWMKPiA+ICAgICAg
dGhlbjoKPiA+ICAgICAgICBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgcngtaW50ZXJuYWwtZGVs
YXktcHM6Cj4gPiBAQCAtMTQzLDYgKzE4NiwxMCBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAg
ICAgICAgLSBhbWxvZ2ljLG1lc29uNi1kd21hYwo+ID4gICAgICAgICAgICAgICAgLSBhbWxvZ2lj
LG1lc29uOG0yLWR3bWFjCj4gPiAgICAgICAgICAgIC0gY29uc3Q6IHNucHMsZHdtYWMKPiA+ICsg
ICAgICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLHQ3LWR3bWFjCj4g
PiArICAgICAgICAgIC0gY29uc3Q6IHNucHMsZHdtYWMtNS4xMGEKPiA+ICsgICAgICAgICAgLSBj
b25zdDogc25wcyxkd21hYwo+ID4KPiA+ICAgIHJlZzoKPiA+ICAgICAgaXRlbXM6Cj4gPiAtLQo+
ID4gMi41Ni4wCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
