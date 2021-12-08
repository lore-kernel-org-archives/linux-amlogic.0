Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ED6C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Dec 2021 04:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7EcG7d994ql7c9oxG5yE+TPA5B4SgEbF8m9fgcrPNs=; b=TM3Q5GafcJL9rp
	TkyA+bjh9X2CxdS09m6qtOM7bmc93mwtxxutvDPYPUa15kowGWQx7BnOf2HVvpPF9zXriVrd+bmlZ
	K6aJSLQovpcaW0QMtb/T9fon1ONr7mmZHOAvKHWWadkDP1qFaInA1YVdMI6CqzA9sTiR807lzoucA
	ZQIxFrsrPxppQ7tJFIyp+msh5/hH81GlyMUXxg30V2DrSlcsVPmLVCKiolxTI0pBWNyfC7u4p1ELs
	QorbLQK3cKVZrO1MyK7eqDA64RWaBQZphXwLsfvbVNu7bpdn+ue13nQCRJ1DicErfxUbFeBOFMXC0
	kC61IAkZWXsypuIICWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muop8-00BDzQ-0g; Wed, 08 Dec 2021 04:44:58 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muoow-00BDxk-2L; Wed, 08 Dec 2021 04:44:47 +0000
Received: by mail-ed1-x531.google.com with SMTP id l25so4012326eda.11;
 Tue, 07 Dec 2021 20:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mvjWIFDl3Z932+ulOmlLjYQdMm4oZF1plc2CmRUrZ7A=;
 b=P1Nid0yP7jCMnNY7woFaZQ4qxE9QiSWUwm95VCAS+65R4pshASNVHc+kaP8zo/h+cX
 gUdKV2A6GyMfsBayqvY3cVq9VPuxgRKbqzgxuY9bjdc4TYH+AEXGFio4b+ftSOiOBP7b
 PnK1NxtGJOp0vCVxS5f0pV8RiN5t4YIOHv1owb2FcIP1AYzg6Pfxi2ei0PpnrkjeQnF5
 bML/YwRwxoH0fQKBUjJWIZAZ4EEtHcXSlbW42QR+OIF+3m8sm2NHAz2584lZAFxYsvRg
 QGvb+571Tvi7vGC1yhpsqCJoeOQJFudR1IrWbvIN+dJrud58KaTeSq4gcKczI01qFqjM
 1SKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mvjWIFDl3Z932+ulOmlLjYQdMm4oZF1plc2CmRUrZ7A=;
 b=jEx+hD0N53LFezHXxiw4cq0TyBPPZ7rB1C9YF875W88Gg6PJLLb51zx/gh9heflR0d
 y74cTG3ievezJDdX15Q9cscL0KdFwzYUDn+ck3Oc3XhUkI9nhrDngGZd7lSXQT2C+tH3
 E0w/kb9rCey3/lWEyEQyCKyUxig9td4CsTgOf+HFPKB07ChIF61HPBJPAI1r2rPFdpn1
 ZFr7pBIPMcQZBsLVvEm9Ygkt6huHXCY0pIHDvvlpMbnhNTGSx+r/ljGlUyZ57GTGPUzU
 Ku+goM9BcTL/Cu9tewmjdaJAGIEGX8V+tOALUI4qDewSVnQ0VGcWDC6uC6ZD2FEHFtVE
 //bQ==
X-Gm-Message-State: AOAM533aHfltHMiKDn2aL4/zKlyD6mzuzuInOgl9xRMywudS2cpZ4P0J
 EoHRJLWm4lK6cZYfqGhf+G0=
X-Google-Smtp-Source: ABdhPJwAW+j1KiEM8wN0uczT86kc03ngEICuZtXPY/dQO0Mj4zmuvAFJTqmSn7HQQwjwIimRqn/DQw==
X-Received: by 2002:a17:906:1be2:: with SMTP id
 t2mr4700337ejg.399.1638938683782; 
 Tue, 07 Dec 2021 20:44:43 -0800 (PST)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i5sm725922ejw.121.2021.12.07.20.44.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 20:44:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [RFC PATCH 2/9] dt-bindings: arm: amlogic: add X96-AIR bindings
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <Ya/Qask7Fpb6mTxb@robh.at.kernel.org>
Date: Wed, 8 Dec 2021 08:44:40 +0400
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, Benoit Masson <yahoo@perenite.com>
Message-Id: <C1918DC0-F873-4832-AF1A-91AFEF4F7151@gmail.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
 <20211130060523.19161-3-christianshewitt@gmail.com>
 <Ya/Qask7Fpb6mTxb@robh.at.kernel.org>
To: Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_204446_131463_84C7D707 
X-CRM114-Status: GOOD (  15.96  )
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

Cj4gT24gOCBEZWMgMjAyMSwgYXQgMToyMSBhbSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gCj4gT24gVHVlLCBOb3YgMzAsIDIwMjEgYXQgMDY6MDU6MTZBTSArMDAwMCwg
Q2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPj4gQWRkIGJvYXJkIGJpbmRpbmdzIGZvciB0aGUgQW1l
ZGlhdGVjaCBYOTYtQUlSIFNUQiB3aGljaCBzaGlwcyB3aXRoCj4+IG1vZGVsIHZhcmlhbnRzIGRp
c3RpZ3Vpc2hlZCBieSBFdGhlcm5ldCBjb25maWd1cmF0aW9uOiBtb2RlbHMgdXNpbmcKPj4gaW50
ZXJuYWwgMTAvMTAwIFBIWSBoYXZlIGEgLTEwMCBzdWZmaXgsIHdoaWxlIG1vZGVscyB1c2luZyBl
eHRlcm5hbAo+PiBHaWdhYml0IFBIWSBoYXZlIGEgLTEwMDAgc3VmZml4Lgo+IAo+IElzbid0IHRo
ZSBwaHkgZGVzY3JpYmVkIGluIERUPyBXaHkgZG8geW91IG5lZWQgdG8gZGVzY3JpYmUgdGhpcyAx
IAo+IGRpZmZlcmVuY2UgYXQgdGhlIHRvcCBsZXZlbD8KClVzZXJzIHdobyBwdXJjaGFzZSBBbmRy
b2lkIFNUQnMgYXMgYSBjaGVhcCBMaW51eCBtZWRpYSBkZXZpY2UgKG9yIGFyZQpyZWltaWFnaW5n
IGFuIGV4aXN0aW5nIGRldmljZSB3aGVuIHRoZXkgZ2l2ZSB1cCBvbiBBbmRyb2lkKSBnZW5lcmFs
bHkKaGF2ZSBubyBpZGVhIHdoYXQgYSBQSFkgaXMsIHNvIHJlYWRpbmcgYSBkZXZpY2UtdHJlZSBm
aWxlIHRvIHBpY2sgdGhlCmNvcnJlY3Qgb25lIGlzIGJleW9uZCB0aGVtLiBNb3N0IHBlb3BsZSBi
bGluZGx5IHRyeSBhbGwgZHRiIGZpbGVzIGZvcgphIGNsYXNzIG9mIGRldmljZSB1bnRpbCB0aGV5
IGZpbmQgb25lIHRoYXQgd29ya3MsIHNvIHRvcC1sZXZlbCBuYW1pbmcKaXMgc2ltcGx5IHRvIGhp
bnQgdGhlIHByb2Nlc3MgYW5kIHJlZHVjZSBndWVzc3dvcmsuIEl04oCZcyBub3QgcGVyZmVjdCwK
YnV0IGl0IGRvZXMgYXBwZWFyIHRvIHJlZHVjZSB0aGUgcXVhbnRpdHkgb2Yg4oCcRXRoZXJuZXQg
ZG9lc27igJl0IHdvcmsh4oCdCnBvc3RzIHNlZW4gaW4gc3VwcG9ydCBmb3J1bXMuCgpDaHJpc3Rp
YW4KCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRA
Z21haWwuY29tPgo+PiAtLS0KPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9hbWxvZ2ljLnlhbWwgfCAyICsrCj4+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
Pj4gCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2FtbG9naWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1s
b2dpYy55YW1sCj4+IGluZGV4IDM2MDgxNzM0ZjcyMC4uZTlhYjBmZmU4YmU3IDEwMDY0NAo+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFt
bAo+PiBAQCAtMTcwLDYgKzE3MCw4IEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgIC0gZGVzY3JpcHRp
b246IEJvYXJkcyB3aXRoIHRoZSBBbWxvZ2ljIE1lc29uIFNNMSBTOTA1WDMvRDMvWTMgU29DCj4+
ICAgICAgICAgaXRlbXM6Cj4+ICAgICAgICAgICAtIGVudW06Cj4+ICsgICAgICAgICAgICAgIC0g
YW1lZGlhdGVjaCx4OTYtYWlyLTEwMAo+PiArICAgICAgICAgICAgICAtIGFtZWRpYXRlY2gseDk2
LWFpci0xMDAwCj4+ICAgICAgICAgICAgICAgLSBiYW5hbmFwaSxicGktbTUKPj4gICAgICAgICAg
ICAgICAtIGhhcmRrZXJuZWwsb2Ryb2lkLWM0Cj4+ICAgICAgICAgICAgICAgLSBoYXJka2VybmVs
LG9kcm9pZC1oYzQKPj4gLS0gCj4+IDIuMTcuMQo+PiAKPj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
