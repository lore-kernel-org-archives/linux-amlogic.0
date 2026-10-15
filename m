Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531E2CCA465
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Oct 2026 17:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+41csIlJIqGj93iwHD2gVRXpp7I4YCc5jSoiyO2qh20=; b=rf4XRe7RWeXDvy
	5i3DMFi0KXbq8VKQXmYRXd+HJ5YnxEgUyz44o0d5AE/S54M8cbdrDRv5/Y3Ti4uWtcBOEdfUzO0Kw
	ReWvOSlTuFzQaweGEPB8QKz1xWi9rUNwWgjqj+8ruYzA2mP/DhDRQAZRl/3s9OV6cON6rCYGo+YuW
	G0l6epaWyW9XR2XQe6wb06aSXv1s0o+CWbr9cNoBeAP7T73YY4KWA2FFPwKW/lKeNyXoyrE9Qou8b
	OEA+JO8vW9ev3kY7msff/FdPe2aFojQM38h7QaZOGKfTEf9+VQL9/INEQ0BEukcKmF0XGyauEZmSe
	5+6r4XtTYz/YsJZfhOlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPfm-000000013nr-1P9C;
	Thu, 15 Oct 2026 17:55:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPfl-000000013n6-0x24;
	Thu, 15 Oct 2026 17:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D173643DF0;
	Thu, 15 Oct 2026 17:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9615C2BCF4;
	Thu, 15 Oct 2026 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792086920;
	bh=OLOxCWkG1uAfbEHQrZsIv+PXDRKyrTYk6AYh4axR+Ek=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BSSpjdV1Z9Fj25NlN44laBxpN1sj6fiSlFAxKUUOVtpPYfhH2MwspIuuEn2mLddVI
	 s8BALk9Gi63ki36a5ZmsJs23g3S/WaoyZbJOGnKLyqbzD/CNRfRZsjwS2KXwlTrGyq
	 u/iSs1QfCn584VjaWkDTtKSYZ7r7MYLVvbCLENMs3BuU/VZnmGUDiAQkQI4h3cRwCG
	 E4+ScnwUKbO9scYnYZjgX5oZSxHccMpGryRXEWsSF7eXK6CrwFlfmhxERvTJqM4Opf
	 ESfT8C0pT9FppScKrbeCuXMMv3ZrvUKnTXvlc2/xiCOj1sbNEsgoB3CVZtFW17VOxB
	 37wSbSkevQFMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E3ECC6B33;
	Thu, 15 Oct 2026 17:55:20 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v6 0/4] arm64: amlogic: T7 thermal support
Date: Thu, 15 Oct 2026 19:54:08 +0200
Message-Id: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QzW6EIBQF4FcxrHubyxV0nFXfo+kC4VpJ/JkiN
 dNMfPeiszHGdnlIzseBh5g4eJ7ENXuIwLOf/DikULxkwrZm+GTwLmVBSAUqiWCcg9hy6E0HsYT
 Z9woQWZeyNs5aKVLzFrjx9019/3jmwF/fCY/PQ1GbicGOfe/jNRv4HmG9QKJUYi20fopj+NlWz
 XJr/DtgloAgq4bqizOlcuWb6Tx3r03YuJn2RH5O0EogkqvQYIF0IPIdQfKcyBNhiEuSmh1ifiD
 UnvhjRfpMcMpKTRenUakDofeEOid0IipUaE1emIb3D1mW5RfMQaoh8gEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3497;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=OLOxCWkG1uAfbEHQrZsIv+PXDRKyrTYk6AYh4axR+Ek=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9ZF4UKf6484s8q/x8/Skz9VW2lQ0Mf/07Unkjvz/t7Ds
 yfKtwh0lLIwiHExyIopsvTPtTzx7vLRM1/3qKfAzGFlAhnCwMUpABNxcmdkOFX2sJR17fnIpr/K
 /B/4PPhrfJ9FGusmvzsRrXj+k9Y1oIoZ7yuuc6Rz+TreaflQorXS1qV6L8/pz3rnPrvdmXN9/jt
 GAA==
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
bmdlcyBpbiB2NjoKLSBSZWJhc2VkIG9uIG5leHQtMjAyNjEwMTQgKHBhdGNoZXMgMS84IHRvIDQv
OCBhbHJlYWR5IGFwcGxpZWQsIGRyb3BwZWQgZnJvbSB0aGlzIHNlcmllcykuCi0gUEFUQ0ggMjog
QWRkIGJ1cyBjbG9ja3MgYW5kIGNsb2NrLW5hbWVzIHRvIGFsbCB0aGVybWFsIHNlbnNvciBub2Rl
cy4KLSBQQVRDSCA0OiBDaGFuZ2UgY29vbGluZyBkZXZpY2UgbWFwIG1pbiBhbmQgbWF4IHZhbHVl
cyBmcm9tIDMwLTEwMCB0byAxLTUuCiAgICAgICAgICAgVGhlIGRyaXZlciBtYXBzICgwLDEsMiwz
LDQsNSkgdG8gKDAsMzAsNDAsNTUsNzUsMTAwKQotIExpbmsgdG8gdjU6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyNjA0MjQtYWRkLXRoZXJtYWwtdDctdmltNC12NS0wLTkwNDBjYTM2YWZl
MkBhbGllbC5mcgoKQ2hhbmdlcyBpbiB2NToKLSBQQVRDSCA0OiBSZW1vdmUgdW5uZWNlc3Nhcnkg
dmFyaWFibGUgYW5kIGNvZGluZyBzdHlsZSBhbGlnbm1lbnQKICAgICAgICAgICBhY2NvcmRpbmcg
dG8gTmVpbCdzIGZlZWRiYWNrLgotIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNjA0MjMtYWRkLXRoZXJtYWwtdDctdmltNC12NC0wLWQ0YzE1MjhkNTA0NEBhbGllbC5m
cgoKQ2hhbmdlcyBpbiB2NDoKLSBQQVRDSCA0OiBFeHRyYWN0IFNNIGFuZCBzeXNjb24gc2V0dXAg
aW50byBhbWxvZ2ljX3RoZXJtYWxfcHJvYmVfc20oKSBhbmQKICAgICAgICAgICBhbWxvZ2ljX3Ro
ZXJtYWxfcHJvYmVfc3lzY29uKCkgcmVtb3ZpbmcgYW1sb2dpY190aGVybWFsX2luaXRpYWxpemUo
KQogICAgICAgICAgIGZyb20gRGFuaWVsJ3MgZmVlZGJhY2suCiAgICAgICAgICAgQWxzbyBmaXgg
cHJlLWV4aXN0aW5nIGJ1ZzogbW92ZSBjYWxpYnJhdGlvbiByZWFkb3V0IGJlZm9yZQogICAgICAg
ICAgIGRldm1fdGhlcm1hbF9vZl96b25lX3JlZ2lzdGVyKCkgdG8gYXZvaWQgcmVhZGluZyB1bmlu
aXRpYWxpemVkCiAgICAgICAgICAgdHJpbV9pbmZvLCBhY2NvcmRpbmcgdG8gRGFuaWVsJ3MgZmVl
ZGJhY2suCi0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDQyMS1h
ZGQtdGhlcm1hbC10Ny12aW00LXYzLTAtYTJlNzIxNWVkMDAzQGFsaWVsLmZyCgpDaGFuZ2VzIGlu
IHYzOgotIFBBVENIIDE6IFJlcGxhY2Ugc2Vjb25kIGlmIGNoZWNrIGJ5IGFuIGVsc2Ugc3RhdGVt
ZW50LgogIFJlbW92ZSB1bm5lY2Vzc2FyeSBsYWJlbCBpbiBleGFtcGxlIGFjY29yZGluZyB0byBD
b25vcidzIGZlZWRiYWNrCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI2MDQxMy1hZGQtdGhlcm1hbC10Ny12aW00LXYyLTAtMTAwMmQ5MGEwNjAyQGFsaWVsLmZyCgpD
aGFuZ2VzIGluIHYyOgotIFBBVENIIDE6IGNoYW5nZSB0d28gY29uc3QgZW50cmllcyB0byBlbnVt
LCBleHBsYWluIHdoeSBzZW5zb3IgaW5kZXggaXMgbmVlZGVkCiAgcmVvcmRlciBjb25kaXRpb25h
bCBjb21wYXRpYmxlIGZvciByZXF1aXJlZCwgYW5kIGZhbGxiYWNrIG9ubHkgYWNjb3JkaW5nIHRv
CiAgS3J6eXN6dG9mJ3MgZmVlZGJhY2suCi0gUEFUQ0ggMzogQWRkIGtlcm5lbGRvYyBmb3IgbWVz
b25fc21fZ2V0X3RoZXJtYWxfY2FsaWIgZXhwb3J0ZWQgZnVuY3Rpb24KICBhY2NvcmRpbmcgdG8g
S3J6eXN6dG9mJ3MgZmVlZGJhY2suCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI2MDQxMC1hZGQtdGhlcm1hbC10Ny12aW00LXYxLTAtMTlmMmI4ZGE3NGQ3QGFsaWVs
LmZyCgotLS0KUm9uYWxkIENsYXZlYXUgKDQpOgogICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiB0
NzogQWRkIGNvb2xpbmcgY2VsbHMgdG8gYWxsIENQVXMKICAgICAgYXJtNjQ6IGR0czogYW1sb2dp
YzogdDc6IEFkZCB0aGVybWFsIHNlbnNvciBub2RlcwogICAgICBhcm02NDogZHRzOiBhbWxvZ2lj
OiB0NzogQWRkIHRoZXJtYWwgem9uZXMKICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogdDc6IGto
YWRhcy12aW00OiBBZGQgZmFuIGNvb2xpbmcgdG8gdGhlcm1hbCB6b25lcwoKIC4uLi9kdHMvYW1s
b2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMgIHwgMTAyICsrKysrKysrKwog
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaSAgICAgICAgfCAyNTMg
KysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM1NSBpbnNlcnRpb25zKCsp
Ci0tLQpiYXNlLWNvbW1pdDogYWI4ZWFkYTk4NjhmYWVlZTk1ZjI1ZDgxZDNkNmZlZDBkMWM5OGI3
OApjaGFuZ2UtaWQ6IDIwMjYwNDEwLWFkZC10aGVybWFsLXQ3LXZpbTQtMDBlNTcxYmFkY2MxCgpC
ZXN0IHJlZ2FyZHMsCi0tIApSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5m
cj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
