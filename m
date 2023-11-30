Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1104C4167B
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Nov 2023 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbSO8I/OtVxQB3enQl80rOI5s3DAXwzl7VjOqJQiLqM=; b=TULpBSCqPKreTv
	5N7SprUCmZ4GhNXmVSSqowHVp68swuXOFXCUqAFF8ZOXyhatlJpk9+U9ux/UXaMdOWFcGDrfaOgeB
	Hurn84Anry/iRvr6wOv0npxHkPyUKbMz7warHMXCJPgr0oE1D4aXiE4zmdJn81gT59Fe0OpHD9p5w
	gDQFY1KOrm3N0pNpzS0F/tBLw09fUe1WU/gLq00dOucFggmHK3qNpmmDKFQagg9v98JbTyeShs9Qi
	XV7KbefRikx8o0TN8zNezusmC8PY5fhOAsJW5lt/vXajdUHONkSz1DVgHZ9IS7th8nZjD6LtFVAgF
	Mxb/tCSIuyQ5Q/pRCPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8knP-00BV28-0U;
	Thu, 30 Nov 2023 17:25:51 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8knM-00BV0K-1e
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Nov 2023 17:25:50 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-58d439e3e15so543927eaf.1
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Nov 2023 09:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701365146; x=1701969946; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCXaR9pLpeAkRuQ4mZJuM+g+sqyQVKCnHLpozbW6RF0=;
        b=F9H9hk6OljhQOhnMe6loYWceZ7JKpm8y6KlgbJnHhEMRwZT3x0vjOjR/doPEzMjmn6
         AevBvW8fByRjzIy+pgEXSYDeDEyM/d9OMHkQnSOUtF7vf/934QJt0Tpes7G1P0SBiVA6
         uxXECtR9pJPHAKTux84BJI/eYRhtXRsJpxbN8NyjBGm37EHieFOUTXmxNhVbbNQvkVXz
         s+nIBWHf5xU+0vmbzg4yOMAjhey9SN0YMcu/FCQSKLXL00124C8FNI1FTJC6mawAysTB
         js3lQRF4/KBqw+BUlbx5xRe1sLaFRGm+dqUMQGPM+9giUV5isyxp5Vy+7E41vz+XUf6v
         h7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701365146; x=1701969946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCXaR9pLpeAkRuQ4mZJuM+g+sqyQVKCnHLpozbW6RF0=;
        b=CdXPYkUnmtB4IObMG32zrCUMiU2e9TTapi9NpfWkVXAWQci9dcuOqcBWFF+oX1AAov
         ACNqgOvxslSWxA/+aoAQzNxUFUcHx37cbCg371st1HSstCDNXf41ZRwbnTlUl1UBlcHE
         L/EvFooN+aIixFkdkQb2/ApjCLwWHgwK9CRzwj+FvrTq6wbJ4eippGLcsmGpO6vidxHX
         ncYGAQekfqzACQC/bWiS17uWWlROmC8qgQLDgP/wcj+QqP17cvGBgaoqj290YattszeV
         jblcciu5kkp25Ops23X8ZETyUSyZ1VR29oXLRdUkW5REnZc2VMfroA37tiEffYp1yExk
         VVKQ==
X-Gm-Message-State: AOJu0YxmmvZNHr7l8n7QQ7Gutlb6tWad+Cv/0ndx8oGU7D+bkFHbZR+e
	bAiwsJ5JpDdlpc1EAFhzjVgfhy7guCRRw407yHw=
X-Google-Smtp-Source: AGHT+IE1BcT0bCdIVW8dU7KPOFqHbZlDjWkEfqiyOMkkQWhlzpLu0zqsTW6SeIivANniYLPudEgoDo2OvABE67wmLQ0=
X-Received: by 2002:a05:6870:1652:b0:1fa:28b9:ad32 with SMTP id
 c18-20020a056870165200b001fa28b9ad32mr8830097oae.29.1701365146260; Thu, 30
 Nov 2023 09:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20231130053130.21966-1-linux.amoon@gmail.com> <20231130053130.21966-2-linux.amoon@gmail.com>
 <20231130-twig-stoning-58235b3195c8@spud> <20231130-snub-backshift-2f69754cf58f@spud>
In-Reply-To: <20231130-snub-backshift-2f69754cf58f@spud>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 30 Nov 2023 22:55:29 +0530
Message-ID: <CANAwSgQhvxUgg1BO2=eWJ_ZEtFKsidYo_xQNxji7yVE=Qy0F0Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_092548_552674_3F2E74E1 
X-CRM114-Status: GOOD (  24.43  )
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

SGkgQ29ub3IsCgpPbiBUaHUsIDMwIE5vdiAyMDIzIGF0IDIwOjUyLCBDb25vciBEb29sZXkgPGNv
bm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgMDM6MTY6
MzNQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMzAsIDIwMjMg
YXQgMTE6MDE6MjZBTSArMDUzMCwgQW5hbmQgTW9vbiB3cm90ZToKPiA+ID4gQWRkIHRoZSBiaW5k
aW5nIGV4YW1wbGUgZm9yIHRoZSBVU0IzLjEgR2VuZXN5cyBMb2dpYyBHTDM1MjMKPiA+ID4gaW50
ZWdyYXRlcyB3aXRoIFVTQiAzLjEgR2VuIDEgU3VwZXIgU3BlZWQgYW5kIFVTQiAyLjAgSGlnaC1T
cGVlZAo+ID4gPiBodWIuCj4gPiA+Cj4gPiA+IEZvciBvbmJvYXJkIGh1YiBjb250cm9sbGVycyB0
aGF0IHN1cHBvcnQgVVNCIDMueCBhbmQgVVNCIDIuMCBodWJzCj4gPiA+IHdpdGggc2hhcmVkIHJl
c2V0cyBhbmQgcG93ZXIgc3VwcGxpZXMsIHRoaXMgcHJvcGVydHkgaXMgdXNlZCB0byBpZGVudGlm
eQo+ID4gPiB0aGUgaHVicyB3aXRoIHdoaWNoIHRoZXNlIGFyZSBzaGFyZWQuCj4gPiA+Cj4gPgo+
ID4gPiBbQ29ub3IgRG9vbGV5OiB1cGdyYWRlIHBlZXItaHViIGRlc2NyaXB0aW9uXQo+ID4Kb2sK
PiA+IFRoaXMgc2hvdWxkIG5vdCBiZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIE90aGVyd2lzZSwK
PiA+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29t
Pgo+ID4KPiA+IENoZWVycywKPiA+IENvbm9yLgo+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5h
bmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gdjU6IHVwZ3Jh
ZGUgcGVlci1odWIgZGVzY3JpcHRpb24gOiBDb25vciBEb29sZXkKPiA+ID4gWzBdIGh0dHBzOi8v
d3d3LmdlbmVzeXNsb2dpYy5jb20udHcvZW4vcHJvZHVjdF92aWV3LnBocD9zaG93PTY3IFtCbG9j
ayBEaWFncmFtXQo+ID4gPiB2NDogRml4IHRoZSBkZXNjcmlwdGlvbiBvZiBwZWVyLWh1YiBhbmQg
dXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZS4KPiA+ID4gU2NoZW1hdGljcyBvZiB0aGUgT2Ryb2lk
IE4yKwo+ID4gPiBodHRwczovL2RuLm9kcm9pZC5jb20vUzkyMlgvT0RST0lELU4yL1NjaGVtYXRp
Yy9vZHJvaWQtbjJfcmV2MC42XzIwMjEwMTIxLnBkZgo+ID4gPiBWMzogZml4IHRoZSBkdF9iaW5k
aW5nX2NoZWNrIGVycm9yLCBhZGRlZCBuZXcgZXhhbXBsZSBmb3IgR2VuZXN5cyBHTDM1MjMKPiA+
ID4gdjI6IGFkZGVkIEdlbmVzeXMgR0wzNTIzIGJpbmRpbmcKPiA+ID4gdjE6IG5vbmUKPiA+ID4g
LS0tCj4gPiA+ICAuLi4vYmluZGluZ3MvdXNiL2dlbmVzeXMsZ2w4NTBnLnlhbWwgICAgICAgICAg
fCA2NSArKysrKysrKysrKysrKysrKy0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjEgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXN5cyxnbDg1MGcueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXN5cyxnbDg1MGcueWFtbAo+ID4g
PiBpbmRleCBlZTA4YjljMzcyMWYuLjQ5OTE5MmVhNDA3NCAxMDA2NDQKPiA+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lc3lzLGdsODUwZy55YW1sCj4g
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXN5cyxn
bDg1MGcueWFtbAo+ID4gPiBAQCAtOSw5ICs5LDYgQEAgdGl0bGU6IEdlbmVzeXMgTG9naWMgVVNC
IGh1YiBjb250cm9sbGVyCj4gPiA+ICBtYWludGFpbmVyczoKPiA+ID4gICAgLSBJY2Vub3d5IFpo
ZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+ID4KPiA+ID4gLWFsbE9mOgo+ID4gPiAtICAtICRyZWY6
IHVzYi1kZXZpY2UueWFtbCMKPiA+ID4gLQo+ID4gPiAgcHJvcGVydGllczoKPiA+ID4gICAgY29t
cGF0aWJsZToKPiA+ID4gICAgICBlbnVtOgo+ID4gPiBAQCAtMjcsMTIgKzI0LDQ2IEBAIHByb3Bl
cnRpZXM6Cj4gPiA+Cj4gPiA+ICAgIHZkZC1zdXBwbHk6Cj4gPiA+ICAgICAgZGVzY3JpcHRpb246
Cj4gPiA+IC0gICAgICB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgMy4zViBjb3JlIHBvd2Vy
IHRvIHRoZSBodWIuCj4gPiA+ICsgICAgICBwaGFuZGxlIHRvIHRoZSByZWd1bGF0b3IgdGhhdCBw
cm92aWRlcyBwb3dlciB0byB0aGUgaHViLgo+Cj4gV2FpdCwgd2h5IGlzIHRoaXMgdGV4dCBjaGFu
Z2luZz8gSSBkb24ndCBzZWUgaXQgbWVudGlvbmVkIGFueXdoZXJlIHdoeQo+IHRoaXMgaXMgbm8g
bG9uZ2VyIHNwZWNpZmljYWxseSAzLjN2Cj4KR0wzNTIzIGhhcyBidWlsdC1pbiA1ViB0byAzLjNW
IGFuZCA1ViB0byAxLjJWIHJlZ3VsYXRvcnMsIHdoaWNoIHNhdmVzCmN1c3RvbWVyc+KAmSBCT00g
Y29zdCwgYW5kIGVhc2VzIGZvciBQQ0IgZGVzaWduLgoKRG8gSSBoYXZlIHRvIHVwZGF0ZSB0aGlz
IGluIHRoZSBjb21taXQgbWVzc2FnZT8gb3IgbGVhdmUgdGhpcyBvcmlnaW5hbC4KCj4gVGhhbmtz
LAo+IENvbm9yLgo+ClRoYW5rcwotQW5hbmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
