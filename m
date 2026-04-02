Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E35AD39426
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Apr 2026 14:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TgjgKxwRDye1fUCD5GO0rkMrkTDMtgl9uvpD4DGSSsQ=; b=emBRI/otsCj1Ad
	p5QozlxjjEwguLaEENf3TeMPrWIFX03JI352rZR9R5jrCiCfT8pIS1KZI7GjCQPV66gjCrq+cvY9O
	oboc9VpFbWn/hLnVdq++XG70iYmVlrf9XLMzRk+zaDhjaEXvY9a81zuQNY98v6y5CX3IlxFVQcF+k
	ARMP+KQsOHusjURpc4ZJa1eoaj9GEY/Muq6O4nbWKOV1uatKbLk6RGuqgTfhovgY1dnM58aa2UwcP
	WD0rnL9W5pzRG5TIqzWGg4HjqeTgyo/8ePtABnXLLHyPP76//R51nEE820LGWLtovk+5axOcCj4Pt
	Iw8mhvwfl6VshrZHbzUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1K-00000000KUv-01KT;
	Thu, 02 Apr 2026 14:27:42 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1H-00000000KTj-0Fkb;
	Thu, 02 Apr 2026 14:27:41 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775140052;
	bh=jtFDzNTESkvMwz+pOZUUTieD6Qiq+MAcYIEdMuIWcKY=;
	h=From:Subject:Date:To:Cc;
	b=hv/0fkokS0N5Iq7GrMrzENCE9ejCYujOWJ/4QJLab+j5/+2KfG8BgMH+3iF8zZqIo
	 EoacrE/qQYxgDQGoe9rK6iQdVx6W0/8QacsR5RYrgbNq1eRhqklCnzGy+wM6Wtv2fE
	 dZoZfEMrimONiKz1nyXJ1zUUMosNTjJ8qwarG74k=
Subject: [PATCH 0/8] Add VIM4 MCU/FAN support
Date: Thu, 02 Apr 2026 16:27:00 +0200
Message-Id: <20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22RzW7bMBCEX8XQuWvwn6JQFH2PIodd7jJmI8muJ
 Bspgrx7GcWHGu1xlpj5uLNv3SpLlbUbDm/dIre61vPchP5y6PIJ52eByk13RpmgnDKAzDDlKxS
 c4eWEjCvc6uQAs84k3tucqGvuyyKlvu7JP54+9SK/rg2wfQ47wlUgn6epbsNhltcNdog18cM/y
 brijh8OX+8PQSUTnD9q5ZvQoOFnxfl4un7HaTw/13xscd92Om75tHuDR88xlMLUfmYRydreEwW
 fSZmolMtWSZRHl7HRhNQr3ZvAbJFjIR2EHEcO7ATJK2di/+jyURKpHlPoUbh4Z9myYh9y0Rkdk
 1FkUIfu73Yb7L7d3i3lydnozUczLbnSKCBta3QlpmhxuJlHKEWrihdnSDT3iXWyEiy2TO+Sz0z
 F5MiR/gu1CtqVoM43HCvDZTlfZNl+A7VTOk7WlqjvxH+9eve26mGLMF/HERZZpZ2RguqFSmJ0w
 013T+/vfwBtlS6VaAIAAA==
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
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1775140049; l=3865;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=jtFDzNTESkvMwz+pOZUUTieD6Qiq+MAcYIEdMuIWcKY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHhQfM84O7Qdhtmr/i231zPtmXx+1HTy2L1MbrbpFpoeFBPywqt1V/u8ZJWsYDro/fWIbYmgZUV
 /QFyEKCBPUwk=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_072739_709453_F3B47958 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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
YWxpZWwuZnI+Ci0tLQpSb25hbGQgQ2xhdmVhdSAoOCk6CiAgICAgIGR0LWJpbmRpbmdzOiBtZmQ6
IGtoYWRhczogQWRkIG5ldyBjb21wYXRpYmxlIGZvciBLaGFkYXMgVklNNCBNQ1UKICAgICAgZHQt
YmluZGluZ3M6IGkyYzogYW1sb2dpYzogQWRkIGNvbXBhdGlibGUgZm9yIFQ3IFNPQwogICAgICBt
ZmQ6IGtoYWRhcy1tY3U6IEFkZCBwZXItdmFyaWFudCBjb25maWd1cmF0aW9uIGluZnJhc3RydWN0
dXJlIGFuZCBWSU00IHN1cHBvcnQKICAgICAgbWZkOiBraGFkYXMtbWN1OiBBZGQgc3VwcG9ydCBm
b3IgVklNNCBNQ1UgdmFyaWFudAogICAgICB0aGVybWFsOiBraGFkYXMtbWN1LWZhbjogQWRkIGZh
biBjb25maWcgZnJvbSBwbGF0Zm9ybSBkYXRhIEFkZCByZWd1bGF0b3Igc3VwcG9ydAogICAgICBh
cm02NDogZHRzOiBhbWxvZ2ljOiB0NzogQWRkIGkyYyBwaW5jdHJsIG5vZGUKICAgICAgYXJtNjQ6
IGR0czogYW1sb2dpYzogdDc6IEFkZCBpMmMgY29udHJvbGxlciBub2RlCiAgICAgIGFybTY0OiBk
dHM6IGFtbG9naWM6IHQ3OiBraGFkYXMtdmltNDogQWRkIGkyYyBNQ1UgZmFuIG5vZGUKCiAuLi4v
YmluZGluZ3MvaTJjL2FtbG9naWMsbWVzb242LWkyYy55YW1sICAgICAgICAgICB8ICAxMyArKy0K
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9raGFkYXMsbWN1LnlhbWwgICAgICAgIHwgICA1
ICsKIC4uLi9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMgIHwg
IDEzICsrKwogYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaSAgICAg
ICAgfCAgMjAgKysrKwogZHJpdmVycy9tZmQva2hhZGFzLW1jdS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxMDYgKysrKysrKysrKysrKysrKysrLS0tCiBkcml2ZXJzL3RoZXJtYWwva2hh
ZGFzX21jdV9mYW4uYyAgICAgICAgICAgICAgICAgICB8ICA0MyArKysrKysrLS0KIGluY2x1ZGUv
bGludXgvbWZkL2toYWRhcy1tY3UuaCAgICAgICAgICAgICAgICAgICAgIHwgIDM5ICsrKysrKyst
CiA3IGZpbGVzIGNoYW5nZWQsIDIxNiBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKLS0t
CmJhc2UtY29tbWl0OiBmN2I2NGVkOTQ4NzE4MjkwMjA5MDc0YTUwYmIwZGYxN2U1OTQ0ODczCmNo
YW5nZS1pZDogMjAyNjA0MDItYWRkLW1jdS1mYW4ta2hhZGFzLXZpbTQtYWMxY2JlNTUzYzliCnBy
ZXJlcXVpc2l0ZS1tZXNzYWdlLWlkOiA8MjAyNjAzMjYwOTI2NDUuMTA1MzI2MS0xLWppYW4uaHVA
YW1sb2dpYy5jb20+CnByZXJlcXVpc2l0ZS1wYXRjaC1pZDogZjAzYTA4NmI0MTM3MTU4NDEyYjJk
NDdiM2RlNzkzYjg1OGRlOGRkZQpwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDEyMzk3MGM5YjI5YzIw
OTA0NDBmMmZkNzFjODVkM2M2ZmQ4ZTM2ZGUKcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiAzZTJlNTZi
MDkyNmJhMzI3YjUyMGY5MzVkZjRjZWQ1MDg5YmJlNTAzCnByZXJlcXVpc2l0ZS1wYXRjaC1pZDog
NjVhNWQ3NmZmZGJjOWIzYWFiMzM4NWJiNjVjYjAyNzAwNGMzMGU3ZQpwcmVyZXF1aXNpdGUtcGF0
Y2gtaWQ6IDIzNzI2OTgwMTgyNmRkM2FkN2ZiMTZlYjRkN2Q2ZDRlYWI1MDQyNzgKcHJlcmVxdWlz
aXRlLXBhdGNoLWlkOiA1N2U5YjA4YTk2OGFlZGY1NDNkM2QwZDU2Y2YxY2E0ZGIyMGIyYTE2CnBy
ZXJlcXVpc2l0ZS1jaGFuZ2UtaWQ6IDIwMjYwMzI2LWFkZC1iY200Mzc1Mi1jb21wYXRpYmxlLWUy
NjRhNGY3OTczYTp2MgpwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGNkOThiNzRmYTU2YWY3MmFmMjU1
M2YzOTFjNDAwOTgxZDgzY2Q0ZjQKcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiBiNzMwZjVlNDJiZTFk
ODlkMTkzZTYzYTAyNjU0OTVjZGJmMmM3ZDdiCnByZXJlcXVpc2l0ZS1jaGFuZ2UtaWQ6IDIwMjYw
MzMwLWZpeC1pbnZhbGlkLXByb3BlcnR5LWJiZTU0ZDkzM2Y3MTp2MgpwcmVyZXF1aXNpdGUtcGF0
Y2gtaWQ6IDhkNjc1ZTdhMjM5OTg1Yzc2Mjg0MzUxNWIyNDFmMGEyZjQ1ZjljOTIKcHJlcmVxdWlz
aXRlLWNoYW5nZS1pZDogMjAyNjAzMzEtZml4LWFtbC10Ny1udWxsLXJlc2V0LTJiNjA4ZWJmOWRh
NDp2MQpwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDViNWRlNzdhZjExNzQ3Y2U5NjQ0MDRmYjgyN2Qy
ZWUyYmZmNDdlYTUKcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiAxZTM3ZmM3NWZlZDFlNTMzYWRlZTBm
M2U3ZTZlYWQxZjhmZjNjNTVjCnByZXJlcXVpc2l0ZS1wYXRjaC1pZDogNjVhNWQ3NmZmZGJjOWIz
YWFiMzM4NWJiNjVjYjAyNzAwNGMzMGU3ZQpwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDJkYWY1ODNm
YjVlNzQ0OWEwMmJkMjE3ZDhhY2EzMzAxNzFiNTk4YWEKcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiAy
MzcyNjk4MDE4MjZkZDNhZDdmYjE2ZWI0ZDdkNmQ0ZWFiNTA0Mjc4CnByZXJlcXVpc2l0ZS1wYXRj
aC1pZDogZDFkZGY5Yjc3MTBlOTFmODA2MmRlODNiZDdiYTU1YWZiMmM0YzExMgpwcmVyZXF1aXNp
dGUtcGF0Y2gtaWQ6IDU3ZTliMDhhOTY4YWVkZjU0M2QzZDBkNTZjZjFjYTRkYjIwYjJhMTYKcHJl
cmVxdWlzaXRlLXBhdGNoLWlkOiBjZDk4Yjc0ZmE1NmFmNzJhZjI1NTNmMzkxYzQwMDk4MWQ4M2Nk
NGY0CnByZXJlcXVpc2l0ZS1wYXRjaC1pZDogYjczMGY1ZTQyYmUxZDg5ZDE5M2U2M2EwMjY1NDk1
Y2RiZjJjN2Q3YgpwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDlkZWJkODhmYTYwZmViZWQ5Y2Q3MjA4
Zjg2NjAzYjRjMmQyNzA1MjAKcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiAzMTRlZjlmZjBjNGQxZDE1
ZGFiMWRlYTlkOTJhYTA2NWYxZWFjM2U5CgpCZXN0IHJlZ2FyZHMsCi0tIApSb25hbGQgQ2xhdmVh
dSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
