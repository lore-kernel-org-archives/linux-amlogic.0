Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB26AC55ABA
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Aug 2026 08:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lW6fvW2IH4vatD0/O9Rb/KEKZnco6LScznJ9oHYOLOc=; b=IA9fR8rLxxjCav
	DMKY8ns4FpXBY6ys5bkyhExMSSGCTbPirK6aLADvaH6FUXrGFVgZp/mp4Tqg/p/Q2uyGZobmBsSI4
	kIT+8SPlbqrAJu5sWGPK7gNDR2Knj9LJAasKeAgQx/WUcTo/y4GdsJSckcGmHrX74+3k3pUXaihQe
	vBsA25X0AiDuK3lafSpzYwDLVMSJlTB+l/UXZfXCH3Sox1xbfIRkT0UmemPJWcIWUFHGuk0eGUJM7
	0Nfyqx/Gr7VR7HkrnkvrokJ9ke6rwoDWhtfNTWF3W6rwMPfklleahZZqYKrfscenEPB3wOovndTRJ
	GNft/Hjb+gHfQVpnLiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWfh-00000003Ufy-2Z08;
	Wed, 05 Aug 2026 08:08:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWff-00000003UfX-2kin;
	Wed, 05 Aug 2026 08:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA072600B1;
	Wed,  5 Aug 2026 08:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EF0AC2BCF6;
	Wed,  5 Aug 2026 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785917294;
	bh=laBUPwOl5B7j6tOv3xGopCaFBP5wANkpZgaxfwV14i4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OoCAG9JT+Y+nAmR5LXwxcNZGOzh/BrzsD+nQ8oLcNB+22e24KOOWZIA3nO5xQhK78
	 1vX//xJOMgOOrrGzEqXm+e+IhS3Ht9O7BPzsW9GKyitM+CCFpGsyVID23cFzg/q+BM
	 EWYTEuvfT7Z1T0WG3vmQRhZbbyzQToVZIxloXjzKZOpu3G6wg3SnBDmJYkgVhiPN4H
	 Ke9kh1RpZDLfgvryNdijTM5bDfR/6j6SZGaY2lfrWXoB76+g/CvN/HMVSwbNoSz9Cd
	 OzTROWbExLTKQRDEznApTjlE9qGVRfYhtaAQco1Xk4kxgcLo5V/UsD/QIMkJCoZnJd
	 cBYI99aFko6Dw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A931C55174;
	Wed,  5 Aug 2026 08:08:14 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v9 0/6] Add VIM4 MCU/FAN support
Date: Wed, 05 Aug 2026 10:06:01 +0200
Message-Id: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XRzWrDMAwH8FcpPs/D8mfc095j7CA78mrWJFuSh
 o7Sd5+bHhoC6XyTQT/9kS5soD7TwPa7C+tpykPu2lL4lx2LB2w/iee61EwKaYUWkmNd8yaeeMK
 Wfx2wxoFPudEcI8RAxqjoAyvd3z2lfJ7l94973dPPqQwY758s4EA8dk2Tx/2upfPI5yFOAbs1H
 PIwdv3vnGyCuePfEBNwwWUASUFjdEG84THT8TX1MznJJaO2GVkYJ4yyQUqtPK4YtWDAbTOqMGj
 RJeNEAAgrRi8YCduMLozWDkCjrJKsV4xZMnqbMbc0KSZ0YFyQasXYB2PAbjO2MLE8Hywkbc2Kc
 Q/GPluxK4zxOmCF3pq6WjHVg3HPDl7dDq51IiIPqOyCuV6vf6lhJnjfAgAA
X-Change-ID: 20260402-add-mcu-fan-khadas-vim4-ac1cbe553c9b
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 mfd@lists.linux.dev, Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4629;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=laBUPwOl5B7j6tOv3xGopCaFBP5wANkpZgaxfwV14i4=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ1bR+8QHS37tfX/uqe/6nVulMrZuun5y2wMeR6YdLkYbD
 1yRO1WY11HKwiDGxSArpsjSP9fyxLvLR8983aOeAjOHlQlkCAMXpwBM5NZkhv/ZRqqL+xc8NRDf
 /IL7xGyLu6/STRby75jXLVn5Sl38abEzw3/vEImNR+S/paXayLgscbutE16bU+pVvGI5T9zKss+
 Xf/AAAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIEtoYWRhcyBWSU00IGJvYXJkIGZlYXR1cmVzIGEgZGlmZmVyZW50IE1DVSB2YXJpYW50IGNv
bXBhcmVkIHRvCnByZXZpb3VzIFZJTSBib2FyZHMuCldoaWxlIGl0IHNoYXJlcyB0aGUgc2FtZSBJ
MkMtYmFzZWQgY29tbXVuaWNhdGlvbiBtb2RlbCwKaXQgZGlmZmVycyBpbiBzb21lIHdheXM6Cgog
IC0gQSBkaXN0aW5jdCByZWdpc3RlciBtYXAgd2l0aCBpdHMgb3duIHZvbGF0aWxlL3dyaXRlYWJs
ZSByZWdpc3RlciBzZXQKICAtIEEgZmFuIGNvbnRyb2wgd2l0aCAw4oCTMTAwIGxldmVscyBpbnN0
ZWFkIG9mIHRoZSAw4oCTMyBsZXZlbHMgcHJldmlvdXNseQogIC0gQSBmYW4gcG93ZXIgc3VwcGx5
IGdhdGVkIHRocm91Z2ggYSByZWd1bGF0b3IKClRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3Ig
dGhpcyBuZXcgdmFyaWFudCBieToKCiAgMS4gUmVmYWN0b3JpbmcgdGhlIGtoYWRhcy1tY3UgTUZE
IGRyaXZlciB0byB1c2UgcGVyLXZhcmlhbnQgZGF0YQogICAgIHN0cnVjdHVyZXMgKHJlZ21hcCBj
b25maWcsIGNlbGxzLCBmYW4gcGxhdGZvcm0gZGF0YSksCiAgICAgYW5kIGFkZGluZyB0aGUga2hh
ZGFzLHZpbTQtbWN1IGNvbXBhdGlibGUgc3RyaW5nLgoKICAyLiBFeHRlbmRpbmcgdGhlIGZhbiB0
aGVybWFsIGRyaXZlciB0byByZXRyaWV2ZSB0aGUgZmFuIHJlZ2lzdGVyCiAgICAgYW5kIG1heGlt
dW0gbGV2ZWwgZnJvbSBwbGF0Zm9ybV9kYXRhLAogICAgIGFuZCB0byBvcHRpb25hbGx5IG1hbmFn
ZSBhIHBvd2VyIHJlZ3VsYXRvciBmb3IgdGhlIGZhbiBzdXBwbHkuCgogIDMuIEFkZGluZyB0aGUg
Y29ycmVzcG9uZGluZyBEVFMgbm9kZSBmb3IgdGhlIFZJTTQsIHdpcmluZyB0aGUgTUNVIHRvCiAg
ICAgdGhlIEkyQyBBT19BIGJ1cyBhbmQgZXhwb3NpbmcgaXQgYXMgYSB0aGVybWFsIGNvb2xpbmcg
ZGV2aWNlLgoKU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZA
YWxpZWwuZnI+Ci0tLQpDaGFuZ2VzIGluIHY5OgotIFJlYmFzZWQgb24gbmV4dC0yMDI2MDczMSAo
cGF0Y2hlcyAxLzgsIDIvOCBhbmQgNi84IGFscmVhZHkgYXBwbGllZCwgZHJvcHBlZCBmcm9tIHRo
aXMgc2VyaWVzKS4KLSBQQVRDSCAxOiBBZGQgbGV2ZWxzIHRhYmxlIGFuZCBubGV2ZWxzIGluIGto
YWRhc19tY3VfZmFuX3BkYXRhIHN0cnVjdC4KLSBQQVRDSCAyOiBVc2UgTUZEX0NFTExfKiBtYWNy
b3MgaW5zdGVhZCBvZiBvcGVuLWNvZGluZyBtZmRfY2VsbC4KLSBQQVRDSCAzOiBQcm92aWRlIGxl
dmVscyB0YWJsZSBhbmQgbmxldmVscyB0byBwbGF0Zm9ybSBkYXRhLgogICAgICAgICAgIENoZWNr
IG1hdGNoX2RhdGEgYmVmb3JlIHRoZSBzd2l0Y2guCi0gUEFUQ0ggNDogVXNlIGxldmVsc1tdIGFu
ZCBubGV2ZWxzIGZyb20gcGxhdGZvcm0gZGF0YS4gVklNNCBsZXZlbHMgaXMgKDAsIDMwLCA0MCwg
NTUsIDc1LCAxMDApLgotIExpbmsgdG8gdjg6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NjA3MDItYWRkLW1jdS1mYW4ta2hhZGFzLXZpbTQtdjgtMC0yNDRmZWVlOTFhMzZAYWxpZWwuZnIK
CkNoYW5nZXMgaW4gdjg6Ci0gUEFUQ0ggNDogRGVmaW5lIGNvbnN0YW50IGZvciBmYW4gbWF4IGxl
dmVsLCByZW1vdmUgZXh0cmEgc3BhY2UgZm9yIHVubmVjZXNzYXJ5IGFsaWdubWVudC4KICAgICAg
ICAgICBUaGFua3MgdG8gTGVlJ3MgcmV2aWV3LgotIExpbmsgdG8gdjc6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyNjA2MDMtYWRkLW1jdS1mYW4ta2hhZGFzLXZpbTQtdjctMC01OTRiYThh
OTY1ZDhAYWxpZWwuZnIKCkNoYW5nZXMgaW4gdjc6Ci0gUEFUQ0ggMy00OiBTaW1wbGlmeSB0aGUg
cGVyLXZhcmlhbnQgaGFuZGxpbmcgYnkgdXNpbmcgbG9jYWwgdmFyaWFibGVzIGluIGtoYWRhc19t
Y3VfcHJvYmUoKQogICAgICAgICAgICAgaW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBhIGRlZGljYXRl
ZCBkYXRhIHN0cnVjdHVyZS4gVGhhbmtzIHRvIExlZSdzIHJldmlldy4KLSBMaW5rIHRvIHY2OiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNTE2LWFkZC1tY3UtZmFuLWtoYWRhcy12aW00
LXY2LTAtY2NjYzliNjFmNDY1QGFsaWVsLmZyCgpDaGFuZ2VzIGluIHY2OgotIFBBVENIIDQ6IEFk
ZHJlc3MgTGVlJ3MgcmV2aWV3IGNvbW1lbnRzOgogIC0gVXNlIGFuIGVudW0gdG8gZGlzY3JpbWlu
YXRlIGJldHdlZW4gTUNVIHR5cGVzIGluc3RlYWQgb2YgcGFzc2luZwogICAgTUZEIGRhdGEgdGhy
b3VnaCB0aGUgRFQgbWF0Y2ggdGFibGUKICAtIEZpeCBlcnJvciBjb2RlIGZyb20gLUVJTlZBTCB0
byAtRU5PREVWIHdoZW4gbm8gTUNVIHR5cGUgaXMgbWF0Y2hlZAogIC0gTWFrZSBraGFkYXNfbWN1
X2Zhbl9jZWxscyBhbmQga2hhZGFzX21jdV9jZWxscyBjb25zdAogIC0gVXNlIGRldl9lcnJfcHJv
YmUoKSBmb3IgcmVnbWFwIGluaXRpYWxpemF0aW9uIGVycm9yCiAgLSBEb2N1bWVudCBmYW4gc3Bl
ZWQgbGV2ZWxzIGZvciBtYXhfbGV2ZWwKLSBMaW5rIHRvIHY1OiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjYwNDI0LWFkZC1tY3UtZmFuLWtoYWRhcy12aW00LXY1LTAtYWZjZmE3MTU3YjIz
QGFsaWVsLmZyCgpDaGFuZ2VzIGluIHY1OgotIFBBVENIIDU6IFJlcGxhY2UgZGV2bV9yZWd1bGF0
b3JfZ2V0X29wdGlvbmFsKCkgd2l0aCBkZXZtX3JlZ3VsYXRvcl9nZXQoKQogICAgICAgICAgIHRv
IHNpbXBsaWZ5IGVycm9yIGhhbmRsaW5nIGFuZCByZW1vdmUgTlVMTCBjaGVja3MsIGFsc28KICAg
ICAgICAgICBvcmRlcmluZyBhcyByZXZlcnNlIGNocmlzdG1hcyBhY2NvcmRpbmcgdG8gTmVpbCdz
IGZlZWRiYWNrLgotIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA0
MjEtYWRkLW1jdS1mYW4ta2hhZGFzLXZpbTQtdjQtMC00NDcxMTRhMjhmMmRAYWxpZWwuZnIKCkNo
YW5nZXMgaW4gdjQ6Ci0gUEFUQ0ggMTogbGltaXQgZmFuLXN1cHBseSBwcm9wZXJ0eSBieSBjb21w
YXRpYmxlIGFjY29yZGluZyB0byBDb25vcidzIGZlZWRiYWNrLgotIExpbmsgdG8gdjM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA0MTctYWRkLW1jdS1mYW4ta2hhZGFzLXZpbTQtdjMt
MC1hNmE3ZjU3MGIxMWJAYWxpZWwuZnIKCkNoYW5nZXMgaW4gdjM6Ci0gUEFUQ0ggMTogYWRkaW5n
IGNvbW1lbnQgb24gdmltNCBjb21wYXRpYmxlIHNheWluZyBpdCBpcyBub3QgZGlzY292ZXJhYmxl
LAogICAgICAgICAgIHRoYW5rcyB0byBSb2IncyBhbmQgTmVpbCdzIGZlZWRiYWNrLgotIExpbmsg
dG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA0MDMtYWRkLW1jdS1mYW4ta2hh
ZGFzLXZpbTQtdjItMC03MDUzNmIyMjQzOWFAYWxpZWwuZnIKCkNoYW5nZXMgaW4gdjI6Ci0gUEFU
Q0ggNTogQWRkIHJlZ3VsYXRvcl9kaXNhYmxlIG9uIHN1c3BlbmQgdGhhbmtzIHRvIE5laWwncyBm
ZWVkYmFjay4KLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNDAy
LWFkZC1tY3UtZmFuLWtoYWRhcy12aW00LXYxLTAtMmIxMmViNGFjN2IwQGFsaWVsLmZyCgotLS0K
Um9uYWxkIENsYXZlYXUgKDYpOgogICAgICBtZmQ6IGtoYWRhcy1tY3U6IEFkZCBwZXItdmFyaWFu
dCBjb25maWd1cmF0aW9uIGluZnJhc3RydWN0dXJlIGFuZCBWSU00IHN1cHBvcnQKICAgICAgbWZk
OiBraGFkYXMtbWN1OiBVc2UgTUZEX0NFTExfKiBtYWNyb3MgZm9yIGNlbGwgZGVjbGFyYXRpb25z
CiAgICAgIG1mZDoga2hhZGFzLW1jdTogQWRkIHN1cHBvcnQgZm9yIFZJTTQgTUNVIHZhcmlhbnQK
ICAgICAgdGhlcm1hbDoga2hhZGFzLW1jdS1mYW46IEFkZCBmYW4gY29uZmlnIGZyb20gcGxhdGZv
cm0gZGF0YSBBZGQgcmVndWxhdG9yIHN1cHBvcnQKICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzog
dDc6IEFkZCBpMmMgY29udHJvbGxlciBub2RlCiAgICAgIGFybTY0OiBkdHM6IGFtbG9naWM6IHQ3
OiBraGFkYXMtdmltNDogQWRkIGkyYyBNQ1UgZmFuIG5vZGUKCiAuLi4vZHRzL2FtbG9naWMvYW1s
b2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzICB8ICAxMyArKysKIGFyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kgICAgICAgIHwgIDEwICsrCiBkcml2ZXJzL21m
ZC9raGFkYXMtbWN1LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyNiArKysrKysrKysr
KysrKysrKystLS0KIGRyaXZlcnMvdGhlcm1hbC9raGFkYXNfbWN1X2Zhbi5jICAgICAgICAgICAg
ICAgICAgIHwgIDU4ICsrKysrKystLS0KIGluY2x1ZGUvbGludXgvbWZkL2toYWRhcy1tY3UuaCAg
ICAgICAgICAgICAgICAgICAgIHwgIDI0ICsrKysKIDUgZmlsZXMgY2hhbmdlZCwgMTk3IGluc2Vy
dGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDlkYmE2NmI2MjE3YWFj
YjkyNGQ5OTdkZTM4NjZlN2U0YzBkY2Y5NTIKY2hhbmdlLWlkOiAyMDI2MDQwMi1hZGQtbWN1LWZh
bi1raGFkYXMtdmltNC1hYzFjYmU1NTNjOWIKCkJlc3QgcmVnYXJkcywKLS0gClJvbmFsZCBDbGF2
ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
