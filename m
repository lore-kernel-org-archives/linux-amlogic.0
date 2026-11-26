Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D963606A323
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QBwJuk0T;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AKKE9f5t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hqQ7OKnweHz7rnL7He6ab7l2WWO6ZW2awr0l8hONvDo=; b=QBwJuk0TLedx9md5wiGfbDyyr0
	WRznwaXhJ08zOmw5IUU8ZSSeFSCior9xW7U5LqbBqagEFNU1UDgY2yvvJTbWo5wZ0Pi839FNQUVFy
	ZbFY32ijsb75D+htemKlTpJLc6PyUNM1N/agk+zG78oXPLLmDMB+sK/4Nte6Bv5pR1yPOSYaqosq3
	Y4WfUdnbYFnTDmlzmLMa2DZN9dGdyno9FP9aM4cIiSxY561iGqiDIhjkSzwLJ8At5bGRjDZMA3698
	XlGnPtWW1GaSFkBxHiewcuePMfToDH3UCKPZEghCvTtGJBWeqzSu7Ah25IHHWV1mUSrtbrq8Be4N+
	sRVRMKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZKw-0000000DJur-1r4S;
	Thu, 26 Nov 2026 13:16:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZKv-0000000DJuX-1VdK
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 13:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31F52628B1
	for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 13:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65AF1F000C0
	for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 13:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698987;
	bh=eAIs0oUI+YPmPLZo54ZycZGgVU2dXBDMzLaTztAAp7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AKKE9f5tar8k8WvuoypakZvL26D8s0k6EGpd3UqOtdzqxSDYv29gJS4bAfsh9R4W5
	 ErxpPkY7zEBlSd/GLqsPtCqn/dxtk25UEKb+9Af/B7NHye9g/MHeL4M0YHdCjIpiaw
	 eUmOkmo2W8n/1VZCKlbxUR/mjEz0zkvNGSEPcZq3l01ZDA7oMq8s4+bpv9+1cgcald
	 dsSivPuqoQlCXTt9a9VyuCPSyg7Snl6AQhNEpb2HVzOHjCbYScfm7yeUXRRSlZWEsB
	 g8wRDS+RYxz0XsB4nWLuw0LtKeOpLjfTZx6nEviLq+T8SVk2YNJgRTiSuz5MPqzinU
	 mmoJj8s3UJ8kQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae25c846edso46499851fa.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 05:16:27 -0800 (PST)
X-Gm-Message-State: APuU4Z9KJDY6MMk0IM+JTH1yC+CJ66xJot+98Uw8x2pywvkPsBSbnzkY
	QSDR/4yjtKQxTQWMlE1t031KDIQ19K0TuGxvZ4pC5t19Xuhf/ncCQVzbR0Ej/zKHoxBlwpO8uue
	u8kjDPb9bqK5W2Uerr8XLJj9tvsFzjwI=
X-Received: by 2002:a05:6512:3d1b:b0:5c1:ac75:6604 with SMTP id
 2adb3069b0e04-5c1bc847d12mr5899749e87.19.1795698986523; Thu, 26 Nov 2026
 05:16:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:16:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLkzm0qTMJsusBd9m+gidwaBPgBbqMEeJFE1t_0ZDMf6NA@mail.gmail.com>
X-Gm-Features: Aa3M54oPi_3zOy_RBrvdi6FjyccKcrCZDV_Tb3Dpo-BA-Pbh5aQfsxCi44RP1zY
Message-ID: <CAD++jLkzm0qTMJsusBd9m+gidwaBPgBbqMEeJFE1t_0ZDMf6NA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBOb3YgMTUsIDIwMjYgYXQgMTE6NDHigK9QTSBNYXJ0aW4gQmx1bWVuc3RpbmdsCjxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gVGhlIEkyUyBwaW4g
Z3JvdXBzIGFyZSByZWdpc3RlcmVkIHdpdGhvdXQgdGhlIF9waW5zIHN1ZmZpeCwgYnV0IHRoZQo+
IGkyc19ncm91cHMgYXJyYXkgc3RpbGwgcmVmZXJlbmNlcyB0aGVtIHdpdGggdGhlIF9waW5zIHN1
ZmZpeC4KPiBVcGRhdGUgdGhlIGdyb3VwIG5hbWVzIHNvIHRoYXQgdGhlIEkyUyBwaW4gZ3JvdXBz
IGNhbiBiZSByZWZlcmVuY2VkLgo+Cj4gRml4ZXM6IDY0ZjZkMDdiYTc0YyAoInBpbmN0cmw6IG1l
c29uOiBtZXNvbjg6IGFkZCBzdXBwb3J0IGZvciB0aGUgSTJTIGFuZCBTUERJRiBwaW5zIikKPiBT
aWduZWQtb2ZmLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdv
b2dsZW1haWwuY29tPgoKUGF0Y2ggYXBwbGllZCBmb3IgZml4ZXMhCgpZb3VycywKTGludXMgV2Fs
bGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
