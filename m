Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBFD606A32C
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TKiBPM5d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oRuTZncz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/nVxeLlvGCsG8tc6fNMeb6oqPF5JHPD/+EF7UtsB79M=; b=TKiBPM5du4vT5wKcYtqr7VM9C5
	NDquWXhOehARiGxophPBrlYtsZMw+lN5y/gLXIULs/KeGSlP54u8Zar+ddm34Llsz0tyEpf+R2//2
	wcmLawkc7O7wzxmAck4zVLGOIYB5tzLEJd7eKMFnik0rCK0VIDBYrEgN3t8jeUbvykrY4Ezg1zwZZ
	KN0Qxuzd/vGe4TLAsaRG669Td4Worl2zJjwpKfoV2vr65/6a9cVWSpS8V6N3ly6dttGRFkTzQc68/
	O3CU3JhFg7tbpeJQYPjTRCcGY4iDYxKUoPmgP3Avmwgi56BexJHLXkBboEz6S5m21vU1Pb2L97XeN
	q5JVtFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPJn-00000006yHt-05bc;
	Tue, 17 Nov 2026 19:58:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPJl-00000006yHP-2zjq;
	Tue, 17 Nov 2026 19:58:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 069DC61405;
	Tue, 17 Nov 2026 19:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3379E1F000C4;
	Tue, 17 Nov 2026 19:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945492;
	bh=qsjU6DFACAbDOfJLMOOcz7Evb3Wx0q0vKZrTcX0d8CY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oRuTZnczPBzp7vCRPzYA8CeIO4F+D3quE7Q84dLMmiYTH5gGsx76zknj4tzRH7K0z
	 JePvcwIs6FaDra2ISn07URXkOye1twBppiPGFsHwq11KFawgW7lFOh65OUgZLUmoHq
	 rxGGLRk92ncO0jmA8+RSWn5NXYjfQ9XSfATotq7Ice7J5BU6SYenEm8h6RineS3umC
	 8qzgaIHIGq5G0l+fr9CBckk25k5wU3czlNL7kUWUfHJv8rUPBtv+K1Zg3eQw1tnoMp
	 xSWSgb7S48XToMWZg8imz9B1M5Xx7KSL5oQd+xK6kSlv2yFghm1MPS2g/kMJhhewFp
	 +S4ev8sFQmT2g==
Message-ID: <sashiko-outbox-219538@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/10] phy: amlogic: Add Meson HDMI TX PHY driver
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-4-9e0ac931381c@aliel.fr>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-4-9e0ac931381c@aliel.fr>
Date: Tue, 17 Nov 2026 19:58:11 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gcGh5OiBhbWxvZ2ljOiBi
cm9rZW4gcmF0ZSBhbmQgc3VibW9kZSBjaGVjayBpbgogIG1lc29uX2hkbWlfcGh5X3ZhbGlkYXRl
KCkKLS0KCmNvbW1pdCAwYmY0OWVhNzdjODY0Y2RjZjdhZjk2ZTU5ZTFmZmJhNTE5NGQ5NjM2CkF1
dGhvcjogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+CgpwaHk6IGFt
bG9naWM6IEFkZCBNZXNvbiBIRE1JIFRYIFBIWSBkcml2ZXIKClRoaXMgY29tbWl0IGFkZHMgYSBn
ZW5lcmljIFBIWSBkcml2ZXIgZm9yIHRoZSBIRE1JIFRYIFBIWSBvbiBBbWxvZ2ljIEdYQkIsCkdY
TCwgR1hNLCBhbmQgRzEyQSBTb0NzLCBhbG9uZyB3aXRoIGEgbGVnYWN5IGhlbHBlciBmb3IgZGV2
aWNlIHRyZWVzCmxhY2tpbmcgYSAicGh5cyIgcHJvcGVydHkuCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BoeS9hbWxvZ2ljL3BoeS1tZXNvbi1oZG1pLXR4LmMgYi9kcml2ZXJzL3BoeS9hbWxvZ2lj
L3BoeS1tZXNvbi1oZG1pLXR4LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMDAuLjY5ODMzYTA4MGRjMzUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9w
aHkvYW1sb2dpYy9waHktbWVzb24taGRtaS10eC5jClsgLi4uIF0KPiArLyogR1hCQiAqLwo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX2hkbWlfcGh5X3JhdGUgZ3hiYl9yYXRlc1tdID0gewo+
ICsJLyogNS45NEdicHMsIDMuNzEyNUdicHMgKi8KPiArCXsgMzcxMjUwMDAwLCAweDMzMzUzMjQ1
LCAweDIxMDAxMTViIH0sCj4gKwkvKiAyLjk3R2JwcyAqLwo+ICsJeyAyOTcwMDAwMDAsIDB4MzM2
MzQyODMsIDB4YjAwMDExNWIgfSwKPiArCS8qIDEuNDg1R2JwcywgYW5kIGJlbG93ICovCj4gKwl7
IDAsICAgICAgICAgMHgzMzYzMjEyMiwgMHgyMDAwMTE1YiB9LAo+ICt9OwpbIC4uLiBdCj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25faGRtaV9waHlfcmF0ZSAqCj4gK21lc29uX2hkbWlfcGh5
X2ZpbmRfcmF0ZShjb25zdCBzdHJ1Y3QgbWVzb25faGRtaV9waHlfZGF0YSAqZGF0YSwgdTY0IHJh
dGUpCj4gK3sKPiArCXVuc2lnbmVkIGludCBpOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBkYXRh
LT5udW1fcmF0ZXM7IGkrKykKPiArCQlpZiAocmF0ZSA+PSBkYXRhLT5yYXRlc1tpXS5taW5fcmF0
ZSkKPiArCQkJcmV0dXJuICZkYXRhLT5yYXRlc1tpXTsKPiArCj4gKwlyZXR1cm4gTlVMTDsKPiAr
fQpbIC4uLiBdCj4gK3N0YXRpYyBpbnQgbWVzb25faGRtaV9waHlfdmFsaWRhdGUoc3RydWN0IHBo
eSAqcGh5LCBlbnVtIHBoeV9tb2RlIG1vZGUsCj4gKwkJCQkgICBpbnQgc3VibW9kZSwgdW5pb24g
cGh5X2NvbmZpZ3VyZV9vcHRzICpvcHRzKQo+ICt7Cj4gKwlzdHJ1Y3QgbWVzb25faGRtaV9waHkg
KnByaXYgPSBwaHlfZ2V0X2RydmRhdGEocGh5KTsKPiArCj4gKwlpZiAobW9kZSAhPSBQSFlfTU9E
RV9IRE1JKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCWlmIChvcHRzLT5oZG1pLmJwYyAh
PSA4KQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCWlmICghbWVzb25faGRtaV9waHlfZmlu
ZF9yYXRlKHByaXYtPmRhdGEsIG9wdHMtPmhkbWkudG1kc19jaGFyX3JhdGUpKQo+ICsJCXJldHVy
biAtRUlOVkFMOwo+ICsKPiArCXJldHVybiAwOwo+ICt9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KQ2Fu
IG1lc29uX2hkbWlfcGh5X2ZpbmRfcmF0ZSgpIGV2ZXIgcmV0dXJuIE5VTEwgaGVyZT8KCkV2ZXJ5
IHBlci1Tb0MgcmF0ZSB0YWJsZSBlbmRzIHdpdGggYW4gZW50cnkgd2hlcmUgbWluX3JhdGUgaXMg
MCwgYW5kIHJhdGUKaXMgYW4gdW5zaWduZWQgdTY0LCBzbyByYXRlID49IGRhdGEtPnJhdGVzW2ld
Lm1pbl9yYXRlIGlzIGFsd2F5cyB0cnVlIG9uCnRoZSBmaW5hbCBlbnRyeS4gIFRoYXQgbWFrZXMg
dGhlIE5VTEwgcmV0dXJuIGFuZCB0aGUgY2FsbGVycycgTlVMTCBjaGVja3MKaW4gbWVzb25faGRt
aV9waHlfdmFsaWRhdGUoKSBhbmQgbWVzb25faGRtaV9waHlfY29uZmlndXJlKCkgZGVhZCBjb2Rl
LCBhbmQKbWVzb25faGRtaV9waHlfdmFsaWRhdGUoKSBhY2NlcHRzIGFueSB0bWRzX2NoYXJfcmF0
ZSB2YWx1ZSAoaW5jbHVkaW5nIDAgSHoKb3IgcmF0ZXMgYWJvdmUgdGhlIDU5NCBNSHogaGFyZHdh
cmUgbGltaXQpLgoKSW4gYWRkaXRpb24sIG1lc29uX2hkbWlfcGh5X3ZhbGlkYXRlKCkgZG9lcyBu
b3QgY2hlY2sgdGhhdCBzdWJtb2RlIGlzClBIWV9IRE1JX01PREVfVE1EUyBiZWZvcmUgcmVhZGlu
ZyBvcHRzLT5oZG1pLnRtZHNfY2hhcl9yYXRlLCB3aGljaCBzaGFyZXMKYW4gYW5vbnltb3VzIHVu
aW9uIHdpdGggb3B0cy0+aGRtaS5mcmwgd2hlbiBzdWJtb2RlIGlzIFBIWV9IRE1JX01PREVfRlJM
LgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MTExNy1tZXNvbi1kcm0tY3JlYXRlLWhkbWl0eC1waHktdjEtMC05ZTBhYzkzMTM4MWNA
YWxpZWwuZnI/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
