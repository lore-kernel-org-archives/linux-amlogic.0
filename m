Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89008CCA46C
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2026 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lYgFG4C0GjdjvH+ZhCQK+f3J05rEufkBmh3GsRKwDPM=; b=FMImVA8caUHBpL
	GCoDampHTM6/H9ZyP8aYif2pt/j/biLqxGAgouBsfGyqdr2syMrC2I8uGbvRHAp5Ols5jkkRoJOMD
	Z1LcEtI8GM/biqUHMI3xkZdYT/1VcOXzwFWbG3KMlhTMU+M8tQT29OdYibmt7skqZNoqw82HKYc0n
	nnMtBnjKPhpQvn9+lAgeSs6qxtRdXasnHkNFwivqdg8bDDwjm9JPs6YEUH9s1yG1SsaT1tfMajh+a
	JCP7r87g1vBWt1V1b5KSY0BWUAHj3Ebz+x9uKeXHekMxjqyF5SZvKUTC1eJSSPdv2rZILs+lCdGt6
	hatOa8+PT+lCmVEU4yxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlY7-00000003XJ9-0gOp;
	Fri, 16 Oct 2026 17:16:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlY6-00000003XIF-2LEA;
	Fri, 16 Oct 2026 17:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECE3040546;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0938C2BCF4;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792171013;
	bh=kQZA6RQBnFlVuvXUdChzKc/fj05CNydeCaEx309sHac=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ESn5QEwURtvO0A6eGoD/yG+799ZsIyBFbQusAIAL4KL8gMdOGDwvKVtaXHxOH/nmC
	 wKAJmSrlYWzrNAQdOYuhcIEmZ/RpBANj0fBumuJ+xi0VTb1fXL2K9EDSq+pmrhTadF
	 qyecn2jyX8OChVZ3XunD/HzE7VucNhY6gqxZX3X5kz7ow6S1NbKy5P4oxCAmyvlfIA
	 Vbl7XeWTQh2ZXPLI8mGS5BoKe+sRpQcfoELPTKV7zlzh4sFo/F54fT2XX0bZpe9mO0
	 V0Kq7/vGyX2zHPMGZ2K3v3JsLi5ZRyBOK23Zu+N0CmoKSiolXNB7N8nGfn6FhM/dLo
	 I/yVb+C0IfnsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB97CC6B38;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v7 0/4] arm64: amlogic: T7 thermal support
Date: Fri, 16 Oct 2026 19:16:06 +0200
Message-Id: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Q22qEMBAG4FeRXDdlJgez7lXfo/QiJmMNeGhjK
 lsW373RhSJie/kH/m8mc2cTxUATuxZ3FmkOUxiHHMxTwVxrh3fiwefMBIgSFAK33vPUUuxtx5P
 hc+gVByBtsLbeOWS5+RGpCbdNfX175EifXxlPj0dW24m4G/s+pGsx0C3xdQACKrYW2jClMX5vW
 824Nf5dYEYOHKtG1BdvjfLmxXaBuucmbtws9oQ8J8RKAAhfgYUSxIGQO0LgOSEzYQUZgZo8gDw
 Qak/8sUU+JvfKoRYXr0GpA6H3hDondCYqUOCsLG1Dx4+Uv0Q+tz4nykxI49FVWskK3I5YluUH5
 Y3AmjUCAAA=
X-Change-ID: 20260410-add-thermal-t7-vim4-00e571badcc1
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3708;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=kQZA6RQBnFlVuvXUdChzKc/fj05CNydeCaEx309sHac=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9al6A9pp+x2B5wKqwgMuLz34XJlw4nsHevzjmlEdpvN7
 9Fk3Lm1o5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZiIRg4jw6PiQwlrQ+u97jZ5
 TNmU8abyRRXfr63HS406bQ9c3BrOZs/wP8+4lM86UHhyN2/c8mjnpBOTQ6yXMMWc8vzgu9zpymN
 lZgA=
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

VGhpcyBzZXJpZXMgYWRkcyB0aGVybWFsIG1vbml0b3Jpbmcgc3VwcG9ydCBmb3IgdGhlIEFtbG9n
aWMgVDcgU29DLAp1c2VkIG9uIHRoZSBLaGFkYXMgVklNNCBib2FyZC4KClRoZSBUNyBleHBvc2Vz
IHNpeCB0aGVybWFsIHNlbnNvcnMgKGE1MywgYTczLCBncHUsIG5uYSwgdnB1LCBoZXZjKSwKZWFj
aCBhY2Nlc3NpYmxlIHRocm91Z2ggdGhlIHNlY3VyZSBtb25pdG9yIGZpcm13YXJlIGludGVyZmFj
ZSByYXRoZXIKdGhhbiBhIGRpcmVjdGx5IG1hcHBlZCBlRnVzZSByZWdpc3RlciBhcyBvbiBvbGRl
ciBTb0NzLgoKVGhlIHNlcmllcyBpcyBvcmdhbml6ZWQgYXMgZm9sbG93czoKCi0gUGF0Y2ggMSBl
eHRlbmRzIHRoZSBhbWxvZ2ljLHQ3LXRoZXJtYWwgRFQgYmluZGluZyB0byBkZXNjcmliZSB0aGUK
ICBuZXcgYW1sb2dpYyxzZWN1cmUtbW9uaXRvciBwcm9wZXJ0eS4KLSBQYXRjaGVzIDItMyBleHRl
bmQgdGhlIE1lc29uIHNlY3VyZSBtb25pdG9yIGRyaXZlciB0byBleHBvc2UgYQogIHRoZXJtYWwg
Y2FsaWJyYXRpb24gcmVhZCBjb21tYW5kIChTTUMgSUQgMHg4MjAwMDA0NykuCi0gUGF0Y2ggNCBh
ZGRzIHRoZSBzZWN1cmUgbW9uaXRvciByZWFkb3V0IHBhdGggdG8gdGhlIGFtbG9naWMgdGhlcm1h
bAogIGRyaXZlciBhbmQgaW50cm9kdWNlcyB0aGUgYW1sb2dpYyx0Ny10aGVybWFsIGNvbXBhdGli
bGUuCi0gUGF0Y2hlcyA1LTcgd2lyZSB1cCB0aGUgVDcgRFRTSSB3aXRoIENQVSBjb29saW5nIGNl
bGxzLCBzZW5zb3IKICBub2RlcywgYW5kIHRoZXJtYWwgem9uZXMuCi0gUGF0Y2ggOCBleHRlbmRz
IHRoZSBLaGFkYXMgVklNNCBEVFMgdG8gbWFwIGFsbCB0aGVybWFsIHpvbmVzIHRvIHRoZQogIG9u
LWJvYXJkIE1DVSBmYW4gY29udHJvbGxlciAoc3RhdGVzIDMw4oCTMTAwLCBjb3JyZXNwb25kaW5n
IHRvIHRoZQogIEZBTl9DVFJMIHJlZ2lzdGVyIHJhbmdlIDB4MUXigJMweDY0KS4KClNpZ25lZC1v
ZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgotLS0KQ2hh
bmdlcyBpbiB2NzoKLSBQQVRDSCAzOiBGaXggZm91ciBob3QgdGhlcm1hbCB6b25lIHRyaXAgcG9p
bnRzIGRlY2xhcmVkIGFzIHBhc3NpdmUgdHlwZSBpbnN0ZWFkIG9mIGhvdCB0eXBlLgotIExpbmsg
dG8gdjY6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjEwMTUtYWRkLXRoZXJtYWwtdDct
dmltNC12Ni0wLTM3ZDFjOTU0MzkwY0BhbGllbC5mcgoKQ2hhbmdlcyBpbiB2NjoKLSBSZWJhc2Vk
IG9uIG5leHQtMjAyNjEwMTQgKHBhdGNoZXMgMS84IHRvIDQvOCBhbHJlYWR5IGFwcGxpZWQsIGRy
b3BwZWQgZnJvbSB0aGlzIHNlcmllcykuCi0gUEFUQ0ggMjogQWRkIGJ1cyBjbG9ja3MgYW5kIGNs
b2NrLW5hbWVzIHRvIGFsbCB0aGVybWFsIHNlbnNvciBub2Rlcy4KLSBQQVRDSCA0OiBDaGFuZ2Ug
Y29vbGluZyBkZXZpY2UgbWFwIG1pbiBhbmQgbWF4IHZhbHVlcyBmcm9tIDMwLTEwMCB0byAxLTUu
CiAgICAgICAgICAgVGhlIGRyaXZlciBtYXBzICgwLDEsMiwzLDQsNSkgdG8gKDAsMzAsNDAsNTUs
NzUsMTAwKQotIExpbmsgdG8gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA0MjQt
YWRkLXRoZXJtYWwtdDctdmltNC12NS0wLTkwNDBjYTM2YWZlMkBhbGllbC5mcgoKQ2hhbmdlcyBp
biB2NToKLSBQQVRDSCA0OiBSZW1vdmUgdW5uZWNlc3NhcnkgdmFyaWFibGUgYW5kIGNvZGluZyBz
dHlsZSBhbGlnbm1lbnQKICAgICAgICAgICBhY2NvcmRpbmcgdG8gTmVpbCdzIGZlZWRiYWNrLgot
IExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA0MjMtYWRkLXRoZXJt
YWwtdDctdmltNC12NC0wLWQ0YzE1MjhkNTA0NEBhbGllbC5mcgoKQ2hhbmdlcyBpbiB2NDoKLSBQ
QVRDSCA0OiBFeHRyYWN0IFNNIGFuZCBzeXNjb24gc2V0dXAgaW50byBhbWxvZ2ljX3RoZXJtYWxf
cHJvYmVfc20oKSBhbmQKICAgICAgICAgICBhbWxvZ2ljX3RoZXJtYWxfcHJvYmVfc3lzY29uKCkg
cmVtb3ZpbmcgYW1sb2dpY190aGVybWFsX2luaXRpYWxpemUoKQogICAgICAgICAgIGZyb20gRGFu
aWVsJ3MgZmVlZGJhY2suCiAgICAgICAgICAgQWxzbyBmaXggcHJlLWV4aXN0aW5nIGJ1ZzogbW92
ZSBjYWxpYnJhdGlvbiByZWFkb3V0IGJlZm9yZQogICAgICAgICAgIGRldm1fdGhlcm1hbF9vZl96
b25lX3JlZ2lzdGVyKCkgdG8gYXZvaWQgcmVhZGluZyB1bmluaXRpYWxpemVkCiAgICAgICAgICAg
dHJpbV9pbmZvLCBhY2NvcmRpbmcgdG8gRGFuaWVsJ3MgZmVlZGJhY2suCi0gTGluayB0byB2Mzog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDQyMS1hZGQtdGhlcm1hbC10Ny12aW00LXYz
LTAtYTJlNzIxNWVkMDAzQGFsaWVsLmZyCgpDaGFuZ2VzIGluIHYzOgotIFBBVENIIDE6IFJlcGxh
Y2Ugc2Vjb25kIGlmIGNoZWNrIGJ5IGFuIGVsc2Ugc3RhdGVtZW50LgogIFJlbW92ZSB1bm5lY2Vz
c2FyeSBsYWJlbCBpbiBleGFtcGxlIGFjY29yZGluZyB0byBDb25vcidzIGZlZWRiYWNrCi0gTGlu
ayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDQxMy1hZGQtdGhlcm1hbC10
Ny12aW00LXYyLTAtMTAwMmQ5MGEwNjAyQGFsaWVsLmZyCgpDaGFuZ2VzIGluIHYyOgotIFBBVENI
IDE6IGNoYW5nZSB0d28gY29uc3QgZW50cmllcyB0byBlbnVtLCBleHBsYWluIHdoeSBzZW5zb3Ig
aW5kZXggaXMgbmVlZGVkCiAgcmVvcmRlciBjb25kaXRpb25hbCBjb21wYXRpYmxlIGZvciByZXF1
aXJlZCwgYW5kIGZhbGxiYWNrIG9ubHkgYWNjb3JkaW5nIHRvCiAgS3J6eXN6dG9mJ3MgZmVlZGJh
Y2suCi0gUEFUQ0ggMzogQWRkIGtlcm5lbGRvYyBmb3IgbWVzb25fc21fZ2V0X3RoZXJtYWxfY2Fs
aWIgZXhwb3J0ZWQgZnVuY3Rpb24KICBhY2NvcmRpbmcgdG8gS3J6eXN6dG9mJ3MgZmVlZGJhY2su
Ci0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDQxMC1hZGQtdGhl
cm1hbC10Ny12aW00LXYxLTAtMTlmMmI4ZGE3NGQ3QGFsaWVsLmZyCgotLS0KUm9uYWxkIENsYXZl
YXUgKDQpOgogICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiB0NzogQWRkIGNvb2xpbmcgY2VsbHMg
dG8gYWxsIENQVXMKICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogdDc6IEFkZCB0aGVybWFsIHNl
bnNvciBub2RlcwogICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiB0NzogQWRkIHRoZXJtYWwgem9u
ZXMKICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogdDc6IGtoYWRhcy12aW00OiBBZGQgZmFuIGNv
b2xpbmcgdG8gdGhlcm1hbCB6b25lcwoKIC4uLi9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFk
Mi1raGFkYXMtdmltNC5kdHMgIHwgMTAyICsrKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL2FtbG9naWMtdDcuZHRzaSAgICAgICAgfCAyNTMgKysrKysrKysrKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDM1NSBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDogYWI4
ZWFkYTk4NjhmYWVlZTk1ZjI1ZDgxZDNkNmZlZDBkMWM5OGI3OApjaGFuZ2UtaWQ6IDIwMjYwNDEw
LWFkZC10aGVybWFsLXQ3LXZpbTQtMDBlNTcxYmFkY2MxCgpCZXN0IHJlZ2FyZHMsCi0tIApSb25h
bGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
