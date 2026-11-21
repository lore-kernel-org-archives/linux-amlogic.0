Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF0E606A320
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 19:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XBHFnJ+a;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HsiL/K9d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ob8+Grex5OVQOw5FBTo+CjgNpC5VoVZMFUaOsSfl6x0=; b=XBHFnJ+awwfo14d51mZnMTMeAh
	7n9gfib6+umZ/p4IWZqb7VpW37AUDL1h+o6Sp5k6V92ktrwwxL7mcckFiYQ9b6evVHgEsbWSJRRPI
	h36Bv7fiYacQrfsMZL2cRc7iavNrOzFCxP3qW5fabJ9fdstVWddMlipDxtum71VvvZ1ThxsHYEzGK
	o36AeKnhJOdPH5doLzk4kmRmBPq53efXUJ2Ug/G1u1KQstzAMR5tFgxo3VKhIkZhHpL6uEPwWvvI7
	5uzi1XT035DNjVyrvNC57ezo5P9TVPk5JMsG9pspMkgC3ZcIOXlhakFgSno0+9U8RlpVPzuuGz03p
	KoEgPMaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqzY-000000008aV-49UV;
	Sat, 21 Nov 2026 19:43:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqzX-000000008aL-0BWV;
	Sat, 21 Nov 2026 19:43:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CA6160CB9;
	Sat, 21 Nov 2026 19:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12E41F000C4;
	Sat, 21 Nov 2026 19:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795290197;
	bh=Ndnh/TEZ+lxNLtCHkCn/UU8fVcS7ajpeDoOxuytt3sA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HsiL/K9dEM8Fk5K9FLQEcquPIPr/f5gKKJlXxBALyTnneLN/QENKGzqkBUKRFWtXO
	 IxgGhnGsZPMMnvFP40VuzeaTr3h2f4lq/Nvhx9CLxJc3aOrwA2me0rDOPa5RCzMflE
	 rAUQnCALnwWjRjW9JDQidbhDcK/X/YNYCznbdUDrTCWiygW1wKktthp38YpIow8Wlo
	 Swtqz8G7FunNErgtGPsc1xMFBFZR1ZoVtzh8JpHIP9o40xwuaHZ8TVx5NXFu0JR9sh
	 WMo/ITRaGmzWT9h2E1n+2DaR2hhtNat5hCK7Rfzc7gjQNIOoZ3xLaa6cR0mpR9xipp
	 UmH28ZgUlbOZg==
Message-ID: <sashiko-outbox-227322@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/11] phy: amlogic: Add Meson HDMI TX PHY driver
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261121-meson-drm-create-hdmitx-phy-v3-4-f8f471788076@aliel.fr>
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
 <20261121-meson-drm-create-hdmitx-phy-v3-4-f8f471788076@aliel.fr>
Date: Sat, 21 Nov 2026 19:43:16 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gcGh5OiBhbWxvZ2ljOiBw
aHktbWVzb24taGRtaS10eDogbWluX3JhdGUgMjUxNzUwMDAgcmVqZWN0cwogIHZhbGlkIERNVCBt
b2RlcwotLQoKY29tbWl0IGM4ZDdhZGNjYWIyMjk4NTQ0NmM1ZGQ2NTk2N2ExN2E3Mjc2Mjk5NzMK
QXV0aG9yOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KCnBoeTog
YW1sb2dpYzogQWRkIE1lc29uIEhETUkgVFggUEhZIGRyaXZlcgoKVGhpcyBjb21taXQgYWRkcyBh
IGdlbmVyaWMgUEhZIGRyaXZlciBmb3IgdGhlIEFtbG9naWMgTWVzb24gSERNSSBUWCBQSFkgb24K
R1hCQiwgR1hMLCBHWE0sIGFuZCBHMTJBIFNvQ3MsIGFsb25nIHdpdGggYSBsZWdhY3kgY3JlYXRp
b24gaGVscGVyIGZvcgpkZXZpY2UgdHJlZXMgd2l0aG91dCBhIHBoeXMgcHJvcGVydHkuCgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9hbWxvZ2ljL3BoeS1tZXNvbi1oZG1pLXR4LmMgYi9kcml2
ZXJzL3BoeS9hbWxvZ2ljL3BoeS1tZXNvbi1oZG1pLXR4LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjg3MmQyNDRkZThmYjcKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvZHJpdmVycy9waHkvYW1sb2dpYy9waHktbWVzb24taGRtaS10eC5jClsgLi4uIF0KPiAr
LyogR1hCQiAqLwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX2hkbWlfcGh5X3JhdGUgZ3hi
Yl9yYXRlc1tdID0gewo+ICsJLyogNS45NEdicHMsIDMuNzEyNUdicHMgKi8KPiArCXsgMzcxMjUw
MDAwLCAweDMzMzUzMjQ1LCAweDIxMDAxMTViIH0sCj4gKwkvKiAyLjk3R2JwcyAqLwo+ICsJeyAy
OTcwMDAwMDAsIDB4MzM2MzQyODMsIDB4YjAwMDExNWIgfSwKPiArCS8qIDEuNDg1R2JwcywgZG93
biB0byAyNTEuNzVNYnBzICovCj4gKwl7IDI1MTc1MDAwLCAgMHgzMzYzMjEyMiwgMHgyMDAwMTE1
YiB9LAo+ICt9Owo+ICsKPiArLyogR1hMIC8gR1hNICovCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
bWVzb25faGRtaV9waHlfcmF0ZSBneGxfcmF0ZXNbXSA9IHsKPiArCS8qIDUuOTRHYnBzLCAzLjcx
MjVHYnBzICovCj4gKwl7IDM3MTI1MDAwMCwgMHgzMzNkMzI4MiwgMHgyMTM2MzE1YiB9LAo+ICsJ
LyogMi45N0dicHMgKi8KPiArCXsgMjk3MDAwMDAwLCAweDMzMzAzMzgyLCAweDIwMzYzMTViIH0s
Cj4gKwkvKiAxLjQ4NUdicHMgKi8KPiArCXsgMTQ4NTAwMDAwLCAweDMzMzAzMzYyLCAweDIwMTYz
MTViIH0sCj4gKwkvKiA3NDIuNU1icHMsIGRvd24gdG8gMjUxLjc1TWJwcyAqLwo+ICsJeyAyNTE3
NTAwMCwgIDB4MzM2MDQxNDIsIDB4MDAxNjMxNWIgfSwKPiArfTsKPiArCj4gKy8qIEcxMkEgKi8K
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9oZG1pX3BoeV9yYXRlIGcxMmFfcmF0ZXNbXSA9
IHsKPiArCS8qIDUuOTRHYnBzLCAzLjcxMjVHYnBzICovCj4gKwl7IDM3MTI1MDAwMCwgMHgzN2Vi
NjVjNCwgMHgyYWIwZmYzYiwgMHgwMDAwMDgwYiB9LAo+ICsJLyogMi45N0dicHMgKi8KPiArCXsg
Mjk3MDAwMDAwLCAweDMzZWI2MjYyLCAweDJhYjBmZjNiLCAweDAwMDAwMDAzIH0sCj4gKwkvKiAx
LjQ4NUdicHMsIGRvd24gdG8gMjUxLjc1TWJwcyAqLwo+ICsJeyAyNTE3NTAwMCwgIDB4MzNlYjQy
NDIsIDB4MmFiMGZmM2IsIDB4MDAwMDAwMDMgfSwKPiArfTsKWyAuLi4gXQo+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IG1lc29uX2hkbWlfcGh5X3JhdGUgKgo+ICttZXNvbl9oZG1pX3BoeV9maW5kX3Jh
dGUoY29uc3Qgc3RydWN0IG1lc29uX2hkbWlfcGh5X2RhdGEgKmRhdGEsIHU2NCByYXRlKQo+ICt7
Cj4gKwl1bnNpZ25lZCBpbnQgaTsKPiArCj4gKwlpZiAocmF0ZSA+IGRhdGEtPm1heF9yYXRlKQo+
ICsJCXJldHVybiBOVUxMOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBkYXRhLT5udW1fcmF0ZXM7
IGkrKykKPiArCQlpZiAocmF0ZSA+PSBkYXRhLT5yYXRlc1tpXS5taW5fcmF0ZSkKPiArCQkJcmV0
dXJuICZkYXRhLT5yYXRlc1tpXTsKPiArCj4gKwlyZXR1cm4gTlVMTDsKPiArfQoKW1NldmVyaXR5
OiBNZWRpdW1dCkRvZXMgc2V0dGluZyBtaW5fcmF0ZSB0byAyNTE3NTAwMCBpbiB0aGUgbG93ZXN0
IGVudHJpZXMgb2YgZ3hiYl9yYXRlc1tdLApneGxfcmF0ZXNbXSwgYW5kIGcxMmFfcmF0ZXNbXSBj
YXVzZSBhIHJlZ3Jlc3Npb24gZm9yIHZhbGlkIGRpc3BsYXkgbW9kZXMKYmVsb3cgMjUuMTc1IE1I
ej8KCkluIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMsIG1lc29uX2hkbWlf
cGh5X3NldHVwX21vZGUoKSB1c2VkCmFuIHVuY29uZGl0aW9uYWwgZWxzZSBicmFuY2ggd2l0aCBu
byBsb3dlciBmcmVxdWVuY3kgYm91bmQgZm9yIHRoZSBsb3dlc3QKYmFuZCAoIjc0Mi41TWJwcywg
YW5kIGJlbG93IiBvbiBHWEwvR1hNLCBhbmQgIjEuNDg1R2JwcywgYW5kIGJlbG93IiBvbiBHWEJC
CmFuZCBHMTJBKS4gIE1lYW53aGlsZSwgbWVzb25fZW5jb2Rlcl9oZG1pX21vZGVfdmFsaWQoKSBh
Y2NlcHRzIG5vbi1WSUMgRE1UCm1vZGVzIGRvd24gdG8gMTUuOSBNSHogdmlhIG1lc29uX3ZjbGtf
ZG10X3N1cHBvcnRlZF9mcmVxKCkgd2l0aG91dCBjYWxsaW5nCnBoeV92YWxpZGF0ZSgpLiAgQW55
IG1vZGUgYmV0d2VlbiAxNS45IE1IeiBhbmQgMjUuMTc0IE1IeiAoc3VjaCBhcwo2NDB4NDgwQDYw
SHogQ1ZUIHJlZHVjZWQtYmxhbmtpbmcgYXQgMjMuNzUgTUh6LCBvciBhIDY0MHg0ODAgRURJRCBk
ZXRhaWxlZAp0aW1pbmcgZGVzY3JpcHRvciB3aG9zZSAxMCBrSHogc3RlcCBlbmNvZGVzIDI1LjE3
NSBNSHogYXMgMjUxNzAga0h6KSBwYXNzZXMKbW9kZSB2YWxpZGF0aW9uIGFuZCBhdG9taWNfY2hl
Y2ssIHRoZW4gZmFpbHMgd2l0aCAtRUlOVkFMIGluCmR3X2hkbWlfcGh5X2luaXQoKSAtPiBwaHlf
Y29uZmlndXJlKCkgZHVyaW5nIGF0b21pY19lbmFibGUsIGFib3J0aW5nIEhETUkKUEhZIHBvd2Vy
LW9uLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MTEyMS1tZXNvbi1kcm0tY3JlYXRlLWhkbWl0eC1waHktdjMtMC1mOGY0NzE3ODgw
NzZAYWxpZWwuZnI/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
